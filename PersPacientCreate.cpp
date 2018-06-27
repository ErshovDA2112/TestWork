//---------------------------------------------------------------------------
#include <vcl.h>
#include <DateUtils.hpp>
#pragma hdrstop

#include "PersPacientCreate.h"
#include "Main.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TForm9 *Form9;

int BaseHeit;
int MasPassport[128];

int Status;
int Status_P;

int EditForm;
int NewForm;
int ViewForm;
//int ActionMaxForm;
int ActionNormForm;

String Tmp_N_SMO;
String Tmp_ST_OKATO;
int SosSnils;
bool FlagMessage;
int NewDatePers;
int TypeActiveDBgrid;

String DopData_U9;
String DataValue_IdPack;

const String SQL_Pers = "SELECT top 300 R_PERS.ID_PAC                                                        \
								,row_number() over (order by R_PERS.FAM) as [№ ]                                            \
								,isnull(R_PERS.FAM, '') + ' ' + isnull(R_PERS.IM, '') + ' ' + isnull(R_PERS.OT, '') \'ФИО\' \
								,R_PERS.SNILS                 AS СНИЛС                                                      \
								,IIF(CONVERT(nvarchar(MAX), R_PERS.DR, 23) = R_PERS.DR_1, R_PERS.DR_1 ,'--.--.--') 	AS [Дата рожд.]         \
							FROM R_PERS ";

String SQLPacientInfo = "SELECT R_PACIENT._id          \
								,row_number() over (order by R_PACIENT._id) as [№ ]                                         \
								,isnull(R_PACIENT.SPOLIS,'')    			\'Полис: серия\'               					\
								,isnull(R_PACIENT.NPOLIS,'')  				\'Полис\: №\'      								\
								,R_PACIENT.SMO                              AS [СМО]                                        \
								,isnull(R_PACIENT.SMO_NAM,'Отсутствует')    AS [СМО Наименование]                           \
						 FROM R_PACIENT                                                                                     \
						 WHERE R_PACIENT.ID_PAC = '";

extern String ind_Button_OKATO;          //Индификатор нажатой кнопки
String NumberSMO;
String Temp_NumberSMO;

int SostSort_U9;
String DataSort_U9;
//---------------------------------------------------------------------------
__fastcall TForm9::TForm9(TComponent* Owner)
  : TForm(Owner)
{
}

//---------------------------------------------------------------------------
void __fastcall TForm9::FormActivate(TObject *Sender)
{
	this->CategoryButtons1->ShowHint = true;
	this->CategoryButtons1->Categories->Items[0]->Items->Items[0]->Hint = this->CategoryButtons1->Categories->Items[0]->Items->Items[0]->Caption;

    this->GroupBox3->Visible = false;

	TypeActiveDBgrid = 1;

    int i;
    String Itog;
    Form9->Panel4->Visible = false;
    Form9->Panel6->Visible = false;
    FlagMessage = false;
    NewDatePers = 0;
    EditForm = 0;
    NewForm = 0;
    ViewForm = 0;
	SosSnils = 0;

//	int ActionMaxForm = 0;
	int ActionNormForm = 1;

	this->Label31->Visible = false;
	this->Label23->Caption = "СМО №: отсутствует";

	DopData_U9 = "";

	SostSort_U9 = 1;
	DataSort_U9 = " ORDER BY row_number() over (order by R_PERS.FAM) ASC";

    while (this->ComboBox1->Items->Count > 0)  this->ComboBox1->Items->Delete(0);
    while (this->ComboBox2->Items->Count > 0)  this->ComboBox2->Items->Delete(0);
    while (this->ComboBox3->Items->Count > 0)  this->ComboBox3->Items->Delete(0);
    while (this->ComboBox4->Items->Count > 0)  this->ComboBox4->Items->Delete(0);
    while (this->ComboBox5->Items->Count > 0)  this->ComboBox5->Items->Delete(0);
    while (this->ComboBox6->Items->Count > 0)  this->ComboBox6->Items->Delete(0);
    while (this->ComboBox7->Items->Count > 0)  this->ComboBox7->Items->Delete(0);
    while (this->ComboBox8->Items->Count > 0)  this->ComboBox8->Items->Delete(0);
    while (this->ComboBox9->Items->Count > 0)  this->ComboBox9->Items->Delete(0);
	while (this->ComboBox10->Items->Count > 0) this->ComboBox10->Items->Delete(0);
    while (this->ComboBox11->Items->Count > 0) this->ComboBox11->Items->Delete(0);

	BaseHeit = 0;

	this->Constraints->MaxHeight = 695;
    this->Constraints->MinHeight = this->Constraints->MaxHeight;
	this->Height = this->Constraints->MaxHeight;

    String Pol = "SELECT [IDPOL]    \
                        ,[POLNAME]  \
                        ,[FullName] \
                  FROM SPR_V005";

	SQL_Reqest_2(Pol);

	if (Form9->ADOQuery2->RecordCount != 0)
	{
		Form9->ADOQuery2->Open();
		for (Form9->ADOQuery2->First(); !Form9->ADOQuery2->Eof; Form9->ADOQuery2->Next())
		{
			Itog = Form9->ADOQuery2->FieldByName("FullName")->AsString;
			Form9->ComboBox1->Items->Add(Itog);
			Form9->ComboBox2->Items->Add(Itog);
        }
        Form9->ComboBox1->ItemIndex = -1;
        Form9->ComboBox2->ItemIndex = -1;
    }

	String Passport = "SELECT  [IDDoc]\
							  ,[DocName]  \
					   FROM SPR_F011    \
					   ORDER BY cast(IDDoc as int) ";

    SQL_Reqest_2(Passport);

    for (i = 0; i < 128; i++) MasPassport[i] = 0;

    if (Form9->ADOQuery2->RecordCount != 0)
    {
		Form9->ADOQuery2->Open();
		i = 0;
		for (Form9->ADOQuery2->First(); !Form9->ADOQuery2->Eof; Form9->ADOQuery2->Next())
        {
			if (i == 0) Form9->ComboBox3->Items->Add("н/у");
            Itog = Form9->ADOQuery2->FieldByName("IDDoc")->AsString;
            MasPassport[i] = StrToInt(Itog);
			Itog = Form9->ADOQuery2->FieldByName("DocName")->AsString;
			Form9->ComboBox3->Items->Add(Form9->ADOQuery2->FieldByName("IDDoc")->AsString + ". "+ Itog);
            i++;
        }
        Form9->ComboBox3->ItemIndex = 0;
	}

    String Polis = "SELECT [IDDOC]      \
						  ,[DOCNAME]    \
                    FROM SPR_F008";

    SQL_Reqest_2(Polis);
	if (Form9->ADOQuery2->RecordCount != 0)
	{
		Form9->ADOQuery2->Open();
		i = 0;
		for (Form9->ADOQuery2->First(); !Form9->ADOQuery2->Eof; Form9->ADOQuery2->Next())
		{
			if (i == 0) Form9->ComboBox4->Items->Add("н/у");
			Itog = Form9->ADOQuery2->FieldByName("DOCNAME")->AsString;
			Form9->ComboBox4->Items->Add(IntToStr(i + 1) + ". "+ Itog);
            i++;
		}
        Form9->ComboBox4->ItemIndex = 0;
    }

    for (i = 0; i < 119; i++ )
    {
        if (i == 0)
        {
            Form9->ComboBox7->Items->Add("н/у");
			Form9->ComboBox10->Items->Add("н/у");
        }

        Form9->ComboBox7->Items->Add(IntToStr(i + 1900));
        Form9->ComboBox10->Items->Add(IntToStr(i + 1900));

    }
    Form9->ComboBox7->ItemIndex = 0;
	Form9->ComboBox10->ItemIndex = 0;

   TFormatSettings FormatSettings = FormatSettings.Create();
   for(i = 0; i < 12; i++)
    {
		if (i == 0)
			{
                Form9->ComboBox6->Items->Add("н/у");
                Form9->ComboBox9->Items->Add("н/у");
			}
         Form9->ComboBox6->Items->Add(FormatSettings.LongMonthNames[i]);
         Form9->ComboBox9->Items->Add(FormatSettings.LongMonthNames[i]);
    }
    Form9->ComboBox6->ItemIndex = 0;
    Form9->ComboBox9->ItemIndex = 0;

    Form9->ComboBox11->Items->Add("н/у");
    Form9->ComboBox11->Items->Add("1 группа");
    Form9->ComboBox11->Items->Add("2 группа");
	Form9->ComboBox11->Items->Add("3 группа");
	Form9->ComboBox11->Items->Add("дети-инвалиды");
    Form9->ComboBox11->ItemIndex = 0;

    Tmp_N_SMO    = this->Label33->Caption;
    Tmp_ST_OKATO = this->Label31->Caption;

	DownLoadDBgrid1(DopData_U9);
    ChangeData();

	Form9->Caption = "Пациенты";
	this->DBGrid4->Width = this->DBGrid1->Width;
}
//---------------------------------------------------------------------------
void __fastcall TForm9::ChangeData()
{
    this->Edit1Change(Edit1);
    this->Edit2Change(Edit2);
    this->Edit3Change(Edit3);
    this->Edit4Change(Edit4);
    this->Edit5Change(Edit5);
    this->Edit6Change(Edit6);
    this->Edit7Change(Edit7);
	this->Edit8Change(Edit8);
    this->Edit9Change(Edit9);
    this->Edit10Change(Edit10);
    this->Edit11Change(Edit11);
	this->Edit13Change(Edit13);
	this->Edit14Change(Edit14);
    this->Edit24Change(Edit24);

    this->ComboBox3Change(ComboBox3);
	this->ComboBox4Change(ComboBox4);
    this->ComboBox5Change(ComboBox5);
    this->ComboBox6Change(ComboBox6);
    this->ComboBox7Change(ComboBox7);
    this->ComboBox8Change(ComboBox8);
    this->ComboBox9Change(ComboBox9);
    this->ComboBox10Change(ComboBox10);
    this->ComboBox11Change(ComboBox11);
}

//---------------------------------------------------------------------------
void __fastcall TForm9::SQL_Reqest_3(String Data)
{
	Form9->ADOQuery3->Active = False;
    Form9->ADOQuery3->SQL->Clear();
    Form9->ADOQuery3->SQL->Add(Data);
    Form9->ADOQuery3->Active = True;
}

//---------------------------------------------------------------------------
void __fastcall TForm9::SQL_Reqest_2(String Data)
{
	Form9->ADOQuery2->Active = False;
	Form9->ADOQuery2->SQL->Clear();
	Form9->ADOQuery2->SQL->Add(Data);
	Form9->ADOQuery2->Active = True;
}

//---------------------------------------------------------------------------
void __fastcall TForm9::CategoryButtons1Categories0Items0Click(TObject *Sender)
{
	if (Form9->SplitView1->Opened)
	{
		Form9->SplitView1->Close();
		if (this->WindowState == wsNormal)
		{
			Form9->Constraints->MaxWidth -= 150;
			Form9->Constraints->MinWidth = Form9->Constraints->MaxWidth;
			Form9->Width = Form9->Constraints->MaxWidth;
        }
		if (this->WindowState == wsMaximized)
		{
			int ll = 0;
			if (this->Panel6->Visible) ll = this->Panel2->Width;

			Form9->Panel1->Width = Form9->Constraints->MaxWidth - 71 - ll;
			Form9->DBGrid1->Width = Form9->Panel1->Width - 20;
		}
	}
	else
	{
		Form9->SplitView1->Open();
		if (this->WindowState == wsNormal)
		{
			Form9->Constraints->MaxWidth += 150;
			Form9->Constraints->MinWidth = Form9->Constraints->MaxWidth;
			Form9->Width = Form9->Constraints->MaxWidth;
		}
		if (this->WindowState == wsMaximized)
		{
			int ll = 0;
			if (this->Panel6->Visible) ll = this->Panel2->Width;

			Form9->Panel1->Width = Form9->Constraints->MaxWidth - 220 - ll;
			Form9->DBGrid1->Width = Form9->Panel1->Width - 20;
		}
	}
}
//---------------------------------------------------------------------------

void __fastcall TForm9::SplitView1Closed(TObject *Sender)
{
	Form9->CategoryButtons1->Width = 50;
}
//---------------------------------------------------------------------------

void __fastcall TForm9::SplitView1Opened(TObject *Sender)
{
	Form9->CategoryButtons1->Width = Form9->SplitView1->OpenedWidth;
}

//---------------------------------------------------------------------------
void __fastcall TForm9::DownLoadDBgrid1(String Data)
{
	Form9->ADOQuery1->Active = False;
	Form9->ADOQuery1->SQL->Clear();
	Form9->ADOQuery1->SQL->Add(SQL_Pers + Data);// + DataSort_U9);
	Form9->ADOQuery1->Active = True;

	UpdateLen_Form9();
	UpdateLen_Pacient();
}

//---------------------------------------------------------------------------
void __fastcall TForm9::UpdateLen_Form9()
{
    int i, j, k;
    int Maxlen = 0;
	int TekLen = 0;
	int TotalLenDbgrid = 0;
	int TotalLenMas[100] = {0};
    String DataLen = "";
    String ItogData = "";

	if (Form9->ADOQuery1->RecordCount >= 1)
    {
        Form9->DBGrid1->Visible = false;
		Form9->ADOQuery1->Open();
		Form9->DBGrid1->DataSource->DataSet->Fields->Fields[0]->Visible = true;
        for (j = 0; j < Form9->ADOQuery1->FieldCount; j++)
        {
			DataLen = Form9->ADOQuery1->Fields->Fields[j]->FieldName;
			Maxlen = this->DBGrid1->Canvas->TextWidth(DataLen);

			for (Form9->ADOQuery1->First(); !Form9->ADOQuery1->Eof; Form9->ADOQuery1->Next())
			{
				ItogData = Form9->ADOQuery1->FieldByName(DataLen)->AsString;
				TekLen = this->DBGrid1->Canvas->TextWidth(ItogData);
				if (TekLen > Maxlen) Maxlen = TekLen;
			}

            if (Maxlen == 0)
            {
                Form9->DBGrid1->Columns->Items[j]->Width = 5;
				TotalLenDbgrid += 5;
				TotalLenMas[j] = 5;
            }
            else
            {
				Form9->DBGrid1->Columns->Items[j]->Width = Maxlen + 5;
				Form9->DBGrid1->Columns->Items[j]->Alignment = taLeftJustify;
				TotalLenDbgrid += Maxlen + 5;
				TotalLenMas[j] = Maxlen + 5;
            }
		}

        if (this->WindowState == wsNormal)
		{
			if (this->Panel6->Visible)
			{
				this->Constraints->MaxWidth = this->Panel1->Width + this->Panel6->Width + this->SplitView1->Width + 18;
			}
			else
			{
				this->Constraints->MaxWidth = this->Panel1->Width + this->SplitView1->Width + 18;
			}

			this->Constraints->MinWidth = this->Constraints->MaxWidth;
			this->Width = this->Constraints->MaxWidth;
        }


		Form9->DBGrid1->Width = Form9->Panel1->Width - 20;

		Form9->ADOQuery1->First();
		Form9->DBGrid1->Visible = true;
		Form9->DBGrid1->DataSource->DataSet->Fields->Fields[0]->Visible = false;

        j = 1;
        k = 0;
        while (1)
        {
			if (TotalLenMas[j] == 0) break;
			k += TotalLenMas[j];
            j++;
		}
		if (Form9->DBGrid1->Width - 10 > k)
        {
			k = Form9->DBGrid1->Width - k - 10;
			for (j = 0; j < this->ADOQuery1->FieldCount - 1; j++)
            {
				Form9->DBGrid1->Columns->Items[j]->Width += (Form9->DBGrid1->Columns->Items[j]->Width * k) / TotalLenDbgrid;
			}
        }
	}
    else
    {
        Form9->DBGrid1->Visible = false;
    }
}
//---------------------------------------------------------------------------
void __fastcall TForm9::CategoryButtons1Categories0Items1Click(TObject *Sender)
{
	if (Form9->Panel4->Visible == false)
    {
		Form9->Panel4->Visible = true;
        Form9->Edit12->Text = "";

		if ((BaseHeit == 0) && (this->WindowState == wsNormal))
        {
			this->Constraints->MaxHeight = 695;
			this->Constraints->MinHeight = this->Constraints->MaxHeight;
            this->Height = this->Constraints->MaxHeight;
            BaseHeit = 1;
        }
    }
    else
    {
		Form9->Panel4->Visible = false;
		if ((BaseHeit == 1) && (this->WindowState == wsNormal))
        {
            this->Constraints->MaxHeight = 695;
            this->Constraints->MinHeight = this->Constraints->MaxHeight;
            this->Height = this->Constraints->MaxHeight;
            BaseHeit = 0;
        }
		DownLoadDBgrid1(DopData_U9);
	}

}

