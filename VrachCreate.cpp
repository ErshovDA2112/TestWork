//---------------------------------------------------------------------------

#include <vcl.h>
#include <DateUtils.hpp>
#pragma hdrstop

#include "VrachCreate.h"
#include "Main.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
Tmo_doctors *mo_doctors;


F8 Fun_8;

extern StyleF Prodject_Style;              //Создание структуры с параметрами стилей
String ID_DOCT;                            //ID текущего Врача
String ID_DOCTSER;
String DopData;

int SostPanel5;
int SostSertifakatButton;
int SostDoctors;
int SostSort = 0;
int MinPanel2Height = 195;
int MaxPanel2Height = 360;

String DataSort = "";

const String SQL_DOCTERS = "SELECT  SPRTER_DOCTORS._id                                                                                                     \
									,row_number() over (order by SPRTER_DOCTORS._id desc) as [№ ]                                                            \
									,SPRTER_DOCTORS.FAM+' '+SPRTER_DOCTORS.IM+' '+SPRTER_DOCTORS.OT  as [ФИО]                                              \
									,SPRTER_DOCTORS.SNILS             as [СНИЛС]                                                                           \
									,SPRTER_DOCTORS.TEL               as [Телефон]                                                                          \
									,[Должность] = cast( isnull(replace((select isnull(NAME_DOC_POST,'') as 'data()'                                       \
																 from SPR_DOC_POST LEFT JOIN R_DOC_POST ON R_DOC_POST._id_doct = SPRTER_DOCTORS._id        \
																 where SPR_DOC_POST._id_doct_post = R_DOC_POST._id_post for xml path('')), ' ', ' '),'')  as nvarchar(1024)) \
									, SPRTER_DOCTORS.COMENTV           \'Комментарий\'                                                                     \
							FROM  SPRTER_DOCTORS LEFT JOIN R_DOC_POST ON (R_DOC_POST._id_doct = SPRTER_DOCTORS._id)";

    const String SQL_DopData = " group by SPRTER_DOCTORS._id, SPRTER_DOCTORS.FAM+' '+SPRTER_DOCTORS.IM+' '+SPRTER_DOCTORS.OT, SPRTER_DOCTORS.SNILS, SPRTER_DOCTORS.TEL, SPRTER_DOCTORS.COMENTV ";

    const String SQL_Sertifikat = "SELECT [DOCT_CODE]  \
								   FROM SPRTER_DOCTCER \
                                   WHERE DOCT_CODE = ";

//---------------------------------------------------------------------------
__fastcall Tmo_doctors::Tmo_doctors(TComponent* Owner)
    : TForm(Owner)
{

}
//---------------------------------------------------------------------------
void __fastcall Tmo_doctors::FormActivate(TObject *Sender)
{
    this->Edit1->Text = "";
    this->Edit2->Text = "";
    this->Edit3->Text = "";
    this->Edit4->Text = "";
    this->Edit5->Text = "";
    this->Edit8->Text = "";
    SostPanel5           = 0;
    SostDoctors          = 0;
    SostSertifakatButton = 0;
    UpdateLen();
    mo_doctors->Panel4->Visible = false;
	mo_doctors->Panel7->Visible = false;

	this->ComboBox1->DropDownCount = 15;
	this->ComboBox2->DropDownCount = 15;

	this->CategoryButtons1->ShowHint = true;
	this->CategoryButtons1->Categories->Items[0]->Items->Items[0]->Hint = this->CategoryButtons1->Categories->Items[0]->Items->Items[0]->Caption;

    while (this->ComboBox3->Items->Count > 0) this->ComboBox3->Items->Delete(0);
    while (this->ComboBox4->Items->Count > 0) this->ComboBox4->Items->Delete(0);
    while (this->ComboBox5->Items->Count > 0) this->ComboBox5->Items->Delete(0);
    while (this->ComboBox6->Items->Count > 0) this->ComboBox6->Items->Delete(0);
    while (this->ComboBox7->Items->Count > 0) this->ComboBox7->Items->Delete(0);
    while (this->ComboBox8->Items->Count > 0) this->ComboBox8->Items->Delete(0);

    WidthForm(1);

    ActiveButton5();
    ActiveButton1();

    int i;
    for(i = 0; i < 12; i++)
    {
        if (i == 0)
            {
                mo_doctors->ComboBox4->Items->Add("н/у");
                mo_doctors->ComboBox7->Items->Add("н/у");
            }
         mo_doctors->ComboBox4->Items->Add(FormatSettings.LongMonthNames[i]);
         mo_doctors->ComboBox7->Items->Add(FormatSettings.LongMonthNames[i]);
    }

    for (i = 0; i < 69; i++ )
    {
        if (i == 0)
        {
            mo_doctors->ComboBox5->Items->Add("н/у");
            mo_doctors->ComboBox8->Items->Add("н/у");
        }

        mo_doctors->ComboBox5->Items->Add(IntToStr(i + 1950));
        mo_doctors->ComboBox8->Items->Add(IntToStr(i + 1950));
    }

    for (i = 0; i < 31; i++ )
    {
        if (i == 0)
        {
            mo_doctors->ComboBox3->Items->Add("н/у");
            mo_doctors->ComboBox6->Items->Add("н/у");
        }

        mo_doctors->ComboBox3->Items->Add(IntToStr(i + 1));
        mo_doctors->ComboBox6->Items->Add(IntToStr(i + 1));
    }

    mo_doctors->ComboBox5->ItemIndex = 0;
    mo_doctors->ComboBox8->ItemIndex = 0;

    ChangeData();

}

//---------------------------------------------------------------------------
void __fastcall Tmo_doctors::WidthForm(int Type)
{
    int LenDBGrid;
    if (mo_doctors->DBGrid1->Width > 580)
    {
        LenDBGrid = 580;
        mo_doctors->DBGrid1->Width = 580;
    }
    else
    {
        LenDBGrid = mo_doctors->DBGrid1->Width;
    }

    if (Type == 1)
    {
        this->Constraints->MaxWidth = LenDBGrid + mo_doctors->SplitView1->Width + 40;
    }
    if (Type == 2)
    {
        this->Constraints->MaxWidth = LenDBGrid  + mo_doctors->SplitView1->Width + mo_doctors->Panel4->Width + 40;
    }

    mo_doctors->Constraints->MinWidth = mo_doctors->Constraints->MaxWidth;
    mo_doctors->Width = mo_doctors->Constraints->MaxWidth;
}

//---------------------------------------------------------------------------
void __fastcall Tmo_doctors::ChangeData()
{
    this->ComboBox3->ItemIndex = 0;
	mo_doctors->ComboBox4->ItemIndex = 0;

    this->ComboBox6->ItemIndex = 0;
    mo_doctors->ComboBox7->ItemIndex = 0;

    this->ComboBox3Change(ComboBox3);
    this->ComboBox4Change(ComboBox4);
    this->ComboBox5Change(ComboBox5);
    this->ComboBox6Change(ComboBox6);
    this->ComboBox7Change(ComboBox7);
    this->ComboBox8Change(ComboBox8);

}

//---------------------------------------------------------------------------
void __fastcall Tmo_doctors::UpdateData()
{
    if ((mo_doctors->Panel4->Visible) && (this->ADOQuery1->RecordCount != 0))
    //if ((mo_doctors->Panel4->Visible) && (this->Button1->Caption == "Изменить") && (this->ADOQuery1->RecordCount != 0))
    {
        int i,j;
        String Year, Month, Day;
        String Name = "";
        String DataName = "";
        int  DataValue = mo_doctors->DBGrid1->DataSource->DataSet->Fields->Fields[0]->Value;
        this->Button1->Caption = "Изменить";

		String SQLString = "SELECT   [_id]         \
									,[FAM]               \
									,[IM]                \
									,[OT]                \
									,[TEL]               \
									,[DATEBEG]           \
									,[DATEEND]           \
									,[COMENTV]           \
									,[SNILS]             \
                            FROM SPRTER_DOCTORS  \
                            WHERE _id = "+ IntToStr(DataValue);

        StartSQL(SQLString);
        mo_doctors->ADOQuery3->Active = True;

        if (this->ADOQuery3->RecordCount == 1)
        {
            mo_doctors->ADOQuery3->Open();
            mo_doctors->ADOQuery3->First();
            for (i = 0; i < mo_doctors->ADOQuery3->FieldCount; i++)
            {
                Name = mo_doctors->ADOQuery3->Fields->Fields[i]->FieldName;
                DataName = mo_doctors->ADOQuery3->FieldByName(Name)->AsString;

                if (Name == "FAM")     this->Edit1->Text = DataName;
                if (Name == "IM")      this->Edit2->Text = DataName;
                if (Name == "OT")      this->Edit3->Text = DataName;
                if (Name == "SNILS")   this->Edit4->Text = DataName;
                if (Name == "TEL")     this->Edit5->Text = DataName;
                if (Name == "COMENTV") this->Edit8->Text = DataName;
                if (Name == "DATEBEG")
                {
                    if ((DataName == "2100-01-01") || (DataName == ""))
                    {
                        this->ComboBox3->ItemIndex = 0;
                        this->ComboBox4->ItemIndex = 0;
                        this->ComboBox5->ItemIndex = 0;
                    }
                    else
                    {
                        Year = "";
                        Month = "";
                        Day = "";
                        for (j = 1; j <= 4; j++)  Year += DataName[j];
                        for (j = 6; j <= 7; j++)  Month += DataName[j];
                        for (j = 9; j <= 10; j++) Day += DataName[j];
                        this->ComboBox3->ItemIndex = StrToInt(Day);
                        this->ComboBox4->ItemIndex = StrToInt(Month);
                        this->ComboBox5->ItemIndex = StrToInt(Year) - 1949;
                    }
                    this->ComboBox3Change(ComboBox3);
                    this->ComboBox4Change(ComboBox4);
                    this->ComboBox5Change(ComboBox5);
                }
                if (Name == "DATEEND")
                {
                    if ((DataName == "2100-01-01") || (DataName == ""))
                    {
                        this->ComboBox6->ItemIndex = 0;
                        this->ComboBox7->ItemIndex = 0;
                        this->ComboBox8->ItemIndex = 0;
                        this->CheckBox1->Checked = false;
                        this->CheckBox1Click(0);
                    }
                    else
                    {
                        Year = "";
                        Month = "";
                        Day = "";
                        for (j = 1; j <= 4; j++)  Year += DataName[j];
                        for (j = 6; j <= 7; j++)  Month += DataName[j];
                        for (j = 9; j <= 10; j++) Day += DataName[j];
                        this->ComboBox6->ItemIndex = StrToInt(Day);
                        this->ComboBox7->ItemIndex = StrToInt(Month);
                        this->ComboBox8->ItemIndex = StrToInt(Year) - 1949;
                        this->CheckBox1->Checked = true;
                        this->CheckBox1Click(0);
                    }
                    this->ComboBox6Change(ComboBox6);
                    this->ComboBox7Change(ComboBox7);
                    this->ComboBox8Change(ComboBox8);
                }
            }
        }
    }
}

