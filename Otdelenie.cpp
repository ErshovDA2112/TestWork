//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
#include "Otdelenie.h"
#include "Main.h"

#include "vector"
#include "Vcl.Imaging.pngimage.hpp"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
Tmo_podr *mo_podr;

int MasDoctorsPodr[2048];
int MasDoctorsOtdel[2048];
int TypeWokrPodr;
int TypeWokrOtdel;

int SostSort_U7_Pod = 0;
String DataSort_U7_Pod = "";

int SostSort_U7_Otd = 0;
String DataSort_U7_Otd = "";

String Podrazdeleniya = "SELECT SPRTER_LPU_1._id																													\
								,SPRTER_LPU_1.CODE 																							as [Код]				\
								,SPRTER_LPU_1.NAME 																							as [Наименование]		\
								,isnull(SPRTER_DOCTORS.FAM, '') + ' ' + isnull(SPRTER_DOCTORS.IM, '') + ' ' + isnull(SPRTER_DOCTORS.OT, '')	as [ФИО]				\
								,IIF(SPRTER_LPU_1.DATEEND IS NULL, 'Активен', 'Не активен')													as [Статус] 			\
								,SPRTER_LPU_1._id_doctors																					as [ID]					\
						FROM SPRTER_LPU_1 																															\
							 LEFT JOIN SPRTER_DOCTORS ON (SPRTER_LPU_1._id_doctors = SPRTER_DOCTORS._id) ";

String Otdeleniya =     "SELECT SPRTER_PODR._id 																													\
								,SPRTER_PODR.CODE 																							as [Код]				\
								,SPRTER_PODR.NAME 																							as [Наименование]		\
								,isnull(SPRTER_DOCTORS.FAM, '') + ' ' + isnull(SPRTER_DOCTORS.IM, '') + ' ' + isnull(SPRTER_DOCTORS.OT, '')	as [ФИО]				\
								,IIF(SPRTER_PODR.DATEEND IS NULL, 'Активен', 'Не активен')													as [Статус] 			\
								,SPRTER_PODR._id_doctors																					as [ID]					\
						FROM SPRTER_PODR																															\
							 LEFT JOIN SPRTER_DOCTORS ON (SPRTER_PODR._id_doctors = SPRTER_DOCTORS._id) ";