//---------------------------------------------------------------------------
void __fastcall TForm9::CategoryButtons1Categories0Items2Click(TObject *Sender)
{
	if ((Form9->Panel6->Visible == false) || (EditForm == 1) || (ViewForm == 1))
	{
		Form9->Panel6->Visible = true;
		this->GroupBox3->Visible = true;
		this->Button5->Visible = false;
		if (this->WindowState == wsNormal)
		{
			this->Constraints->MaxWidth = this->Panel1->Width + this->Panel6->Width + this->SplitView1->Width + 18;
			this->Constraints->MinWidth = this->Constraints->MaxWidth;
			this->Width = this->Constraints->MaxWidth;
		}

		if (this->WindowState == wsMaximized)
		{
			Form9->Panel1->Width = Form9->Constraints->MaxWidth - this->Panel2->Width - 71;
			Form9->DBGrid1->Width = Form9->Panel1->Width - 20;
		}

		this->Button3->Visible = true;
        this->Button4->Visible = false;
		Form9->Panel4->Visible = false;
        NewForm = 1;
        EditForm = 0;
        ViewForm = 0;
        ClearDataForm();
        this->ComboBox4Change(ComboBox4);
        SosSnils = 1;
		NewDatePers = 0;
        this->Edit1->SetFocus();
		this->CheckBox6->Checked = false;
		this->Button7->Visible = false;
		this->Button8->Visible = false;
		this->Button9->Visible = false;
		this->DBGrid4->Visible = false;
		this->Label36->Visible = false;
		TypeActiveDBgrid = 0;
		this->DBGrid1->Refresh() ;
		this->DBGrid4->Refresh() ;
    }
    else
    {
		Form9->Panel6->Visible = false;
		this->GroupBox3->Visible = false;
		if (this->WindowState == wsNormal)
		{
			this->Constraints->MaxWidth = this->Panel1->Width + this->SplitView1->Width + 18;
			this->Constraints->MinWidth = this->Constraints->MaxWidth;
			this->Width = this->Constraints->MaxWidth;
		}

		if (this->WindowState == wsMaximized)
		{
			Form9->Panel1->Width = Form9->Constraints->MaxWidth - this->SplitView1->Width - 18;
			Form9->DBGrid1->Width = Form9->Panel1->Width - 20;
		}
        EditForm = 0;
        NewForm = 0;
        ViewForm = 0;
        SosSnils = 0;
    }
}

//---------------------------------------------------------------------------
void __fastcall TForm9::CategoryButtons1Categories0Items3Click(TObject *Sender)
{
	SosSnils = 0;
    if ((Form9->Panel6->Visible == false) || (NewForm == 1) || (ViewForm == 1))
    {
		Form9->Panel6->Visible = true;
		this->GroupBox3->Visible = true;
		this->Button5->Visible = true;
		if (this->WindowState == wsNormal)
		{
			this->Constraints->MaxWidth = this->Panel1->Width + this->Panel6->Width + this->SplitView1->Width + 18;
			this->Constraints->MinWidth = this->Constraints->MaxWidth;
			this->Width = this->Constraints->MaxWidth;
		}

		if (this->WindowState == wsMaximized)
		{
			Form9->Panel1->Width = Form9->Constraints->MaxWidth - this->Panel2->Width - 71;
			Form9->DBGrid1->Width = Form9->Panel1->Width - 20;
		}

		this->Button3->Visible = false;
        this->Button4->Visible = true;
		EditForm = 1;
        NewForm = 0;
		ViewForm = 0;
		InfoPacient();
		UpdateLen_Pacient();
		if (Form9->DBGrid4->Visible) DBGrid4MyClick();
        this->Edit1->SetFocus();
    }
    else
    {
		Form9->Panel6->Visible = false;
		this->GroupBox3->Visible = false;
		if (this->WindowState == wsNormal)
		{
			this->Constraints->MaxWidth = this->Panel1->Width + this->SplitView1->Width + 18;
			this->Constraints->MinWidth = this->Constraints->MaxWidth;
			this->Width = this->Constraints->MaxWidth;
		}

		if (this->WindowState == wsMaximized)
		{
			Form9->Panel1->Width = Form9->Constraints->MaxWidth - this->SplitView1->Width - 18;
			Form9->DBGrid1->Width = Form9->Panel1->Width - 20;
		}

        EditForm = 0;
        NewForm = 0;
        ViewForm = 0;
    }
}

//---------------------------------------------------------------------------
void __fastcall TForm9::StatusErrosDost(String DataValue, int Type)
{
    String SQLString = "SELECT * FROM R_DOST WHERE _pid='" + DataValue + "' AND DOST = " + IntToStr(Type);
    SQL_Reqest_3(SQLString);
    if (Form9->ADOQuery3->RecordCount == 1)
    {
        if (Type == 4) Status |= 1;
        if (Type == 5) Status |= 3;
        if (Type == 6) Status |= 7;
    }
}

//---------------------------------------------------------------------------
void __fastcall TForm9::StatusErrosDost_P(String DataValue, int Type)
{
    String SQLString = "SELECT * FROM R_DOST_P WHERE _pid='" + DataValue + "' AND DOST = " + IntToStr(Type);
    SQL_Reqest_3(SQLString);
    if (Form9->ADOQuery3->RecordCount == 1)
    {
        if (Type == 4) Status_P |= 1;
        if (Type == 5) Status_P |= 3;
        if (Type == 6) Status_P |= 7;
	}
}

//---------------------------------------------------------------------------
void __fastcall TForm9::InfoPacient()
{
    int j,i;
    String NamePole,ItogData, Year, Month, Day;
    Status   = 0;
    Status_P = 0;
    //Очистка значение

    ClearDataForm();

    this->CheckBox6->Checked = false;
    this->DBGrid1->Visible = true;
	if (Form9->ADOQuery1->RecordCount < 1 )
    {
        this->DBGrid1->Visible = false;
        Abort();
    }

	DataValue_IdPack = this->DBGrid1->DataSource->DataSet->Fields->Fields[0]->Value;

    String Zapros = "SELECT [ID_PAC] \
                      ,[FAM]         \
                      ,[IM]          \
                      ,[OT]          \
                      ,[OT_EXIST]    \
                      ,[W]           \
                      ,[DR]          \
                      ,[DR_1]        \
					  ,[TEL]         \
					  ,[ADRESS]      \
                      ,[FAM_P]       \
                      ,[IM_P]        \
                      ,[OT_P]        \
                      ,[OT_P_EXIST]  \
					  ,[W_P]         \
                      ,[DR_P]        \
                      ,[DR_P_1]      \
                      ,[MR]          \
					  ,[DOCTYPE]     \
					  ,[DOCSER]      \
                      ,[DOCNUM]      \
                      ,[SNILS]       \
                      ,[OKATOG]      \
                      ,[OKATOP]      \
                      ,[COMENTP]     \
                    FROM R_PERS      \
					WHERE ID_PAC = '" + DataValue_IdPack +"'";

	SQL_Reqest_2(Zapros);

	if (Form9->ADOQuery2->RecordCount == 1)
    {
        for (j = 0; j < Form9->ADOQuery2->FieldCount; j++)
        {
            NamePole = Form9->ADOQuery2->Fields->Fields[j]->FieldName;
            ItogData = Form9->ADOQuery2->FieldByName(NamePole)->AsString;
            //Фамилия Имя Отчество пациента
            if (NamePole == "FAM") this->Edit1->Text = ItogData;
            if (NamePole == "IM")  this->Edit2->Text = ItogData;
            if (NamePole == "OT")  this->Edit3->Text = ItogData;
            if (NamePole == "OT_EXIST")
            {
                if ((ItogData == "False") || (ItogData.Length() == 0))
                {
                    this->CheckBox2->Checked = false;
                }

                if (ItogData == "True")
                {
                    this->CheckBox2->Checked = true;
					this->CheckBox2Click(0);
                }
			}
            //Фамилия Имя Отчество представителя
            if (NamePole == "FAM_P") this->Edit5->Text = ItogData;
            if (NamePole == "IM_P")  this->Edit6->Text = ItogData;
            if (NamePole == "OT_P")  this->Edit7->Text = ItogData;
			if (NamePole == "OT_P_EXIST")
			{
				if ((ItogData == "False") || (ItogData.Length() == 0))
                {
                    this->CheckBox3->Checked = false;
                }

                if (ItogData == "True")
                {
                    this->CheckBox3->Checked = true;
                    this->CheckBox3Click(0);
                }
			}
			//Адрес жительства
			if (NamePole == "ADRESS"  && ItogData != "") this->Edit15->Text = ItogData;
			//Пол пациента и представителя
			if (NamePole == "W"       && ItogData != "") this->ComboBox1->ItemIndex = StrToInt(ItogData) - 1;
            if (NamePole == "W_P"     && ItogData != "") this->ComboBox2->ItemIndex = StrToInt(ItogData) - 1;
            //Снилс
			if (NamePole == "SNILS") this->Edit11->Text = ItogData;
            //Телефон
            if (NamePole == "TEL")   this->Edit4->Text  = ItogData;
            //Место рождения
            if (NamePole == "MR")    this->Edit8->Text  = ItogData;
            //документ удостоверяющий личность
            if (NamePole == "DOCTYPE" && ItogData != "")
            {
                for (i = 0; i < 128; i++)
                {
                    if (MasPassport[i] == StrToInt(ItogData))
                    {
                        this->ComboBox3->ItemIndex = i + 1;
                        break;
                    }
				}
            }
            //Серия документа удостоверяющего личность
            if (NamePole == "DOCSER")  this->Edit9->Text  = ItogData;
            //Номер документа удостоверяющего личность
            if (NamePole == "DOCNUM")  this->Edit10->Text = ItogData;
			//Комментарий
            if (NamePole == "COMENTP") this->Edit24->Text = ItogData;
            //Окато пребывания
            if (NamePole == "OKATOP" && (ItogData.Length() > 0))
            {
				if (ItogData == "0") this->Button1->Caption = "Выбрать";
                else this->Button1->Caption = ItogData;
            }
            //Окато жительства
			if (NamePole == "OKATOG" && (ItogData.Length() > 0))
            {
				if (ItogData == "0") this->Button2->Caption = "Выбрать";
                else this->Button2->Caption = ItogData;
			}

			if (this->Button1->Caption == this->Button2->Caption) this->CheckBox1->Checked = true;
			else this->CheckBox1->Checked = false;

            //День рождения пациента
            if ((NamePole == "DR_1") && (ItogData.Length() > 0))
            {
                Year = "";
                Month = "";
                Day = "";
                for (i = 2; i <= 4; i++)  Year += ItogData[i];
                for (i = 6; i <= 7; i++)  Month += ItogData[i];
                for (i = 9; i <= 10; i++) Day += ItogData[i];
                if (StrToInt(Year) == 0)
                {
                    this->ComboBox7->ItemIndex = 0;
                }
                else
                {
                    if (StrToInt(Year) >= 900) this->ComboBox7->ItemIndex = StrToInt(Year) - 899;
                    else this->ComboBox7->ItemIndex = StrToInt(Year) + 101;
				}
                this->ComboBox6->ItemIndex = StrToInt(Month);
                this->ComboBox5->ItemIndex = StrToInt(Day);
                this->ComboBox6Change(ComboBox6);
            }

            //День рождения представителя
            if ((NamePole == "DR_P_1") && (ItogData.Length() > 0))
            {
                Year = "";
                Month = "";
                Day = "";
				for (i = 2; i <= 4; i++)  Year += ItogData[i];
                for (i = 6; i <= 7; i++)  Month += ItogData[i];
                for (i = 9; i <= 10; i++) Day += ItogData[i];
                if (StrToInt(Year) == 0)
                {
                    this->ComboBox10->ItemIndex = 0;
                }
                else
                {
                    if (StrToInt(Year) >= 900) this->ComboBox10->ItemIndex = StrToInt(Year) - 899;
                    else this->ComboBox10->ItemIndex = StrToInt(Year) + 101;
                }
                this->ComboBox9->ItemIndex = StrToInt(Month);
				this->ComboBox8->ItemIndex = StrToInt(Day);
				this->ComboBox9Change(ComboBox9);
			}
		}
	}

	if (this->DBGrid4->Visible) this->DBGrid4MyClick();

	this->ComboBox3Change(ComboBox3);
	this->ComboBox5Change(ComboBox5);
	this->ComboBox7Change(ComboBox7);
	this->ComboBox8Change(ComboBox8);
	this->ComboBox10Change(ComboBox10);
	this->ComboBox11Change(ComboBox11);

}

//---------------------------------------------------------------------------
void __fastcall TForm9::DBGrid1CellClick(TColumn *Column)
{
	if (Form9->Panel6->Visible)
	{
		SosSnils = 0;
		InfoPacient();
		if (this->Button3->Visible)
        {
			this->Button3->Visible = false;
			this->Button4->Visible = true;
		}
	}

	UpdateLen_Pacient();
	if (Form9->DBGrid4->Visible) DBGrid4MyClick();

	TypeActiveDBgrid = 1;
	this->DBGrid1->Refresh() ;
	this->DBGrid4->Refresh() ;
}

//---------------------------------------------------------------------------
void __fastcall TForm9::UpdateLen_Pacient()
{
	Form9->DBGrid4->Visible = false;
	Form9->Button8->Visible = false;
	Form9->Button9->Visible = false;
	Form9->Label36->Visible = false;
	if (this->DBGrid1->Visible)
	{
		this->Button5->Visible = true;
		String Itog = this->DBGrid1->DataSource->DataSet->Fields->Fields[0]->AsString;

		Form9->ADOQuery4->Active = False;
		Form9->ADOQuery4->SQL->Clear();
		Form9->ADOQuery4->SQL->Add(SQLPacientInfo + Itog + "'");
		Form9->ADOQuery4->Active = True;

		int i, j, k;
		int Maxlen = 0;
		int TekLen = 0;
		String DataLen = "";
		String ItogData = "";

		if (Form9->ADOQuery4->RecordCount > 0)
		{
			Form9->ADOQuery4->Open();
			Form9->DBGrid4->DataSource->DataSet->Fields->Fields[0]->Visible = true;
			for (j = 0; j < Form9->ADOQuery4->FieldCount; j++)
			{
				DataLen = Form9->ADOQuery4->Fields->Fields[j]->FieldName;
				Maxlen = this->DBGrid4->Canvas->TextWidth(DataLen);

				for (Form9->ADOQuery4->First(); !Form9->ADOQuery4->Eof; Form9->ADOQuery4->Next())
				{
					ItogData = Form9->ADOQuery4->FieldByName(DataLen)->AsString;
					TekLen = this->DBGrid4->Canvas->TextWidth(ItogData);
					if (TekLen > Maxlen) Maxlen = TekLen;
				}

				if (Maxlen == 0)
				{
					Form9->DBGrid4->Columns->Items[j]->Width = 5;
				}
				else
				{
					Form9->DBGrid4->Columns->Items[j]->Width = Maxlen + 5;
					Form9->DBGrid4->Columns->Items[j]->Alignment = taLeftJustify;
				}
			}
			Form9->ADOQuery4->First();
			Form9->DBGrid4->DataSource->DataSet->Fields->Fields[0]->Visible = false;
			Form9->DBGrid4->Visible = true;
			Form9->Button8->Visible = true;
			Form9->Button9->Visible = true;
            Form9->Label36->Visible = true;
			if (this->GroupBox3->Visible)
			{
				this->DBGrid4MyClick();
               	this->ComboBox4Change(ComboBox4);
			}
		}
		else
		{
			this->ComboBox4->ItemIndex = 0;
            this->ComboBox4Change(0);
		}
	}

	if (Form9->DBGrid4->Visible) this->Button7->Visible = true;
	else this->Button7->Visible = false;
}

