//---------------------------------------------------------------------------
//Новая запись
#include <vcl.h>
#pragma hdrstop

#include "InsertPassword.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TForm14 *Form14;


extern String TypeWorkUser;
extern String FullSpisokUser;
extern String SnilsWorking;

//---------------------------------------------------------------------------
__fastcall TForm14::TForm14(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TForm14::Button1Click(TObject *Sender)
{
	HWND hWnd = GetForegroundWindow();
	String DateInfo;

	String Zapros = FullSpisokUser + " WHERE USER_NAME = '" + this->Edit3->Text + "' AND PASSWORD = '" + this->Edit3->Text + "'";
	Form13->ADOQuery2->Active = False;
	Form13->ADOQuery2->SQL->Clear();
	Form13->ADOQuery2->SQL->Add(Zapros);
	Form13->ADOQuery2->Active = True;

	if (Form13->ADOQuery2->RecordCount == 1)
	{
		SnilsWorking = Form13->ADOQuery2->FieldByName(Form13->ADOQuery2->Fields->Fields[4]->FieldName)->AsString;
		TypeWorkUser = StrToInt(Form13->ADOQuery2->FieldByName(Form13->ADOQuery2->Fields->Fields[1]->FieldName)->AsString);

		Zapros = "SELECT CONCAT(  SPRTER_DOCTORS.FAM,\' \',                \
								  SPRTER_DOCTORS.IM, \' \',                \
								  SPRTER_DOCTORS.OT)        	 AS [Врач] \
				  FROM 	SPRTER_DOCTORS                                     \
				  WHERE SPRTER_DOCTORS.SNILS = '" + SnilsWorking + "'";

		Form13->ADOQuery2->Active = False;
		Form13->ADOQuery2->SQL->Clear();
		Form13->ADOQuery2->SQL->Add(Zapros);
		Form13->ADOQuery2->Active = True;
		if (Form13->ADOQuery2->RecordCount == 1)
		{
			DateInfo = Form13->ADOQuery2->FieldByName(Form13->ADOQuery2->Fields->Fields[0]->FieldName)->AsString;
		}

		String ID = "";
		String Simvol;
		for (int i = 0; i < SnilsWorking.Length(); i++)
		{
			Simvol = SnilsWorking.SubString(i + 1, 1);
			if (Simvol == " ") Simvol = ".";
			ID = ID + Simvol;
		}
		SnilsWorking = ID;

		char *MesData = AnsiString("Добро пожаловать! " + DateInfo).c_str();

		MessageBoxA(hWnd, MesData, "Внимание!", MB_OK);
		Close();
	}
	else
	{
		MessageBoxA(hWnd, "Логин или пароль неправильно введен !", "Внимание!", MB_OK);
	}
}
//---------------------------------------------------------------------------

void __fastcall TForm14::Edit3KeyPress(TObject *Sender, System::WideChar &Key)
{
	if (Key == '\r')
	{
		Key = 0;
		this->Edit4->SetFocus();
	}
}
//---------------------------------------------------------------------------

void __fastcall TForm14::Edit4KeyPress(TObject *Sender, System::WideChar &Key)
{
	if (Key == '\r')
	{
		Key = 0;
		this->Button1->SetFocus();
	}
}
//---------------------------------------------------------------------------

void __fastcall TForm14::FormActivate(TObject *Sender)
{
    this->Edit3->SetFocus();
}
//---------------------------------------------------------------------------