//---------------------------------------------------------------------------
void __fastcall Tmo_doctors::StartSQL(String SQLString)
{
    mo_doctors->ADOQuery3->Active = False;
    mo_doctors->ADOQuery3->SQL->Clear();
    mo_doctors->ADOQuery3->SQL->Add(SQLString);
}

//---------------------------------------------------------------------------
void __fastcall Tmo_doctors::UpdateLen()
{

    if (mo_doctors->Panel7->Visible)
    {

    }
    else
    {
        DopData = "";
    }

    mo_doctors->ADOQuery1->Active = False;
    mo_doctors->ADOQuery1->SQL->Clear();
    mo_doctors->ADOQuery1->SQL->Add(SQL_DOCTERS + DopData + SQL_DopData + DataSort);
    mo_doctors->ADOQuery1->Active = True;

    mo_doctors->DBGrid1->Columns->Items[0]->Visible = false;

    int i, j;
	int Maxlen = 0;
	int TekLen = 0;
    int TotalLenDbgrid = 0;
    String DataLen = "";
    String ItogData = "";

    if (mo_doctors->ADOQuery1->RecordCount >= 1)
    {
        mo_doctors->DBGrid1->Visible = false;
        mo_doctors->ADOQuery1->Open();
        for (j = 0; j < mo_doctors->ADOQuery1->FieldCount; j++)
        {
            DataLen = mo_doctors->ADOQuery1->Fields->Fields[j]->FieldName;
			Maxlen = this->DBGrid1->Canvas->TextWidth(DataLen);
            mo_doctors->ADOQuery1->First();

            for (i = 0; !mo_doctors->ADOQuery1->Eof; i++)
            {
				ItogData = mo_doctors->ADOQuery1->FieldByName(DataLen)->AsString;
				TekLen = this->DBGrid1->Canvas->TextWidth(ItogData);
				if (TekLen > Maxlen) Maxlen = TekLen;
                mo_doctors->ADOQuery1->Next();
            }
            if (Maxlen == 0)
            {
                mo_doctors->DBGrid1->Columns->Items[j]->Width = 6;
                TotalLenDbgrid += 6;
            }
            else
            {
				mo_doctors->DBGrid1->Columns->Items[j]->Width = Maxlen + 5;
				mo_doctors->DBGrid1->Columns->Items[j]->Alignment = taLeftJustify;
				TotalLenDbgrid += Maxlen + 5;
            }
		}
        mo_doctors->DBGrid1->Width = TotalLenDbgrid + 16;
        mo_doctors->ADOQuery1->First();
        mo_doctors->DBGrid1->Visible = true;
    }
    else
    {
        mo_doctors->DBGrid1->Visible = false;
    }
}

//---------------------------------------------------------------------------
void __fastcall Tmo_doctors::Button1Click(TObject *Sender)
{
    int i;
    String ItogTimeDataB, ItogTimeDataE;
    String DataMonth, DataDay;

    if (
        (this->ComboBox3->ItemIndex == 0) ||
        (this->ComboBox4->ItemIndex == 0) ||
        (this->ComboBox5->ItemIndex == 0)
       )
	{
		HWND hWnd = GetForegroundWindow();
		MessageBoxA(hWnd, "Ошибка в дате приема.", "Внимание!", MB_OK);
		this->ComboBox3->SetFocus();
		Abort();
	}
    else
    {
        if (this->ComboBox4->ItemIndex < 10) DataMonth = "0" + IntToStr(this->ComboBox4->ItemIndex);
        else DataMonth = IntToStr(this->ComboBox4->ItemIndex);

        if (this->ComboBox3->ItemIndex < 10) DataDay = "0" + IntToStr(this->ComboBox3->ItemIndex);
        else DataDay = IntToStr(this->ComboBox3->ItemIndex);

		ItogTimeDataB = "'" + IntToStr(this->ComboBox5->ItemIndex + 1949) + "-" + DataMonth + "-" + DataDay + "'";
    }

    if (
        (this->ComboBox6->ItemIndex == 0) ||
        (this->ComboBox7->ItemIndex == 0) ||
        (this->ComboBox8->ItemIndex == 0)
       )
    {
        if (
            (this->ComboBox6->ItemIndex == 0) &&
            (this->ComboBox7->ItemIndex == 0) &&
            (this->ComboBox8->ItemIndex == 0)
           )
        {
            ItogTimeDataE = "NULL";
        }
        else
        {
            HWND hWnd = GetForegroundWindow();
			MessageBoxA(hWnd, "Ошибка в дате окончания работы.", "Внимание!", MB_OK);
            this->ComboBox6->SetFocus();
            Abort();
        }
    }
    else
    {
		if (this->ComboBox7->ItemIndex < 10) DataMonth = "0" + IntToStr(this->ComboBox7->ItemIndex);
        else DataMonth = IntToStr(this->ComboBox7->ItemIndex);

        if (this->ComboBox6->ItemIndex < 10) DataDay = "0" + IntToStr(this->ComboBox6->ItemIndex);
        else DataDay = IntToStr(this->ComboBox6->ItemIndex);

		if (this->ComboBox5->ItemIndex > this->ComboBox8->ItemIndex)
		{
			HWND hWnd = GetForegroundWindow();
			MessageBoxA(hWnd, "Ошибка в годе окончания работы.", "Внимание!", MB_OK);
			this->ComboBox8->SetFocus();
			Abort();
		}
		else
		{
			if (this->ComboBox5->ItemIndex == this->ComboBox8->ItemIndex)
			{
				if (this->ComboBox4->ItemIndex > this->ComboBox7->ItemIndex)
				{
					HWND hWnd = GetForegroundWindow();
					MessageBoxA(hWnd, "Ошибка в месяце окончания работы.", "Внимание!", MB_OK);
					this->ComboBox7->SetFocus();
					Abort();
				}
				else
				{
					if (this->ComboBox4->ItemIndex == this->ComboBox7->ItemIndex)
					{
						if (this->ComboBox3->ItemIndex > this->ComboBox6->ItemIndex)
						{
							HWND hWnd = GetForegroundWindow();
							MessageBoxA(hWnd, "Ошибка в дне окончания работы.", "Внимание!", MB_OK);
							this->ComboBox6->SetFocus();
							Abort();
                        }
                    }
                }
            }
        }

        ItogTimeDataE = "'" + IntToStr(this->ComboBox8->ItemIndex + 1949) + "-" + DataMonth + "-" + DataDay + "'";
    }

    String OT ;
    if (this->Edit3->Text == "")
    {
		//HWND hWnd = GetForegroundWindow();
		//MessageBoxA(hWnd, "Введите отчество врача.", "Внимание!", MB_OK);
        //this->Edit3->SetFocus(); Abort();
        OT = "NULL";
    }
    else OT = "'" + this->Edit3->Text + "'";

    if (this->Edit4->Text.Length() != 14)
    {
        HWND hWnd = GetForegroundWindow();
        MessageBoxA(hWnd, "СНИЛС врача введён некорректно!", "Внимание!", MB_OK);
        this->Edit4->SetFocus(); Abort();
    }

    char *SN = AnsiString(mo_doctors->Edit4->Text).c_str();
    if (
        ((SN[0] == SN[1]) &&  (SN[1] == SN[2])) ||
        ((SN[4] == SN[5]) &&  (SN[5] == SN[6])) ||
        ((SN[8] == SN[9]) &&  (SN[9] == SN[10]))
       )
    {
        HWND hWnd = GetForegroundWindow();
        MessageBoxA(hWnd, "СНИЛС врача введён некорректно!", "Внимание!", MB_OK);
        this->Edit4->SetFocus(); Abort();
    }


    if (this->Edit5->Text == "") this->Edit5->Text = " ";
    String COMENTV;
    if (this->Edit8->Text == "")
    {
        COMENTV = "NULL";
    }
    else COMENTV = "'" + this->Edit8->Text + "'";

	String Snils = "SELECT   [_id]        \
							,[SNILS]              \
             FROM SPRTER_DOCTORS   \
             WHERE SNILS = '"+ this->Edit4->Text+"'";

    StartSQL(Snils);
    mo_doctors->ADOQuery3->Active = True;

    if (this->Button1->Caption != "Изменить")
    {
        if (this->ADOQuery3->RecordCount != 0)
        {
            HWND hWnd = GetForegroundWindow();
            MessageBoxA(hWnd, "Запись невозможна. Такой СНИЛС уже существует!", "Внимание!", MB_OK);
            Abort();
        }

        Fun_8.OpenSQL("INSERT INTO SPRTER_DOCTORS \
          ([SNILS] \
          ,[FAM] \
          ,[IM] \
          ,[OT] \
          ,[KAB] \
          ,[INTERVAL] \
          ,[TEL] \
          ,[DATEBEG] \
          ,[DATEEND] \
          ,[COMENTV]) OUTPUT inserted._id \
              VALUES( \
              '" + this->Edit4->Text + "', \
              '" + this->Edit1->Text + "', \
              '" + this->Edit2->Text + "', \
              "  + OT                + ",  \
              '0', '00:00:00',             \
              '" + this->Edit5->Text + "', \
              "  + ItogTimeDataB     + ", \
              "  + ItogTimeDataE     + ", \
              "  + COMENTV           + ")");
        mo_doctors->Panel4->Visible = false;
        WidthForm(1);

        UpdateLen();
        HWND hWnd = GetForegroundWindow();
        MessageBoxA(hWnd, "Данные о враче успешно внесены.", "Внимание!", MB_OK);
    }
    else
    {
        int  DataValue = mo_doctors->DBGrid1->DataSource->DataSet->Fields->Fields[0]->Value;
        if (mo_doctors->ADOQuery3->RecordCount != 0)
        {
            String Itog = "";
            mo_doctors->ADOQuery3->Open();
            mo_doctors->ADOQuery3->First();
            for (i = 0; !mo_doctors->ADOQuery3->Eof; i++)
            {
                Itog = mo_doctors->ADOQuery3->FieldByName("_id")->AsString;
                mo_doctors->ADOQuery3->Next();
            }
            if (Itog != IntToStr(DataValue))
            {
                HWND hWnd = GetForegroundWindow();
                MessageBoxA(hWnd, "Изменение невозможно. Такой СНИЛС уже существует!", "Внимание!", MB_OK);
                Abort();
            }
        }

        //ИЗМЕНЕНИЕ ДАННЫХ ВРАЧА
        String TmpString = "UPDATE SPRTER_DOCTORS SET  \
                       [SNILS]    = '"  + this->Edit4->Text + "'  \
                      ,[FAM]      = '"  + this->Edit1->Text + "'  \
                      ,[IM]       = '"  + this->Edit2->Text + "'  \
                      ,[OT]       = "   + OT                + "  \
                      ,[KAB]      = '0'                           \
                      ,[INTERVAL] = '00:00:00'                    \
                      ,[TEL]      = '"  + this->Edit5->Text + "'  \
                      ,[DATEBEG]  = "   + ItogTimeDataB     + "   \
                      ,[DATEEND]  = "   + ItogTimeDataE     + "   \
                      ,[COMENTV]  = "   + COMENTV           + "  \
                    WHERE _id = "+DataValue;

        Fun_8.InsernSQL(TmpString);
        mo_doctors->Panel4->Visible = false;
        WidthForm(1);

        UpdateLen();
        HWND hWnd = GetForegroundWindow();
        MessageBoxA(hWnd, "Данные о враче успешно обновлены.", "Внимание!", MB_OK);
    }

}
//---------------------------------------------------------------------------
void __fastcall Tmo_doctors::Button2Click(TObject *Sender)
{
    this->Panel5->Visible = true;
    SostPanel5 = 1;
    this->Button5->Caption = "Сохранить добавление";
    this->Edit6->Text = "";
    this->Edit7->Text = "";
    this->Edit9->Text = "";
    this->Edit10->Text = "";
    this->ComboBox1->ItemIndex = 0;
    this->Panel2->Height = MaxPanel2Height;
}
//---------------------------------------------------------------------------
void __fastcall Tmo_doctors::DateTimePicker1Change(TObject *Sender)
{
    this->DateTimePicker1->Checked = true;
}