//---------------------------------------------------------------------------
void __fastcall TForm9::Edit11KeyPress(TObject *Sender, System::WideChar &Key)
{
   	if (Key == '\'') Key = 0;
	if ((Key >= '0') && (Key <= '9'))
    {
        int len = this->Edit11->Text.Length();
        if (len >= 14)
        {
            Abort();
        }
    }
    else
    {
		if ((Key == '\b') || (Key == '\r'))
		{
			if (Key == '\r')
			{
                Key = 0;
				this->Edit4->SetFocus();
			}
		}
        else Abort();
	}
}
//---------------------------------------------------------------------------

void __fastcall TForm9::Edit11KeyUp(TObject *Sender, WORD &Key, TShiftState Shift)
{
    int i,j,TekPolKur, IshodLen;
    TekPolKur = Form9->Edit11->SelStart;
    IshodLen = Form9->Edit11->Text.Length();
    char *Snils = AnsiString(Form9->Edit11->Text).c_str();
    char *Sn =  new char[256];
    char *ResultSn =  new char[256];

    *Sn = '\0';
    *ResultSn = '\0';

    if (Key == 8)
	{
        if ((TekPolKur == IshodLen) && ((TekPolKur == 11) || (TekPolKur == 7) || (TekPolKur == 3)))
        {
            IshodLen--;
        }
    }

    j = 0;
    for (i = 0; i < IshodLen; i++)
    {
        if (
            (Snils[i] == '0') ||
            (Snils[i] == '1') ||
            (Snils[i] == '2') ||
            (Snils[i] == '3') ||
            (Snils[i] == '4') ||
            (Snils[i] == '5') ||
			(Snils[i] == '6') ||
            (Snils[i] == '7') ||
            (Snils[i] == '8') ||
            (Snils[i] == '9')
            )
        {
            Sn[j] = Snils[i];
			Sn[j + 1] = '\0';
            j++;
        }
    }

    i = 0;
    j = 0;
    while (Sn[i] != '\0')
    {
        ResultSn[j] = Sn[i];
        if ((i == 2) || (i == 5))
        {
            ResultSn[j + 1] = '-';
            j+=2;
            i++;
			continue;
        }

        if (i == 8)
        {
            ResultSn[j + 1] = ' ';
            j+=2;
            i++;
            continue;
        }
        j++;
        i++;
    }

    ResultSn[j] = '\0';

    Form9->Edit11->Text = (UnicodeString)ResultSn;
    *Sn = '\0';

    if (Key == 37 || Key == 39 || Key == 8 || Key == 46)
    {
        if (Key == 8)  Form9->Edit11->SelStart = TekPolKur;
        if (Key == 46) Form9->Edit11->SelStart = TekPolKur;
    }
    else
    {
		Form9->Edit11->SelStart = Form9->Edit11->Text.Length() ;
    }


}

//---------------------------------------------------------------------------
void __fastcall TForm9::DBGrid1KeyUp(TObject *Sender, WORD &Key, TShiftState Shift)

{
	if ((Key == 9) || (Key == 38) || (Key == 40))
    {
		InfoPacient();
		UpdateLen_Pacient();
		if (Form9->DBGrid4->Visible) DBGrid4MyClick();
    }
}

//---------------------------------------------------------------------------
void __fastcall TForm9::CheckBox6Click(TObject *Sender)
{
    if (this->CheckBox6->Checked)
    {
        this->GroupBox2->Visible = true;
        this->GroupBox5->Caption = "Документы представителя";
        this->ComboBox8Change(ComboBox8);
    }
    else
	{
        this->GroupBox2->Visible = false;
        this->GroupBox5->Caption = "Документы пациента";
    }
}

//---------------------------------------------------------------------------
void __fastcall TForm9::SetMonthPacientIndex()
{
    int i;
    int SostIndex = -1;
    SostIndex = Form9->ComboBox5->ItemIndex;
    while (this->ComboBox5->Items->Count > 0) this->ComboBox5->Items->Delete(0);

    this->ComboBox6->Color = clWindow;
	for(i = 0; i < DaysInAMonth(YearOf(Date()),Form9->ComboBox6->ItemIndex); i++)
    {
        if (i == 0) Form9->ComboBox5->Items->Add("н/у");
        if (i < 9) Form9->ComboBox5->Items->Add("0" + IntToStr(i + 1));
        else Form9->ComboBox5->Items->Add(IntToStr(i + 1));
    }
    if (Form9->ComboBox5->Items->Count < SostIndex) Form9->ComboBox5->ItemIndex = Form9->ComboBox5->Items->Count - 1;
    else Form9->ComboBox5->ItemIndex = SostIndex;
}

//---------------------------------------------------------------------------
void __fastcall TForm9::ComboBox6Change(TObject *Sender)
{
    bool IzmData = false;
    int i;
    int SostIndex = -1;
    if (Form9->ComboBox6->ItemIndex > 0) SetMonthPacientIndex();
    else
    {
        if (Form9->ComboBox6->ItemIndex == -1)
        {
            if (Form9->ComboBox6->Text.Length() == 2)
			{
                IzmData = true;
                int month = StrToInt(Form9->ComboBox6->Text);
                if (month > 0 && month < 13)
                {
                    Form9->ComboBox6->ItemIndex = month;
                    SetMonthPacientIndex();
                }
                else this->ComboBox6->Color = clYellow;
            }
        }

        if (Form9->ComboBox6->ItemIndex == 0)
        {
            SostIndex = Form9->ComboBox5->ItemIndex;
            while (this->ComboBox5->Items->Count > 0) this->ComboBox5->Items->Delete(0);
            for (i = 0; i < 31; i++)
            {
                if (i == 0) Form9->ComboBox5->Items->Add("н/у");
				if (i < 9) Form9->ComboBox5->Items->Add("0" + IntToStr(i + 1));
                else Form9->ComboBox5->Items->Add(IntToStr(i + 1));
            }
            if (Form9->ComboBox5->Items->Count < SostIndex) Form9->ComboBox5->ItemIndex = Form9->ComboBox5->Items->Count - 1;
            else Form9->ComboBox5->ItemIndex = SostIndex;
        }

        if (IzmData == false) this->ComboBox6->Color = clMoneyGreen;
    }

}

//---------------------------------------------------------------------------
void __fastcall TForm9::SetMonthPredstavitelIndex()
{
    int i;
    int SostIndex = -1;
    SostIndex = Form9->ComboBox8->ItemIndex;
	while (this->ComboBox8->Items->Count > 0) this->ComboBox8->Items->Delete(0);
    this->ComboBox9->Color = clWindow;
    for(i = 0; i < DaysInAMonth(YearOf(Date()),Form9->ComboBox9->ItemIndex); i++)
    {
        if (i == 0) Form9->ComboBox8->Items->Add("н/у");
        if (i < 9) Form9->ComboBox8->Items->Add("0" + IntToStr(i + 1));
        else Form9->ComboBox8->Items->Add(IntToStr(i + 1));
    }
    if (Form9->ComboBox8->Items->Count < SostIndex) Form9->ComboBox8->ItemIndex = Form9->ComboBox8->Items->Count - 1;
    else Form9->ComboBox8->ItemIndex = SostIndex;
}

//---------------------------------------------------------------------------
void __fastcall TForm9::ComboBox9Change(TObject *Sender)
{
    bool IzmData = false;
    int i;
    int SostIndex = -1;
    if (Form9->ComboBox9->ItemIndex > 0)
    {
        SetMonthPredstavitelIndex();
    }
    else
	{
        if (Form9->ComboBox9->ItemIndex == -1)
        {
            if (Form9->ComboBox9->Text.Length() == 2)
            {
                IzmData = true;
                int month = StrToInt(Form9->ComboBox9->Text);
                if (month > 0 && month < 13)
                {
                    Form9->ComboBox9->ItemIndex = month;
                    SetMonthPredstavitelIndex();
                }
                else this->ComboBox9->Color = clYellow;
            }
        }
        if (Form9->ComboBox9->ItemIndex == 0)
        {
            SostIndex = Form9->ComboBox8->ItemIndex;
            while (this->ComboBox8->Items->Count > 0) this->ComboBox8->Items->Delete(0);
            for (i = 0; i < 31; i++)
            {
                if (i == 0) Form9->ComboBox8->Items->Add("н/у");
                if (i < 9) Form9->ComboBox8->Items->Add("0" + IntToStr(i + 1));
                else Form9->ComboBox8->Items->Add(IntToStr(i + 1));
            }
            if (Form9->ComboBox8->Items->Count < SostIndex) Form9->ComboBox8->ItemIndex = Form9->ComboBox8->Items->Count - 1;
			else Form9->ComboBox8->ItemIndex = SostIndex;

        }

        if (IzmData == false) this->ComboBox9->Color = clMoneyGreen;
    }
}
//---------------------------------------------------------------------------

void __fastcall TForm9::Button1Click(TObject *Sender)
{
    ind_Button_OKATO = "B1";
    Form11->ShowModal();
}
//---------------------------------------------------------------------------

void __fastcall TForm9::Button2Click(TObject *Sender)
{
    ind_Button_OKATO = "B2";
    Form11->ShowModal();
}

//---------------------------------------------------------------------------
void __fastcall TForm9::Edit3Change(TObject *Sender)
{
    if (Form9->Edit3->Text=="")
    {
        Form9->Edit3->Color = clMoneyGreen;
        NewDatePers |= 4;
        NewDatePers ^= 4;
    }
    else
    {
        Form9->Edit3->Color = clWindow;
        NewDatePers |= 4;
    }
}

//---------------------------------------------------------------------------
void __fastcall TForm9::InfoSluch(String ItogData)
{
	String SQLString = "DELETE FROM R_SLUCH WHERE [_id_zap]=" + ItogData;
	Request2(SQLString);
}
//---------------------------------------------------------------------------
void __fastcall TForm9::Edit5Change(TObject *Sender)
{
    if (Form9->Edit5->Text=="")
    {
        Form9->Edit5->Color = clMoneyGreen;
        NewDatePers |= 8;
        NewDatePers ^= 8;
    }
    else
    {
        Form9->Edit5->Color = clWindow;
        NewDatePers |= 8;
    }
}
//---------------------------------------------------------------------------

void __fastcall TForm9::Edit6Change(TObject *Sender)
{
    if (Form9->Edit6->Text=="")
    {
        Form9->Edit6->Color = clMoneyGreen;
        NewDatePers |= 16;
        NewDatePers ^= 16;
    }
    else
    {
        Form9->Edit6->Color = clWindow;
		NewDatePers |= 16;
    }
}
//---------------------------------------------------------------------------

void __fastcall TForm9::Edit7Change(TObject *Sender)
{
    if (Form9->Edit7->Text=="")
    {
        Form9->Edit7->Color = clMoneyGreen;
        NewDatePers |= 32;
        NewDatePers ^= 32;
    }
    else
    {
        Form9->Edit7->Color = clWindow;
        NewDatePers |= 32;
    }
}
//---------------------------------------------------------------------------

void __fastcall TForm9::Edit2Change(TObject *Sender)
{
    if (Form9->Edit2->Text=="")
    {
        Form9->Edit2->Color = clMoneyGreen;
        NewDatePers |= 2;
        NewDatePers ^= 2;
    }
    else
    {
        Form9->Edit2->Color = clWindow;
        NewDatePers |= 2;
    }
}
//---------------------------------------------------------------------------

void __fastcall TForm9::Edit1Change(TObject *Sender)
{
    if (Form9->Edit1->Text=="")
    {
		Form9->Edit1->Color = clMoneyGreen;
        NewDatePers |= 1;
        NewDatePers ^= 1;
    }
    else
    {
        Form9->Edit1->Color = clWindow;
        NewDatePers |= 1;
    }
}
//---------------------------------------------------------------------------

void __fastcall TForm9::ComboBox4Change(TObject *Sender)
{
	this->Label31->Visible = false;

    if (this->ComboBox4->ItemIndex == 0)
    {
        this->Edit13->Visible = false;
        this->Edit14->Visible = false;
        this->Label1->Visible = false;
		this->Label5->Visible = false;
		this->Label23->Visible = false;
        this->Button6->Visible = false;
        this->ComboBox4->Color = clMoneyGreen;
        this->Label33->Visible = false;
        NewDatePers |= 64;
		NewDatePers ^= 64;

		this->Edit13->Text = "";
		this->Edit14->Text = "";
		this->Label23->Caption = "СМО №: отсутствует";
        this->Label33->Caption = "СМО: Отсутствует";
    }
    else
    {
        this->Edit13->Visible = true;
        this->Edit14->Visible = true;
        this->Label1->Visible = true;
		this->Label5->Visible = true;
		this->Label23->Visible = true;
        this->Button6->Visible = true;
        this->Label33->Visible = true;
        if (this->Label33->Caption == "СМО: Отсутствует") this->Label33->Font->Color = clRed;
        else this->Label33->Font->Color = clWindowText;
        this->ComboBox4->Color = clWindow;
		NewDatePers |= 64;
    }

    if (this->ComboBox4->ItemIndex == 1) this->Label31->Visible = true;
}
//---------------------------------------------------------------------------

void __fastcall TForm9::ComboBox3Change(TObject *Sender)
{
    if (this->ComboBox3->ItemIndex == 0)
    {
        this->Edit9->Visible   = false;
        this->Edit10->Visible  = false;
        this->Label26->Visible = false;
        this->Label27->Visible = false;
        this->ComboBox3->Color = clMoneyGreen;
        NewDatePers ^= 1024;
        NewDatePers |= 1024;
    }
    else
    {
        this->Edit9->Visible   = true;
        this->Edit10->Visible  = true;
        this->Label26->Visible = true;
        this->Label27->Visible = true;
        this->ComboBox3->Color = clWindow;
        NewDatePers |= 1024;
    }
}

//---------------------------------------------------------------------------
void __fastcall TForm9::ComboBox11Change(TObject *Sender)
{
    if (this->ComboBox11->ItemIndex == 0)
    {
        this->ComboBox11->Color = clMoneyGreen;
    }
    else
    {
        this->ComboBox11->Color = clWindow;
    }
}
//---------------------------------------------------------------------------

void __fastcall TForm9::ComboBox7Change(TObject *Sender)
{
    if (this->ComboBox7->ItemIndex == 0)
    {
        this->ComboBox7->Color = clMoneyGreen;
    }
    else
    {
        this->ComboBox7->Color = clYellow;
        if (this->ComboBox7->Text.Length() == 4)
        {
            if ((StrToInt(this->ComboBox7->Text) < 1904) || (StrToInt(this->ComboBox7->Text) > 2018))
            {
                this->ComboBox7->Color = clYellow;
            }
            else this->ComboBox7->Color = clWindow;
        }
    }
}
//---------------------------------------------------------------------------