//---------------------------------------------------------------------------
__fastcall Tmo_podr::Tmo_podr(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall Tmo_podr::FormMouseWheel(TObject *Sender, TShiftState Shift, int WheelDelta,
          TPoint &MousePos, bool &Handled)
{
//    this->ScrollBox1->VertScrollBar->Position -= WheelDelta;
}
//---------------------------------------------------------------------------
void __fastcall Tmo_podr::FormActivate(TObject *Sender)
{

	DataSort_U7_Pod = "ORDER BY SPRTER_LPU_1.CODE ASC";
    SostSort_U7_Pod = 1;

	DataSort_U7_Otd = "ORDER BY SPRTER_PODR.CODE ASC";
    SostSort_U7_Otd = 1;

	for (int i = 0; i < 2048; i++) MasDoctorsPodr[i] = -1;
	for (int i = 0; i < 2048; i++) MasDoctorsOtdel[i] = -1;
	mo_podr->ADOQuery1->Active = False;
	mo_podr->ADOQuery1->SQL->Clear();
	mo_podr->ADOQuery1->SQL->Add(Podrazdeleniya + DataSort_U7_Pod);
	mo_podr->ADOQuery1->Active = True;
	UpdateLen_Podrazdelenie();

	mo_podr->ADOQuery2->Active = False;
    mo_podr->ADOQuery2->SQL->Clear();
    mo_podr->ADOQuery2->SQL->Add(Otdeleniya + DataSort_U7_Otd);
	mo_podr->ADOQuery2->Active = True;
	UpdateLen_Otdelenie();

	this->Panel4->Visible = false;
	this->Panel5->Visible = false;
}

//---------------------------------------------------------------------------
void __fastcall Tmo_podr::DBGrid1DrawColumnCell(TObject *Sender, const TRect &Rect,
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

void __fastcall Tmo_podr::DBGrid2DrawColumnCell(TObject *Sender, const TRect &Rect,
          int DataCol, TColumn *Column, TGridDrawState State)
{
    F1MyDBGrid *grid = static_cast<F1MyDBGrid*>(Sender);
    if (grid->DataLink->ActiveRecord == grid->Row -1)
    {
     TField *F = Column->Field;
	 TCanvas *Cvs = DBGrid2->Canvas;
	 Cvs->Brush->Color = clSkyBlue;
     Cvs->FillRect(Rect);
     Cvs->Font->Color = clBlack;
     Cvs->TextOut(Rect.Left+2, Rect.Top+2, F->Text);
     Cvs->TextOut(Rect.Left+2, Rect.Top+2, F->Text);
	}
}

//---------------------------------------------------------------------------
void __fastcall Tmo_podr::UpdateLen_Podrazdelenie()
{
    int i, j;
    int Maxlen = 0;
    int TekLen = 0;
    int TotalLenDbgrid = 0;
    String DataLen = "";
    String ItogData = "";

    mo_podr->DBGrid1->Visible = false;

	if (mo_podr->ADOQuery1->RecordCount > 0)
	{
		mo_podr->ADOQuery1->Open();
		for (j = 0; j < mo_podr->ADOQuery1->FieldCount; j++)
		{

			DataLen = mo_podr->ADOQuery1->Fields->Fields[j]->FieldName;
			Maxlen = this->DBGrid1->Canvas->TextWidth(DataLen);
			mo_podr->ADOQuery1->First();

            for (i = 0; !mo_podr->ADOQuery1->Eof; i++)
            {
                ItogData = mo_podr->ADOQuery1->FieldByName(DataLen)->AsString;
                TekLen = this->DBGrid1->Canvas->TextWidth(ItogData);
                if (TekLen > Maxlen) Maxlen = TekLen;
                mo_podr->ADOQuery1->Next();
			}

            if (Maxlen == 0)
			{
				mo_podr->DBGrid1->Columns->Items[j]->Width = 6;
				if (j > 0) TotalLenDbgrid += 6;
            }
			else
            {
				mo_podr->DBGrid1->Columns->Items[j]->Width = Maxlen + 6;
				if (j > 0) TotalLenDbgrid += Maxlen + 6;
            }
        }

		mo_podr->ADOQuery1->First();
		mo_podr->DBGrid1->DataSource->DataSet->Fields->Fields[0]->Visible = false;
		mo_podr->DBGrid1->DataSource->DataSet->Fields->Fields[5]->Visible = false;
		mo_podr->DBGrid1->Visible = true;
    }
}

//---------------------------------------------------------------------------
void __fastcall Tmo_podr::UpdateLen_Otdelenie()
{
    int i, j;
    int Maxlen = 0;
    int TekLen = 0;
    int TotalLenDbgrid = 0;
    String DataLen = "";
    String ItogData = "";

    mo_podr->DBGrid2->Visible = false;

	if (mo_podr->ADOQuery2->RecordCount > 0)
	{
		mo_podr->ADOQuery2->Open();
		for (j = 0; j < mo_podr->ADOQuery2->FieldCount; j++)
		{

			DataLen = mo_podr->ADOQuery2->Fields->Fields[j]->FieldName;
			Maxlen = this->DBGrid2->Canvas->TextWidth(DataLen);
			mo_podr->ADOQuery2->First();

            for (i = 0; !mo_podr->ADOQuery2->Eof; i++)
            {
                ItogData = mo_podr->ADOQuery2->FieldByName(DataLen)->AsString;
                TekLen = this->DBGrid2->Canvas->TextWidth(ItogData);
                if (TekLen > Maxlen) Maxlen = TekLen;
                mo_podr->ADOQuery2->Next();
			}

            if (Maxlen == 0)
			{
				mo_podr->DBGrid2->Columns->Items[j]->Width = 6;
				if (j > 0) TotalLenDbgrid += 6;
            }
			else
            {
				mo_podr->DBGrid2->Columns->Items[j]->Width = Maxlen + 6;
				if (j > 0) TotalLenDbgrid += Maxlen + 6;
            }
        }

		mo_podr->ADOQuery2->First();
		mo_podr->DBGrid2->DataSource->DataSet->Fields->Fields[0]->Visible = false;
		mo_podr->DBGrid2->DataSource->DataSet->Fields->Fields[5]->Visible = false;
		mo_podr->DBGrid2->Visible = true;
    }
}
//---------------------------------------------------------------------------

void __fastcall Tmo_podr::Button2Click(TObject *Sender)
{
	TypeWokrPodr = 1;
	this->Panel4->Visible = true;
	this->DouwnLoadDoctorsPodzazdelenue();
	this->DBGrid1CellClick(0);

}

//---------------------------------------------------------------------------
void __fastcall Tmo_podr::DouwnLoadDoctorsPodzazdelenue()
{
	int i;
	String Itog;
	for (i = 0; i < 2048; i++) MasDoctorsPodr[i] = -1;

	while (this->ComboBox1->Items->Count > 0) this->ComboBox1->Items->Delete(0);

	String SQL_DOCTERS = "SELECT FAM + ' ' + IM + ' ' + OT 'ФИО' 										\
								,_id 					   'ИД'											\
						  FROM   SPRTER_DOCTORS 														\
						  WHERE GETDATE() >= DATEBEG AND (GETDATE() < DATEEND OR DATEEND IS NULL)		\
						  ORDER BY FAM "  ;

	mo_podr->ADOQuery3->Active = False;
	mo_podr->ADOQuery3->SQL->Clear();
    mo_podr->ADOQuery3->SQL->Add(SQL_DOCTERS);
	mo_podr->ADOQuery3->Active = True;

    if (mo_podr->ADOQuery3->RecordCount != 0)
    {
        mo_podr->ADOQuery3->Open();
        mo_podr->ADOQuery3->First();
        for (i = 0; !mo_podr->ADOQuery3->Eof; i++)
        {
			Itog = mo_podr->ADOQuery3->FieldByName("ФИО")->AsString;
			MasDoctorsPodr[i] = StrToInt(mo_podr->ADOQuery3->FieldByName("ИД")->AsString);
            mo_podr->ComboBox1->Items->Add(IntToStr(i + 1) + ". "+ Itog);
            mo_podr->ADOQuery3->Next();
        }
		mo_podr->ComboBox1->ItemIndex = -1;
	}
	this->ComboBox1Change(ComboBox1);
}

//---------------------------------------------------------------------------
void __fastcall Tmo_podr::Button3Click(TObject *Sender)
{
	TypeWokrPodr = 0;
	this->Panel4->Visible = true;
   	this->Edit1->Text = "";
	this->Edit3->Text = "";
	this->Edit1->Color = clYellow;
	this->Edit3->Color = clYellow;
	this->CheckBox1->Checked = false;

	DouwnLoadDoctorsPodzazdelenue();
    this->Button1->Visible = False;
}

//---------------------------------------------------------------------------
void __fastcall Tmo_podr::Button5Click(TObject *Sender)
{
    TypeWokrOtdel = 1;
	this->Panel5->Visible = true;
	this->DouwnLoadDoctorsOtdelenue();
	this->DBGrid2CellClick(0);
}

//---------------------------------------------------------------------------
void __fastcall Tmo_podr::DouwnLoadDoctorsOtdelenue()
{
	int i;
	String Itog;
	for (i = 0; i < 2048; i++) MasDoctorsOtdel[i] = -1;
	while (this->ComboBox2->Items->Count > 0) this->ComboBox2->Items->Delete(0);

	String SQL_DOCTERS = "SELECT FAM + ' ' + IM + ' ' + OT 'ФИО' 										\
								,_id 					   'ИД'											\
						  FROM   SPRTER_DOCTORS 														\
						  WHERE GETDATE() >= DATEBEG AND (GETDATE() < DATEEND OR DATEEND IS NULL)		\
						  ORDER BY FAM "  ;

	mo_podr->ADOQuery3->Active = False;
	mo_podr->ADOQuery3->SQL->Clear();
    mo_podr->ADOQuery3->SQL->Add(SQL_DOCTERS);
	mo_podr->ADOQuery3->Active = True;

    if (mo_podr->ADOQuery3->RecordCount != 0)
    {
        mo_podr->ADOQuery3->Open();
        mo_podr->ADOQuery3->First();
		for (i = 0; !mo_podr->ADOQuery3->Eof; i++)
        {
			Itog = mo_podr->ADOQuery3->FieldByName("ФИО")->AsString;
			MasDoctorsOtdel[i] = StrToInt(mo_podr->ADOQuery3->FieldByName("ИД")->AsString);
            mo_podr->ComboBox2->Items->Add(IntToStr(i + 1) + ". "+ Itog);
            mo_podr->ADOQuery3->Next();
        }
        mo_podr->ComboBox2->ItemIndex = -1;
	}
	this->ComboBox2Change(ComboBox2);
}

//---------------------------------------------------------------------------
void __fastcall Tmo_podr::Button4Click(TObject *Sender)
{
	TypeWokrOtdel = 0;
	this->Panel5->Visible = true;
	this->Edit2->Text = "";
	this->Edit4->Text = "";
	this->Edit2->Color = clYellow;
	this->Edit4->Color = clYellow;
	this->CheckBox2->Checked = false;
    this->Button6->Visible = false;

	DouwnLoadDoctorsOtdelenue();
}

//---------------------------------------------------------------------------
void __fastcall Tmo_podr::DBGrid1CellClick(TColumn *Column)
{
	if (this->Panel4->Visible)
	{
		String DataLen, ItogData;
		int j, i;
		TypeWokrPodr = 1;
		for (j = 0; j < mo_podr->ADOQuery1->FieldCount; j++)
		{
			DataLen = mo_podr->ADOQuery1->Fields->Fields[j]->FieldName;
			ItogData = mo_podr->ADOQuery1->FieldByName(DataLen)->AsString;
			if (DataLen == "Код")
			{
				this->Edit3->Text = mo_podr->ADOQuery1->FieldByName(DataLen)->AsString;
			}
			if (DataLen == "Наименование")
			{
				this->Edit1->Text = ItogData;
			}
			if (DataLen == "ID")
			{
				if (ItogData.Length() > 0)
				{
					i = 0;
					while (MasDoctorsPodr[i] != -1)
					{
						if (MasDoctorsPodr[i] == StrToInt(ItogData))
						{
							this->ComboBox1->ItemIndex = i;
                            this->ComboBox1Change(ComboBox1);
							break;
						}
						i++;
					}
				}
				else
				{
				 	this->ComboBox1->ItemIndex = -1;
				 	this->ComboBox1Change(ComboBox1);
				}
			}
			if (DataLen == "Статус")
			{
				if (ItogData == "Активен") this->CheckBox1->Checked = true;
				else this->CheckBox1->Checked = false;
			}
		}
        this->Button1->Visible = true;
	}
}
//---------------------------------------------------------------------------

void __fastcall Tmo_podr::DBGrid2CellClick(TColumn *Column)
{
	if (this->Panel5->Visible)
	{
		String DataLen, ItogData;
		int j, i;
		TypeWokrOtdel = 1;
		for (j = 0; j < mo_podr->ADOQuery2->FieldCount; j++)
		{
			DataLen = mo_podr->ADOQuery2->Fields->Fields[j]->FieldName;
			ItogData = mo_podr->ADOQuery2->FieldByName(DataLen)->AsString;
			if (DataLen == "Код")
			{
				this->Edit4->Text = mo_podr->ADOQuery2->FieldByName(DataLen)->AsString;
			}
			if (DataLen == "Наименование")
			{
				this->Edit2->Text = mo_podr->ADOQuery2->FieldByName(DataLen)->AsString;
			}
			if (DataLen == "ID")
			{
				if (ItogData.Length() > 0)
				{
					i = 0;
					while (MasDoctorsOtdel[i] != -1)
					{
						if (MasDoctorsOtdel[i] == StrToInt(ItogData))
						{
							this->ComboBox2->ItemIndex = i;
							this->ComboBox2Change(ComboBox2);
							break;
						}
						i++;
					}
				}
                else
                {
                	this->ComboBox2->ItemIndex = -1;
                	this->ComboBox2Change(ComboBox2);
                }
			}
			if (DataLen == "Статус")
			{
				if (ItogData == "Активен") this->CheckBox2->Checked = true;
				else this->CheckBox2->Checked = false;
			}
		}
		this->Button6->Visible = true;
	}
}
//---------------------------------------------------------------------------

void __fastcall Tmo_podr::Edit1Change(TObject *Sender)
{
	if (this->Edit1->Text=="")
	{
		this->Edit1->Color = clYellow;
	}
	else
	{
		this->Edit1->Color = clWindow;
		String Data = "SELECT * FROM SPRTER_LPU_1 WHERE NAME = '" + this->Edit1->Text + "'";
		mo_podr->ADOQuery3->Active = False;
		mo_podr->ADOQuery3->SQL->Clear();
		mo_podr->ADOQuery3->SQL->Add(Data);
		mo_podr->ADOQuery3->Active = True;

		if (TypeWokrPodr == 0)
		{
			if (mo_podr->ADOQuery3->RecordCount != 0) this->Edit1->Color = clRed;
		}
		else
		{
			if (mo_podr->ADOQuery3->RecordCount == 1)
			{
				String DataLen = mo_podr->ADOQuery3->Fields->Fields[0]->FieldName;
				String ItogData = mo_podr->ADOQuery3->FieldByName(DataLen)->AsString;
				if (DataLen == "_id")
				{
					if (ItogData != mo_podr->ADOQuery1->Fields->Fields[0]->AsString)
					{
						this->Edit1->Color = clRed;
					}
				}
			}
			if (mo_podr->ADOQuery3->RecordCount > 1) this->Edit1->Color = clRed;
		}
	}

}
//---------------------------------------------------------------------------

void __fastcall Tmo_podr::Edit3Change(TObject *Sender)
{
	if (this->Edit3->Text == "") this->Edit3->Color = clYellow;
	else
	{
		this->Edit3->Color = clWindow;
		String Data = "SELECT * FROM SPRTER_LPU_1 WHERE CODE = " + this->Edit3->Text;
		mo_podr->ADOQuery3->Active = False;
		mo_podr->ADOQuery3->SQL->Clear();
		mo_podr->ADOQuery3->SQL->Add(Data);
		mo_podr->ADOQuery3->Active = True;
		if (TypeWokrPodr == 0)
		{
			if (mo_podr->ADOQuery3->RecordCount != 0) this->Edit3->Color = clRed;
		}
		else
		{
			if (mo_podr->ADOQuery3->RecordCount == 1)
			{
				String DataLen = mo_podr->ADOQuery3->Fields->Fields[0]->FieldName;
				String ItogData = mo_podr->ADOQuery3->FieldByName(DataLen)->AsString;
				if (DataLen == "_id")
				{
					if (ItogData != mo_podr->ADOQuery1->Fields->Fields[0]->AsString)
					{
						this->Edit3->Color = clRed;
					}
				}
			}
			if (mo_podr->ADOQuery3->RecordCount > 1) this->Edit3->Color = clRed;
        }
	}
}
//---------------------------------------------------------------------------

void __fastcall Tmo_podr::Edit2Change(TObject *Sender)
{
	if (this->Edit2->Text=="") this->Edit2->Color = clYellow;
	else
	{
		this->Edit2->Color = clWindow;
		String Data = "SELECT * FROM SPRTER_PODR WHERE NAME = '" + this->Edit2->Text + "'";
		mo_podr->ADOQuery3->Active = False;
		mo_podr->ADOQuery3->SQL->Clear();
		mo_podr->ADOQuery3->SQL->Add(Data);
		mo_podr->ADOQuery3->Active = True;

		if (TypeWokrOtdel == 0)
		{
			if (mo_podr->ADOQuery3->RecordCount != 0)
			{
				this->Edit2->Color = clRed;
			}
		}
		else
		{
			if (mo_podr->ADOQuery3->RecordCount == 1)
			{
				String DataLen = mo_podr->ADOQuery3->Fields->Fields[0]->FieldName;
				String ItogData = mo_podr->ADOQuery3->FieldByName(DataLen)->AsString;
				if (DataLen == "_id")
				{
					if (ItogData != mo_podr->ADOQuery2->Fields->Fields[0]->AsString)
					{
						this->Edit2->Color = clRed;
					}
				}
			}
		}
	}
}
//---------------------------------------------------------------------------

void __fastcall Tmo_podr::Edit4Change(TObject *Sender)
{
	if (this->Edit4->Text=="")
	{
		this->Edit4->Color = clYellow;
	}
	else
	{
		this->Edit4->Color = clWindow;
		String Data = "SELECT * FROM SPRTER_PODR WHERE CODE = " + this->Edit4->Text;
		mo_podr->ADOQuery3->Active = False;
		mo_podr->ADOQuery3->SQL->Clear();
		mo_podr->ADOQuery3->SQL->Add(Data);
		mo_podr->ADOQuery3->Active = True;
		if (TypeWokrOtdel == 0)
		{
			if (mo_podr->ADOQuery3->RecordCount != 0)
			{
				this->Edit4->Color = clRed;
			}
		}
		else
		{
			if (mo_podr->ADOQuery3->RecordCount == 1)
			{
				String DataLen = mo_podr->ADOQuery3->Fields->Fields[0]->FieldName;
				String ItogData = mo_podr->ADOQuery3->FieldByName(DataLen)->AsString;
				if (DataLen == "_id")
				{
					if (ItogData != mo_podr->ADOQuery2->Fields->Fields[0]->AsString)
					{
						this->Edit4->Color = clRed;
					}
				}
			}
			if (mo_podr->ADOQuery3->RecordCount > 1) this->Edit4->Color = clRed;
        }
	}
}
//---------------------------------------------------------------------------

void __fastcall Tmo_podr::Button7Click(TObject *Sender)
{
	if (this->Edit1->Color != clWindow)
	{
		HWND hWnd = GetForegroundWindow();
		MessageBoxA(hWnd, "Ошибка в заполнении названия подразделения.", "Внимание!", MB_OK);
		this->Edit1->SetFocus();
		Abort();
	}
	if (this->Edit3->Color != clWindow)
	{
		HWND hWnd = GetForegroundWindow();
		MessageBoxA(hWnd, "Ошибка в заполнении кода подразделения.", "Внимание!", MB_OK);
		this->Edit3->SetFocus();
		Abort();
	}

	String StatusWork;
	String SaveDate;

	if (this->CheckBox1->Checked) StatusWork = "NULL";
	else StatusWork = "'2000-01-01'";

	String id_doctors;
	if (this->ComboBox1->ItemIndex == -1) id_doctors = "NULL";
	else id_doctors = "'" + IntToStr(MasDoctorsPodr[this->ComboBox1->ItemIndex]) + "'";

	if (TypeWokrPodr == 1)
	{
		SaveDate = "UPDATE [SPRTER_LPU_1] SET 	\
						   [CODE]        = '" + this->Edit3->Text + "'" +
						 ",[NAME]        = '" + this->Edit1->Text + "'" +
						 ",[DATEBEG]     = '2000-01-01'" +
						 ",[DATEEND]     = " + StatusWork +
						 ",[_id_doctors] = " + id_doctors +
				  " WHERE  [_id]         = " + mo_podr->ADOQuery1->Fields->Fields[0]->AsString;
	}
	else
	{
    	SaveDate  = "INSERT INTO [SPRTER_LPU_1] ( [CODE],         \
                                                 [NAME],         \
                                                 [DATEBEG],      \
                                                 [DATEEND],      \
                                                 [_id_doctors])  \
                     OUTPUT INSERTED._id VALUES ('" + this->Edit3->Text  + "','"
                                                    + this->Edit1->Text  + "',"
                                                    + "'2000-01-01'"     + ","
                                                    + StatusWork         + ","
                                                    + id_doctors         + ")";
	}

	mo_podr->ADOQuery3->Active = False;
	mo_podr->ADOQuery3->SQL->Clear();
	mo_podr->ADOQuery3->SQL->Add(SaveDate);
	mo_podr->ADOQuery3->ExecSQL();

	mo_podr->ADOQuery1->Active = False;
	mo_podr->ADOQuery1->SQL->Clear();
	mo_podr->ADOQuery1->SQL->Add(Podrazdeleniya + DataSort_U7_Pod);
	mo_podr->ADOQuery1->Active = True;
	UpdateLen_Podrazdelenie();

}
//---------------------------------------------------------------------------

void __fastcall Tmo_podr::Button8Click(TObject *Sender)
{
	if (this->Edit2->Color != clWindow)
	{
		HWND hWnd = GetForegroundWindow();
		MessageBoxA(hWnd, "Ошибка в заполнении названия отделения.", "Внимание!", MB_OK);
		this->Edit2->SetFocus();
		Abort();
	}
	if (this->Edit4->Color != clWindow)
	{
		HWND hWnd = GetForegroundWindow();
		MessageBoxA(hWnd, "Ошибка в заполнении кода отделения.", "Внимание!", MB_OK);
		this->Edit4->SetFocus();
		Abort();
	}

	String StatusWork;
	String SaveDate;

	if (this->CheckBox2->Checked) StatusWork = "NULL";
	else StatusWork = "'2000-01-01'";

	String id_doctors;
	if (this->ComboBox2->ItemIndex == -1) id_doctors = "NULL";
	else id_doctors = "'" + IntToStr(MasDoctorsOtdel[this->ComboBox2->ItemIndex]) + "'";

	if (TypeWokrOtdel == 1)
	{
		SaveDate = "UPDATE [SPRTER_PODR] SET 	\
				 		   [CODE]        = '" + this->Edit4->Text + "'" +
						 ",[NAME]        = '" + this->Edit2->Text + "'" +
						 ",[DATEBEG]     = '2000-01-01'" +
						 ",[DATEEND]     = " + StatusWork +
						 ",[_id_doctors] = " + id_doctors +
				   " WHERE  [_id]         = " + mo_podr->ADOQuery2->Fields->Fields[0]->AsString;


	}
	else
	{
     	SaveDate  = "INSERT INTO [SPRTER_PODR] ([CODE],         \
                                                [NAME],         \
                                                [DATEBEG],      \
                                                [DATEEND],      \
                                                [_id_doctors])  \
                     OUTPUT INSERTED._id VALUES ('" + this->Edit4->Text  + "','"
                                                    + this->Edit2->Text  + "',"
                                                    + "'2000-01-01'"     + ","
                                                    + StatusWork         + ","
                                                    + id_doctors         + ")";
	}
	mo_podr->ADOQuery3->Active = False;
	mo_podr->ADOQuery3->SQL->Clear();
	mo_podr->ADOQuery3->SQL->Add(SaveDate);
	mo_podr->ADOQuery3->ExecSQL();

	mo_podr->ADOQuery2->Active = False;
	mo_podr->ADOQuery2->SQL->Clear();
	mo_podr->ADOQuery2->SQL->Add(Otdeleniya + DataSort_U7_Otd);
	mo_podr->ADOQuery2->Active = True;
	UpdateLen_Otdelenie();

}
//---------------------------------------------------------------------------

void __fastcall Tmo_podr::ComboBox1Change(TObject *Sender)
{
	if (this->ComboBox1->ItemIndex == -1) this->ComboBox1->Color = clMoneyGreen;
	else this->ComboBox1->Color = clWindow;
}
//---------------------------------------------------------------------------

void __fastcall Tmo_podr::ComboBox2Change(TObject *Sender)
{
	if (this->ComboBox2->ItemIndex == -1) this->ComboBox2->Color = clMoneyGreen;
	else this->ComboBox2->Color = clWindow;
}
//---------------------------------------------------------------------------

void __fastcall Tmo_podr::Button1Click(TObject *Sender)
{
	String SQL_DOCTERS = "SELECT  PODR 				\
						  FROM	  R_SLUCH			\
						  WHERE PODR = " + mo_podr->ADOQuery1->Fields->Fields[0]->AsString;

	mo_podr->ADOQuery3->Active = False;
	mo_podr->ADOQuery3->SQL->Clear();
    mo_podr->ADOQuery3->SQL->Add(SQL_DOCTERS);
	mo_podr->ADOQuery3->Active = True;

	if (mo_podr->ADOQuery3->RecordCount != 0)
	{
		HWND hWnd = GetForegroundWindow();
		MessageBoxA(hWnd, "Удаление подразделения невозможно \n т.к. используется в случаях.", "Внимание!", MB_OK);
		Abort();
	}

	SQL_DOCTERS = "SELECT  PODR 				\
				   FROM	  R_SLUCH_HMP		\
				   WHERE PODR = "  + mo_podr->ADOQuery1->Fields->Fields[0]->AsString;

	mo_podr->ADOQuery3->Active = False;
	mo_podr->ADOQuery3->SQL->Clear();
    mo_podr->ADOQuery3->SQL->Add(SQL_DOCTERS);
	mo_podr->ADOQuery3->Active = True;

	if (mo_podr->ADOQuery3->RecordCount != 0)
	{
		HWND hWnd = GetForegroundWindow();
		MessageBoxA(hWnd, "Удаление подразделения невозможно \n т.к. используется в случаях.", "Внимание!", MB_OK);
		Abort();
	}

	if (MessageBox(Application->Handle,
        L"Удаление подразделения!\n\n Действительно удалить подразделение?",
        L"Удаление",
        MB_ICONQUESTION | MB_YESNO)== IDYES)
	{
		SQL_DOCTERS = "DELETE FROM SPRTER_LPU_1 WHERE _id = " + mo_podr->ADOQuery1->Fields->Fields[0]->AsString;
		mo_podr->ADOQuery3->Active = False;
		mo_podr->ADOQuery3->SQL->Clear();
		mo_podr->ADOQuery3->SQL->Add(SQL_DOCTERS);
		mo_podr->ADOQuery3->ExecSQL();

		mo_podr->ADOQuery1->Active = False;
		mo_podr->ADOQuery1->SQL->Clear();
		mo_podr->ADOQuery1->SQL->Add(Podrazdeleniya + DataSort_U7_Pod);
		mo_podr->ADOQuery1->Active = True;
		UpdateLen_Podrazdelenie();
        this->DBGrid1CellClick(0);
	}
}
//---------------------------------------------------------------------------

void __fastcall Tmo_podr::Button6Click(TObject *Sender)
{
	String SQL_DOCTERS = "SELECT  LPU_1 				\
						  FROM	  R_SLUCH			\
						  WHERE LPU_1 = " + mo_podr->ADOQuery2->Fields->Fields[0]->AsString;

	mo_podr->ADOQuery3->Active = False;
	mo_podr->ADOQuery3->SQL->Clear();
    mo_podr->ADOQuery3->SQL->Add(SQL_DOCTERS);
	mo_podr->ADOQuery3->Active = True;

	if (mo_podr->ADOQuery3->RecordCount != 0)
	{
		HWND hWnd = GetForegroundWindow();
		MessageBoxA(hWnd, "Удаление отделения невозможно \n т.к. используется в случаях.", "Внимание!", MB_OK);
		Abort();
	}

	SQL_DOCTERS = "SELECT  LPU_1 				\
				   FROM	  R_SLUCH_HMP		\
				   WHERE LPU_1 = "  + mo_podr->ADOQuery2->Fields->Fields[0]->AsString;

	mo_podr->ADOQuery3->Active = False;
	mo_podr->ADOQuery3->SQL->Clear();
    mo_podr->ADOQuery3->SQL->Add(SQL_DOCTERS);
	mo_podr->ADOQuery3->Active = True;

	if (mo_podr->ADOQuery3->RecordCount != 0)
	{
		HWND hWnd = GetForegroundWindow();
		MessageBoxA(hWnd, "Удаление отделения невозможно \n т.к. используется в случаях.", "Внимание!", MB_OK);
		Abort();
	}

	if (MessageBox(Application->Handle,
        L"Удаление отделения!\n\n Действительно удалить отделение?",
		L"Удаление",
        MB_ICONQUESTION | MB_YESNO)== IDYES)
	{
		SQL_DOCTERS = "DELETE FROM SPRTER_LPU_1 WHERE _id = " + mo_podr->ADOQuery2->Fields->Fields[0]->AsString;
		mo_podr->ADOQuery3->Active = False;
		mo_podr->ADOQuery3->SQL->Clear();
		mo_podr->ADOQuery3->SQL->Add(SQL_DOCTERS);
		mo_podr->ADOQuery3->ExecSQL();

		mo_podr->ADOQuery2->Active = False;
		mo_podr->ADOQuery2->SQL->Clear();
		mo_podr->ADOQuery2->SQL->Add(Otdeleniya  + DataSort_U7_Otd);
		mo_podr->ADOQuery2->Active = True;
		UpdateLen_Otdelenie();
	}
}
//---------------------------------------------------------------------------

void __fastcall Tmo_podr::DBGrid1KeyUp(TObject *Sender, WORD &Key, TShiftState Shift)

{
	if ((Key == 9) || (Key == 38) || (Key == 40))
	{
		if (this->Panel4->Visible) DBGrid1CellClick(0);
	}
}

//---------------------------------------------------------------------------
void __fastcall Tmo_podr::DBGrid2KeyUp(TObject *Sender, WORD &Key, TShiftState Shift)

{
	if ((Key == 9) || (Key == 38) || (Key == 40))
	{
		if (this->Panel5->Visible) DBGrid2CellClick(0);
	}
}
//---------------------------------------------------------------------------

void __fastcall Tmo_podr::DBGrid1TitleClick(TColumn *Column)
{
	String Data = Column->FieldName;
	if (Data == "Код")
	{
		if (SostSort_U7_Pod == 1)
		{
			SostSort_U7_Pod = 2;
			DataSort_U7_Pod = "ORDER BY SPRTER_LPU_1.CODE DESC";
		}
        else
		{
			SostSort_U7_Pod = 1;
			DataSort_U7_Pod = "ORDER BY SPRTER_LPU_1.CODE ASC";
		}
	}

	if (Data == "Наименование")
	{
		if (SostSort_U7_Pod == 3)
		{
			SostSort_U7_Pod = 4;
			DataSort_U7_Pod = "ORDER BY SPRTER_LPU_1.NAME DESC";
		}
        else
		{
			SostSort_U7_Pod = 3;
			DataSort_U7_Pod = "ORDER BY SPRTER_LPU_1.NAME ASC";
		}
	}

	mo_podr->ADOQuery1->Active = False;
	mo_podr->ADOQuery1->SQL->Clear();
	mo_podr->ADOQuery1->SQL->Add(Podrazdeleniya + DataSort_U7_Pod);
	mo_podr->ADOQuery1->Active = True;
	UpdateLen_Podrazdelenie();
    this->DBGrid1CellClick(0);
}
//---------------------------------------------------------------------------

void __fastcall Tmo_podr::DBGrid2TitleClick(TColumn *Column)
{
	String Data = Column->FieldName;
	if (Data == "Код")
	{
		if (SostSort_U7_Otd == 1)
		{
			SostSort_U7_Otd= 2;
			DataSort_U7_Otd = "ORDER BY SPRTER_PODR.CODE DESC";
		}
        else
		{
			SostSort_U7_Otd = 1;
			DataSort_U7_Otd = "ORDER BY SPRTER_PODR.CODE ASC";
		}
	}

	if (Data == "Наименование")
	{
		if (SostSort_U7_Otd == 3)
		{
			SostSort_U7_Otd = 4;
			DataSort_U7_Otd = "ORDER BY SPRTER_PODR.NAME DESC";
		}
        else
		{
			SostSort_U7_Otd = 3;
			DataSort_U7_Otd = "ORDER BY SPRTER_PODR.NAME ASC";
		}
	}

	mo_podr->ADOQuery2->Active = False;
	mo_podr->ADOQuery2->SQL->Clear();
	mo_podr->ADOQuery2->SQL->Add(Otdeleniya + DataSort_U7_Otd);
	mo_podr->ADOQuery2->Active = True;
	UpdateLen_Otdelenie();
    this->DBGrid2CellClick(0);
}
//---------------------------------------------------------------------------

void __fastcall Tmo_podr::DBGrid1ColumnMoved(TObject *Sender, int FromIndex, int ToIndex)

{
	this->DBGrid1->Columns->Items[ToIndex]->Index = FromIndex;
}
//---------------------------------------------------------------------------

void __fastcall Tmo_podr::DBGrid2ColumnMoved(TObject *Sender, int FromIndex, int ToIndex)

{
	this->DBGrid2->Columns->Items[ToIndex]->Index = FromIndex;
}
//---------------------------------------------------------------------------