//---------------------------------------------------------------------------
void __fastcall Tmo_doctors::DBGrid1CellClick(TColumn *Column)
{
	if (mo_doctors->Panel1->Visible)
	{
		UpdateData();
		mo_doctors->Label12->Caption = "Изменение данных о враче ";
	}
    if (mo_doctors->Panel2->Visible)
    {
       this->Panel2->Height = MinPanel2Height;
       UpdateSertivifat();
    }
	if (mo_doctors->Panel6->Visible) DolUpdate();
}

//---------------------------------------------------------------------------
void __fastcall Tmo_doctors::CategoryButtons1Categories0Items0Click(TObject *Sender)
{
    if (mo_doctors->SplitView1->Opened)
    {
        mo_doctors->SplitView1->Close();
        mo_doctors->Constraints->MaxWidth -= 150;
        mo_doctors->Constraints->MinWidth = mo_doctors->Constraints->MaxWidth;
        mo_doctors->Width = mo_doctors->Constraints->MaxWidth;
    }
    else
    {
        mo_doctors->SplitView1->Open();
        mo_doctors->Constraints->MaxWidth += 150;
        mo_doctors->Constraints->MinWidth = mo_doctors->Constraints->MaxWidth;
        mo_doctors->Width = mo_doctors->Constraints->MaxWidth;
    }
}

//---------------------------------------------------------------------------
void __fastcall Tmo_doctors::SplitView1Closed(TObject *Sender)
{
    mo_doctors->CategoryButtons1->Width = 50;
}

//---------------------------------------------------------------------------
void __fastcall Tmo_doctors::SplitView1Opened(TObject *Sender)
{
    mo_doctors->CategoryButtons1->Width = mo_doctors->SplitView1->OpenedWidth;
}

//---------------------------------------------------------------------------
void __fastcall Tmo_doctors::CategoryButtons1Categories0Items3Click(TObject *Sender)
{
	String FOI = mo_doctors->DBGrid1->DataSource->DataSet->Fields->Fields[2]->AsString;

	String Mes = "Удаление данных о враче - " + FOI + ". Вы уверены?";
	char *MesData = AnsiString(Mes).c_str();
	wchar_t MesItog[128] = {'\0'};
	MultiByteToWideChar(CP_ACP, MB_PRECOMPOSED, MesData, Mes.Length(), MesItog, Mes.Length());

	if (MessageBox(Application->Handle, MesItog, L"Удаление информации", MB_ICONQUESTION | MB_YESNO) == IDYES)
	{
        if (this->ADOQuery1->RecordCount != 0)
        {
            int  DataValue = mo_doctors->DBGrid1->DataSource->DataSet->Fields->Fields[0]->Value;

            //проверка существования сертификата
            String SQLString = SQL_Sertifikat + IntToStr(DataValue);
            StartSQL(SQLString);
            mo_doctors->ADOQuery3->Active = True;

            if (mo_doctors->ADOQuery3->RecordCount >= 1)
            {
                SQLString = "DELETE FROM [SPRTER_DOCTCER] WHERE [DOCT_CODE]=" + IntToStr(DataValue);
                StartSQL(SQLString);
                mo_doctors->ADOQuery3->ExecSQL();
            }

            //Удаление графика
            SQLString = "SELECT [_id_doct]  \
                FROM REG_GRAFIC   \
                WHERE _id_doct = "+ IntToStr(DataValue);
            StartSQL(SQLString);
            mo_doctors->ADOQuery3->Active = True;

            if (mo_doctors->ADOQuery3->RecordCount >= 1)
            {
                SQLString = "DELETE FROM [REG_GRAFIC] WHERE [_id_doct]=" + IntToStr(DataValue);
                StartSQL(SQLString);
                mo_doctors->ADOQuery3->ExecSQL();
            }

            //Удаление с регистратуры
            SQLString = "SELECT [_id_doct]    \
                FROM REG_REGISTRATURA       \
                WHERE _id_doct = "+ IntToStr(DataValue);
            StartSQL(SQLString);
            mo_doctors->ADOQuery3->Active = True;

            if (mo_doctors->ADOQuery3->RecordCount >= 1)
            {
                SQLString = "DELETE FROM [REG_REGISTRATURA] WHERE [_id_doct]=" + IntToStr(DataValue);
                StartSQL(SQLString);
                mo_doctors->ADOQuery3->ExecSQL();
            }

            //Удаление с должности
            SQLString = "SELECT [_id_doct]    \
                FROM R_DOC_POST       \
                WHERE _id_doct = "+ IntToStr(DataValue);
            StartSQL(SQLString);
            mo_doctors->ADOQuery3->Active = True;

            if (mo_doctors->ADOQuery3->RecordCount >= 1)
            {
                SQLString = "DELETE FROM [R_DOC_POST] WHERE [_id_doct]=" + IntToStr(DataValue);
                StartSQL(SQLString);
                mo_doctors->ADOQuery3->ExecSQL();
            }

            SQLString = "DELETE FROM [SPRTER_DOCTORS] WHERE [_id]=" + IntToStr(DataValue);

            mo_doctors->ADOQuery1->Active = False;
            mo_doctors->ADOQuery1->SQL->Clear();
            mo_doctors->ADOQuery1->SQL->Add(SQLString);
            mo_doctors->ADOQuery1->ExecSQL();

            UpdateLen();
            this->Panel4->Visible = false;
            WidthForm(1);
        }

    }
}
//---------------------------------------------------------------------------
void __fastcall Tmo_doctors::CategoryButtons1Categories0Items1Click(TObject *Sender)

{
    Fun_8.F8Clear();
    mo_doctors->Button1->Caption = "Добавить";
    mo_doctors->Button1->Visible = true;
    mo_doctors->Panel4->Visible = true;
    mo_doctors->Panel1->Visible = true;
    mo_doctors->Panel2->Visible = false;
    mo_doctors->Panel6->Visible = false;

    mo_doctors->Label12->Caption = "Добавление врача";

    WidthForm(2);

    this->Edit1->SetFocus();

    this->Panel2->Height = MinPanel2Height;
    ActiveButton1();
    UpdateLen();
    this->ComboBox3->ItemIndex = 0;
    this->ComboBox4->ItemIndex = 0;
    this->ComboBox5->ItemIndex = 0;
    this->ComboBox6->ItemIndex = 0;
    this->ComboBox7->ItemIndex = 0;
    this->ComboBox8->ItemIndex = 0;
    this->CheckBox1->Checked = false;
    this->ComboBox6->Visible = false;
    this->ComboBox7->Visible = false;
    this->ComboBox8->Visible = false;
}
//---------------------------------------------------------------------------

void __fastcall Tmo_doctors::CategoryButtons1Categories0Items2Click(TObject *Sender)
{
	if (this->ADOQuery1->RecordCount != 0)
    {
        this->Button1->Caption = "Изменить";
		mo_doctors->Panel4->Visible = true;

		mo_doctors->Panel1->Visible = true;
		mo_doctors->Panel2->Visible = false;
		mo_doctors->Panel6->Visible = false;

		mo_doctors->Label12->Caption = "Изменение данных о враче ";
		this->Panel2->Height = MinPanel2Height;
		WidthForm(2);

		UpdateData();
		ActiveButton1();
    }
}
//---------------------------------------------------------------------------