void __fastcall TForm9::ComboBox5Change(TObject *Sender)
{
    if (this->ComboBox5->ItemIndex == 0)
    {
        this->ComboBox5->Color = clMoneyGreen;
    }
    else
    {
        this->ComboBox5->Color = clMoneyGreen;
        if (this->ComboBox5->Text.Length() == 1)
        {
            this->ComboBox5->Color = clYellow;
        }

        if (this->ComboBox5->Text.Length() > 2)
        {
            this->ComboBox5->Color = clYellow;
		}

        if (this->ComboBox5->Text.Length() == 2)
        {
            if (StrToInt(this->ComboBox5->Text) > 31)
            {
                this->ComboBox5->Color = clYellow;
            }
            else this->ComboBox5->Color = clWindow;
        }
    }

}

//---------------------------------------------------------------------------
void __fastcall TForm9::ComboBox10Change(TObject *Sender)
{
    if (this->ComboBox10->ItemIndex == 0)
    {
        this->ComboBox10->Color = clMoneyGreen;
    }
    else
    {
        this->ComboBox10->Color = clYellow;
        if (Form9->ComboBox10->Text.Length() == 4)
        {
            if ((StrToInt(Form9->ComboBox10->Text) < 1904) || (StrToInt(Form9->ComboBox10->Text) > 2018))
            {
                Form9->ComboBox10->Color = clYellow;
            }
            else this->ComboBox10->Color = clWindow;
        }
    }
}
//---------------------------------------------------------------------------

void __fastcall TForm9::ComboBox8Change(TObject *Sender)
{
    if (this->ComboBox8->ItemIndex == 0)
    {
        this->ComboBox8->Color = clMoneyGreen;
	}
    else
    {
        this->ComboBox8->Color = clWindow;
    }
}
//---------------------------------------------------------------------------

void __fastcall TForm9::Edit8Change(TObject *Sender)
{
    if (Form9->Edit8->Text=="")
    {
        Form9->Edit8->Color = clMoneyGreen;
    }
    else
    {
        Form9->Edit8->Color = clWindow;
    }
}
//---------------------------------------------------------------------------

void __fastcall TForm9::Edit11Change(TObject *Sender)
{
    if (Form9->Edit11->Text=="")
    {
        Form9->Edit11->Color = clMoneyGreen;
        NewDatePers |= 128;
        NewDatePers ^= 128;
    }
    else
    {
        NewDatePers |= 128;
        if (Form9->Edit11->Text.Length() != 14)
        {
            Form9->Edit11->Color = clYellow;
        }
        else
        {
            Form9->Edit11->Color = clWindow;
            //ProverkaSnils(Form9->Edit11->Text);
        }
	}
}

//---------------------------------------------------------------------------
void __fastcall TForm9::ProverkaSnils(String SnilsData)
{

    String Pol = "SELECT [ID_PAC]   \
                  FROM R_PERS       \
                  WHERE SNILS   = '" + SnilsData + "'";

    SQL_Reqest_3(Pol);
    if (SosSnils == 1)
    {
        if (Form9->ADOQuery3->RecordCount > 0)
        {
            Form9->Edit11->Color = clRed;
        }
    }
    else
    {
        if (Form9->ADOQuery3->RecordCount == 1)
        {
            String DataLen = Form9->ADOQuery3->Fields->Fields[0]->FieldName;
            String ItogData = Form9->ADOQuery3->FieldByName(DataLen)->AsString;
            if (DataLen == "_id")
            {
                if (ItogData != Form9->ADOQuery1->Fields->Fields[0]->AsString)
                {
                    Form9->Edit11->Color = clRed;
                }
            }
        }
        if (Form9->ADOQuery3->RecordCount > 1)
        {
            Form9->Edit11->Color = clRed;
        }
    }

}

//---------------------------------------------------------------------------
void __fastcall TForm9::Edit4Change(TObject *Sender)
{
    if (Form9->Edit4->Text=="")
    {
        Form9->Edit4->Color = clMoneyGreen;
    }
    else
    {
        Form9->Edit4->Color = clWindow;
    }
}
//---------------------------------------------------------------------------

void __fastcall TForm9::Edit9Change(TObject *Sender)
{
    if (Form9->Edit9->Text=="")
    {
        Form9->Edit9->Color = clMoneyGreen;
    }
    else
    {
        Form9->Edit9->Color = clWindow;
    }
}

//---------------------------------------------------------------------------
String SetInt(String FullName)
	{
		String temp ="";
        for (int i = 1; i <= FullName.Length(); i++)
        {
			if (FullName[i]>='0'&& FullName[i]<='9')
            {
                temp += FullName[i];
            }
            if (FullName[i]==' ') break;
        }
        return (temp);
	}

//---------------------------------------------------------------------------
void __fastcall TForm9::Edit10Change(TObject *Sender)
{
	if (Form9->Edit10->Text=="")
    {
        Form9->Edit10->Color = clMoneyGreen;
    }
    else
	{
		Form9->Edit10->Color = clWindow;
	}
}
//---------------------------------------------------------------------------

void __fastcall TForm9::Edit13Change(TObject *Sender)
{
    if (Form9->Edit13->Text=="")
    {
        Form9->Edit13->Color = clMoneyGreen;
        NewDatePers ^= 256;
        NewDatePers |= 256;
    }
    else
    {
        Form9->Edit13->Color = clWindow;
        NewDatePers |= 256;
    }
}
//---------------------------------------------------------------------------

void __fastcall TForm9::Edit14Change(TObject *Sender)
{
    if (Form9->Edit14->Text=="")
    {
        Form9->Edit14->Color = clMoneyGreen;
        NewDatePers ^= 512;
        NewDatePers |= 512;
    }
    else
    {
        Form9->Edit14->Color = clWindow;
        NewDatePers |= 512;
    }
}
//---------------------------------------------------------------------------

void __fastcall TForm9::Edit24Change(TObject *Sender)
{
    if (Form9->Edit24->Text=="")
    {
        Form9->Edit24->Color = clMoneyGreen;
    }
    else
    {
        Form9->Edit24->Color = clWindow;
    }
}

//---------------------------------------------------------------------------
void __fastcall TForm9::Function_R_DOST(String DataValue)
{
    bool StatusDataInfo = false;
    int TotalErorPers   = 63;
    int i;

    //Удаление кода нажедности пациента
	String SQLString = "DELETE FROM R_DOST WHERE [_pid]='" + DataValue + "'";
	Request2(SQLString);

    //неизвестно отчество
    if (this->Edit3->Text.Length() != 0) TotalErorPers ^= 1;

    //неизвестна фамилия
    if (this->Edit1->Text.Length() != 0) TotalErorPers ^= 2;

    //неизвестно имя
    if (this->Edit2->Text.Length() != 0) TotalErorPers ^= 4;

    //известен год и месяц
    if (
        (this->ComboBox7->ItemIndex > 0) &&
        (this->ComboBox6->ItemIndex > 0) &&
        (this->ComboBox5->ItemIndex == 0)
       )
    {
        StatusDataInfo = true;
    }
    else TotalErorPers ^= 8;

    //известен год
    if (
        (this->ComboBox7->ItemIndex > 0) &&
        (this->ComboBox6->ItemIndex == 0) &&
        (this->ComboBox5->ItemIndex == 0)
	   )
    {
        StatusDataInfo = true;
    }
    else TotalErorPers ^= 16;

    //дата рождения не понятна
    if (StatusDataInfo == false)
    {
        if (
            (this->ComboBox7->ItemIndex == 0) ||
            (this->ComboBox6->ItemIndex == 0) ||
            (this->ComboBox5->ItemIndex == 0)
           )
        {}
        else TotalErorPers ^= 32;
    }
    else TotalErorPers ^= 32;

    for (i = 0; i < 6; i++)
    {
        if ((TotalErorPers & (1 << i)) != 0)
        {
        SQLString = "INSERT INTO R_DOST  \
                      ([_pid]            \
                      ,[DOST])           \
                      VALUES('" + DataValue + "'," + IntToStr(i + 1)+")";

		Request2(SQLString);
        }
    }

    //Удаление кода нажедности пациента
	SQLString = "DELETE FROM R_DOST_P WHERE [_pid]='" + DataValue + "'";
	Request2(SQLString);
}

//---------------------------------------------------------------------------
void __fastcall TForm9::Function_R_DOST_P(String DataValue)
{
    bool StatusDataInfo = false;
    int TotalErorPers_P = 63;
    int i;

    //неизвестно отчество
    if (this->Edit7->Text.Length() != 0) TotalErorPers_P ^= 1;

    //неизвестна фамилия
    if (this->Edit5->Text.Length() != 0) TotalErorPers_P ^= 2;

    //неизвестно имя
    if (this->Edit6->Text.Length() != 0) TotalErorPers_P ^= 4;

    //известен год и месяц
    if (
        (this->ComboBox10->ItemIndex > 0) &&
        (this->ComboBox9->ItemIndex  > 0) &&
        (this->ComboBox8->ItemIndex == 0)
       )
    {
        StatusDataInfo = true;
    }
    else TotalErorPers_P ^= 8;

    //известен год
    if (
        (this->ComboBox10->ItemIndex > 0) &&
        (this->ComboBox9->ItemIndex == 0) &&
        (this->ComboBox8->ItemIndex == 0)
       )
    {
        StatusDataInfo = true;
    }
    else TotalErorPers_P ^= 16;

    //дата рождения не понятна
	if (StatusDataInfo == false)
    {
        if (
            (this->ComboBox10->ItemIndex == 0) ||
            (this->ComboBox9->ItemIndex  == 0) ||
            (this->ComboBox8->ItemIndex  == 0)
           )
        {}
        else TotalErorPers_P ^= 32;
    }
    else TotalErorPers_P ^= 32;

    for (i = 0; i < 6; i++)
    {
        if ((TotalErorPers_P & (1 << i)) != 0)
        {
        String SQLString = "INSERT INTO R_DOST_P  \
                      ([_pid]              \
                      ,[DOST])             \
                      VALUES('" + DataValue + "'," + IntToStr(i + 1)+")";

		Request2(SQLString);
        }
    }
}

//---------------------------------------------------------------------------
void __fastcall TForm9::Button4Click(TObject *Sender)
{
	DataValue_IdPack = this->DBGrid1->DataSource->DataSet->Fields->Fields[0]->Value;
	String VPOLIS, tf_okato, nam_smok, Ogrn;
    int j;

	Function_R_DOST(DataValue_IdPack);

    if (Form9->CheckBox6->Checked == false)
    {
		this->ComboBox8->ItemIndex = 0;
        this->ComboBox9->ItemIndex = 0;
        this->ComboBox10->ItemIndex = 0;
	}

	Function_R_DOST_P(DataValue_IdPack);

    String DataYear,   DataMonth,   DataDay;
    String DataYear_P, DataMonth_P, DataDay_P;
	String DR_1, DR_P_1;
    int i;

    //День рождения пациента
    if (this->ComboBox7->ItemIndex < 1)
    {
        DataYear = "1900";
        DR_1 = "'0000-";
    }
    else
    {
        DataYear = this->ComboBox7->Text;
        DR_1 = "'" + DataYear + "-";
    }

    if (this->ComboBox6->ItemIndex < 1)
    {
        DataMonth = "01";
        DR_1 +="00-";
    }
	else
    {
        if (this->ComboBox6->ItemIndex < 10) DataMonth = "0" + IntToStr(this->ComboBox6->ItemIndex);
        else DataMonth = IntToStr(this->ComboBox6->ItemIndex);
		DR_1 += DataMonth + "-";
    }

    if (this->ComboBox5->ItemIndex < 1)
    {
        DataDay = "01";
		DR_1 += "00'";
    }
    else
	{
        if (this->ComboBox5->ItemIndex < 10) DataDay = "0" + IntToStr(this->ComboBox5->ItemIndex);
        else DataDay = IntToStr(this->ComboBox5->ItemIndex);
        DR_1 += DataDay + "'";
    }

    //День рождения представителя
    if (this->ComboBox10->ItemIndex < 1)
    {
        DataYear_P = "1900";
        DR_P_1 = "'0000-";
    }
    else
    {
        DataYear_P = this->ComboBox10->Text;
		DR_P_1 = "'" + DataYear_P + "-";
    }

    if (this->ComboBox9->ItemIndex < 1)
    {
        DataMonth_P = "01";
        DR_P_1 +="00-";
    }
    else
	{
        if (this->ComboBox9->ItemIndex < 10) DataMonth_P = "0" + IntToStr(this->ComboBox9->ItemIndex);
        else DataMonth_P = IntToStr(this->ComboBox9->ItemIndex);
        DR_P_1 += DataMonth_P + "-";
    }

	if (this->ComboBox8->ItemIndex < 1)
    {
		DataDay_P = "01";
        DR_P_1 += "00'";
    }
    else
	{
    if (this->ComboBox8->ItemIndex < 10) DataDay_P = "0" + IntToStr(this->ComboBox8->ItemIndex);
        else DataDay_P = IntToStr(this->ComboBox8->ItemIndex);
		DR_P_1 += DataDay_P + "'";
    }

	//ИЗМЕНЕНИЕ ДАННЫХ ПАЦИЕНТА
	String FAM_P, IM_P, OT_P, W_P, DR_P, DR;
    if (Form9->CheckBox6->Checked)
    {
        if (this->Edit5->Text == "") FAM_P = "NULL";
        else  FAM_P = "'" + this->Edit5->Text + "'";

        if (this->Edit6->Text == "") IM_P = "NULL";
        else  IM_P = "'" + this->Edit6->Text + "'";

        if (this->Edit7->Text == "") OT_P = "NULL";
        else  OT_P = "'" + this->Edit7->Text + "'";

		W_P   = "'" + IntToStr(this->ComboBox2->ItemIndex + 1) + "'";
		DR_P  = "'" + DataYear_P + "-" + DataMonth_P + "-" + DataDay_P + "'";
    }
    else
    {
        FAM_P = "NULL";
		IM_P  = "NULL";
        OT_P  = "NULL";
		W_P   = "'0'";
        DR_P  = "'1900-01-01'";
    }

    String Passport = IntToStr(MasPassport[this->ComboBox3->ItemIndex - 1]);

	if (Passport == "0") Passport = "NULL";
    else Passport = "'" + Passport + "'";

	String FAM, IM, OT;
	if (this->Edit1->Text.Length() == 0) FAM = "NULL";
    else FAM = "'" + this->Edit1->Text + "'";

	if (this->Edit2->Text.Length() == 0) IM = "NULL";
    else IM = "'" + this->Edit2->Text + "'";

	if (this->Edit3->Text.Length() == 0) OT = "NULL";
	else OT = "'" + this->Edit3->Text + "'";

	String TEL, MestRoz, SerDoc, NumDoc, SNILS, Koment, Adress;

	if (this->Edit4->Text.Length() == 0) TEL = "NULL";
	else TEL = "'" + this->Edit4->Text + "'";

	if (this->Edit8->Text.Length() == 0) MestRoz = "NULL";
	else MestRoz = "'" + this->Edit8->Text + "'";

	if (this->Edit9->Text.Length() == 0) SerDoc = "NULL";
	else SerDoc = "'" + this->Edit9->Text + "'";

	if (this->Edit10->Text.Length() == 0) NumDoc = "NULL";
	else NumDoc = "'" + this->Edit10->Text + "'";

	if (this->Edit11->Text.Length() == 0) SNILS = "NULL";
	else SNILS = "'" + this->Edit11->Text + "'";

	if (this->Edit24->Text == "") Koment = "NULL";
	else Koment = "'" + this->Edit24->Text + "'";

	if (this->Edit15->Text == "") Adress = "NULL";
	else Adress = "'" + this->Edit15->Text + "'";

	String OKATOG = "'0'";
	//Окато жительства
	if (this->Button2->Caption != "Выбрать") OKATOG = "'" + this->Button2->Caption + "'";

	String OKATOP = "'0'";
	//Окато пребывания
	if (this->Button1->Caption != "Выбрать") OKATOP = "'" + this->Button1->Caption + "'";

    String OT_EXIST;
	if (this->CheckBox2->Checked) OT_EXIST = "'TRUE'";
    else OT_EXIST = "'FALSE'";

    String OT_P_EXIST;
	if (this->CheckBox3->Checked && this->CheckBox6->Checked) OT_P_EXIST = "'TRUE'";
	else OT_P_EXIST = "'FALSE'";

	DR  = "'" + DataYear + "-" + DataMonth + "-" + DataDay + "'";

	String TmpString = "UPDATE R_PERS SET                                                       \
						   [FAM]        = "  + FAM + "                                          \
						  ,[IM]         = "  + IM + "                                           \
						  ,[OT]         = "  + OT + "                                           \
						  ,[OT_EXIST]   = "  + OT_EXIST + "                                     \
						  ,[W]          = '" + IntToStr(this->ComboBox1->ItemIndex + 1)   + "'  \
						  ,[DR]         = "  + DR + "  											\
						  ,[DR_1]       = "  + DR_1 + "   										\
						  ,[TEL]        = "  + TEL + "                            				\
						  ,[ADRESS]     = "  + Adress + "                           			\
						  ,[FAM_P]      = "  + FAM_P + "                                        \
						  ,[IM_P]       = "  + IM_P + "                                         \
						  ,[OT_P]       = "  + OT_P + "                                         \
						  ,[OT_P_EXIST] = "  + OT_P_EXIST + "                                   \
						  ,[W_P]     	= "  + W_P  + "                                        	\
						  ,[DR_P]    	= "  + DR_P + "                                         \
						  ,[DR_P_1]  	= "  + DR_P_1 + "                                       \
						  ,[DOCTYPE] 	= "  + Passport +"                                      \
						  ,[DOCSER]  	= "  + SerDoc  + "                           			\
						  ,[DOCNUM]  	= "  + NumDoc + "                           			\
						  ,[MR]      	= "  + MestRoz + "                           			\
						  ,[SNILS]   	= "  + SNILS + "                           				\
						  ,[OKATOG]  	= "  + OKATOG + "                                      	\
						  ,[OKATOP]  	= "  + OKATOP + "                                      	\
						  ,[COMENTP] 	= "  + Koment + "                           			\
						WHERE ID_PAC 	= '" + DataValue_IdPack + "'";

	Request2(TmpString);

	DownLoadDBgrid1(DopData_U9);

	if (Form9->ADOQuery1->RecordCount >= 1)
    {
		Form9->ADOQuery1->Open();
		String DataLen;
        for (j = 0; j < Form9->ADOQuery1->FieldCount; j++)
        {
            DataLen = Form9->ADOQuery1->Fields->Fields[j]->FieldName;
            if (DataLen == "ID_PAC")
            {
				for (Form9->ADOQuery1->First(); !Form9->ADOQuery1->Eof; Form9->ADOQuery1->Next())
                {
					if (DataValue_IdPack == Form9->ADOQuery1->FieldByName(DataLen)->AsString) break;
                }
			break;
            }
        }
		InfoPacient();
		UpdateLen_Pacient();
    }

	//if (!FlagMessage)
	//{
//		DownLoadDBgrid1(DopData_U9);
		HWND hWnd = GetForegroundWindow();
		MessageBoxA(hWnd, "Данные о пациентах успешно обновлены.", "Внимание!", MB_OK);
    //}

	FlagMessage = false;

}

