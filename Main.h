
#ifndef ClassF1
#define ClassF1
#include "MainFormMO.h"
#include "Unit2.h"
#include "Schet_Edit.h"
#include "Select_MO.h"
#include "Unit5.h"
#include "Spravochnik_TFOMS.h"
#include "Otdelenie.h"
#include "VrachCreate.h"
#include "PersPacientCreate.h"
#include "Unit11.h"
#include "Otchet.h"
#include "SpisokUserCreate.h"
#include "InsertPassword.h"
#include "Otchet_0_9.h"
#include "Otchet_9_17.h"
#include "vector"
#include "RForm3.h"

using namespace std;

extern String YEAR;

class F1MyDBGrid : public TDBGrid {
	public:
	__property Row;
	__property DataLink;

};

class Main
{
    public:
    Main (){}

	void OpenSQL_Grid (String SQL_String)
    {
        mo_main->ADOQuery1->Active = False;
        mo_main->ADOQuery1->SQL->Clear();
        mo_main->ADOQuery1->SQL->Add(SQL_String);
        mo_main->ADOQuery1->Active = True;

        mo_main->DBGrid1->Columns->Items[0]->Visible = true;
    }

    void OpenSQL_Grid_Refresh ()
    {
        mo_main->ADOQuery1->Active = False;
		mo_main->ADOQuery1->Active = True;
    }

    void OpenSQL (String SQL_String)
    {
        mo_main->ADOQuery2->Active = False;
        mo_main->ADOQuery2->SQL->Clear();
        mo_main->ADOQuery2->SQL->Add(SQL_String);
        mo_main->ADOQuery2->Active = True;
    }

    void InsernSQL (String SQLString)
    {
        mo_main->ADOQuery2->Active = False;
        mo_main->ADOQuery2->SQL->Clear();
        mo_main->ADOQuery2->SQL->Add(SQLString);
        mo_main->ADOQuery2->ExecSQL();
    }

    void DeleteLineSQL (String SQLString, int id)
    {
        //id_up = mo_main->DBGrid1->DataSource->DataSet->Fields->Fields[0]->Value;
        InsernSQL(SQLString+IntToStr(id));
        OpenSQL_Grid_Refresh();
        Refresh_Button();
    }


    void Refresh_Button ()
    {
        OpenSQL("SELECT DISTINCT [MONTH] FROM [R_SCHET] WHERE [YEAR] = "+YEAR+" ORDER BY [MONTH] DESC");
        mo_main->ADOQuery2->First();
        int ic;
        for (int i = 12; i!=0; i--)
        {
            ic = 0;
            for (ic; ic < mo_main->ComponentCount; ic++)
            {
                if (mo_main->Components[ic]->Name == ("MyButton" + IntToStr(i)))
                {
		                if (((TButton *)(mo_main->Components[ic]))->Caption == mo_main->ADOQuery2->FieldByName("MONTH")->AsString)
					{
		                    ((TButton *)(mo_main->Components[ic]))->Enabled = True;
		                    mo_main->ADOQuery2->Next();
		                }
		                else
		                {
		                    ((TButton *)(mo_main->Components[ic]))->Enabled = False;
		                }
		            }
            }
        }
    }

    void QuickSearch_F4(String SQLString, String SQLRequired, String FComponents, int FComponentsNumber)
    {
        OpenSQL(SQLString);
        int i = 0;
        for (i; i < mo_select_mo->ComponentCount; i++)
        {
            if (mo_select_mo->Components[i]->Name == (FComponents + IntToStr(FComponentsNumber))) break;
        }

        ((TComboBox *)(mo_select_mo->Components[i]))->Items->Clear();
        for (mo_main->ADOQuery2->First(); !mo_main->ADOQuery2->Eof; mo_main->ADOQuery2->Next())
        {
            ((TComboBox *)(mo_select_mo->Components[i]))->Items->Add(mo_main->ADOQuery2->FieldByName(SQLRequired)->AsString);
        }
    }

    String FindOneRow (String SQLString, String SQLRequired)
    {
        OpenSQL(SQLString);
        if (mo_main->ADOQuery2->RecordCount == 1)
        {
            return(mo_main->ADOQuery2->FieldByName(SQLRequired)->AsString);
        }
        else
        {
          return("Неправильное значение или информация отсутствует.");
        }
    }

    String FindOneRowNotNull (String SQLString, String SQLRequired)
    {
        OpenSQL(SQLString);
        if (mo_main->ADOQuery2->RecordCount == 1)
        {
            return(mo_main->ADOQuery2->FieldByName(SQLRequired)->AsString);
        }
        else
        {
            return("0");
        }
    }

    String SetInt(String FullName)
    {
        String temp ="";
        for (int i = 1; i <= FullName.Length(); i++)
        {
            if ((FullName[i]>='0'&& FullName[i]<='9')||FullName[i]=='.')
            {
                temp += FullName[i];
            }
            if (FullName[i]==' ') break;
        }
        return (temp);
    }

