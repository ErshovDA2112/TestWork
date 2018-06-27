//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "RForm3.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "frxADOComponents"
#pragma link "frxClass"
#pragma resource "*.dfm"
TForm3 *Form3;

int MonthBegin;
int MonthEnd;
int YearBegin;
int YearEnd;

//---------------------------------------------------------------------------
__fastcall TForm3::TForm3(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TForm3::FormCreate(TObject *Sender)
{
	int i;
	while (this->ComboBox1->Items->Count > 0)  this->ComboBox1->Items->Delete(0);
	while (this->ComboBox2->Items->Count > 0)  this->ComboBox2->Items->Delete(0);
	while (this->ComboBox3->Items->Count > 0)  this->ComboBox3->Items->Delete(0);
	while (this->ComboBox4->Items->Count > 0)  this->ComboBox4->Items->Delete(0);

	MonthBegin = -1;
	MonthEnd = -1;
	YearBegin = -1;
	YearEnd	= -1;

 //rxADOComponents1(frxReport1.FindObject('ADODatabase1')).DatabaseName = "ITMed54";
//frxADOComponents1(frxReport1.FindObject('ADODatabase1')).DatabaseName = "ITMed54";

   TFormatSettings FormatSettings = FormatSettings.Create();
   for(i = 0; i < 12; i++)
    {
		if (i == 0)
			{
				this->ComboBox1->Items->Add("н/у");
				this->ComboBox3->Items->Add("н/у");
			}
		 //this->ComboBox1->Items->Add(FormatSettings.LongMonthNames[i]);
		 //this->ComboBox3->Items->Add(FormatSettings.LongMonthNames[i]);
		 this->ComboBox1->Items->Add(IntToStr(i + 1));
		 this->ComboBox3->Items->Add(IntToStr(i + 1));
    }
	this->ComboBox1->ItemIndex = 0;
	this->ComboBox3->ItemIndex = 0;

	for (i = 0; i < 5; i++ )
    {
        if (i == 0)
        {
			this->ComboBox2->Items->Add("н/у");
			this->ComboBox4->Items->Add("н/у");
		}

		this->ComboBox2->Items->Add(IntToStr(i + 2016));
		this->ComboBox4->Items->Add(IntToStr(i + 2016));

    }
	this->ComboBox2->ItemIndex = 3;
	this->ComboBox4->ItemIndex = 3;

}
//---------------------------------------------------------------------------
void __fastcall TForm3::Button1Click(TObject *Sender)
{
	frxReport1->LoadFromFile("c:\\123\\*.frx",1);

	frxReport1->Variables->Clear();
	//frxReport1->Variables->Variables[" var"] = Null;
	//frxReport1->Variables->Variables["schet"]=SchetForYarik;
//	frxReport1->Variables->Variables["@d1"]="'" + DateTimePicker1->DateTime.DateString()+ "'";
//	frxReport1->Variables->Variables["@d1"] = QuotedStr(DateTimePicker1->DateTime.DateString());

	frxReport1->ShowReport();
   //	ShowMessage("Запуск отчетности. В стадии разработки");
}
//---------------------------------------------------------------------------
void __fastcall TForm3::ComboBox1Change(TObject *Sender)
{
	if (this->ComboBox1->ItemIndex > 0)  MonthBegin = this->ComboBox1->ItemIndex;
	else MonthBegin = -1;

}
//---------------------------------------------------------------------------

void __fastcall TForm3::ComboBox2Change(TObject *Sender)
{
	if (this->ComboBox2->ItemIndex > 0)  YearBegin = this->ComboBox2->ItemIndex + 2015;
	else YearBegin = -1;
}
//---------------------------------------------------------------------------

void __fastcall TForm3::ComboBox3Change(TObject *Sender)
{
	if (this->ComboBox3->ItemIndex > 0)  MonthEnd = this->ComboBox3->ItemIndex;
	else MonthEnd = -1;
}
//---------------------------------------------------------------------------

void __fastcall TForm3::ComboBox4Change(TObject *Sender)
{
	if (this->ComboBox3->ItemIndex > 0)  YearEnd = this->ComboBox4->ItemIndex + 2015;
	else YearEnd = -1;
}
//---------------------------------------------------------------------------