void __fastcall Tmo_doctors::CategoryButtons1Categories0Items5Click(TObject *Sender)
{
    int i;
    String Itog = "";

    WidthForm(2);

    mo_doctors->Panel4->Visible = true;
    mo_doctors->Panel1->Visible = false;
    mo_doctors->Panel2->Visible = true;
    mo_doctors->Panel6->Visible = false;

    mo_doctors->Label12->Caption = "Сведения о сертификатах";
    mo_doctors->Panel2->Top = 24;

	String SpecVracha = "SELECT  [IDSPEC]             \
								,[SPECNAME]           \
						FROM SPR_V021";
    StartSQL(SpecVracha);
    mo_doctors->ADOQuery3->Active = True;

	if (mo_doctors->ADOQuery3->RecordCount > 0)
    {
		mo_doctors->ADOQuery3->Open();
		for (mo_doctors->ADOQuery3->First(); !mo_doctors->ADOQuery3->Eof; mo_doctors->ADOQuery3->Next())
		{
			Itog = mo_doctors->ADOQuery3->FieldByName("IDSPEC")->AsString + ". " + mo_doctors->ADOQuery3->FieldByName("SPECNAME")->AsString;
			mo_doctors->ComboBox1->Items->Add(Itog);
        }
        mo_doctors->ComboBox1->ItemIndex = 0;
    }

    UpdateSertivifat();
    if (SostPanel5 == 0)
    {
        this->Panel5->Visible = false;
        this->Panel2->Height = MinPanel2Height;
    }
    ActiveButton5();
}

//---------------------------------------------------------------------------
void __fastcall Tmo_doctors::UpdateSertivifat()
{
    int  DataValue = mo_doctors->DBGrid1->DataSource->DataSet->Fields->Fields[0]->Value;
	String Sertifikat = "SELECT    [_id]           \
								  ,[DOCT_CODE]     \'Код врача\'            \
								  ,[V021_CODE]     \'Код спец.\'            \
								  ,row_number() over (order by _id) as [№ ] \
								  ,[NAME_BY_OKSO]  \'Специальность\'        \
								  ,[SER_CERT]      \'Серия\'                \
								  ,[NUM_CERT]      \'Номер\'                \
								  ,[DATEBEG_CERT]  \'Начало\'               \
								  ,[DATEEND_CERT]  \'Окончание\'            \
								  ,[COMENT]        \'Комментарий\'            \
						 FROM SPRTER_DOCTCER                       \
						 WHERE DOCT_CODE = " + IntToStr(DataValue);

    mo_doctors->ADOQuery2->Active = False;
    mo_doctors->ADOQuery2->SQL->Clear();
    mo_doctors->ADOQuery2->SQL->Add(Sertifikat);
    mo_doctors->ADOQuery2->Active = True;
    if (this->ADOQuery2->RecordCount != 0)
    {
        this->Label15->Visible = false;
        this->Button4->Visible = true;
        this->Button3->Visible = true;
        this->DBGrid2->Visible = true;
        mo_doctors->Label18->Visible = true;

        mo_doctors->DBGrid2->Columns->Items[0]->Visible = false;
        mo_doctors->DBGrid2->Columns->Items[1]->Visible = false;
        mo_doctors->DBGrid2->Columns->Items[2]->Visible = false;

        int i, j;
		int Maxlen = 0;
		int TekLen = 0;
        String DataLen = "";
        String ItogData = "";

        mo_doctors->ADOQuery2->Open();
        for (j = 0; j < mo_doctors->ADOQuery2->FieldCount; j++)
        {
            DataLen = mo_doctors->ADOQuery2->Fields->Fields[j]->FieldName;
			Maxlen = this->DBGrid2->Canvas->TextWidth(DataLen);
            mo_doctors->ADOQuery2->First();

            for (i = 0; !mo_doctors->ADOQuery2->Eof; i++)
            {
                ItogData = mo_doctors->ADOQuery2->FieldByName(DataLen)->AsString;
				TekLen = this->DBGrid2->Canvas->TextWidth(ItogData);
				if (TekLen > Maxlen) Maxlen = TekLen;
                mo_doctors->ADOQuery2->Next();
            }
            if (Maxlen == 0) mo_doctors->DBGrid2->Columns->Items[j]->Width = 6;
			else mo_doctors->DBGrid2->Columns->Items[j]->Width = Maxlen + 6;
			mo_doctors->DBGrid2->Columns->Items[j]->Alignment = taLeftJustify;
        }
        mo_doctors->ADOQuery2->First();
        ValidSertuifikat();

    }
    else
    {
        this->Label15->Visible = true;
        this->Button3->Visible = false;
        this->Button4->Visible = false;
        this->DBGrid2->Visible = false;
        mo_doctors->Label18->Visible = false;
    }
}

//---------------------------------------------------------------------------
void __fastcall Tmo_doctors::ValidSertuifikat()
{
    int i, j;
    time_t t;
    time(&t);
    int Year = localtime(&t)->tm_year + 1900;

    String Second = "";
    String DataName = "";
    String Name = "";
    for (i = 0; i < mo_doctors->ADOQuery2->FieldCount; i++)
    {
        Name = mo_doctors->ADOQuery2->Fields->Fields[i]->FieldName;
        DataName = mo_doctors->ADOQuery2->FieldByName(Name)->AsString;

        if (Name == "Окончание")
        {
            for (j = 1; j <= 4; j++)
            {
                Second += DataName[j];
            }
            if ((StrToInt(Second) - Year) >= 0)
            {
                mo_doctors->Label18->Caption = "Сертификат действителен.";
            }
            else
            {
                mo_doctors->Label18->Caption = "Сертификат недействителен.";
            }

        }
    }
}


//---------------------------------------------------------------------------
void __fastcall Tmo_doctors::Button3Click(TObject *Sender)
{
  if (MessageBox(Application->Handle,
    L"Удаление данных о сертификате врача. Вы уверены?",
    L"Удаление сертификата",
    MB_ICONQUESTION | MB_YESNO) == IDYES)
    {
        int  DataValue = mo_doctors->DBGrid2->DataSource->DataSet->Fields->Fields[0]->Value;
        String SQLString = "DELETE FROM SPRTER_DOCTCER WHERE [_id]=" + IntToStr(DataValue);

        mo_doctors->ADOQuery2->Active = False;
        mo_doctors->ADOQuery2->SQL->Clear();
        mo_doctors->ADOQuery2->SQL->Add(SQLString);
        mo_doctors->ADOQuery2->ExecSQL();
        UpdateSertivifat();
    }
}

//---------------------------------------------------------------------------
void __fastcall Tmo_doctors::UpdateDataPanel5()
{
    TDateTime dt;
    TFormatSettings FormatSettings;
    String First = "";
    String Second = "";

    FormatSettings.DateSeparator = '-';
    FormatSettings.TimeSeparator = ':';
    FormatSettings.LongDateFormat = "YYYY-MM-DD";
    FormatSettings.ShortDateFormat = "YYYY-MM-DD";
    FormatSettings.ShortTimeFormat = "HH:MM:SS";
    FormatSettings.LongTimeFormat = "HH:MM:SS";

    int i, j;
    String DataName = "";
    int  DataValue = mo_doctors->DBGrid2->DataSource->DataSet->Fields->Fields[0]->Value;

	String Sertifikat = "SELECT    [_id] \
								  ,[DOCT_CODE]                    \
								  ,[V021_CODE]                    \
								  ,[NAME_BY_OKSO]                 \
								  ,[SER_CERT]                     \
								  ,[NUM_CERT]                     \
								  ,[DATEBEG_CERT]                 \
								  ,[DATEEND_CERT]                 \
								  ,[COMENT]                       \
						  FROM SPRTER_DOCTCER             \
						  WHERE _id = " + IntToStr(DataValue);

    StartSQL(Sertifikat);
    mo_doctors->ADOQuery3->Active = True;

    if (this->ADOQuery3->RecordCount == 1)
    {
        mo_doctors->ADOQuery3->Open();
        mo_doctors->ADOQuery3->First();
        for (i = 0; i < mo_doctors->ADOQuery3->FieldCount; i++)
        {
            Name = mo_doctors->ADOQuery3->Fields->Fields[i]->FieldName;
            DataName = mo_doctors->ADOQuery3->FieldByName(Name)->AsString;

			if (Name == "V021_CODE")
            {
				String SpecVracha = "SELECT  [IDSPEC]             \
											,[SPECNAME]           \
									 FROM SPR_V021";
                mo_doctors->ADOQuery5->Active = False;
                mo_doctors->ADOQuery5->SQL->Clear();
                mo_doctors->ADOQuery5->SQL->Add(SpecVracha);
                mo_doctors->ADOQuery5->Active = True;

				if (mo_doctors->ADOQuery5->RecordCount > 0)
                {
                    mo_doctors->ADOQuery5->Open();
					int k = 0;
					for (mo_doctors->ADOQuery5->First(); !mo_doctors->ADOQuery5->Eof; mo_doctors->ADOQuery5->Next())
                    {
						if (mo_doctors->ADOQuery5->FieldByName("IDSPEC")->AsString == DataName)
                        {
							this->ComboBox1->ItemIndex = k;
                            break;
						}
						k++;
                    }
                }
            }
            if (Name == "SER_CERT") this->Edit10->Text = DataName;
            if (Name == "NUM_CERT") this->Edit9->Text = DataName;
            if (Name == "DATEBEG_CERT")
            {
                if (TryStrToDateTime(DataName + " 00:00:00", dt, FormatSettings))
                {
                    mo_doctors->DateTimePicker1->Date = dt;
                }

                for (j = 1; j <= 4; j++)
                {
                    First += DataName[j];
                }
              }
            if (Name == "DATEEND_CERT")
            {
                for (j = 1; j <= 4; j++)
                {
                    Second += DataName[j];
                }
                int Srok = StrToInt(Second) - StrToInt(First);
                this->Edit6->Text = IntToStr(Srok);
            }

            if (Name == "COMENT")       this->Edit7->Text = DataName;
        }
    }
}

//---------------------------------------------------------------------------
void __fastcall Tmo_doctors::DBGrid2CellClick(TColumn *Column)
{
    if (SostPanel5 == 2)
    {
        UpdateDataPanel5();
    }
    ValidSertuifikat();
}
//---------------------------------------------------------------------------

