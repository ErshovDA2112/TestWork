//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Spravochnik_TFOMS.h"
#include "Main.h"

#include "vector"
#include "Vcl.Imaging.pngimage.hpp"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
Tmo_lpu_1 *mo_lpu_1;
//F6 Fun_6;
//---------------------------------------------------------------------------
__fastcall Tmo_lpu_1::Tmo_lpu_1(TComponent* Owner)
    : TForm(Owner)
{
}

//---------------------------------------------------------------------------
void __fastcall Tmo_lpu_1::RefreshChecked()
{
   String DataInfo = " SELECT [tf_code]  as 'Код'              \
                        ,[name_tfk]      as 'Наименование ТФОМС' \
                        FROM [SPR_F001]                        \
                        where checked = 1";
    mo_lpu_1->ADOQuery2->Active = False;
    mo_lpu_1->ADOQuery2->SQL->Clear();
    mo_lpu_1->ADOQuery2->SQL->Add(DataInfo);
    mo_lpu_1->ADOQuery2->Active = True;
    mo_lpu_1->DBGrid1->Columns->Items[1]->Width = 380;
    mo_lpu_1->DBGrid2->Columns->Items[1]->Width = 560;
}

//---------------------------------------------------------------------------
void __fastcall Tmo_lpu_1::UpdateChecked(int checked)
{
    int NumberCode = mo_lpu_1->DBGrid1->DataSource->DataSet->Fields->Fields[0]->Value;
    String DopData = "";

    if(checked == 0) NumberCode = mo_lpu_1->DBGrid2->DataSource->DataSet->Fields->Fields[0]->Value;
    if (NumberCode < 10) DopData = "0";

	String InfoSchet = "UPDATE SPR_F001 SET 					\
						[checked] = " + IntToStr(checked) + " 	\
                        WHERE tf_code = '"+ DopData + IntToStr(NumberCode)+"'";

    mo_lpu_1->ADOQuery3->Active = False;
    mo_lpu_1->ADOQuery3->SQL->Clear();
    mo_lpu_1->ADOQuery3->SQL->Add(InfoSchet);
    mo_lpu_1->ADOQuery3->ExecSQL();
}

//---------------------------------------------------------------------------
void __fastcall Tmo_lpu_1::FormActivate(TObject *Sender)
{
    int i;
    String DataInfo = " SELECT [tf_code] as 'Код'              \
                        ,[name_tfk]      as 'Наименование ТФОМС' \
                        FROM [SPR_F001]";
    mo_lpu_1->ADOQuery1->Active = False;
    mo_lpu_1->ADOQuery1->SQL->Clear();
    mo_lpu_1->ADOQuery1->SQL->Add(DataInfo);
    mo_lpu_1->ADOQuery1->Active = True;

    mo_lpu_1->RefreshChecked();
//    mo_lpu_1->Resize(false);
}

//---------------------------------------------------------------------------
void __fastcall Tmo_lpu_1::Button3Click(TObject *Sender)
{
    mo_lpu_1->UpdateChecked(1);
    mo_lpu_1->RefreshChecked();
}

//---------------------------------------------------------------------------

void __fastcall Tmo_lpu_1::Button1Click(TObject *Sender)
{
    if (mo_lpu_1->ADOQuery2->RecordCount >= 1)
    {
        if (MessageBox(Application->Handle,
            L"Удаление ТФОМС. Вы уверены?",
            L"Удаление ТФОМС",
            MB_ICONQUESTION | MB_YESNO) == IDYES)
        {
           mo_lpu_1->UpdateChecked(0);
           mo_lpu_1->RefreshChecked();
        }
    }
}
//---------------------------------------------------------------------------
void __fastcall Tmo_lpu_1::Edit1Change(TObject *Sender)
{
    int LenData = mo_lpu_1->Edit1->GetTextLen();
	String  DataInfo = "SELECT [tf_code] as 'Код'             \
                        ,[name_tfk] as 'Наименование ТФОМС'   \
                        FROM [SPR_F001]";
    if (LenData > 0)
    {
        DataInfo = "SELECT [tf_code] as 'Код',[name_tfk] as 'Справочник ТФОМС' FROM [spr_f001] where (tf_code like '%" +
        mo_lpu_1->Edit1->Text+"%') or ([name_tfk] LIKE '%"+ TCharacter::ToUpper(mo_lpu_1->Edit1->Text)+"%')";
    }
    mo_lpu_1->ADOQuery1->Active = False;
    mo_lpu_1->ADOQuery1->SQL->Clear();
    mo_lpu_1->ADOQuery1->SQL->Add(DataInfo);
    mo_lpu_1->ADOQuery1->Active = True;
	mo_lpu_1->DBGrid1->Columns->Items[1]->Width = 380;
    mo_lpu_1->DBGrid2->Columns->Items[1]->Width = 560;
}
//---------------------------------------------------------------------------

void __fastcall Tmo_lpu_1::DBGrid2ColumnMoved(TObject *Sender, int FromIndex, int ToIndex)

{
	this->DBGrid2->Columns->Items[ToIndex]->Index = FromIndex;
}
//---------------------------------------------------------------------------

void __fastcall Tmo_lpu_1::DBGrid1ColumnMoved(TObject *Sender, int FromIndex, int ToIndex)

{
	this->DBGrid1->Columns->Items[ToIndex]->Index = FromIndex;
}
//---------------------------------------------------------------------------