//---------------------------------------------------------------------------
void __fastcall TForm9::ComboBox6KeyPress(TObject *Sender, System::WideChar &Key)

{
	if ((Key >= '0') && (Key <= '9'))
    {}
    else
    {
		if ((Key == '\b') || (Key == '\r'))
		{
			if (Key == '\r')
			{
                Key = 0;
				if (this->ComboBox6->Text == "") this->ComboBox6->ItemIndex = 0;
				this->ComboBox7->SetFocus();
			}
		}
        else Abort();
    }
}

//---------------------------------------------------------------------------
void __fastcall TForm9::ComboBox9KeyPress(TObject *Sender, System::WideChar &Key)

{
	if ((Key >= '0') && (Key <= '9'))
    {}
    else
    {
		if ((Key == '\b') || (Key == '\r'))
		{
			if (Key == '\r')
			{
                Key = 0;
				if (this->ComboBox9->Text == "") this->ComboBox9->ItemIndex = 0;
				this->ComboBox10->SetFocus();
			}
		}
        else Abort();
    }
}

//---------------------------------------------------------------------------
void __fastcall TForm9::ClearDataForm()
{
    this->ComboBox1->ItemIndex  = -1;
    this->ComboBox2->ItemIndex  = -1;
    this->ComboBox3->ItemIndex  = 0;
    this->ComboBox4->ItemIndex  = 0;
    this->ComboBox5->ItemIndex  = 0;
    this->ComboBox6->ItemIndex  = 0;
    this->ComboBox7->ItemIndex  = 0;
    this->ComboBox8->ItemIndex  = 0;
    this->ComboBox9->ItemIndex  = 0;
    this->ComboBox10->ItemIndex = 0;
    this->ComboBox11->ItemIndex = 0;

    this->Edit1->Text  = "";
    this->Edit2->Text  = "";
    this->Edit3->Text  = "";
	this->Edit4->Text  = "";
    this->Edit5->Text  = "";
    this->Edit6->Text  = "";
    this->Edit7->Text  = "";
    this->Edit8->Text  = "";
    this->Edit9->Text  = "";
    this->Edit10->Text = "";
    this->Edit11->Text = "";
    this->Edit13->Text = "";
	this->Edit14->Text = "";
	this->Edit15->Text = "";
    this->Edit24->Text = "";

	this->Button1->Caption = "Выбрать";
    this->Button2->Caption = "Выбрать";

	this->Label33->Caption = "СМО: Отсутствует";
    this->Label33->Font->Color = clRed;

    this->Label31->Caption = Tmp_ST_OKATO;
}

//---------------------------------------------------------------------------
void __fastcall TForm9::Button3Click(TObject *Sender)
{
	if (NewDatePers == 0)
    {
        HWND hWnd = GetForegroundWindow();
        MessageBoxA(hWnd, "Данные о пациенте не добавлены.", "Внимание!", MB_OK);
        Abort();
    }

    int i,j;
    String NamePole, ItogData;

    String FAM, IM, OT;

	if (this->Edit1->Text == "") FAM = "NULL";
    else FAM = "'" + this->Edit1->Text + "'";

    if (this->Edit2->Text == "") IM = "NULL";
    else IM = "'" + this->Edit2->Text + "'";

    if (this->Edit3->Text == "") OT = "NULL";
    else OT = "'" + this->Edit3->Text + "'";

	if (Form9->CheckBox6->Checked == false)
    {
        this->ComboBox8->ItemIndex = 0;
        this->ComboBox9->ItemIndex = 0;
		this->ComboBox10->ItemIndex = 0;
    }

	String DataYear,   DataMonth,   DataDay;
	String DataYear_P, DataMonth_P, DataDay_P;
	String DR_1, DR_P_1;

	//День рождения пациента
    if (this->ComboBox7->ItemIndex < 1)
    {
		DR_1 = "'0000-";
		DataYear = "1900";
    }
	else
	{
		DataYear = this->ComboBox7->Text;
		DR_1 = "'" + DataYear + "-";
	}

	if (this->ComboBox6->ItemIndex < 1)
    {
		DataMonth = "01";
        DR_1 += "00-";
	}
    else
	{
		if (this->ComboBox6->ItemIndex < 10) DataMonth = "0" + IntToStr(this->ComboBox6->ItemIndex);
		else DataMonth = IntToStr(this->ComboBox6->ItemIndex);
		DR_1 += DataMonth + "-";
    }

	if (this->ComboBox5->ItemIndex < 1)
	{
        DataDay = "01";
		DR_1 += "00'";
    }
    else
    {
	if (this->ComboBox5->ItemIndex < 10) DataDay = "0" + IntToStr(this->ComboBox5->ItemIndex);
        else DataDay = IntToStr(this->ComboBox5->ItemIndex);
        DR_1 += DataDay + "'";
	}

    //День рождения представителя
    if (this->ComboBox10->ItemIndex < 1)
    {
		DataYear_P = "1900";
        DR_P_1 = "'0000-";
    }
	else
    {
        DataYear_P = this->ComboBox10->Text;
        DR_P_1 = "'" + DataYear_P + "-";
    }

	if (this->ComboBox9->ItemIndex < 1)
    {
		DataMonth_P = "01";
        DR_P_1 += "00-";
    }
    else
    {
        if (this->ComboBox9->ItemIndex < 10) DataMonth_P = "0" + IntToStr(this->ComboBox9->ItemIndex);
        else DataMonth_P = IntToStr(this->ComboBox9->ItemIndex);
        DR_P_1 += DataMonth_P + "-";
    }

    if (this->ComboBox8->ItemIndex < 1)
    {
        DataDay_P = "01";
        DR_P_1 += "00'";
    }
	else
    {
    if (this->ComboBox8->ItemIndex < 10) DataDay_P = "0" + IntToStr(this->ComboBox8->ItemIndex);
        else DataDay_P = IntToStr(this->ComboBox8->ItemIndex);
        DR_P_1 += DataDay_P + "'";
    }

    String Passport = IntToStr(MasPassport[this->ComboBox3->ItemIndex - 1]);

	if (Passport == "0") Passport = "NULL";
    else Passport = "'" + Passport + "'";

	String FAM_P, IM_P, OT_P, W_P, DR_P;
    if (Form9->CheckBox6->Checked)
    {
		if (this->Edit5->Text == "") FAM_P = "NULL";
		else  FAM_P = "'" + this->Edit5->Text + "'";

        if (this->Edit6->Text == "") IM_P = "NULL";
		else  IM_P = "'" + this->Edit6->Text + "'";

        if (this->Edit7->Text == "") OT_P = "NULL";
		else  OT_P = "'" + this->Edit7->Text + "'";

		W_P   = "'" + IntToStr(this->ComboBox2->ItemIndex + 1) + "'";
		DR_P  = "'" + DataYear_P + "-" + DataMonth_P + "-" + DataDay_P + "'";
    }
    else
    {
        FAM_P = "NULL";
        IM_P  = "NULL";
        OT_P  = "NULL";
		W_P   = "'0'";
		DR_P  = "'1900-01-01'";
    }

    String OT_EXIST;
    if (this->CheckBox2->Checked)
	{
        OT_EXIST = "'TRUE'";
    }
    else OT_EXIST = "'FALSE'";

	String OT_P_EXIST;
	if (this->CheckBox3->Checked && this->CheckBox6->Checked)
    {
        OT_P_EXIST = "'TRUE'";
    }
	else OT_P_EXIST = "'FALSE'";

	String TEL, ADRESS, PlaceBorn, SerDoc, NumDoc, Snils, Koment;
	if (this->Edit4->Text.Length() > 0)	TEL = "'" + this->Edit4->Text + "'";
	else TEL = "NULL";

	if (this->Edit15->Text.Length() > 0) ADRESS = "'" + this->Edit15->Text + "'";
	else ADRESS = "NULL";

	if (this->Edit8->Text.Length() > 0) PlaceBorn = "'" + this->Edit8->Text + "'";
	else PlaceBorn = "NULL";

	if (this->Edit9->Text.Length() > 0) SerDoc = "'" + this->Edit9->Text + "'";
	else SerDoc = "NULL";

	if (this->Edit10->Text.Length() > 0) NumDoc = "'" + this->Edit10->Text + "'";
	else NumDoc = "NULL";

	if (this->Edit11->Text.Length() > 0) Snils = "'" + this->Edit11->Text + "'";
	else Snils = "NULL";

	if (this->Edit24->Text.Length() > 0) Koment = "'" + this->Edit11->Text + "'";
	else Koment = "NULL";

	String OKATOG = "'0'";
	//Окато жительства
	if (this->Button2->Caption != "Выбрать") OKATOG = "'" + this->Button2->Caption + "'";

	String OKATOP = "'0'";
	//Окато пребывания
	if (this->Button1->Caption != "Выбрать") OKATOP = "'" + this->Button1->Caption + "'";


	String SaveData =  "INSERT INTO [R_PERS] ([ID_PAC], \
											  [FAM], \
                                              [IM], \
											  [OT], \
											  [OT_EXIST], \
											  [W], \
											  [DR], \
											  [DR_1],\
											  [TEL], \
											  [ADRESS], \
                                              [FAM_P], \
                                              [IM_P], \
                                              [OT_P], \
                                              [OT_P_EXIST], \
                                              [W_P], \
                                              [DR_P], \
                                              [DR_P_1],\
                                              [MR], \
                                              [DOCTYPE], \
                                              [DOCSER], \
                                              [DOCNUM], \
                                              [SNILS], \
											  [OKATOG], \
                                              [OKATOP], \
                                              [COMENTP]) \
						OUTPUT INSERTED.ID_PAC VALUES ( newid(),";

    String SaveData_1 =       FAM                                               + "," +
                              IM                                                + "," +
                              OT                                                + "," +
                              OT_EXIST                                          + "," +
						"'" + IntToStr(this->ComboBox1->ItemIndex + 1) + "'"    + "," +
                        "'" + DataYear + "-" + DataMonth + "-" + DataDay + "'"  + "," +
							  DR_1                                              + "," +
							  TEL                            					+ "," +
							  ADRESS                          					+ "," +
							  FAM_P 		                                    + "," +
							  IM_P 		                                        + "," +
							  OT_P 		                                        + "," +
							  OT_P_EXIST                                        + "," +
							  W_P                                               + "," +
							  DR_P 		                                        + "," +
							  DR_P_1                                            + "," +
							  PlaceBorn				                            + "," +
							  Passport                                          + "," +
							  SerDoc                                 			+ "," +
							  NumDoc                                		    + "," +
                        	  Snils                         					+ "," +
							  OKATOG 						                    + "," +
							  OKATOP                      						+ "," +
							  Koment                       						+ ")";

	SQL_Reqest_2(SaveData + SaveData_1);

	DataValue_IdPack = Form9->ADOQuery2->FieldByName("ID_PAC")->AsString;
	Function_R_DOST(DataValue_IdPack);
	Function_R_DOST_P(DataValue_IdPack);

	DownLoadDBgrid1(DopData_U9);

	if (Form9->ADOQuery1->RecordCount >= 1)
	{
		Form9->ADOQuery1->Open();
		String DataLen;
		for (j = 0; j < Form9->ADOQuery1->FieldCount; j++)
		{
			DataLen = Form9->ADOQuery1->Fields->Fields[j]->FieldName;
			if (DataLen == "ID_PAC")
			{
				for (Form9->ADOQuery1->First(); !Form9->ADOQuery1->Eof; Form9->ADOQuery1->Next())
				{
					if (DataValue_IdPack == Form9->ADOQuery1->FieldByName(DataLen)->AsString)
					{
					this->DBGrid1CellClick(0);
					break;
					}
				}
			break;
			}
		}
	}
	SosSnils = 0;
	this->Button3->Visible = false;
	this->Button4->Visible = true;

	FlagMessage = true;
	DownLoadDBgrid1(DopData_U9);
	UpdateLen_Pacient();

	HWND hWnd = GetForegroundWindow();
	MessageBoxA(hWnd, "Новые данные добавлены.", "Внимание!", MB_OK);
}