void __fastcall Tmo_doctors::Button5Click(TObject *Sender)
{
    int NewYear = 0;
    int i;

    int  DataValue = mo_doctors->DBGrid1->DataSource->DataSet->Fields->Fields[0]->Value;
    ID_DOCT = IntToStr(DataValue);

    String TMP = "";
    String DDD = mo_doctors->ComboBox1->Text;
    String Name_Sertifikat = "";
    bool Start = false;
    for (i = 1; i <= DDD.Length(); i++)
    {
        if ((DDD[i] == '.') && (DDD[i + 1] == ' ') && (Start == false))
        {
            i++;
            Start = true;
            continue;
        }
        if (Start) Name_Sertifikat += DDD[i];
        else TMP += DDD[i];

    }

    if ((SostPanel5 == 1) && (mo_doctors->DateTimePicker1->Checked == false))
    {
        HWND hWnd = GetForegroundWindow();
        MessageBoxA(hWnd, "Введите дату выдачи сертификата!", "Внимание!", MB_OK);
        mo_doctors->DateTimePicker1->SetFocus();
        Abort();
    }

    if (this->Edit6->Text != "") NewYear = StrToInt(this->Edit6->Text);

    time_t t;
    time(&t);

    int Year=localtime(&t)->tm_year + 1900;

    NewYear   += StrToInt(mo_doctors->DateTimePicker1->Date.FormatString("yyyy"));

    if (NewYear < Year)
    {
        HWND hWnd = GetForegroundWindow();
        MessageBoxA(hWnd, "Ошибка ввода даты выдачи сертификата!", "Внимание!", MB_OK);
        mo_doctors->DateTimePicker1->SetFocus();
        Abort();
    }

    String AAA = IntToStr(NewYear) + mo_doctors->DateTimePicker1->Date.FormatString("mmdd");

    String Sertifikat = "SELECT [_id] \
          ,[SER_CERT]            \
          ,[NUM_CERT]            \
          ,[DOCT_CODE]           \
          FROM SPRTER_DOCTCER    \
          WHERE SER_CERT = '" + mo_doctors->Edit10->Text +"' AND NUM_CERT = '" + mo_doctors->Edit9->Text +"'";
    StartSQL(Sertifikat);
    mo_doctors->ADOQuery3->Active = True;

    String temp = "NULL";
    if (mo_doctors->Edit7->Text != "") temp = "'" + mo_doctors->Edit7->Text + "'";

    if (SostPanel5 == 1)
    {
        if (this->ADOQuery3->RecordCount != 0)
        {
            HWND hWnd = GetForegroundWindow();
            MessageBoxA(hWnd, "Запись невозможна. Такой сертификат уже существует!", "Внимание!", MB_OK);
            this->Edit9->SetFocus();
            Abort();
        }

        ID_DOCT = "'" + ID_DOCT + "'";
        TMP = "'" + TMP + "'";
        Name_Sertifikat     = "'" + Name_Sertifikat + "'";
        String SER_CERT     = "'" + mo_doctors->Edit10->Text + "'";
        String NUM_CERT     = "'" + mo_doctors->Edit9->Text + "'";
        String DATEBEG_CERT = "'" + mo_doctors->DateTimePicker1->Date.FormatString("yyyymmdd") + "'";
        AAA                 = "'" + AAA + "'";

        String SQL_TMP = "INSERT INTO SPRTER_DOCTCER                                       \
                          OUTPUT INSERTED._id VALUES(" + ID_DOCT         + ","
                                                       + TMP             + ","
                                                       + Name_Sertifikat + ","
                                                       + SER_CERT        + ","
                                                       + NUM_CERT        + ","
                                                       + DATEBEG_CERT    + ","
                                                       + AAA             + ","
                                                       + temp + ")";

        Fun_8.InsernSQL(SQL_TMP);
        UpdateSertivifat();
    }

    if (SostPanel5 == 2)
    {
        String DoctorValue = mo_doctors->DBGrid1->DataSource->DataSet->Fields->Fields[0]->Value;
        DataValue = mo_doctors->DBGrid2->DataSource->DataSet->Fields->Fields[0]->Value;
        if (this->ADOQuery3->RecordCount != 0)
        {
            String Itog = "";
            mo_doctors->ADOQuery3->Open();
            mo_doctors->ADOQuery3->First();
            for (i = 0; !mo_doctors->ADOQuery3->Eof; i++)
            {
                Itog = mo_doctors->ADOQuery3->FieldByName("DOCT_CODE")->AsString;
                if (DoctorValue != Itog)
                {
                    HWND hWnd = GetForegroundWindow();
                    MessageBoxA(hWnd, "Запись невозможна. Такой сертификат уже существует!", "Внимание!", MB_OK);
                    Abort();
                }
                mo_doctors->ADOQuery3->Next();
            }
        }

        String TmpString = "UPDATE SPRTER_DOCTCER SET                     \
                       [DOCT_CODE] =    '" + ID_DOCT                  +"' \
					  ,[V021_CODE] =    '" + TMP                      +"' \
                      ,[NAME_BY_OKSO] = '" + Name_Sertifikat          +"' \
                      ,[SER_CERT] =     '" + mo_doctors->Edit10->Text +"' \
                      ,[NUM_CERT] =     '" + mo_doctors->Edit9->Text  +"' \
                      ,[DATEBEG_CERT] = '" + mo_doctors->DateTimePicker1->Date.FormatString("yyyymmdd") + "' \
                      ,[DATEEND_CERT] = '" + AAA                      +"' \
                      ,[COMENT]       = "  + temp                     +"  \
                    WHERE _id         = "  + DataValue;
        Fun_8.InsernSQL(TmpString);
        UpdateSertivifat();
    }
    this->Panel2->Height = MinPanel2Height;
	this->Panel5->Visible = false;
}
//---------------------------------------------------------------------------

void __fastcall Tmo_doctors::Button4Click(TObject *Sender)
{
	this->Panel5->Visible = true;
	SostPanel5 = 2;
	this->Panel2->Height = MaxPanel2Height;
    this->Button5->Caption = "Сохранить изменение";
	UpdateDataPanel5();

	this->Edit10Change(0);
	this->Edit9Change(0);
	this->Edit6Change(0);

	ActiveButton5();
}
//---------------------------------------------------------------------------
void __fastcall Tmo_doctors::CategoryButtons1Categories0Items6Click(TObject *Sender)

{
    this->Panel4->Visible = false;
    WidthForm(1);
}
//---------------------------------------------------------------------------

void __fastcall Tmo_doctors::CategoryButtons1Categories0Items4Click(TObject *Sender)

{
    int i;
    String Itog = "";
    mo_doctors->Label12->Caption = "Должность врача.";
    mo_doctors->Panel6->Top = 24;

    mo_doctors->Panel4->Visible = true;
    this->Panel2->Height = MinPanel2Height;

    mo_doctors->Panel1->Visible = false;
    mo_doctors->Panel2->Visible = false;
    mo_doctors->Panel6->Visible = true;

    WidthForm(2);

    String DolznostVracha = "SELECT      \
             [_id_doct_post]             \
            ,[NAME_DOC_POST]             \
            FROM SPR_DOC_POST";
    StartSQL(DolznostVracha);
    mo_doctors->ADOQuery3->Active = True;

    if (mo_doctors->ADOQuery3->RecordCount >= 1)
    {
        mo_doctors->ADOQuery3->Open();
        mo_doctors->ADOQuery3->First();
        for (i = 0; !mo_doctors->ADOQuery3->Eof; i++)
        {
            Itog = mo_doctors->ADOQuery3->FieldByName("_id_doct_post")->AsString + ". " + mo_doctors->ADOQuery3->FieldByName("NAME_DOC_POST")->AsString;
            mo_doctors->ComboBox2->Items->Add(Itog);
            mo_doctors->ADOQuery3->Next();
        }
        mo_doctors->ComboBox2->ItemIndex = 0;
    }
    DolUpdate();

}
//---------------------------------------------------------------------------

void __fastcall Tmo_doctors::DBGrid1KeyUp(TObject *Sender, WORD &Key, TShiftState Shift)
{
    if ((Key == 9) || (Key == 38) || (Key == 40))
    {
        //Информация о врачах
        if (mo_doctors->Panel1->Visible)
        {
            UpdateData();
        }
        //Информация о сертификатах
        if (mo_doctors->Panel2->Visible)
        {
           this->Panel2->Height = MinPanel2Height;
           UpdateSertivifat();
        }
        //Информация о должностях
        if (mo_doctors->Panel6->Visible)
        {
            DolUpdate();
        }
    }
}
//---------------------------------------------------------------------------


void __fastcall Tmo_doctors::Edit4KeyPress(TObject *Sender, System::WideChar &Key)

{
	if ((Key >= '0') && (Key <= '9'))
    {
        int len = this->Edit4->Text.Length();
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
				this->Edit5->SetFocus();
			}
		}
        else Abort();
    }
}
//---------------------------------------------------------------------------

void __fastcall Tmo_doctors::Edit1KeyPress(TObject *Sender, System::WideChar &Key)

{
	if (Key == '\r')
	{
        Key = 0;
		this->Edit2->SetFocus();
	}
	if ((Key >= '0') && (Key <= '9'))
    {
        Abort();
    }

}
//---------------------------------------------------------------------------

void __fastcall Tmo_doctors::Edit4KeyUp(TObject *Sender, WORD &Key, TShiftState Shift)
{
	int i,j,TekPolKur, IshodLen;
    TekPolKur = mo_doctors->Edit4->SelStart;
    IshodLen = mo_doctors->Edit4->Text.Length();
    char *Snils = AnsiString(mo_doctors->Edit4->Text).c_str();
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

    mo_doctors->Edit4->Text = (UnicodeString)ResultSn;
    *Sn = '\0';

    if (Key == 37 || Key == 39 || Key == 8 || Key == 46)
    {
        if (Key == 8)  Edit4->SelStart = TekPolKur;
        if (Key == 46) Edit4->SelStart = TekPolKur;
    }
    else
    {
        Edit4->SelStart = Edit4->Text.Length() ;
	}
}

//---------------------------------------------------------------------------
void __fastcall Tmo_doctors::Button6Click(TObject *Sender)
{
    //Добавление с должности
    int DataValue = mo_doctors->DBGrid1->DataSource->DataSet->Fields->Fields[0]->Value;
    String SQLString = "SELECT [_id_doct]    \
                        FROM R_DOC_POST       \
                        WHERE _id_doct = "+ IntToStr(DataValue) + " AND _id_post = " + IntToStr(ComboBox2->ItemIndex + 1);

    StartSQL(SQLString);
    mo_doctors->ADOQuery3->Active = True;
    if (mo_doctors->ADOQuery3->RecordCount > 0)
    {
        HWND hWnd = GetForegroundWindow();
        MessageBoxA(hWnd,"Должность у вача уже существует!", "Внимание", MB_OK);
        Abort();
    }


    String SQL_TMP = "INSERT INTO R_DOC_POST ([_id_doct], [_id_post]) VALUES( " + IntToStr(DataValue)+ ", " + IntToStr(ComboBox2->ItemIndex + 1) + ")";
    Fun_8.InsernSQL(SQL_TMP);
    mo_doctors->DBGrid4->Visible = true;
    DolUpdate();
    UpdateLen();
    WidthForm(2);
    PozDoc(DataValue);
}

