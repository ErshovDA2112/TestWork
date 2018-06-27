//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Unit5.h"
#include "Main.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TForm5 *Form5;

extern String Temp_NumberSMO;
int DataClose;
bool FlagEnter;

//---------------------------------------------------------------------------
__fastcall TForm5::TForm5(TComponent* Owner)
    : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TForm5::Button1Click(TObject *Sender)
{
	Temp_NumberSMO = this->DBGrid1->DataSource->DataSet->Fields->Fields[1]->Value;
	Form9->Label23->Caption = "СМО №: " + Temp_NumberSMO;
	Form9->Label33->Caption = "Реестровый номер СМО: " + this->DBGrid1->DataSource->DataSet->Fields->Fields[2]->Value;
	Form9->Label33->Font->Color = clWindowText;
	Form9->ComboBox3->SetFocus();
	DataClose = 1;
	Form5->Close();
}
//---------------------------------------------------------------------------
void __fastcall TForm5::FormActivate(TObject *Sender)
{
	FlagEnter = false;
	Temp_NumberSMO = "";
	DataClose = 0;
	Form5->Edit1->Text = "";
    Form5->Edit1->SetFocus();
	String Zapros_SMO = "SELECT row_number() over (order by smocod) as [№ ] \
                               ,smocod as [Код СМО]                         \
                               ,nam_smok as [Наименование]                  \
                         FROM SPR_F002";

    Form5->ADOQuery1->Active = False;
    Form5->ADOQuery1->SQL->Clear();
    Form5->ADOQuery1->SQL->Add(Zapros_SMO);
    Form5->ADOQuery1->Active = True;

    UpdateLen();
}

//---------------------------------------------------------------------------
void __fastcall TForm5::Edit1KeyUp(TObject *Sender, WORD &Key, TShiftState Shift)
{
	if (Key == 40)
	{
		this->DBGrid1->SetFocus();
	}
}

//---------------------------------------------------------------------------
void __fastcall TForm5::UpdateLen()
{
    String ItogData, DataLen;
    int i,j, Maxlen;

    if (Form5->ADOQuery1->RecordCount >= 1)
    {
        Form5->DBGrid1->Visible = false;
        Form5->ADOQuery1->Open();
		for (j = 0; j < Form5->ADOQuery1->FieldCount; j++)
        {

			DataLen = Form5->ADOQuery1->Fields->Fields[j]->FieldName;
            Maxlen = DataLen.Length();
            Form5->ADOQuery1->First();

            for (i = 0; !Form5->ADOQuery1->Eof; i++)
			{
                ItogData = Form5->ADOQuery1->FieldByName(DataLen)->AsString;
                if (ItogData.Length() > Maxlen) Maxlen = ItogData.Length();
                Form5->ADOQuery1->Next();
            }

			if (Maxlen == 0)
            {
                Form5->DBGrid1->Columns->Items[j]->Width = 12;
			}
            else
			{
				if (Maxlen > 88)
				{
					Form5->DBGrid1->Columns->Items[j]->Width = 88*7;
				}
				else Form5->DBGrid1->Columns->Items[j]->Width = Maxlen*7;
			}
        }
        Form5->ADOQuery1->First();
		Form5->DBGrid1->Visible = true;
	}

    if (Form5->ADOQuery1->RecordCount == 0)
	{
		Form5->DBGrid1->Visible = false;
	}
}

//---------------------------------------------------------------------------
void __fastcall TForm5::DBGrid1CellClick(TColumn *Column)
{
	Temp_NumberSMO = this->DBGrid1->DataSource->DataSet->Fields->Fields[1]->Value;
}
//---------------------------------------------------------------------------

void __fastcall TForm5::DBGrid1KeyUp(TObject *Sender, WORD &Key, TShiftState Shift)
{
	if (FlagEnter)
	{
		Key = 0;
        FlagEnter = false;

	}
	if (Key == '\r')
	{
		Form5->Button1Click(Button1);
    }
}
//---------------------------------------------------------------------------

void __fastcall TForm5::DBGrid1DblClick(TObject *Sender)
{
	Form5->Button1Click(Button1);
}
//---------------------------------------------------------------------------

void __fastcall TForm5::Edit1Change(TObject *Sender)
{
	String StrokaPoiska = Form5->Edit1->Text;
	String SQL_Pacient = "";
	String DataInfo = "";

	SQL_Pacient = "SELECT row_number() over (order by smocod) as [№ ] 	\
							   ,[smocod]   as [Код СМО]   			 	\
							   ,[nam_smok] as [Наименование]			\
						 FROM SPR_F002       ";

	if (StrokaPoiska.Length()> 0)
	{
	   DataInfo = "WHERE smocod LIKE '%" + StrokaPoiska + "%' OR nam_smok LIKE '%" + StrokaPoiska +"%'";
	}

		Form5->ADOQuery1->Active = False;
		Form5->ADOQuery1->SQL->Clear();
		Form5->ADOQuery1->SQL->Add(SQL_Pacient + DataInfo);
		Form5->ADOQuery1->Active = True;

	UpdateLen();
}
//---------------------------------------------------------------------------

void __fastcall TForm5::DBGrid1DrawColumnCell(TObject *Sender, const TRect &Rect,
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

void __fastcall TForm5::FormKeyPress(TObject *Sender, System::WideChar &Key)
{
	if (Key == '\x1B')
	{
		Key = 0;
        DataClose = 0;
		this->Close();
	}
}
//---------------------------------------------------------------------------
void __fastcall TForm5::FormClose(TObject *Sender, TCloseAction &Action)
{
	if (DataClose == 0)
	{
		Temp_NumberSMO = "";
	}
}
//---------------------------------------------------------------------------

void __fastcall TForm5::Edit1KeyPress(TObject *Sender, System::WideChar &Key)
{
	if (Key == '\r')
	{
		Key = 0;
		this->DBGrid1->SetFocus();
		FlagEnter = true;
        Abort();
	}
}
//---------------------------------------------------------------------------