    String IfString(String temp)
    {
        if (temp.SubString(0,1)!="'") temp = "'"+temp+"'";
    return(temp);
    }

	private:

};

class F3:public Main
{
    public:
    F3 (){}

    void QuickSearch_F3(String SQLString, String SQLRequired, String FComponents, int FComponentsNumber)
    {
        OpenSQL(SQLString);
        int i = 0;
        for (i; i < mo_schet->ComponentCount; i++)
        {
            if (mo_schet->Components[i]->Name == (FComponents + IntToStr(FComponentsNumber))) break;
        }

        ((TComboBox *)(mo_schet->Components[i]))->Items->Clear();
        for (mo_main->ADOQuery2->First(); !mo_main->ADOQuery2->Eof; mo_main->ADOQuery2->Next())
            {
                ((TComboBox *)(mo_schet->Components[i]))->Items->Add(mo_main->ADOQuery2->FieldByName(SQLRequired)->AsString);
            }
    }

    private:

};

class F6 : public Main
{
    public:
	  F6(){}
};

class F7 : public Main
{
    public:
	  F7(){}
};

class F8 : public Main
{
    public:
	  F8(){}

    void F8Ed_ENABLE(bool en)
    {
        mo_doctors->Label1->Enabled = en;
        mo_doctors->Label2->Enabled = en;
        mo_doctors->Label3->Enabled = en;
        mo_doctors->Label4->Enabled = en;
        mo_doctors->Label5->Enabled = en;
        mo_doctors->Label6->Enabled = en;
 //       mo_doctors->Label7->Enabled = en;
        mo_doctors->Label8->Enabled = en;
        mo_doctors->Label9->Enabled = en;
        mo_doctors->Label10->Enabled = en;
        mo_doctors->Label11->Enabled = en;
//        mo_doctors->Label12->Enabled = en;
        mo_doctors->Label13->Enabled = en;
        mo_doctors->Label14->Enabled = en;
        mo_doctors->Edit1->Enabled = en;
        mo_doctors->Edit2->Enabled = en;
        mo_doctors->Edit3->Enabled = en;
        mo_doctors->Edit4->Enabled = en;
        mo_doctors->Edit5->Enabled = en;
 //       mo_doctors->Edit6->Enabled = en;
//        mo_doctors->Edit7->Enabled = en;
        mo_doctors->Edit8->Enabled = en;
        mo_doctors->Edit9->Enabled = en;
        mo_doctors->Button1->Enabled = en;
        mo_doctors->Button2->Enabled = en;
        mo_doctors->DateTimePicker1->Enabled = en;
 //       mo_doctors->DateTimePicker2->Enabled = en;
    }

    void F8SizeColumsGrid2()
    {
        if (mo_doctors->ADOQuery2->Active == true )
        {
            /*ID*/ 			  //case 0: mo_main->DBGrid1->Columns->Items[0]->Width = 50;
            /*ФИО Врача*/
            mo_doctors->DBGrid2->Columns->Items[1]->Width = (mo_doctors->DBGrid2->Width - 20) / 5 ;
            /*Специальность*/
            mo_doctors->DBGrid2->Columns->Items[2]->Width = (mo_doctors->DBGrid2->Width - 20) / 5 ;
            /*Дата нач*/
            mo_doctors->DBGrid2->Columns->Items[3]->Width = (mo_doctors->DBGrid2->Width - 20) / 5 ;
            /*ДАта око*/
            mo_doctors->DBGrid2->Columns->Items[4]->Width = (mo_doctors->DBGrid2->Width - 20) / 5 ;
            /*Комментарий*/
            mo_doctors->DBGrid2->Columns->Items[5]->Width = (mo_doctors->DBGrid2->Width - 20) / 5 - 10;
        }
    }

    void F8OpenSQL_Grid (String SQL_String)
    {
        mo_doctors->ADOQuery1->Active = False;
        mo_doctors->ADOQuery1->SQL->Clear();
        mo_doctors->ADOQuery1->SQL->Add(SQL_String);
        mo_doctors->ADOQuery1->Active = True;
        mo_doctors->DBGrid1->Align = (TAlign)taLeftJustify;

        for (int i = 0; i < mo_doctors->DBGrid1->Columns->Count; i++)
        {
            mo_doctors->DBGrid1->Columns->Items[i]->Alignment = taLeftJustify;
        }

        mo_doctors->DBGrid1->Columns->Items[0]->Visible = false;
    }

    void F8OpenSQL_Grid_Refresh ()
    {
        mo_doctors->ADOQuery1->Active = False;
        mo_doctors->ADOQuery1->Active = True;
        mo_doctors->DBGrid1->Align = (TAlign)taLeftJustify;
        for (int i = 0; i < mo_doctors->DBGrid1->Columns->Count; i++)
        {
            mo_doctors->DBGrid1->Columns->Items[i]->Alignment = taLeftJustify;
        }
        mo_doctors->DBGrid1->Columns->Items[0]->Visible = false;

        //try
        //{
              //mo_main->DBGrid1->DataSource->DataSet->GotoBookmark(BM.Bookmark_zap);
        //} catch(const Exception& e){/*ShowMessage("Ошибка");*/}

        //Menu1Enable(/*String id*/);
    }