//---------------------------------------------------------------------------
void __fastcall Tmo_doctors::PozDoc(int DataValue)
{
    if (mo_doctors->ADOQuery1->RecordCount > 0)
    {
        mo_doctors->ADOQuery1->Open();
        mo_doctors->ADOQuery1->First();

        String DataLen = mo_doctors->ADOQuery1->Fields->Fields[0]->FieldName;
        String ItogData;

        for (int i = 0; !mo_doctors->ADOQuery1->Eof; i++)
        {
            ItogData = mo_doctors->ADOQuery1->FieldByName(DataLen)->AsString;
            if (ItogData == IntToStr(DataValue))
            {
                break;
            }
            mo_doctors->ADOQuery1->Next();
        }

    }
}

//---------------------------------------------------------------------------
void __fastcall Tmo_doctors::Button7Click(TObject *Sender)
{
    //Удаление с должности
    if (MessageBox(Application->Handle,
        L"Удаление должности врача. Вы уверены?",
        L"Удаление данных",
    MB_ICONQUESTION | MB_YESNO) == IDYES)
    {
        int DataValue = mo_doctors->DBGrid4->DataSource->DataSet->Fields->Fields[0]->Value;
        int DocNom = mo_doctors->DBGrid1->DataSource->DataSet->Fields->Fields[0]->Value;
        String SQLString = "DELETE FROM [R_DOC_POST] WHERE [_id]=" + IntToStr(DataValue);
        StartSQL(SQLString);
        mo_doctors->ADOQuery3->ExecSQL();
        DolUpdate();
        UpdateLen();
        WidthForm(2);
        PozDoc(DocNom);
    }
}

//---------------------------------------------------------------------------
void __fastcall Tmo_doctors::DolUpdate()
{
    String DolznostVracha;
    int DataValue = mo_doctors->DBGrid1->DataSource->DataSet->Fields->Fields[0]->Value;
    DolznostVracha = "SELECT                                        \
                      R_DOC_POST._id                                \
                    , R_DOC_POST._id_post                           \
                    , row_number() over (order by _id desc) as [№ ] \
                    , SPR_DOC_POST.NAME_DOC_POST \'Должность\'      \
                    FROM R_DOC_POST, SPR_DOC_POST                   \
                    WHERE R_DOC_POST._id_post = SPR_DOC_POST._id_doct_post AND R_DOC_POST._id_doct =" + IntToStr(DataValue);

    mo_doctors->ADOQuery4->Active = False;
    mo_doctors->ADOQuery4->SQL->Clear();
    mo_doctors->ADOQuery4->SQL->Add(DolznostVracha);
    mo_doctors->ADOQuery4->Active = True;
    if (mo_doctors->ADOQuery4->RecordCount == 0)
    {
        mo_doctors->DBGrid4->Visible = false;
        this->Button7->Visible = false;
        this->Button8->Visible = false;
    }
    else
    {
        mo_doctors->DBGrid4->Visible = true;
        this->Button7->Visible = true;
        this->Button8->Visible = true;
        int i, j;
		int Maxlen = 0;
		int TekLen = 0;
        int TotalLenDbgrid = 0;
        String DataLen = "";
        String ItogData = "";

        mo_doctors->ADOQuery4->Open();
        for (j = 0; j < mo_doctors->ADOQuery4->FieldCount; j++)
        {
            DataLen = mo_doctors->ADOQuery4->Fields->Fields[j]->FieldName;
			Maxlen = this->DBGrid4->Canvas->TextWidth(DataLen);
            mo_doctors->ADOQuery4->First();

            for (i = 0; !mo_doctors->ADOQuery4->Eof; i++)
            {
                ItogData = mo_doctors->ADOQuery4->FieldByName(DataLen)->AsString;
                TekLen = this->DBGrid4->Canvas->TextWidth(ItogData);
				if (TekLen > Maxlen) Maxlen = TekLen;
                mo_doctors->ADOQuery4->Next();
            }
            if (Maxlen == 0)
            {
                mo_doctors->DBGrid4->Columns->Items[j]->Width = 6;
                TotalLenDbgrid += 6;
            }
            else
            {
				mo_doctors->DBGrid4->Columns->Items[j]->Width = Maxlen + 6;
				mo_doctors->DBGrid4->Columns->Items[j]->Alignment = taLeftJustify;
				TotalLenDbgrid += Maxlen + 6;
            }
        }
		mo_doctors->ADOQuery4->First();
    }

    mo_doctors->DBGrid4->DataSource->DataSet->Fields->Fields[0]->Visible = false;
    mo_doctors->DBGrid4->DataSource->DataSet->Fields->Fields[1]->Visible = false;
}

//--------------------------------------------------------------------------
void __fastcall Tmo_doctors::Button8Click(TObject *Sender)
{
    //Редактирование должности
    int DataValue = mo_doctors->DBGrid4->DataSource->DataSet->Fields->Fields[0]->Value;
    int DocNom    = mo_doctors->DBGrid1->DataSource->DataSet->Fields->Fields[0]->Value;

    String SQLString = "SELECT [_id_doct]    \
                        FROM R_DOC_POST       \
                        WHERE _id_doct = "+ IntToStr(DocNom) + " AND _id_post = " + IntToStr(ComboBox2->ItemIndex + 1);

    StartSQL(SQLString);
    mo_doctors->ADOQuery3->Active = True;
    if (mo_doctors->ADOQuery3->RecordCount > 0)
    {
        HWND hWnd = GetForegroundWindow();
        MessageBoxA(hWnd,"Должность у вача уже существует!", "Внимание", MB_OK);
        Abort();
    }

    String TmpString = "UPDATE R_DOC_POST SET                                               \
                            [_id_post] =     '" + IntToStr(ComboBox2->ItemIndex + 1) + "'   \
                        WHERE _id         = "  + DataValue;
    Fun_8.InsernSQL(TmpString);
    DolUpdate();
    UpdateLen();
    WidthForm(2);
    PozDoc(DocNom);
}
//---------------------------------------------------------------------------

void __fastcall Tmo_doctors::Edit2KeyPress(TObject *Sender, System::WideChar &Key)
{
	if ((Key >= '0') && (Key <= '9'))
    {
        Abort();
	}
	if (Key == '\r')
	{
        Key = 0;
		this->Edit3->SetFocus();
	}
}
//---------------------------------------------------------------------------

void __fastcall Tmo_doctors::Edit3KeyPress(TObject *Sender, System::WideChar &Key)
{
	if ((Key >= '0') && (Key <= '9'))
	{
		Abort();
	}
	if (Key == '\r')
	{
		Key = 0;
		this->Edit4->SetFocus();
	}
}
//---------------------------------------------------------------------------

void __fastcall Tmo_doctors::Edit6KeyPress(TObject *Sender, System::WideChar &Key)
{
	if ((Key >= '0') && (Key <= '9'))
    {}
    else
    {
		if ((Key =='\b') || (Key =='\r'))
		{
			if (Key == '\r')
			{
			Key = 0;
			this->Edit7->SetFocus();
			}
		}
        else Abort();
    }
}
//---------------------------------------------------------------------------

void __fastcall Tmo_doctors::Edit10Change(TObject *Sender)
{
	if (mo_doctors->Edit10->Text != "")
	{
		SostSertifakatButton |= 1;
    }
    else
	{
        SostSertifakatButton |= 1;
        SostSertifakatButton ^= 1;
    }
    ActiveButton5();

}
//---------------------------------------------------------------------------

void __fastcall Tmo_doctors::Edit9Change(TObject *Sender)
{
	if (mo_doctors->Edit9->Text != "")
    {
        SostSertifakatButton |= 2;
	}
    else
    {
        SostSertifakatButton |= 2;
		SostSertifakatButton ^= 2;
    }
	ActiveButton5();
}
//---------------------------------------------------------------------------

void __fastcall Tmo_doctors::Edit6Change(TObject *Sender)
{
    if (mo_doctors->Edit6->Text != "")
    {
        SostSertifakatButton |= 4;
    }
    else
    {
        SostSertifakatButton |= 4;
        SostSertifakatButton ^= 4;
    }
    ActiveButton5();
}

//---------------------------------------------------------------------------
void __fastcall Tmo_doctors::ActiveButton5()
{
    if (SostSertifakatButton == 7)
    {
        mo_doctors->Button5->Enabled = true;
    }
    else
    {
        mo_doctors->Button5->Enabled = false;
    }
}

//---------------------------------------------------------------------------
void __fastcall Tmo_doctors::ActiveButton1()
{
    if (SostDoctors == 7)
    {
        mo_doctors->Button1->Enabled = true;
    }
    else
    {
        mo_doctors->Button1->Enabled = false;
    }
}

//---------------------------------------------------------------------------
void __fastcall Tmo_doctors::Edit1Change(TObject *Sender)
{
    if (mo_doctors->Edit1->Text != "")
    {
        SostDoctors |= 1;
        this->Edit1->Color = clWindow;
    }
    else
    {
        SostDoctors |= 1;
        SostDoctors ^= 1;
        this->Edit1->Color = clYellow;
    }
    ActiveButton1();

}

//---------------------------------------------------------------------------
void __fastcall Tmo_doctors::Edit2Change(TObject *Sender)
{
    if (mo_doctors->Edit2->Text != "")
    {
        SostDoctors |= 2;
        this->Edit2->Color = clWindow;
    }
    else
    {
        SostDoctors |= 2;
        SostDoctors ^= 2;
        this->Edit2->Color = clYellow;
    }
    ActiveButton1();
}

//---------------------------------------------------------------------------

void __fastcall Tmo_doctors::Edit4Change(TObject *Sender)
{
    if (mo_doctors->Edit4->Text != "")
    {
        SostDoctors |= 4;
        if (mo_doctors->Edit4->Text.Length() != 14)
        {
            mo_doctors->Edit4->Color = clYellow;
        }
        else
        {
            this->Edit4->Color = clWindow;
            ProverkaSnils(mo_doctors->Edit4->Text);
        }
    }
    else
    {
        SostDoctors |= 4;
        SostDoctors ^= 4;
        this->Edit4->Color = clYellow;
    }
    ActiveButton1();
}