//---------------------------------------------------------------------------
void __fastcall TForm9::Edit1KeyPress(TObject *Sender, System::WideChar &Key)
{
	if (((Key >= '0') && (Key <= '9')) || (Key == 39))
	{
		Abort();
	}
	if (Key == '\r')
	{
		Key = 0;
		this->Edit2->SetFocus();
	}
	if (Key == '\'') Key = 0;
}

//---------------------------------------------------------------------------
void __fastcall TForm9::Button6Click(TObject *Sender)
{
	Form5->Caption = "Выбор страховой медицинской организации";
	Form5->ShowModal();
	if ((NumberSMO != Temp_NumberSMO) && (Temp_NumberSMO.Length() > 0))
	{
		NumberSMO = "'" + Temp_NumberSMO + "'";
	}
    this->ComboBox11->SetFocus();
}

//---------------------------------------------------------------------------

void __fastcall TForm9::Edit2KeyPress(TObject *Sender, System::WideChar &Key)
{
	if (((Key >= '0') && (Key <= '9')) || (Key == 39))
    {
        Abort();
	}
	if (Key == '\r')
	{
		Key = 0;
        this->Edit3->SetFocus();
	}
	if (Key == '\'') Key = 0;
}
//---------------------------------------------------------------------------

void __fastcall TForm9::Edit3KeyPress(TObject *Sender, System::WideChar &Key)
{
	if (((Key >= '0') && (Key <= '9')) || (Key == 39))
    {
        Abort();
	}
	if (Key == '\r')
	{
		Key = 0;
		this->CheckBox2->SetFocus();
	}
	if (Key == '\'') Key = 0;
}
//---------------------------------------------------------------------------

void __fastcall TForm9::ComboBox5KeyPress(TObject *Sender, System::WideChar &Key)

{
	if ((Key >= '0') && (Key <= '9'))
    {}
    else
    {
		if ((Key == '\b') || (Key == '\r'))
        {
			if (Key == '\r')
			{
				Key = 0;
				if (this->ComboBox5->Text == "") this->ComboBox5->ItemIndex = 0;
				this->ComboBox6->SetFocus();
			}
		}
		else Abort();
    }
}
//---------------------------------------------------------------------------

void __fastcall TForm9::ComboBox8KeyPress(TObject *Sender, System::WideChar &Key)

{
	if ((Key >= '0') && (Key <= '9'))
    {}
	else
    {
		if ((Key == '\b') || (Key == '\r'))
		{
			if (Key == '\r')
			{
                Key = 0;
				if (this->ComboBox8->Text == "") this->ComboBox8->ItemIndex = 0;
				this->ComboBox9->SetFocus();
			}
		}
        else Abort();
    }
}
//---------------------------------------------------------------------------

void __fastcall TForm9::ComboBox7KeyPress(TObject *Sender, System::WideChar &Key)

{
	if ((Key >= '0') && (Key <= '9'))
    {}
    else
    {
		if ((Key == '\b') || (Key == '\r'))
		{
			if (Key == '\r')
			{
                Key = 0;
				if (this->ComboBox7->Text == "") this->ComboBox7->ItemIndex = 0;
				this->CheckBox6->SetFocus();
			}
		}
        else Abort();
    }
}
//---------------------------------------------------------------------------

void __fastcall TForm9::ComboBox10KeyPress(TObject *Sender, System::WideChar &Key)

{
	if ((Key >= '0') && (Key <= '9'))
	{}
	else
    {
		if ((Key == '\b') || (Key == '\r'))
		{
			if (Key == '\r')
			{
				Key = 0;
				if (this->ComboBox10->Text == "") this->ComboBox10->ItemIndex = 0;
				this->ComboBox3->SetFocus();
			}
		}
        else Abort();
    }
}
//---------------------------------------------------------------------------
void __fastcall TForm9::CheckBox1Click(TObject *Sender)
{
    if (this->CheckBox1->Checked)
    {
		this->Button1->Caption = this->Button2->Caption;
		this->Button1->Enabled = false;
    }
    else
    {
		this->Button1->Enabled = true;
	}
}
//---------------------------------------------------------------------------

void __fastcall TForm9::Edit14KeyPress(TObject *Sender, System::WideChar &Key)
{
   	if (Key == '\'') Key = 0;
	if ((Key >= '0') && (Key <= '9'))
    {}
    else
    {
		if ((Key == '\b') || (Key == '\r'))
		{
			if (Key == '\r')
			{
                Key = 0;
				this->Button6->SetFocus();
			}
		}
        else Abort();
    }
}
//---------------------------------------------------------------------------

void __fastcall TForm9::Edit10KeyPress(TObject *Sender, System::WideChar &Key)
{
	if (Key == '\'') Key = 0;
	if ((Key >= '0') && (Key <= '9'))
	{
	}
	else
	{
		if ((Key == '\b') || (Key == '\r'))
		{
			if (Key == '\r')
			{
                Key = 0;
				this->Edit8->SetFocus();
			}
		}
		else Abort();
	}
}
//---------------------------------------------------------------------------

void __fastcall TForm9::Edit4KeyPress(TObject *Sender, System::WideChar &Key)
{
   	if (Key == '\'') Key = 0;
	if (
        ((Key >= '0') && (Key <= '9')) ||
        (Key == '+') ||
        (Key == '-') ||
        (Key == '(') ||
        (Key == ')')
       )
    {

    }
    else
    {
		if ((Key == '\b') || (Key == '\r'))
		{
			if (Key == '\r')
			{
                Key = 0;
				this->Edit15->SetFocus();
			}
		}
        else Abort();
    }
}
//---------------------------------------------------------------------------

void __fastcall TForm9::CategoryButtons1Categories0Items4Click(TObject *Sender)
{
	int i,j,k;

    String NamePole,ItogData;
    String R_PACIENT_id = "";

	if (MessageBox(Application->Handle,
		L"Удаление данных о пациенте. Вы уверены?",
		L"Удаление информации",
	MB_ICONQUESTION | MB_YESNO) == IDYES)
	{
		DataValue_IdPack = this->DBGrid1->DataSource->DataSet->Fields->Fields[0]->Value;

        //Получаем _id из R_PACIENT при условии что существует ID_PAC
        String Strahovanie = "SELECT [_id]  \
                            ,[ID_PAC]       \
							FROM R_PACIENT  \
							WHERE ID_PAC ='" + DataValue_IdPack + "'";

        SQL_Reqest_3(Strahovanie);
        if (Form9->ADOQuery3->RecordCount == 1)
        {
            for (j = 0; j < Form9->ADOQuery3->FieldCount; j++)
            {
                NamePole = Form9->ADOQuery3->Fields->Fields[j]->FieldName;
                ItogData = Form9->ADOQuery3->FieldByName(NamePole)->AsString;

				if (NamePole == "_id") R_PACIENT_id = ItogData;
            }
        }

        if (R_PACIENT_id != "")
        {
            //Получаем записи из R_ZAP по _pid при условии что существует
            String Zapis = "SELECT [_id]       \
                                  ,[_pid]      \
                            FROM R_ZAP         \
                            WHERE _pid = " + R_PACIENT_id ;

            SQL_Reqest_3(Zapis);

            //Записей может быть несколько для одного _pid
            if (Form9->ADOQuery3->RecordCount != 0)
            {
				k = 0;
				Form9->ADOQuery3->Open();
				for (Form9->ADOQuery3->First(); !Form9->ADOQuery3->Eof; Form9->ADOQuery3->Next())
				{
					for (j = 0; j < Form9->ADOQuery3->FieldCount; j++)
					{
						NamePole = Form9->ADOQuery3->Fields->Fields[j]->FieldName;
						ItogData = Form9->ADOQuery3->FieldByName(NamePole)->AsString;

						if (NamePole == "_id")
						{
							InfoSluch(ItogData);
							k++;
						}
					}
				}

				String SQLString = "DELETE FROM R_ZAP WHERE [_pid]=" + R_PACIENT_id;
				Request2(SQLString);
            }
        }

		String SQLString = "DELETE FROM R_PACIENT WHERE [ID_PAC]='" + DataValue_IdPack + "'";
		Request2(SQLString);

        //Удаление кода нажедности пациента
		SQLString = "DELETE FROM R_DOST WHERE [_pid]='" + DataValue_IdPack + "'";
		Request2(SQLString);

        //Удаление кода нажедности представителя
		SQLString = "DELETE FROM R_DOST_P WHERE [_pid]='" + DataValue_IdPack + "'";
		Request2(SQLString);

		SQLString = "DELETE FROM R_PERS WHERE [ID_PAC]='" + DataValue_IdPack + "'";
		Request2(SQLString);

        DownLoadDBgrid1(DopData_U9);
        InfoPacient();
	}
}
//---------------------------------------------------------------------------

void __fastcall TForm9::DBGrid1DblClick(TObject *Sender)
{
	Form9->Panel6->Visible = true;
	if (this->WindowState == wsNormal)
	{
		this->Constraints->MaxWidth = this->Panel1->Width + this->Panel6->Width + this->SplitView1->Width + 18;
		this->Constraints->MinWidth = this->Constraints->MaxWidth;
		this->Width = this->Constraints->MaxWidth;
	}
	this->Button3->Visible = false;
	this->GroupBox3->Visible = true;
    this->Button4->Visible = true;
	InfoPacient();
    EditForm = 1;
    NewForm = 0;
    ViewForm = 0;
}

//---------------------------------------------------------------------------
void __fastcall TForm9::ComboBox3KeyUp(TObject *Sender, WORD &Key, TShiftState Shift)
{
	if (Key == 32)
	{
		if (!this->ComboBox3->DroppedDown) this->ComboBox3->DroppedDown = true;
		else this->ComboBox3->DroppedDown = false;
	}
	if (Key == 8)
	{
		this->ComboBox3->ItemIndex = -1;
	}
}
//---------------------------------------------------------------------------


void __fastcall TForm9::ComboBox4KeyUp(TObject *Sender, WORD &Key, TShiftState Shift)

{
	if (Key == 32)
	{
		if (!this->ComboBox4->DroppedDown) this->ComboBox4->DroppedDown = true;
		else this->ComboBox4->DroppedDown = false;
	}
	if (Key == 8)
	{
		this->ComboBox4->ItemIndex = -1;
	}
}
//---------------------------------------------------------------------------




void __fastcall TForm9::DBGrid1DrawColumnCell(TObject *Sender, const TRect &Rect,
          int DataCol, TColumn *Column, TGridDrawState State)
{
	F1MyDBGrid *grid = static_cast<F1MyDBGrid*>(Sender);
    if (grid->DataLink->ActiveRecord == grid->Row -1)
    {
     TField *F = Column->Field;
	 TCanvas *Cvs = DBGrid1->Canvas;
	 if (TypeActiveDBgrid > 0)
	 {
		 if (TypeActiveDBgrid == 1) Cvs->Brush->Color = clSkyBlue;
		 else  Cvs->Brush->Color = clMedGray;
	 }
	 Cvs->FillRect(Rect);
     Cvs->Font->Color = clBlack;
     Cvs->TextOut(Rect.Left+2, Rect.Top+2, F->Text);
     Cvs->TextOut(Rect.Left+2, Rect.Top+2, F->Text);
    }
}

//---------------------------------------------------------------------------
void __fastcall TForm9::Edit12Change(TObject *Sender)
{
	String StrokaPoiska = Form9->Edit12->Text;
    if (StrokaPoiska.Length()> 0)
    {
	   DopData_U9 = " WHERE          R_PERS.SNILS     LIKE '%" + StrokaPoiska
							+ "%' OR R_PERS.FAM       LIKE '%" + StrokaPoiska + "%'";

		DownLoadDBgrid1(DopData_U9);

		UpdateLen_Form9();
		if ((this->DBGrid1->Visible) && (this->Panel6->Visible)) InfoPacient();
    }
	else
	{
		DopData_U9 = "";
		DownLoadDBgrid1(DopData_U9);
    }
this->Edit12->Width = this->Panel4->Width - 200;
}

//---------------------------------------------------------------------------
void __fastcall TForm9::CheckBox2Click(TObject *Sender)
{
    if (this->CheckBox2->Checked)
    {
        this->Edit3->Text = "";
        this->Edit3->Enabled = false;
        this->Edit3->Color = clGray;
    }
    else
    {
        this->Edit3->Enabled = true;
		if (this->Edit3->Text == "") this->Edit3->Color = clMoneyGreen;
		else this->Edit3->Color = clWindow;
	}
    //this->CheckBox2->Font->Style =  TFontStyles() << fsBold << fsItalic;
}

//---------------------------------------------------------------------------
void __fastcall TForm9::CheckBox3Click(TObject *Sender)
{
    if (this->CheckBox3->Checked)
    {
        this->Edit7->Text = "";
        this->Edit7->Enabled = false;
        this->Edit7->Color = clGray;
    }
    else
    {
        this->Edit7->Enabled = true;
		if (this->Edit7->Text == "") this->Edit7->Color = clMoneyGreen;
		else this->Edit7->Color = clWindow;
    }
}

//---------------------------------------------------------------------------
void __fastcall TForm9::ComboBox2KeyUp(TObject *Sender, WORD &Key, TShiftState Shift)
{
	if (Key == 32)
	{
		if (!this->ComboBox2->DroppedDown) this->ComboBox2->DroppedDown = true;
		else this->ComboBox2->DroppedDown = false;
	}
	if (Key == 8)
	{
		this->ComboBox2->ItemIndex = -1;
	}
}
//---------------------------------------------------------------------------

void __fastcall TForm9::CheckBox2Exit(TObject *Sender)
{
//  this->CheckBox2->Font->Style =  TFontStyles() >> fsBold >> fsItalic;
}

//---------------------------------------------------------------------------
void __fastcall TForm9::FormKeyPress(TObject *Sender, System::WideChar &Key)
{
	if (Key == '\x1B')
    {
		Key = 0;
        this->Close();
    }
    if ((Key == '+') && !Form9->Panel6->Visible)
    {
        Key = 0;
        CategoryButtons1Categories0Items2Click(0);
    }
}
//---------------------------------------------------------------------------

void __fastcall TForm9::CheckBox2KeyPress(TObject *Sender, System::WideChar &Key)
{
	if (Key == '\r')
	{
		Key = 0;
		this->ComboBox1->SetFocus();
	}
}
//---------------------------------------------------------------------------

void __fastcall TForm9::ComboBox1KeyPress(TObject *Sender, System::WideChar &Key)
{
	if (Key == '\r')
	{
		Key = 0;
		this->ComboBox5->SetFocus();
	}
}
//---------------------------------------------------------------------------

void __fastcall TForm9::ComboBox11KeyPress(TObject *Sender, System::WideChar &Key)
{
	if (Key == '\r')
	{
        Key = 0;
		this->Button5->SetFocus();
	}
}
//---------------------------------------------------------------------------

void __fastcall TForm9::ComboBox1KeyUp(TObject *Sender, WORD &Key, TShiftState Shift)

{
	if (Key == 32)
	{
		if (!this->ComboBox1->DroppedDown) this->ComboBox1->DroppedDown = true;
		else this->ComboBox1->DroppedDown = false;
	}
	if (Key == 8)
	{
		this->ComboBox1->ItemIndex = -1;
	}
}
//---------------------------------------------------------------------------

void __fastcall TForm9::ComboBox11KeyUp(TObject *Sender, WORD &Key, TShiftState Shift)

{
	if (Key == 32)
	{
		if (!this->ComboBox11->DroppedDown) this->ComboBox11->DroppedDown = true;
		else this->ComboBox11->DroppedDown = false;
	}
	if (Key == 8)
	{
		this->ComboBox11->ItemIndex = -1;
	}
}
//---------------------------------------------------------------------------