    void F8OpenSQL_Grid2 (String SQL_String)
    {
        mo_doctors->ADOQuery2->Active = False;
        mo_doctors->ADOQuery2->SQL->Clear();
        mo_doctors->ADOQuery2->SQL->Add(SQL_String);
        mo_doctors->ADOQuery2->Active = True;
        mo_doctors->DBGrid2->Align = (TAlign)taLeftJustify;

        for (int i = 0; i < mo_doctors->DBGrid2->Columns->Count; i++)
        {
            mo_doctors->DBGrid2->Columns->Items[i]->Alignment = taLeftJustify;
        }

        mo_doctors->DBGrid2->Columns->Items[0]->Visible = false;
        F8SizeColumsGrid2();
    }

    void F8OpenSQL_Grid2_Refresh ()
    {
        mo_doctors->ADOQuery2->Active = False;
        mo_doctors->ADOQuery2->Active = True;
        F8SizeColumsGrid2();
        mo_doctors->DBGrid2->Align = (TAlign)taLeftJustify;
        for (int i = 0; i < mo_doctors->DBGrid2->Columns->Count; i++)
        {
            mo_doctors->DBGrid2->Columns->Items[i]->Alignment = taLeftJustify;
        }
        mo_doctors->DBGrid2->Columns->Items[0]->Visible = false;

        //try
        //{
            //mo_main->DBGrid1->DataSource->DataSet->GotoBookmark(BM.Bookmark_zap);
        //} catch(const Exception& e){/*ShowMessage("Ошибка");*/}

        //Menu1Enable(/*String id*/);
    }

    void F8Clear()
    {
        mo_doctors->Edit1->Text = "";
        mo_doctors->Edit2->Text = "";
        mo_doctors->Edit3->Text = "";
        mo_doctors->Edit4->Text = "";
        mo_doctors->Edit5->Text = "";
 //       mo_doctors->Edit6->Text = "";
 //       mo_doctors->Edit7->Text = "";
        mo_doctors->Edit8->Text = "";
        mo_doctors->Edit9->Text = "";
        mo_doctors->ComboBox1->Text = "";
        mo_doctors->DateTimePicker1->Checked = false;
 //       mo_doctors->DateTimePicker2->Checked = false;
    }

    void F8Lic_visible (bool vis)
    {
        mo_doctors->Label9->Visible = vis;
        mo_doctors->Label10->Visible = vis;
        mo_doctors->Label11->Visible = vis;
 //       mo_doctors->Label12->Visible = vis;
        mo_doctors->Label14->Visible = vis;
        mo_doctors->Edit9->Visible = vis;
        mo_doctors->ComboBox1->Visible = vis;
        mo_doctors->DateTimePicker1->Visible = vis;
 //       mo_doctors->DateTimePicker2->Visible = vis;
        mo_doctors->Button2->Visible = vis;
        mo_doctors->DBGrid2->Visible = vis;

        /*
        if (vis == true)
        {
            mo_doctors->Button1->Visible = false;
        }
        else
        {
            mo_doctors->Button1->Visible = true;
        }
        */
    }

    void F8QuickSearch(String SQLString, String SQLRequired, String FComponents, int FComponentsNumber)
    {
        OpenSQL(SQLString);
        int i = 0;
        for (i; i < mo_doctors->ComponentCount; i++)
        {
            if (mo_doctors->Components[i]->Name == (FComponents + IntToStr(FComponentsNumber))) break;
        }

        ((TComboBox *)(mo_doctors->Components[i]))->Items->Clear();
        for (mo_main->ADOQuery2->First(); !mo_main->ADOQuery2->Eof; mo_main->ADOQuery2->Next())
        {
            ((TComboBox *)(mo_doctors->Components[i]))->Items->Add(mo_main->ADOQuery2->FieldByName(SQLRequired)->AsString);
        }
    }

    void F8_DeleteDOCTORS (String SQLString, int id)
    {
        InsernSQL(SQLString+IntToStr(id));
        F8OpenSQL_Grid_Refresh();
    }

    void F8_DeleteDOCTSER (String SQLString, int id)
    {
        InsernSQL(SQLString+IntToStr(id));
        F8OpenSQL_Grid2_Refresh();
    }

};

extern int NumL;
extern vector<TLabel *> Label_OKATO;

class F10 : public Main
{
 	public:

 	F10 (){}

 	void Free_OKATO ()
 	{
	  	for (int i = 0; i < NumL; i++)
	  	{
	   		delete Label_OKATO[i];
	   		Label_OKATO.pop_back();
	  	}
	}
};

#endif