//---------------------------------------------------------------------------
void __fastcall Tmo_doctors::ProverkaSnils(String SnilsData)
{
    String Pol = "SELECT [_id]        \
                  FROM SPRTER_DOCTORS   \
                  WHERE SNILS = '"+ SnilsData+"'";

    StartSQL(Pol);
    mo_doctors->ADOQuery3->Active = True;

    if (this->Button1->Caption != "Изменить")
    {
        if (mo_doctors->ADOQuery3->RecordCount > 0)
        {
            mo_doctors->Edit4->Color = clRed;
        }
    }
    else
    {
        if (mo_doctors->ADOQuery3->RecordCount == 1)
        {
            String DataLen = mo_doctors->ADOQuery3->Fields->Fields[0]->FieldName;
            String ItogData = mo_doctors->ADOQuery3->FieldByName(DataLen)->AsString;
            if (DataLen == "_id")
            {
                if (ItogData != mo_doctors->ADOQuery1->Fields->Fields[0]->AsString)
                {
					mo_doctors->Edit4->Color = clRed;
                }
            }
        }
        if (mo_doctors->ADOQuery3->RecordCount > 1) mo_doctors->Edit4->Color = clRed;
    }
}

//---------------------------------------------------------------------------
void __fastcall Tmo_doctors::Edit5KeyPress(TObject *Sender, System::WideChar &Key)
{
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
		if ((Key =='\b') || (Key == '\r'))
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
void __fastcall Tmo_doctors::ComboBox4Change(TObject *Sender)
{
	bool IzmData = false;
    int i;
    int SostIndex = -1;
    if (this->ComboBox4->ItemIndex > 0) SetMonthPacientIndex();
    else
    {
        if (this->ComboBox4->ItemIndex == -1)
        {
            if (this->ComboBox4->Text.Length() == 2)
            {
                IzmData = true;
                int month = StrToInt(this->ComboBox4->Text);
                if (month > 0 && month < 13)
                {
                    this->ComboBox4->ItemIndex = month;
                    SetMonthPacientIndex();
                }
                else this->ComboBox4->Color = clYellow;
            }
        }

        if (this->ComboBox4->ItemIndex == 0)
        {
            SostIndex = mo_doctors->ComboBox3->ItemIndex;
            while (this->ComboBox3->Items->Count > 0) this->ComboBox3->Items->Delete(0);
            for (i = 0; i < 31; i++)
            {
                if (i == 0) mo_doctors->ComboBox3->Items->Add("н/у");
                if (i < 9) mo_doctors->ComboBox3->Items->Add("0" + IntToStr(i + 1));
                else mo_doctors->ComboBox3->Items->Add(IntToStr(i + 1));
            }
            if (mo_doctors->ComboBox3->Items->Count < SostIndex) mo_doctors->ComboBox3->ItemIndex = mo_doctors->ComboBox3->Items->Count - 1;
            else mo_doctors->ComboBox3->ItemIndex = SostIndex;
        }

        if (IzmData == false) this->ComboBox4->Color = clMoneyGreen;
    }

}

//---------------------------------------------------------------------------
void __fastcall Tmo_doctors::ComboBox7Change(TObject *Sender)
{
    bool IzmData = false;
    int i;
    int SostIndex = -1;
    if (mo_doctors->ComboBox7->ItemIndex > 0) SetMonthPredstavitelIndex();
    else
    {
        if (mo_doctors->ComboBox7->ItemIndex == -1)
        {
            if (mo_doctors->ComboBox7->Text.Length() == 2)
            {
                IzmData = true;
                int month = StrToInt(mo_doctors->ComboBox7->Text);
                if (month > 0 && month < 13)
                {
                    mo_doctors->ComboBox7->ItemIndex = month;
                    SetMonthPredstavitelIndex();
                }
                else this->ComboBox7->Color = clYellow;
            }
        }

        if (mo_doctors->ComboBox7->ItemIndex == 0)
        {
            SostIndex = mo_doctors->ComboBox6->ItemIndex;
            while (this->ComboBox6->Items->Count > 0) this->ComboBox6->Items->Delete(0);
            for (i = 0; i < 31; i++)
            {
                if (i == 0) mo_doctors->ComboBox6->Items->Add("н/у");
                if (i < 9) mo_doctors->ComboBox6->Items->Add("0" + IntToStr(i + 1));
                else mo_doctors->ComboBox6->Items->Add(IntToStr(i + 1));
            }
            if (mo_doctors->ComboBox6->Items->Count < SostIndex) mo_doctors->ComboBox6->ItemIndex = mo_doctors->ComboBox6->Items->Count - 1;
            else mo_doctors->ComboBox6->ItemIndex = SostIndex;
		}

        if (IzmData == false) this->ComboBox7->Color = clMoneyGreen;
    }
}

//---------------------------------------------------------------------------
void __fastcall Tmo_doctors::SetMonthPacientIndex()
{
    int i;
    int SostIndex = -1;
    SostIndex = mo_doctors->ComboBox3->ItemIndex;
    while (this->ComboBox3->Items->Count > 0) this->ComboBox3->Items->Delete(0);
    this->ComboBox4->Color = clWindow;

    for(i = 0; i < DaysInAMonth(YearOf(Date()),mo_doctors->ComboBox4->ItemIndex); i++)
	{
		if (i == 0) mo_doctors->ComboBox3->Items->Add("н/у");
		if (i < 9) mo_doctors->ComboBox3->Items->Add("0" + IntToStr(i + 1));
		else mo_doctors->ComboBox3->Items->Add(IntToStr(i + 1));
	}
	if (mo_doctors->ComboBox3->Items->Count < SostIndex) mo_doctors->ComboBox3->ItemIndex = mo_doctors->ComboBox3->Items->Count - 1;
	else mo_doctors->ComboBox3->ItemIndex = SostIndex;
}

//---------------------------------------------------------------------------
void __fastcall Tmo_doctors::SetMonthPredstavitelIndex()
{
	int i;
	int SostIndex = -1;
	SostIndex = mo_doctors->ComboBox6->ItemIndex;
	while (this->ComboBox6->Items->Count > 0) this->ComboBox6->Items->Delete(0);
	this->ComboBox7->Color = clWindow;

	for(i = 0; i < DaysInAMonth(YearOf(Date()),mo_doctors->ComboBox7->ItemIndex); i++)
	{
		if (i == 0) mo_doctors->ComboBox6->Items->Add("н/у");
        if (i < 9) mo_doctors->ComboBox6->Items->Add("0" + IntToStr(i + 1));
        else mo_doctors->ComboBox6->Items->Add(IntToStr(i + 1));
	}
    if (mo_doctors->ComboBox6->Items->Count < SostIndex) mo_doctors->ComboBox6->ItemIndex = mo_doctors->ComboBox6->Items->Count - 1;
    else mo_doctors->ComboBox6->ItemIndex = SostIndex;
}

//---------------------------------------------------------------------------
void __fastcall Tmo_doctors::ComboBox3Change(TObject *Sender)
{
    if (this->ComboBox3->ItemIndex == 0)
    {
        this->ComboBox3->Color = clMoneyGreen;
    }
    else
    {
        this->ComboBox3->Color = clMoneyGreen;
		if (this->ComboBox3->Text.Length() == 1)
		{
			this->ComboBox3->Color = clYellow;
		}

		if (this->ComboBox3->Text.Length() > 2)
		{
			this->ComboBox3->Color = clYellow;
		}

		if (this->ComboBox3->Text.Length() == 2)
		{
			if (StrToInt(this->ComboBox3->Text) > 31)
			{
				this->ComboBox3->Color = clYellow;
			}
			else this->ComboBox3->Color = clWindow;
		}
	}
}

//---------------------------------------------------------------------------
void __fastcall Tmo_doctors::ComboBox3KeyPress(TObject *Sender, System::WideChar &Key)
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
				if (this->ComboBox3->Text == "") this->ComboBox3->ItemIndex = 0;
				this->ComboBox4->SetFocus();
			}
        }
        else Abort();
    }
}

//---------------------------------------------------------------------------
void __fastcall Tmo_doctors::ComboBox5Change(TObject *Sender)
{
    if (this->ComboBox5->ItemIndex == 0)
    {
        this->ComboBox5->Color = clMoneyGreen;
    }
    else
    {
        this->ComboBox5->Color = clYellow;
        if (this->ComboBox5->Text.Length() == 4)
        {
            if ((StrToInt(this->ComboBox5->Text) < 1950) || (StrToInt(this->ComboBox5->Text) > 2018))
			{
                this->ComboBox5->Color = clYellow;
            }
			else this->ComboBox5->Color = clWindow;
		}
	}
}
//---------------------------------------------------------------------------

void __fastcall Tmo_doctors::ComboBox4KeyPress(TObject *Sender, System::WideChar &Key)
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
				if (this->ComboBox4->Text == "") this->ComboBox4->ItemIndex = 0;
				this->ComboBox5->SetFocus();
			}
		}
        else Abort();
    }
}

//---------------------------------------------------------------------------
void __fastcall Tmo_doctors::ComboBox5KeyPress(TObject *Sender, System::WideChar &Key)
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
				this->CheckBox1->SetFocus();
			}
		}
		else Abort();
	}
}

//---------------------------------------------------------------------------
void __fastcall Tmo_doctors::ComboBox6Change(TObject *Sender)
{
    if (this->ComboBox6->ItemIndex == 0)
    {
        this->ComboBox6->Color = clMoneyGreen;
    }
    else
    {
        this->ComboBox6->Color = clWindow;
    }
}
//---------------------------------------------------------------------------

void __fastcall Tmo_doctors::ComboBox7KeyPress(TObject *Sender, System::WideChar &Key)

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
				this->ComboBox8->SetFocus();
			}
		}
        else Abort();
    }
}

//---------------------------------------------------------------------------
void __fastcall Tmo_doctors::ComboBox8KeyPress(TObject *Sender, System::WideChar &Key)

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
				this->Button1->SetFocus();
			}
		}
        else Abort();
    }
}
//---------------------------------------------------------------------------