void __fastcall TForm9::FormResize(TObject *Sender)
{
	if (this->WindowState == wsMaximized)
	{
		int screenW = GetSystemMetrics(SM_CXSCREEN);
		int screenH = GetSystemMetrics(SM_CYSCREEN);

		Form9->Constraints->MaxHeight = screenH;
		Form9->Constraints->MinHeight = screenH;


        this->Constraints->MaxWidth = screenW;
		this->Constraints->MinWidth = this->Constraints->MaxWidth;
		this->Width = this->Constraints->MaxWidth;

		ActionNormForm = 0;

		if (Form9->Panel6->Visible)
		{
			this->Panel1->Width = Form9->Constraints->MaxWidth - this->SplitView1->Width - this->Panel6->Width;
			Form9->DBGrid1->Width = Form9->Panel1->Width - 20;
		}
		else
		{
			this->Panel1->Width = Form9->Constraints->MaxWidth - this->SplitView1->Width;
			Form9->DBGrid1->Width = Form9->Panel1->Width - 20;
		}
	}

	if ((this->WindowState == wsNormal) && (ActionNormForm == 0))
	{
		this->Panel1->Width = 487;
		Form9->DBGrid1->Width = Form9->Panel1->Width - 20;
//		ActionMaxForm  = 0;
		ActionNormForm = 1;

		if (this->Panel6->Visible)
		{
			this->Constraints->MaxWidth = this->Panel1->Width + this->Panel6->Width + this->SplitView1->Width + 18;
		}
		else
		{
			this->Constraints->MaxWidth = this->Panel1->Width + this->SplitView1->Width + 18;
		}

		this->Constraints->MinWidth = this->Constraints->MaxWidth;
		this->Width = this->Constraints->MaxWidth;

		Form9->DBGrid1->Width = Form9->Panel1->Width - 20;

		this->Constraints->MaxHeight = 695;
		this->Constraints->MinHeight = 695;
    }
}
//---------------------------------------------------------------------------

void __fastcall TForm9::ComboBox4KeyPress(TObject *Sender, System::WideChar &Key)
{
	if (Key == '\r')
	{
		Key = 0;
		if (this->Edit13->Visible) this->Edit13->SetFocus();
		else this->ComboBox3->SetFocus();
	}
}
//---------------------------------------------------------------------------

void __fastcall TForm9::Edit13KeyPress(TObject *Sender, System::WideChar &Key)
{
	if (Key == '\r')
	{
		Key = 0;
		this->Edit14->SetFocus();
	}
   	if (Key == '\'') Key = 0;
}
//---------------------------------------------------------------------------

void __fastcall TForm9::ComboBox3KeyPress(TObject *Sender, System::WideChar &Key)
{
	if (Key == '\r')
	{
		Key = 0;
		if (this->Edit9->Visible) this->Edit9->SetFocus();
		else this->Edit8->SetFocus();
	}
}
//---------------------------------------------------------------------------

void __fastcall TForm9::Edit9KeyPress(TObject *Sender, System::WideChar &Key)
{
	if (Key == '\r')
	{
		Key = 0;
		this->Edit10->SetFocus();
	}
	if (Key == '\'') Key = 0;
}
//---------------------------------------------------------------------------

void __fastcall TForm9::Edit8KeyPress(TObject *Sender, System::WideChar &Key)
{
	if (Key == '\r')
	{
		Key = 0;
		this->Edit11->SetFocus();
	}
   	if (Key == '\'') Key = 0;
}
//---------------------------------------------------------------------------

void __fastcall TForm9::CheckBox1KeyPress(TObject *Sender, System::WideChar &Key)

{
	if (Key == '\r')
	{
        Key = 0;
		if (this->Button1->Enabled) this->Button1->SetFocus();
		else this->Edit24->SetFocus();
	}
}
//---------------------------------------------------------------------------

void __fastcall TForm9::Edit24KeyPress(TObject *Sender, System::WideChar &Key)
{
   	if (Key == '\'') Key = 0;
	if (Key == '\r')
	{
        Key = 0;
        if (this->Button3->Visible) this->Button3->SetFocus();
		if (this->Button4->Visible) this->Button4->SetFocus();
	}
}
//---------------------------------------------------------------------------

void __fastcall TForm9::Edit5KeyPress(TObject *Sender, System::WideChar &Key)
{
	if (Key == '\r')
	{
		Key = 0;
		this->Edit6->SetFocus();
	}
	if (Key == '\'') Key = 0;
}
//---------------------------------------------------------------------------

void __fastcall TForm9::Edit6KeyPress(TObject *Sender, System::WideChar &Key)
{
	if (Key == '\r')
	{
		Key = 0;
        this->Edit7->SetFocus();
	}
   	if (Key == '\'') Key = 0;
}
//---------------------------------------------------------------------------

void __fastcall TForm9::Edit7KeyPress(TObject *Sender, System::WideChar &Key)
{
	if (Key == '\r')
	{
		Key = 0;
		this->CheckBox3->SetFocus();
	}
	if (Key == '\'') Key = 0;
}
//---------------------------------------------------------------------------

void __fastcall TForm9::ComboBox2KeyPress(TObject *Sender, System::WideChar &Key)
{
	if (Key == '\r')
	{
		Key = 0;
		this->ComboBox8->SetFocus();
	}
}
//---------------------------------------------------------------------------

void __fastcall TForm9::CheckBox3KeyPress(TObject *Sender, System::WideChar &Key)
{
	if (Key == '\r')
	{
		Key = 0;
		this->ComboBox2->SetFocus();
	}
}
//---------------------------------------------------------------------------

void __fastcall TForm9::CheckBox6KeyPress(TObject *Sender, System::WideChar &Key)
{
	if (Key == '\r')
	{
		Key = 0;
		if (this->GroupBox2->Visible) this->Edit5->SetFocus();
		else this->ComboBox3->SetFocus();
	}
}
//---------------------------------------------------------------------------

void __fastcall TForm9::DBGrid1ColumnMoved(TObject *Sender, int FromIndex, int ToIndex)

{
	this->DBGrid1->Columns->Items[ToIndex]->Index = FromIndex;
}
//---------------------------------------------------------------------------

void __fastcall TForm9::CategoryButtons1Categories0Items5Click(TObject *Sender)
{
	String qq = Form9->DBGrid1->DataSource->DataSet->Fields->Fields[0]->AsString;
	AnsiString temp = "ItMedMor.exe " + qq;
	char cmd[100];
	strcpy(cmd, temp.c_str());
	WinExec(cmd,SW_SHOW);
}
//---------------------------------------------------------------------------

void __fastcall TForm9::DBGrid1TitleClick(TColumn *Column)
{
	String Data = Column->FieldName;
	if (Data == "№ ")
	{
		if (SostSort_U9 == 1)
		{
			SostSort_U9 = 2;
			DataSort_U9 = " ORDER BY row_number() over (order by R_PERS.FAM) DESC";
		}
		else
		{
			SostSort_U9 = 1;
			DataSort_U9 = " ORDER BY row_number() over (order by R_PERS.FAM) ASC";
		}
	}

	if (Data == "ФИО")
	{
		if (SostSort_U9 == 3)
		{
			SostSort_U9 = 4;
			DataSort_U9 = " ORDER BY isnull(R_PERS.FAM, '') + ' ' + isnull(R_PERS.IM, '') + ' ' + isnull(R_PERS.OT, '') DESC";
		}
		else
		{
			SostSort_U9 = 3;
			DataSort_U9 = " ORDER BY isnull(R_PERS.FAM, '') + ' ' + isnull(R_PERS.IM, '') + ' ' + isnull(R_PERS.OT, '') ASC";
		}
	}

	if (Data == "СНИЛС")
	{
		if (SostSort_U9 == 5)
		{
			SostSort_U9 = 6;
			DataSort_U9 = " ORDER BY R_PERS.SNILS DESC";
		}
		else
		{
			SostSort_U9 = 5;
			DataSort_U9 = " ORDER BY R_PERS.SNILS ASC";
		}
	}


	if (Data == "Полис: серия, №")
	{
		if (SostSort_U9 == 7)
		{
			SostSort_U9 = 8;
			DataSort_U9 = " ORDER BY isnull(R_PACIENT.SPOLIS,'') + ' ' + isnull(R_PACIENT.NPOLIS,'') DESC";
		}
		else
		{
			SostSort_U9 = 7;
			DataSort_U9 = " ORDER BY isnull(R_PACIENT.SPOLIS,'') + ' ' + isnull(R_PACIENT.NPOLIS,'') ASC";
		}
	}

	DownLoadDBgrid1(DopData_U9);
	UpdateLen_Form9();
}
//---------------------------------------------------------------------------

void __fastcall TForm9::DBGrid4DrawColumnCell(TObject *Sender, const TRect &Rect,
          int DataCol, TColumn *Column, TGridDrawState State)
{
	F1MyDBGrid *grid = static_cast<F1MyDBGrid*>(Sender);
    if (grid->DataLink->ActiveRecord == grid->Row -1)
    {
     TField *F = Column->Field;
	 TCanvas *Cvs = DBGrid4->Canvas;
	 if (TypeActiveDBgrid == 4) Cvs->Brush->Color = clSkyBlue;
	 else  Cvs->Brush->Color = clMedGray;
     Cvs->FillRect(Rect);
     Cvs->Font->Color = clBlack;
     Cvs->TextOut(Rect.Left+2, Rect.Top+2, F->Text);
     Cvs->TextOut(Rect.Left+2, Rect.Top+2, F->Text);
	}
}
//---------------------------------------------------------------------------

void __fastcall TForm9::Button5Click(TObject *Sender)
{
	String VPOLIS, tf_okato, nam_smok, Ogrn;
	String NumberPolis = "NULL";
	String SerPolis = "NULL";
	String DataYear,DataMonth,DataDay;
	String DR_1, DR_P_1;
	HWND hWnd = GetForegroundWindow();

	tf_okato = "NULL";
	nam_smok = "NULL";
	Ogrn     = "NULL";

	int i;

	//День рождения пациента
	if (this->ComboBox7->ItemIndex < 1)	DataYear = "1900";
	else DataYear = this->ComboBox7->Text;

	if (this->ComboBox6->ItemIndex < 1) DataMonth = "01";
	else
	{
		if (this->ComboBox6->ItemIndex < 10) DataMonth = "0" + IntToStr(this->ComboBox6->ItemIndex);
		else DataMonth = IntToStr(this->ComboBox6->ItemIndex);
	}

	if (this->ComboBox5->ItemIndex < 1)DataDay = "01";
	else
	{
	if (this->ComboBox5->ItemIndex < 10) DataDay = "0" + IntToStr(this->ComboBox5->ItemIndex);
		else DataDay = IntToStr(this->ComboBox5->ItemIndex);
	}

	if (this->ComboBox4->ItemIndex == 0)
	{
		NumberSMO          = "NULL";
		VPOLIS             = "NULL";
	}
	else
	{
		VPOLIS = IntToStr(this->ComboBox4->ItemIndex);
		if (Form9->Label33->Caption == "СМО: Отсутствует") NumberSMO = "NULL";
		if (this->Edit13->Text.Length() > 0) SerPolis    = "'" + this->Edit13->Text + "'";
		if (this->Edit14->Text.Length() > 0) NumberPolis = "'" + this->Edit14->Text + "'";
	}

	String NewBorn = "";
	String Year = "";
	if (Form9->CheckBox6->Checked)
	{
		for (i = 3; i <= 4; i++)  Year += DataYear[i];
		NewBorn = IntToStr(this->ComboBox1->ItemIndex + 1) + Year + DataMonth + DataDay + "01";
	}
	else NewBorn = "0";

	String Zapros_SMO = "SELECT [smocod]     \
							   ,[tf_okato]   \
							   ,[nam_smok]   \
							   ,[Ogrn]       \
						 FROM SPR_F002       \
						 WHERE smocod = " + NumberSMO;

	SQL_Reqest_3(Zapros_SMO);

	if (Form9->ADOQuery3->RecordCount == 1)
	{
		String NamePole, ItogData;

		for (i = 0; i < Form9->ADOQuery3->FieldCount; i++)
		{
			NamePole = Form9->ADOQuery3->Fields->Fields[i]->FieldName;
			ItogData = Form9->ADOQuery3->FieldByName(NamePole)->AsString;

			//Фамилия Имя Отчество пациента
			if (NamePole == "tf_okato") tf_okato = ItogData;
			if (NamePole == "nam_smok") nam_smok = ItogData;
			if (NamePole == "Ogrn")     Ogrn     = ItogData;
		}
	}

	if (nam_smok != "NULL") nam_smok = "'" + nam_smok + "'";

	//Проверка на существоание дублирующей записи
	Zapros_SMO = "SELECT [VPOLIS]   \
						,[SPOLIS]   \
						,[NPOLIS]   \
						,[SMO]      \
				  FROM R_PACIENT    \
				  WHERE ID_PAC = '" + DataValue_IdPack + "'";

	SQL_Reqest_3(Zapros_SMO);
	if (Form9->ADOQuery3->RecordCount > 0)
	{
		String Itog;
		Form9->ADOQuery3->Open();
		for (Form9->ADOQuery3->First(); !Form9->ADOQuery3->Eof; Form9->ADOQuery3->Next())
		{
			Itog = Form9->ADOQuery3->FieldByName("VPOLIS")->AsString;
			if (Itog != VPOLIS) continue;

			Itog = Form9->ADOQuery3->FieldByName("SPOLIS")->AsString;
			if (Itog.Length() == 0) Itog = "NULL";
			else Itog = "'" + Itog + "'";
			if (Itog != SerPolis) continue;

			Itog = Form9->ADOQuery3->FieldByName("NPOLIS")->AsString;
			if (Itog.Length() == 0) Itog = "NULL";
			else Itog = "'" + Itog + "'";
			if (Itog != NumberPolis) continue;

			Itog = Form9->ADOQuery3->FieldByName("SMO")->AsString;
			if (Itog.Length() == 0) Itog = "NULL";
			else Itog = "'" + Itog + "'";
			if (Itog != NumberSMO) continue;

			MessageBoxA(hWnd, "Повторная информация не может быть добавлена!", "Внимание!", MB_OK);
			Abort();
		}
    }

	String Strahovanie = "INSERT INTO [R_PACIENT] ( [ID_PAC],   \
													[VPOLIS],   \
													[SPOLIS],   \
													[NPOLIS],   \
													[ST_OKATO], \
													[SMO],      \
													[SMO_OGRN], \
													[SMO_OK],   \
													[SMO_NAM],  \
													[INV],      \
													[NOVOR],    \
													[COMENTP])  \
						  OUTPUT INSERTED._id VALUES ('" + DataValue_IdPack                     + "',"
													   + VPOLIS                                + ","
													   + SerPolis                              + ","
													   + NumberPolis                           + ","
													   + "NULL"                                + ","
													   + NumberSMO                             + ","
													   + Ogrn                                  + ","
													   + tf_okato                              + ","
													   + nam_smok                  			   + ","
													   + IntToStr(this->ComboBox11->ItemIndex) + ","
													   + NewBorn                               + ","
													   + "NULL"                                + ")";

	SQL_Reqest_2(Strahovanie);

	String TmpPacientInfo = "SELECT R_PACIENT.ID_PAC          \
								,isnull(R_PACIENT.SPOLIS,'')    			              					\
								,isnull(R_PACIENT.NPOLIS,'')  				     							\
								,isnull(R_PACIENT.SMO,'')  					      							\
						 FROM R_PACIENT                                                                                     \
						 WHERE R_PACIENT._id = '" + Form9->ADOQuery2->FieldByName(Form9->ADOQuery2->Fields->Fields[0]->FieldName)->AsString + "'";

	SQL_Reqest_2(TmpPacientInfo);

	String TmpString = "UPDATE R_PERS SET                                                       							\
							   [_npolis_act] = '"  + Form9->ADOQuery2->FieldByName(Form9->ADOQuery2->Fields->Fields[3]->FieldName)->AsString
												   + Form9->ADOQuery2->FieldByName(Form9->ADOQuery2->Fields->Fields[1]->FieldName)->AsString
												   + Form9->ADOQuery2->FieldByName(Form9->ADOQuery2->Fields->Fields[2]->FieldName)->AsString + "'   \
						WHERE ID_PAC 	= '" + Form9->ADOQuery2->FieldByName(Form9->ADOQuery2->Fields->Fields[0]->FieldName)->AsString + "'";
	Request2(TmpString);

	this->DBGrid1CellClick(0);
	this->Button5->Visible = true;
	MessageBoxA(hWnd, "Информация о страховании пациентах успешно добавлена!", "Внимание!", MB_OK);
}
//---------------------------------------------------------------------------