void __fastcall Tmo_doctors::ComboBox6KeyPress(TObject *Sender, System::WideChar &Key)

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



void __fastcall Tmo_doctors::ComboBox8Change(TObject *Sender)
{
    if (this->ComboBox8->ItemIndex == 0)
    {
        this->ComboBox8->Color = clMoneyGreen;
    }
    else
    {
        this->ComboBox8->Color = clYellow;
        if (this->ComboBox8->Text.Length() == 4)
        {
            if ((StrToInt(this->ComboBox8->Text) < 1950) || (StrToInt(this->ComboBox8->Text) > 2018))
            {
                this->ComboBox8->Color = clYellow;
            }
            else this->ComboBox8->Color = clWindow;
        }
    }
}

//---------------------------------------------------------------------------
void __fastcall Tmo_doctors::DBGrid1DrawColumnCell(TObject *Sender, const TRect &Rect,
		  int DataCol, TColumn *Column, TGridDrawState State)
{
	F1MyDBGrid *grid = static_cast<F1MyDBGrid*>(Sender);
	if (grid->DataLink->ActiveRecord == grid->Row -1)
	{
	 TField *F = Column->Field;
	 TCanvas *Cvs = DBGrid1->Canvas;
	 Cvs->Brush->Color = clSkyBlue;
	 Cvs->FillRect(Rect);
	 Cvs->Font->Color = clBlack;
	 Cvs->TextOut(Rect.Left+2, Rect.Top+2, F->Text);
	 Cvs->TextOut(Rect.Left+2, Rect.Top+2, F->Text);
	}
}

//---------------------------------------------------------------------------
void __fastcall Tmo_doctors::CategoryButtons1Categories0Items7Click(TObject *Sender)

{
	if (this->Panel7->Visible)
	{
        this->Panel7->Visible = false;
    }
    else
    {
        this->Panel7->Visible = true;
    }
}
//---------------------------------------------------------------------------

void __fastcall Tmo_doctors::Edit12Change(TObject *Sender)
{
    String StrokaPoiska = this->Edit12->Text;
    if (StrokaPoiska.Length()> 0)
    {
	   DopData = " WHERE     SPRTER_DOCTORS.SNILS LIKE '%" + StrokaPoiska
                    + "%' OR SPRTER_DOCTORS.FAM   LIKE '%" + StrokaPoiska +"%'";

        UpdateLen();
        if (this->DBGrid1->Visible)
        {
            if (mo_doctors->Panel1->Visible) UpdateData();
            if (mo_doctors->Panel2->Visible)
            {
               this->Panel2->Height = MinPanel2Height;
               UpdateSertivifat();
            }
            if (mo_doctors->Panel6) DolUpdate();
        }
    }
    else
    {
        DopData = "";
        UpdateLen();
    }
}
//---------------------------------------------------------------------------

void __fastcall Tmo_doctors::Edit8Change(TObject *Sender)
{
    if (this->Edit8->Text == "")
    {
        this->Edit8->Color = clMoneyGreen;
    }
    else
    {
        this->Edit8->Color = clWindow;
    }
}
//---------------------------------------------------------------------------

void __fastcall Tmo_doctors::Edit5Change(TObject *Sender)
{
    if (this->Edit5->Text == "")
    {
        this->Edit5->Color = clMoneyGreen;
	}
    else
	{
        this->Edit5->Color = clWindow;
    }
}
//---------------------------------------------------------------------------

void __fastcall Tmo_doctors::Edit3Change(TObject *Sender)
{
    if (this->Edit3->Text == "")
    {
        this->Edit3->Color = clMoneyGreen;
    }
    else
    {
        this->Edit3->Color = clWindow;
    }
}

//---------------------------------------------------------------------------
void __fastcall Tmo_doctors::CheckBox1Click(TObject *Sender)
{
    if (this->CheckBox1->Checked)
    {
        this->ComboBox6->Visible = true;
        this->ComboBox7->Visible = true;
        this->ComboBox8->Visible = true;
    }
    else
    {
        this->ComboBox6->Visible = false;
        this->ComboBox7->Visible = false;
        this->ComboBox8->Visible = false;
        this->ComboBox6->ItemIndex = 0;
        this->ComboBox7->ItemIndex = 0;
        this->ComboBox8->ItemIndex = 0;
    }

}

//---------------------------------------------------------------------------
void __fastcall Tmo_doctors::DBGrid1TitleClick(TColumn *Column)
{
	String Data = Column->FieldName;
    if (Data == "ФИО")
    {
        if (SostSort == 1)
        {
            SostSort = 2;
            DataSort = "ORDER BY SPRTER_DOCTORS.FAM+' '+SPRTER_DOCTORS.IM+' '+SPRTER_DOCTORS.OT DESC";
        }
        else
        {
            SostSort = 1;
            DataSort = "ORDER BY SPRTER_DOCTORS.FAM+' '+SPRTER_DOCTORS.IM+' '+SPRTER_DOCTORS.OT ASC";
        }
    }
    if (Data == "№ ")
    {
        if (SostSort == 3)
        {
            SostSort = 4;
            DataSort = "ORDER BY SPRTER_DOCTORS._id ASC";
        }
        else
        {
            SostSort = 3;
            DataSort = "ORDER BY SPRTER_DOCTORS._id DESC";
        }
    }
    if (Data == "СНИЛС")
    {
        if (SostSort == 5)
        {
            SostSort = 6;
            DataSort = "ORDER BY SPRTER_DOCTORS.SNILS DESC";
        }
        else
        {
            SostSort = 5;
            DataSort = "ORDER BY SPRTER_DOCTORS.SNILS ASC";
        }
	}

    if (Data == "Телефон")
    {
        if (SostSort == 7)
        {
            SostSort = 8;
            DataSort = "ORDER BY SPRTER_DOCTORS.TEL DESC";
        }
        else
        {
            SostSort = 7;
            DataSort = "ORDER BY SPRTER_DOCTORS.TEL ASC";
        }
    }

    if (Data == "Должность")
    {
        if (SostSort == 9)
        {
            SostSort = 10;
            DataSort = "ORDER BY cast( isnull(replace((select isnull(NAME_DOC_POST,'') as 'data()'                                       \
                                     from SPR_DOC_POST LEFT JOIN R_DOC_POST ON R_DOC_POST._id_doct = SPRTER_DOCTORS._id        \
                                     where SPR_DOC_POST._id_doct_post = R_DOC_POST._id_post for xml path('')), ' ', ' '),'')  as nvarchar(1024)) DESC";
        }
        else
		{
            SostSort = 9;
            DataSort = "ORDER BY cast( isnull(replace((select isnull(NAME_DOC_POST,'') as 'data()'                                       \
                                     from SPR_DOC_POST LEFT JOIN R_DOC_POST ON R_DOC_POST._id_doct = SPRTER_DOCTORS._id        \
                                     where SPR_DOC_POST._id_doct_post = R_DOC_POST._id_post for xml path('')), ' ', ' '),'')  as nvarchar(1024))  ASC";
        }
    }

    UpdateLen();
	if (mo_doctors->Panel4->Visible) WidthForm(2);
	else WidthForm(1);
	this->DBGrid1CellClick(0);
}

//---------------------------------------------------------------------------
void __fastcall Tmo_doctors::Edit8KeyPress(TObject *Sender, System::WideChar &Key)
{
	if (Key == '\r')
	{
		Key = 0;
		this->ComboBox3->SetFocus();
	}
}
//---------------------------------------------------------------------------

void __fastcall Tmo_doctors::DBGrid1ColumnMoved(TObject *Sender, int FromIndex, int ToIndex)

{
	this->DBGrid1->Columns->Items[ToIndex]->Index = FromIndex;
}
//---------------------------------------------------------------------------

void __fastcall Tmo_doctors::DBGrid4ColumnMoved(TObject *Sender, int FromIndex, int ToIndex)
{
	this->DBGrid4->Columns->Items[ToIndex]->Index = FromIndex;
}
//---------------------------------------------------------------------------

void __fastcall Tmo_doctors::DBGrid2ColumnMoved(TObject *Sender, int FromIndex, int ToIndex)

{
	this->DBGrid2->Columns->Items[ToIndex]->Index = FromIndex;
}
//---------------------------------------------------------------------------

void __fastcall Tmo_doctors::FormKeyPress(TObject *Sender, System::WideChar &Key)
{
	if (Key == '\x1B')
    {
		Key = 0;
        this->Close();
	}
}
//---------------------------------------------------------------------------


void __fastcall Tmo_doctors::ComboBox1KeyPress(TObject *Sender, System::WideChar &Key)
{
	if (Key == '\r')
	{
		Key = 0;
		this->Edit10->SetFocus();
	}
}
//---------------------------------------------------------------------------

void __fastcall Tmo_doctors::Edit10KeyPress(TObject *Sender, System::WideChar &Key)
{
	if (Key == '\r')
	{
		Key = 0;
		this->Edit9->SetFocus();
	}
}
//---------------------------------------------------------------------------

void __fastcall Tmo_doctors::CheckBox1KeyPress(TObject *Sender, System::WideChar &Key)
{
	if (Key == '\r')
	{
		Key = 0;
		if (this->ComboBox6->Visible) this->ComboBox6->SetFocus();
		else this->Button1->SetFocus();
	}
}
//---------------------------------------------------------------------------

void __fastcall Tmo_doctors::ComboBox2KeyPress(TObject *Sender, System::WideChar &Key)

{
	if (Key == '\r')
	{
		Key = 0;
		this->Button6->SetFocus();
    }
}
//---------------------------------------------------------------------------

void __fastcall Tmo_doctors::Edit9KeyPress(TObject *Sender, System::WideChar &Key)
{
	if (Key == '\r')
	{
		Key = 0;
		this->DateTimePicker1->SetFocus();
    }
}

//---------------------------------------------------------------------------
void __fastcall Tmo_doctors::DateTimePicker1KeyPress(TObject *Sender, System::WideChar &Key)
{
	if (Key == '\r')
	{
		Key = 0;
		this->Edit6->SetFocus();
	}
}

//---------------------------------------------------------------------------
void __fastcall Tmo_doctors::Edit7KeyPress(TObject *Sender, System::WideChar &Key)
{
	if (Key == '\r')
	{
		Key = 0;
		if (this->Button5->Enabled) this->Button5->SetFocus();
	}
}
//---------------------------------------------------------------------------