void __fastcall TForm9::DBGrid4MyClick()
{
	int j;

	String id = this->DBGrid4->DataSource->DataSet->Fields->Fields[0]->AsString;
	String NamePole,ItogData;

	String Strahovanie = "SELECT R_PACIENT._id          \
								,R_PACIENT.ID_PAC       \
								,R_PACIENT.VPOLIS       \
								,R_PACIENT.SPOLIS       \
								,R_PACIENT.NPOLIS       \
								,R_PACIENT.ST_OKATO     \
								,R_PACIENT.SMO          \
								,SPR_F002.nam_smok      \
								,R_PACIENT.NOVOR        \
								,R_PACIENT.INV          \
						  FROM R_PACIENT                \
							   LEFT JOIN SPR_F002 ON (R_PACIENT.SMO = SPR_F002.smocod) \
						  WHERE R_PACIENT._id = '" + id + "'";

	SQL_Reqest_3(Strahovanie);

	String Zapros = "SELECT _npolis_act     \
					 FROM R_PERS            \
					 WHERE ID_PAC = '" + Form9->DBGrid1->DataSource->DataSet->Fields->Fields[0]->AsString + "'";
	SQL_Reqest_2(Zapros);
	if (Form9->ADOQuery2->RecordCount == 1)
	{
		String TekPolis = Form9->ADOQuery2->FieldByName(Form9->ADOQuery2->Fields->Fields[0]->FieldName)->AsString;
		if (TekPolis.Length() == 0)
		{
			this->Button9->Visible = true;
		}
		else
		{
			String RealPolic = this->DBGrid4->DataSource->DataSet->Fields->Fields[4]->AsString +
							   this->DBGrid4->DataSource->DataSet->Fields->Fields[2]->AsString +
							   this->DBGrid4->DataSource->DataSet->Fields->Fields[3]->AsString;
			if (TekPolis != RealPolic)
			{
				this->Button9->Visible = true;
			}
			else this->Button9->Visible = false;


        }
    }


	if (Form9->ADOQuery3->RecordCount == 1)
    {
		for (j = 0; j < Form9->ADOQuery3->FieldCount; j++)
        {
			NamePole = Form9->ADOQuery3->Fields->Fields[j]->FieldName;
			ItogData = Form9->ADOQuery3->FieldByName(NamePole)->AsString;
			if (ItogData == "NULL") ItogData = "";

            if (NamePole == "VPOLIS")
            {
				if (ItogData.Length() > 0) this->ComboBox4->ItemIndex = StrToInt(ItogData);
                else this->ComboBox4->ItemIndex = 0;
            }
			if (NamePole == "SPOLIS")
            {
				if (ItogData.Length() > 0) this->Edit13->Text = ItogData;
                else this->Edit13->Text = "";
            }
            if (NamePole == "NPOLIS")
            {
				if (ItogData.Length() > 0) this->Edit14->Text = ItogData;
                else this->Edit14->Text = "";
            }
            if (NamePole == "ST_OKATO")
            {
                if (this->ComboBox4->ItemIndex == 1)
                {
					this->Label31->Visible = true;
                    if (ItogData.Length() > 0) this->Label31->Caption = Tmp_ST_OKATO + " " + ItogData;
                    else this->Label31->Caption = Tmp_ST_OKATO;
                }
                else
                {
                    this->Label31->Visible = false;
				}

            }
            if (NamePole == "INV")
            {
                if (ItogData.Length() > 0) this->ComboBox11->ItemIndex = StrToInt(ItogData);
                else this->ComboBox11->ItemIndex = 0;
			}

			if (NamePole == "nam_smok")
			{
				if (ItogData.Length() > 0)
                {
					this->Label33->Caption = "СМО: " + ItogData;
					this->Label33->Font->Color = clWindowText;
				}
				else
				{
					this->Label33->Caption = "СМО: Отсутствует";
                    this->Label33->Font->Color = clRed;
                }
			}


            if (NamePole == "SMO")
			{
				if (ItogData.Length() > 0)
				{
					NumberSMO = "'" + ItogData + "'";
					this->Label23->Caption = "СМО №: " + ItogData;
				}
				else
				{
					NumberSMO = "";
					this->Label23->Caption = "СМО №: отсутствует";
				}
			}

			if (NamePole == "NOVOR")
			{
				if (ItogData.Length() <= 1) this->CheckBox6->Checked = false;
				else this->CheckBox6->Checked = true;
			}
		}
		this->ComboBox4Change(0);
	}
}

//---------------------------------------------------------------------
void __fastcall TForm9::Button7Click(TObject *Sender)
{
	String NewBorn = "";
	String Year = "";
	String DataYear,DataMonth,DataDay;
	int i;
	String tf_okato = "NULL";
	String nam_smok = "NULL";
	String Ogrn     = "NULL";
	String VPOLIS   = "NULL";

	//День рождения пациента
	if (this->ComboBox7->ItemIndex < 1)	DataYear = "1900";
	else DataYear = this->ComboBox7->Text;

	if (this->ComboBox6->ItemIndex < 1) DataMonth = "01";
	else
	{
		if (this->ComboBox6->ItemIndex < 10) DataMonth = "0" + IntToStr(this->ComboBox6->ItemIndex);
		else DataMonth = IntToStr(this->ComboBox6->ItemIndex);
	}

	if (this->ComboBox5->ItemIndex < 1)DataDay = "01";
	else
	{
	if (this->ComboBox5->ItemIndex < 10) DataDay = "0" + IntToStr(this->ComboBox5->ItemIndex);
		else DataDay = IntToStr(this->ComboBox5->ItemIndex);
	}

	if (Form9->CheckBox6->Checked)
	{
		for (i = 3; i <= 4; i++)  Year += DataYear[i];
		NewBorn = IntToStr(this->ComboBox1->ItemIndex + 1) + Year + DataMonth + DataDay + "01";
	}
    else NewBorn = "0";

	String SPOLIS,NPOLIS;

	if (this->DBGrid4->Visible)
	{
		VPOLIS = IntToStr(this->ComboBox4->ItemIndex);
		if (this->Edit13->Text == "") SPOLIS = "NULL";
		else SPOLIS = "'" + this->Edit13->Text + "'";

		if (this->Edit14->Text == "") NPOLIS = "NULL";
		else NPOLIS = "'" + this->Edit14->Text + "'";

		if (NumberSMO.Length() > 0)
		{
			String Zapros_SMO = "SELECT [smocod]     \
									   ,[tf_okato]   \
									   ,[nam_smok]   \
									   ,[Ogrn]       \
								 FROM SPR_F002       \
								 WHERE smocod = " + NumberSMO;
			SQL_Reqest_3(Zapros_SMO);
			if (Form9->ADOQuery3->RecordCount == 1)
			{
				String NamePole, ItogData;

				for (int j = 0; j < Form9->ADOQuery3->FieldCount; j++)
				{
					NamePole = Form9->ADOQuery3->Fields->Fields[j]->FieldName;
					ItogData = Form9->ADOQuery3->FieldByName(NamePole)->AsString;

					if (ItogData.Length() > 0)
					{
						if (NamePole == "tf_okato") tf_okato = "'" + ItogData + "'";
						if (NamePole == "nam_smok") nam_smok = "'" + ItogData + "'";
						if (NamePole == "Ogrn")     Ogrn     = "'" + ItogData + "'";
					}
				}
			}
		}
		else
		{
			NumberSMO = "NULL";
		}

		String TmpPacientInfo = "SELECT R_PACIENT.ID_PAC          		\
										,isnull(R_PACIENT.SPOLIS,'')    \
										,isnull(R_PACIENT.NPOLIS,'')  	\
										,isnull(R_PACIENT.SMO,'')  		\
								FROM R_PACIENT                          \
								WHERE R_PACIENT._id = '" + Form9->DBGrid4->DataSource->DataSet->Fields->Fields[0]->AsString + "'";
		SQL_Reqest_2(TmpPacientInfo);

		String R_PACIENT_id = Form9->DBGrid4->DataSource->DataSet->Fields->Fields[0]->AsString;
		String R_PACIENT_ID_PAC = Form9->ADOQuery2->FieldByName(Form9->ADOQuery2->Fields->Fields[0]->FieldName)->AsString;

		TmpPacientInfo = " SELECT [_npolis_act] \
						   FROM R_PERS         	\
						   WHERE R_PERS.ID_PAC = '" + R_PACIENT_ID_PAC + "'";

		SQL_Reqest_2(TmpPacientInfo);
		String Polis = Form9->ADOQuery2->FieldByName(Form9->ADOQuery2->Fields->Fields[0]->FieldName)->AsString;

		bool ActivePolis= false;

		if (Polis == (Form9->DBGrid4->DataSource->DataSet->Fields->Fields[4]->AsString +
					  Form9->DBGrid4->DataSource->DataSet->Fields->Fields[2]->AsString +
					  Form9->DBGrid4->DataSource->DataSet->Fields->Fields[3]->AsString))
		{
			ActivePolis = true;
		}

		//ST_OKATO Регион для старого окато
		String Strahovanie = "UPDATE R_PACIENT SET                                          \
							   [VPOLIS]    = "  + VPOLIS + "                                \
							  ,[SPOLIS]    = "  + SPOLIS + "                    			\
							  ,[NPOLIS]    = "  + NPOLIS + "                    			\
							  ,[ST_OKATO]  =      NULL                     					\
							  ,[SMO]       = "  + NumberSMO + "                             \
							  ,[SMO_OGRN]  = "  + Ogrn + "                                  \
							  ,[SMO_OK]    = "  + tf_okato + "                              \
							  ,[SMO_NAM]   = "  + nam_smok + "                              \
							  ,[INV]       = '" + IntToStr(this->ComboBox11->ItemIndex) + "'\
							  ,[NOVOR]     = '" + NewBorn + "'                              \
							  ,[COMENTP]   = NULL  											\
							WHERE R_PACIENT._id   = '" + Form9->DBGrid4->DataSource->DataSet->Fields->Fields[0]->AsString +"'";
		Request2(Strahovanie);

		if (ActivePolis)
		{
			String TmpString = "UPDATE R_PERS SET                                                       							\
									   [_npolis_act] = '"  + NumberSMO.SubString(2,5)
														   + this->Edit13->Text
														   + this->Edit14->Text + "'   \
								WHERE ID_PAC 	= '" + R_PACIENT_ID_PAC + "'";
			Request2(TmpString);
		}

		int TempTypeActiveDBgrid = TypeActiveDBgrid;
		this->DBGrid1CellClick(0);

		if (Form9->ADOQuery4->RecordCount > 0)
		{
			Form9->ADOQuery4->Open();
			for (Form9->ADOQuery4->First(); !Form9->ADOQuery4->Eof; Form9->ADOQuery4->Next())
			{
				if (R_PACIENT_id == Form9->ADOQuery4->FieldByName(Form9->ADOQuery4->Fields->Fields[0]->FieldName)->AsString)
				{
					break;
				}
			}
		}

		TypeActiveDBgrid = TempTypeActiveDBgrid;
		this->DBGrid1->Refresh();
		this->DBGrid4->Refresh();

		HWND hWnd = GetForegroundWindow();
		MessageBoxA(hWnd, "Информация о страховании пациентах успешно исправлена!", "Внимание!", MB_OK);
	}
}
//---------------------------------------------------------------------------

void __fastcall TForm9::Button8Click(TObject *Sender)
{
	if (this->DBGrid4->Visible)
	{
		if (MessageBox(Application->Handle,
			L"Удаление данных о страховке пациенте. Вы уверены?",
			L"Удаление информации",
		MB_ICONQUESTION | MB_YESNO) == IDYES)
		{
			String SQLString = "DELETE FROM R_PACIENT WHERE [_id]='" + Form9->DBGrid4->DataSource->DataSet->Fields->Fields[0]->AsString + "'";
			Request2(SQLString);
			this->DBGrid1CellClick(0);
		}
	}
}
//---------------------------------------------------------------------------

void __fastcall TForm9::DBGrid4ColumnMoved(TObject *Sender, int FromIndex, int ToIndex)

{
	this->DBGrid4->Columns->Items[ToIndex]->Index = FromIndex;
}
//---------------------------------------------------------------------------

void __fastcall TForm9::DBGrid4CellClick(TColumn *Column)
{
	TypeActiveDBgrid = 4;
	DBGrid4MyClick();
	this->DBGrid1->Refresh() ;
	this->DBGrid4->Refresh() ;
}
//---------------------------------------------------------------------------



void __fastcall TForm9::Edit15KeyPress(TObject *Sender, System::WideChar &Key)
{
	if (Key == '\'') Key = 0;
}
//---------------------------------------------------------------------------

void __fastcall TForm9::Edit12KeyPress(TObject *Sender, System::WideChar &Key)
{
   	if (Key == '\'') Key = 0;
}
//---------------------------------------------------------------------------

void __fastcall TForm9::Edit10KeyUp(TObject *Sender, WORD &Key, TShiftState Shift)

{
	String Itog;
	String TekWord = SetInt(this->ComboBox3->Text);
	String Zapros = "SELECT DocNum  \
					 FROM SPR_F011  \
					 WHERE IDDoc = '" + TekWord + "'";
	SQL_Reqest_2(Zapros);

	if (Form9->ADOQuery2->RecordCount == 1)
	{
		Itog = Form9->ADOQuery2->FieldByName("DocNum")->AsString;
		if (this->Edit10->Text.Length() > Itog.Length())
		{
			Key = 0;
			this->Edit10->ShowHint = true;
			this->Edit10->Hint = "Превышено допустимое значение!!!";
			this->Edit10->Color = clYellow;
		}
		else
		{
			this->Edit10->ShowHint = false;
			this->Edit10->Color = clWindow;
        }
	}
}

//---------------------------------------------------------------------------
void __fastcall TForm9::Button9Click(TObject *Sender)
{
	String TmpString = "UPDATE R_PERS SET                                                       							\
							   [_npolis_act] = '"  + this->DBGrid4->DataSource->DataSet->Fields->Fields[4]->AsString
												   + this->DBGrid4->DataSource->DataSet->Fields->Fields[2]->AsString
												   + this->DBGrid4->DataSource->DataSet->Fields->Fields[3]->AsString + "'   \
						WHERE ID_PAC = '" + Form9->DBGrid1->DataSource->DataSet->Fields->Fields[0]->AsString + "'";
	Request2(TmpString);

	//UpdateLen_Pacient();
	if (Form9->DBGrid4->Visible) DBGrid4MyClick();

	HWND hWnd = GetForegroundWindow();
	MessageBoxA(hWnd, "Полис активен.", "Внимание!", MB_OK);
}

//---------------------------------------------------------------------------
void __fastcall TForm9::Request2(String Data)
{
	Form9->ADOQuery2->Active = False;
	Form9->ADOQuery2->SQL->Clear();
	Form9->ADOQuery2->SQL->Add(Data);
	Form9->ADOQuery2->ExecSQL();
}
//---------------------------------------------------------------------------
