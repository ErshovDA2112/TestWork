//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Unit11.h"
#include "Main.h"

#include "vector"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TForm11 *Form11;
F10 Fun11;                             //Создание обьекта класса F10

extern StyleF Prodject_Style;        //структура оформлени компонентов
String ind_Button_OKATO = "";        //Индификатор нажатой кнопки
int NumL0 = 0;                        //номер компонента label
int NumL0L = 0;                       //номер компонента label
int NumL0C = 0;                       //номер компонента label
vector<TLabel *> Label_OKATO;        //масив из label
vector<TLabel *> Label_OKATO_PATCH;  //масив из label
vector<TLabel *> Label_OKATO_ORHER;  //масив из label
const int LTop = 10;                 //отступ между строками
int CloseType;
String My_OKATO;

//---------------------------------------------------------------------------
__fastcall TForm11::TForm11(TComponent* Owner)
    : TForm(Owner)
{
}

//---------------------------------------------------------------------------
void __fastcall TForm11::LabelOKATOMOUSEENTER(TObject *Sender)
{
    ((TLabel*)Sender)->Font->Color = Prodject_Style.Color_Select_Line;
    ((TLabel*)Sender)->Font->Style = TFontStyles() << fsBold << fsUnderline;
}

//---------------------------------------------------------------------------
void __fastcall TForm11::LabelOKATOMOUSELEAVE(TObject *Sender)
{
    ((TLabel*)Sender)->Font->Color = clWindowText;
    ((TLabel*)Sender)->Font->Style = TFontStyles() << fsBold;
}
//---------------------------------------------------------------------------

void __fastcall TForm11::LabelOKATOMOUSEENTER2(TObject *Sender)
{
    ((TLabel*)Sender)->Font->Color = Prodject_Style.Color_Select_Line;
    ((TLabel*)Sender)->Font->Style = TFontStyles() << fsUnderline;
}

//---------------------------------------------------------------------------
void __fastcall TForm11::LabelOKATOMOUSELEAVE2(TObject *Sender)
{
    ((TLabel*)Sender)->Font->Color = clWindowText;
    ((TLabel*)Sender)->Font->Style = TFontStyles() >> fsUnderline;
}

//---------------------------------------------------------------------------
void __fastcall TForm11::LabelOKATOCLICK2(TObject *Sender)
{
    String FullName = ((TLabel*)Sender)->Name;
    String temp ="";
    for (int i = 1; i <= FullName.Length(); i++)
    {
        if ((FullName[i]>='0'&& FullName[i]<='9')||FullName[i]=='.')
        {
            temp += FullName[i];
        }
        if (FullName[i]==' ') break;
    }

    int Select_NumL0C = StrToInt(temp);
    int END_NumL0C = Select_NumL0C+1;
    if ((Select_NumL0C >= 0)&&(Select_NumL0C != NumL0C))
    {
        Select_NumL0C++;
        for (Select_NumL0C ; Select_NumL0C < NumL0C; Select_NumL0C++)
        {
            delete Label_OKATO_PATCH[Select_NumL0C];
            Label_OKATO_PATCH.pop_back();
        }
        NumL0C = END_NumL0C;
    }

    String OKATO = Fun11.SetInt(((TLabel*)Sender)->Caption);

    String SQL_String = "SELECT CONCAT(CODE,' ',NAME) OKATO, ADDITIONAL_INFO FROM [SPR_OKATO] WHERE PARENT_CODE = '"+Fun11.SetInt(((TLabel*)Sender)->Caption)+"' ORDER BY CODE";

    Form11->ADOQuery1->Active = False;
    Form11->ADOQuery1->SQL->Clear();
    Form11->ADOQuery1->SQL->Add(SQL_String);
    Form11->ADOQuery1->Active = True;

    //Fun11.openSQL("SELECT CONCAT(CODE,' ',NAME) OKATO, ADDITIONAL_INFO FROM [SPR_OKATO] WHERE PARENT_CODE = '"+Fun11.SetInt(((TLabel*)Sender)->Caption)+"' ORDER BY CODE");
    if (Form11->ADOQuery1->RecordCount > 0)
    {
        this->Button3->Visible = false;
    }

    for (int i = 0; i < NumL0; i++)
    {
        delete Label_OKATO[i];
        Label_OKATO.pop_back();
    }
    NumL0 = 0;

    for (int i = 0; i < NumL0L; i++)
    {
        delete Label_OKATO_ORHER[i];
        Label_OKATO_ORHER.pop_back();
    }

    NumL0L = 0;

    Form11->ADOQuery1->First();
    for (NumL0 = 0; !Form11->ADOQuery1->Eof; NumL0++)
    {
        Label_OKATO.push_back(new TLabel(Form11));
        Label_OKATO[NumL0]->Parent = Form11->ScrollBox1;
        Label_OKATO[NumL0]->Caption = Form11->ADOQuery1->FieldByName("OKATO")->AsString;
        Label_OKATO[NumL0]->Left = 20;
        Label_OKATO[NumL0]->Name = "Label_OKATO"+IntToStr(NumL0);
        if (NumL0 == 0)
        {
            Label_OKATO[NumL0]->Top = 10; //(NumL0*20)+10;
        }
        else
        {
            Label_OKATO[NumL0]->Top = Label_OKATO[NumL0-1]->Top + Label_OKATO[NumL0-1]->Height + LTop;
        }

        Label_OKATO[NumL0]->Font->Size = 10;
        Label_OKATO[NumL0]->WordWrap = true;
        Label_OKATO[NumL0]->Width = Form11->Panel2->Width * 0.48;
        /*Label_OKATO[NumL0]->Top = (NumL0*20)+10;
        Label_OKATO[NumL0]->Font->Size = 10;*/
        Label_OKATO[NumL0]->Font->Style = TFontStyles() << fsBold /*<< fsItalic*/;
        Label_OKATO[NumL0]->OnClick = LabelOKATOCLICK;
        Label_OKATO[NumL0]->OnMouseEnter = LabelOKATOMOUSEENTER;
        Label_OKATO[NumL0]->OnMouseLeave = LabelOKATOMOUSELEAVE;

        Label_OKATO_ORHER.push_back(new TLabel(Form11));
        Label_OKATO_ORHER[NumL0L]->Parent = Form11->ScrollBox1;
        if (Form11->ADOQuery1->FieldByName("ADDITIONAL_INFO")->AsString !="") {
        Label_OKATO_ORHER[NumL0L]->Caption = Form11->ADOQuery1->FieldByName("ADDITIONAL_INFO")->AsString;
    }
    else
    {
        Label_OKATO_ORHER[NumL0L]->Caption = " ";
    }
    Label_OKATO_ORHER[NumL0L]->Left =  Form11->Panel2->Width * 0.58;
    Label_OKATO_ORHER[NumL0L]->Name = "Label_OKATO_ORHER"+IntToStr(NumL0L);
    Label_OKATO_ORHER[NumL0L]->Top = Label_OKATO[NumL0]->Top;
    Label_OKATO_ORHER[NumL0L]->Font->Size = 10;
    Label_OKATO_ORHER[NumL0L]->Font->Style = TFontStyles() << fsBold /*<< fsItalic*/;
    Label_OKATO_ORHER[NumL0L]->OnClick = LabelOKATOCLICK;
    Label_OKATO_ORHER[NumL0L]->OnMouseEnter = LabelOKATOMOUSEENTER;
    Label_OKATO_ORHER[NumL0L]->OnMouseLeave = LabelOKATOMOUSELEAVE;
    NumL0L++;
    Form11->ADOQuery1->Next();
    }
 //ShowMessage("NumL0C = " + IntToStr(NumL0C));
}

//---------------------------------------------------------------------------
void __fastcall TForm11::LabelOKATOCLICK(TObject *Sender)
{
    String NAME, OKATO;
    if (Fun11.SetInt(((TLabel*)Sender)->Caption) != "")
	{
		NAME = ((TLabel*)Sender)->Caption;
		OKATO = Fun11.SetInt(((TLabel*)Sender)->Caption);
	}
	else
	{
        NAME = Label_OKATO[StrToInt(Fun11.SetInt(((TLabel*)Sender)->Name))]->Caption;
		OKATO = Fun11.SetInt(Label_OKATO[StrToInt(Fun11.SetInt(((TLabel*)Sender)->Name))]->Caption);
	}

	String SQL_String ="SELECT CONCAT(CODE,' ',NAME) OKATO,                 \
                               ADDITIONAL_INFO                              \
                        FROM [SPR_OKATO]                                    \
						WHERE PARENT_CODE = '" + OKATO + "' ORDER BY CODE";

	Form11->ADOQuery1->Active = False;
	Form11->ADOQuery1->SQL->Clear();
    Form11->ADOQuery1->SQL->Add(SQL_String);
	Form11->ADOQuery1->Active = True;

    if (Form11->ADOQuery1->RecordCount == 0)
	{
		My_OKATO = OKATO;
		this->Button3->Visible = true;
    }

    for (int i = 0; i < NumL0; i++)
    {
        delete Label_OKATO[i];
        Label_OKATO.pop_back();
    }
    NumL0 = 0;
    for (int i = 0; i < NumL0L; i++)
    {
        delete Label_OKATO_ORHER[i];
        Label_OKATO_ORHER.pop_back();
    }
    NumL0L = 0;

    Form11->ADOQuery1->First();
    for (NumL0 = 0; !Form11->ADOQuery1->Eof; NumL0++)
    {
        Label_OKATO.push_back(new TLabel(Form11));
        Label_OKATO[NumL0]->Parent = Form11->ScrollBox1;
        Label_OKATO[NumL0]->Caption = Form11->ADOQuery1->FieldByName("OKATO")->AsString;
        Label_OKATO[NumL0]->Left = 20;
        Label_OKATO[NumL0]->Name = "Label_OKATO"+IntToStr(NumL0);
        if (NumL0 == 0)
        {
            Label_OKATO[NumL0]->Top = 10; //(NumL0*20)+10;
        }
        else
        {
            Label_OKATO[NumL0]->Top = Label_OKATO[NumL0-1]->Top + Label_OKATO[NumL0-1]->Height + LTop;
        }
        Label_OKATO[NumL0]->Font->Size = 10;
        Label_OKATO[NumL0]->WordWrap = true;
        Label_OKATO[NumL0]->Width = Form11->Panel2->Width * 0.48;
        Label_OKATO[NumL0]->Font->Style = TFontStyles() << fsBold /*<< fsItalic*/;
        Label_OKATO[NumL0]->OnClick = LabelOKATOCLICK;
        Label_OKATO[NumL0]->OnMouseEnter = LabelOKATOMOUSEENTER;
        Label_OKATO[NumL0]->OnMouseLeave = LabelOKATOMOUSELEAVE;

        Label_OKATO_ORHER.push_back(new TLabel(Form11));
        Label_OKATO_ORHER[NumL0L]->Parent = Form11->ScrollBox1;
        if (Form11->ADOQuery1->FieldByName("ADDITIONAL_INFO")->AsString !="")
        {
            Label_OKATO_ORHER[NumL0L]->Caption = Form11->ADOQuery1->FieldByName("ADDITIONAL_INFO")->AsString;
        }
        else
        {
            Label_OKATO_ORHER[NumL0L]->Caption = " ";
        }
        Label_OKATO_ORHER[NumL0L]->Left =  Form11->Panel2->Width * 0.58;
        Label_OKATO_ORHER[NumL0L]->Name = "Label_OKATO_ORHER"+IntToStr(NumL0L);
        Label_OKATO_ORHER[NumL0L]->Top = Label_OKATO[NumL0]->Top;
        Label_OKATO_ORHER[NumL0L]->Font->Size = 10;
        Label_OKATO_ORHER[NumL0L]->Font->Style = TFontStyles() << fsBold /*<< fsItalic*/;
        Label_OKATO_ORHER[NumL0L]->OnClick = LabelOKATOCLICK;
        Label_OKATO_ORHER[NumL0L]->OnMouseEnter = LabelOKATOMOUSEENTER;
        Label_OKATO_ORHER[NumL0L]->OnMouseLeave = LabelOKATOMOUSELEAVE;
        NumL0L++;
        Form11->ADOQuery1->Next();
    }

    Label_OKATO_PATCH.push_back(new TLabel(Form11));
    Label_OKATO_PATCH[NumL0C]->Parent = Form11->Panel2;
    Label_OKATO_PATCH[NumL0C]->Caption = NAME;
    Label_OKATO_PATCH[NumL0C]->Font->Size = 8;
    Label_OKATO_PATCH[NumL0C]->Width = Form11->Panel2->Width * 0.21;
    Label_OKATO_PATCH[NumL0C]->WordWrap = true;
    if (NumL0C == 0)
        Label_OKATO_PATCH[NumL0C]->Left = 10;
    else
        Label_OKATO_PATCH[NumL0C]->Left = Label_OKATO_PATCH[NumL0C-1]->Left + Label_OKATO_PATCH[NumL0C-1]->Width +7;

    Label_OKATO_PATCH[NumL0C]->Name = "Label_OKATO_PATCH"+IntToStr(NumL0C);
    Label_OKATO_PATCH[NumL0C]->Top = 10;
    Label_OKATO_PATCH[NumL0C]->OnClick = LabelOKATOCLICK2;
    Label_OKATO_PATCH[NumL0C]->OnMouseEnter = LabelOKATOMOUSEENTER2;
    Label_OKATO_PATCH[NumL0C]->OnMouseLeave = LabelOKATOMOUSELEAVE2;
    NumL0C++;
 //ShowMessage("NumL0C = " + IntToStr(NumL0C));
}

//---------------------------------------------------------------------------
void __fastcall TForm11::ZagruzkaData()
{
    String SQL_OKATO = "SELECT TOP 100 row_number() over (order by CODE)        AS [№ ]         \
                                      ,CODE                                     AS [Код]        \
                                      ,NAME + ' ' + isnull(ADDITIONAL_INFO, '') AS [Название]   \
                        FROM SPR_OKATO                                                          \
                        WHERE checked = 1";

    Form11->ADOQuery2->Active = False;
    Form11->ADOQuery2->SQL->Clear();
    Form11->ADOQuery2->SQL->Add(SQL_OKATO);
    Form11->ADOQuery2->Active = True;
}

//---------------------------------------------------------------------------
void __fastcall TForm11::FormActivate(TObject *Sender)
{
    this->Button3->Visible = false;
    CloseType = 0;
    Form11->Edit1->Text = "";

    ZagruzkaData();
    UpdateLen_Form11();
    Form11->Edit1->SetFocus();

    String SQL_String ="SELECT CONCAT(CODE,' ',NAME) OKATO, ADDITIONAL_INFO FROM [SPR_OKATO] WHERE PARENT_CODE IS NULL ORDER BY CODE";

    Form11->ADOQuery1->Active = False;
    Form11->ADOQuery1->SQL->Clear();
    Form11->ADOQuery1->SQL->Add(SQL_String);
    Form11->ADOQuery1->Active = True;

    for (int i = 0; i < NumL0C; i++)
    {
        delete Label_OKATO_PATCH[i];
        Label_OKATO_PATCH.pop_back();
    }
    NumL0C = 0;

    for (int i = 0; i < NumL0; i++)
    {
        delete Label_OKATO[i];
        Label_OKATO.pop_back();
    }
    NumL0 = 0;

    for (int i = 0; i < NumL0L; i++)
    {
        delete Label_OKATO_ORHER[i];
        Label_OKATO_ORHER.pop_back();
    }
    NumL0L = 0;


    Form11->ADOQuery1->First();
    for (NumL0 = 0; !Form11->ADOQuery1->Eof; NumL0++)
    {
        Label_OKATO.push_back(new TLabel(Form11));
        Label_OKATO[NumL0]->Parent = Form11->ScrollBox1;
        Label_OKATO[NumL0]->Caption = Form11->ADOQuery1->FieldByName("OKATO")->AsString;
        Label_OKATO[NumL0]->Left = 20;
        Label_OKATO[NumL0]->Name = "Label_OKATO"+IntToStr(NumL0);
        if (NumL0 == 0)
        {
            Label_OKATO[NumL0]->Top = 10; //(NumL0*20)+10;
        }
        else
        {
            Label_OKATO[NumL0]->Top = Label_OKATO[NumL0-1]->Top + Label_OKATO[NumL0-1]->Height + LTop;
        }
        Label_OKATO[NumL0]->Font->Size = 10;
        Label_OKATO[NumL0]->WordWrap = true;
        Label_OKATO[NumL0]->Width = Form11->Panel2->Width * 0.48;
        Label_OKATO[NumL0]->Font->Style = TFontStyles() << fsBold ;
        Label_OKATO[NumL0]->OnClick = LabelOKATOCLICK;
        Label_OKATO[NumL0]->OnMouseEnter = LabelOKATOMOUSEENTER;
        Label_OKATO[NumL0]->OnMouseLeave = LabelOKATOMOUSELEAVE;

        Label_OKATO_ORHER.push_back(new TLabel(Form11));
        Label_OKATO_ORHER[NumL0L]->Parent = Form11->ScrollBox1;
        if (Form11->ADOQuery1->FieldByName("ADDITIONAL_INFO")->AsString !="")
        {
            Label_OKATO_ORHER[NumL0L]->Caption = Form11->ADOQuery1->FieldByName("ADDITIONAL_INFO")->AsString;
        }
        else
        {
            Label_OKATO_ORHER[NumL0L]->Caption = " ";
        }
        Label_OKATO_ORHER[NumL0L]->Left =  Form11->Panel2->Width * 0.58;
        Label_OKATO_ORHER[NumL0L]->Name = "Label_OKATO_ORHER"+IntToStr(NumL0L);
        Label_OKATO_ORHER[NumL0L]->Top = Label_OKATO[NumL0]->Top;
        Label_OKATO_ORHER[NumL0L]->Font->Size = 10;
        Label_OKATO_ORHER[NumL0L]->Font->Style = TFontStyles() << fsBold ;
        Label_OKATO_ORHER[NumL0L]->OnClick = LabelOKATOCLICK;
        Label_OKATO_ORHER[NumL0L]->OnMouseEnter = LabelOKATOMOUSEENTER;
        Label_OKATO_ORHER[NumL0L]->OnMouseLeave = LabelOKATOMOUSELEAVE;
        NumL0L++;
        Form11->ADOQuery1->Next();
    }
}

//---------------------------------------------------------------------------
void __fastcall TForm11::Button1Click(TObject *Sender)
{
    this->Button3->Visible = false;
    for (int i = 0; i < NumL0C; i++)
    {
        delete Label_OKATO_PATCH[i];
        Label_OKATO_PATCH.pop_back();
    }
    NumL0C = 0;
    for (int i = 0; i < NumL0; i++)
    {
        delete Label_OKATO[i];
        Label_OKATO.pop_back();
    }
    NumL0 = 0;
    for (int i = 0; i < NumL0L; i++)
    {
        delete Label_OKATO_ORHER[i];
        Label_OKATO_ORHER.pop_back();
    }
    NumL0L = 0;

    String SQL_String = "SELECT CONCAT(CODE,' ',NAME) OKATO, ADDITIONAL_INFO FROM [SPR_OKATO] WHERE PARENT_CODE IS NULL ORDER BY CODE";
    Form11->ADOQuery1->Active = False;
    Form11->ADOQuery1->SQL->Clear();
    Form11->ADOQuery1->SQL->Add(SQL_String);
    Form11->ADOQuery1->Active = True;


    Form11->ADOQuery1->First();

    for (NumL0 = 0; !Form11->ADOQuery1->Eof; NumL0++)
    {
        Label_OKATO.push_back(new TLabel(Form11));
        Label_OKATO[NumL0]->Parent = Form11->ScrollBox1;
        Label_OKATO[NumL0]->Caption = Form11->ADOQuery1->FieldByName("OKATO")->AsString;
        Label_OKATO[NumL0]->Left = 20;
        Label_OKATO[NumL0]->Name = "Label_OKATO"+IntToStr(NumL0);
        if (NumL0 == 0)
        {
            Label_OKATO[NumL0]->Top = 10; //(NumL0*20)+10;
        }
        else
        {
            Label_OKATO[NumL0]->Top = Label_OKATO[NumL0-1]->Top + Label_OKATO[NumL0-1]->Height + LTop;
        }
        Label_OKATO[NumL0]->Font->Size = 10;
        Label_OKATO[NumL0]->Font->Style = TFontStyles() << fsBold /*<< fsItalic*/;
        Label_OKATO[NumL0]->OnClick = LabelOKATOCLICK;
        Label_OKATO[NumL0]->OnMouseEnter = LabelOKATOMOUSEENTER;
        Label_OKATO[NumL0]->OnMouseLeave = LabelOKATOMOUSELEAVE;

        Label_OKATO_ORHER.push_back(new TLabel(Form11));
        Label_OKATO_ORHER[NumL0L]->Parent = Form11->ScrollBox1;
        if (Form11->ADOQuery1->FieldByName("ADDITIONAL_INFO")->AsString !="")
        {
            Label_OKATO_ORHER[NumL0L]->Caption = Form11->ADOQuery1->FieldByName("ADDITIONAL_INFO")->AsString;
        }
        else
        {
            Label_OKATO_ORHER[NumL0L]->Caption = " ";
        }
        Label_OKATO_ORHER[NumL0L]->Left =  Form11->Panel2->Width * 0.48;
        Label_OKATO_ORHER[NumL0L]->Name = "Label_OKATO_ORHER"+IntToStr(NumL0L);
        Label_OKATO_ORHER[NumL0L]->Top = Label_OKATO[NumL0]->Top;
        Label_OKATO_ORHER[NumL0L]->Font->Size = 10;
        Label_OKATO_ORHER[NumL0L]->Font->Style = TFontStyles() << fsBold /*<< fsItalic*/;
        Label_OKATO_ORHER[NumL0L]->OnClick = LabelOKATOCLICK;
        Label_OKATO_ORHER[NumL0L]->OnMouseEnter = LabelOKATOMOUSEENTER;
        Label_OKATO_ORHER[NumL0L]->OnMouseLeave = LabelOKATOMOUSELEAVE;
        NumL0L++;
        Form11->ADOQuery1->Next();
    }
}

//---------------------------------------------------------------------------
void __fastcall TForm11::FormCloseQuery(TObject *Sender, bool &CanClose)
{
    for (int i = 0; i < NumL0; i++)
    {
        delete Label_OKATO[i];
        Label_OKATO.pop_back();
    }
    NumL0 = 0;
    for (int i = 0; i < NumL0C; i++)
    {
        delete Label_OKATO_PATCH[i];
        Label_OKATO_PATCH.pop_back();
    }
    NumL0C = 0;
    for (int i = 0; i < NumL0L; i++)
    {
        delete Label_OKATO_ORHER[i];
        Label_OKATO_ORHER.pop_back();
    }
    NumL0L = 0;
}

//---------------------------------------------------------------------------
void __fastcall TForm11::FormMouseWheel(TObject *Sender, TShiftState Shift, int WheelDelta,
          TPoint &MousePos, bool &Handled)
{
    Form11->ScrollBox1->VertScrollBar->Position -= WheelDelta;
}

//---------------------------------------------------------------------------
void __fastcall TForm11::UpdateLen_Form11()
{
    int i, j;
    int Maxlen = 0;
    int TotalLenDbgrid = 0;
    String DataLen = "";
	String ItogData = "";

//	this->Edit1->Visible = false;
	if (Form11->ADOQuery2->RecordCount > 0)
    {
		Form11->DBGrid1->Visible = false;
 //		this->Edit1->Visible = true;
        Form11->ADOQuery2->Open();
        for (j = 0; j < Form11->ADOQuery2->FieldCount; j++)
        {

            DataLen = Form11->ADOQuery2->Fields->Fields[j]->FieldName;
            Maxlen = DataLen.Length();
            Form11->ADOQuery2->First();

            for (i = 0; !Form11->ADOQuery2->Eof; i++)
            {
                ItogData = Form11->ADOQuery2->FieldByName(DataLen)->AsString;
                if (ItogData.Length() > Maxlen) Maxlen = ItogData.Length();
                Form11->ADOQuery2->Next();
            }

            if (Maxlen == 0)
            {
                Form11->DBGrid1->Columns->Items[j]->Width = 12;
                if (j > 0) TotalLenDbgrid += 12;
            }
            else
            {
                Form11->DBGrid1->Columns->Items[j]->Width = Maxlen*6 + 12;
                if (j > 0) TotalLenDbgrid += Maxlen*6 + 12;
            }
        }
        Form11->ADOQuery2->First();
        Form11->DBGrid1->Visible = true;

    }
    else
    {
        Form11->DBGrid1->Visible = false;
    }
}
//---------------------------------------------------------------------------

void __fastcall TForm11::Edit1Change(TObject *Sender)
{
    String StrokaPoiska = Form11->Edit1->Text;
    if (StrokaPoiska.Length()> 0)
    {
       String SQL_OKATO = "SELECT TOP 100 row_number() over (order by CODE)         AS [№ ]              \
                                         ,CODE                                      AS [Код]             \
                                         ,NAME + ' ' + isnull(ADDITIONAL_INFO, '')  AS [Название]        \
                           FROM SPR_OKATO                                                                \
                           WHERE        (CODE            LIKE '%" + StrokaPoiska
                                + "%' OR NAME            LIKE '%" + StrokaPoiska
                                + "%' OR ADDITIONAL_INFO LIKE '%" + StrokaPoiska + "%')  AND checked = 1";

        Form11->ADOQuery2->Active = False;
        Form11->ADOQuery2->SQL->Clear();
        Form11->ADOQuery2->SQL->Add(SQL_OKATO);
        Form11->ADOQuery2->Active = True;
        UpdateLen_Form11();
    }
    else
    {
        UpdateLen_Form11();
    }
}
//---------------------------------------------------------------------------

void __fastcall TForm11::Button2Click(TObject *Sender)
{
	if (ind_Button_OKATO == "B2")
	{
		Form9->Button2->Caption = this->DBGrid1->DataSource->DataSet->Fields->Fields[1]->Value;
		if (Form9->CheckBox1->Checked) Form9->Button1->Caption = this->DBGrid1->DataSource->DataSet->Fields->Fields[1]->Value;
		Form9->CheckBox1->SetFocus();
	}
	if (ind_Button_OKATO == "B1")
	{
		Form9->Button1->Caption = this->DBGrid1->DataSource->DataSet->Fields->Fields[1]->Value;
		Form9->Edit24->SetFocus();
	}

    CloseType = 2;
    Close();
}
//---------------------------------------------------------------------------

void __fastcall TForm11::DBGrid1DblClick(TObject *Sender)
{
    this->Button2Click(Button2);
}
//---------------------------------------------------------------------------


void __fastcall TForm11::Edit1KeyUp(TObject *Sender, WORD &Key, TShiftState Shift)

{
    if (Key == 40)
    {
        this->DBGrid1->SetFocus();
    }
}
//---------------------------------------------------------------------------

void __fastcall TForm11::DBGrid1KeyUp(TObject *Sender, WORD &Key, TShiftState Shift)

{
    if (Key == 13)
    {
        this->Button2Click(Button2);
    }
}
//---------------------------------------------------------------------------

void __fastcall TForm11::DBGrid1DrawColumnCell(TObject *Sender, const TRect &Rect,
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

void __fastcall TForm11::FormClose(TObject *Sender, TCloseAction &Action)
{
    String Data;
    String NAME, OKATO;
    if (CloseType != 2)
    {
        //OKATO = "Выбрать";
        if (NumL0C > 0)
        {
            Data = Label_OKATO_PATCH[NumL0C - 1]->Caption;
            OKATO = Fun11.SetInt(Data);

            if (this->Button3->Visible)
			{
				if (MessageBox(Application->Handle,
					L"Внимание. Закрытие формы.\n Cохранить выбранные данные?",
					L"Закрытие формы",
					MB_ICONQUESTION | MB_YESNO) == IDYES)
				{
					if (ind_Button_OKATO == "B1")
					{
						if (CloseType == 0) Form9->Button1->Caption = OKATO;
						Form9->CheckBox1->SetFocus();
					}
					if (ind_Button_OKATO == "B2")
					{
						if (CloseType == 0) Form9->Button2->Caption = OKATO;
						if (Form9->CheckBox1->Checked)
						{
							if (CloseType == 0) Form9->Button1->Caption = OKATO;
						}
						Form9->Edit24->SetFocus();
					}
				}
            }
            else
            {
                if (MessageBox(Application->Handle,
                    L"Внимание. При закрытие формы в в ОКАТО попадут промежуточные данные! \n Выйти с промежуточными данными?",
                    L"Закрытие формы",
                    MB_ICONQUESTION | MB_YESNO) == IDNO)
                {}
                else
                {
                    if (ind_Button_OKATO == "B1")
                    {
                        if (CloseType == 0) Form9->Button1->Caption = OKATO;
						Form9->CheckBox1->SetFocus();
					}
					if (ind_Button_OKATO == "B2")
					{
						if (CloseType == 0) Form9->Button2->Caption = OKATO;
						if (Form9->CheckBox1->Checked)
						{
							if (CloseType == 0) Form9->Button1->Caption = OKATO;
						}
                        Form9->Edit24->SetFocus();
                    }
                }
            }
        }
    }
}
//---------------------------------------------------------------------------

void __fastcall TForm11::ScrollBox1MouseWheel(TObject *Sender, TShiftState Shift,
          int WheelDelta, TPoint &MousePos, bool &Handled)
{
    ScrollBox1->VertScrollBar->Position -= WheelDelta;
}
//---------------------------------------------------------------------------

void __fastcall TForm11::ScrollBox1Click(TObject *Sender)
{
    this->ScrollBox1->SetFocus();
}
//---------------------------------------------------------------------------

void __fastcall TForm11::Button3Click(TObject *Sender)
{
    CloseType = 1;
    if (ind_Button_OKATO == "B1")
    {
		Form9->Button1->Caption = My_OKATO;
	}

	if (ind_Button_OKATO == "B2")
	{
		Form9->Button2->Caption = My_OKATO;
		if (Form9->CheckBox1->Checked)
		{
			Form9->Button1->Caption = My_OKATO;
		}
	}

	for (int i = 0; i < NumL0; i++)
	{
        delete Label_OKATO[i];
        Label_OKATO.pop_back();
    }

    for (int i = 0; i < NumL0C; i++)
    {
        delete Label_OKATO_PATCH[i];
        Label_OKATO_PATCH.pop_back();
    }
    NumL0 = 0;
    NumL0C = 0;
    Form11->Close();
    Abort();
}
//---------------------------------------------------------------------------

void __fastcall TForm11::Button5Click(TObject *Sender)
{
    String Data;
    String TMP = Label_OKATO_PATCH[NumL0C - 1]->Caption;
    for (int i = 1; i < TMP.Length(); i++)
    {
        if (TMP[i]==' ')
        {
            break;
        }
        Data += TMP[i];
    }

    String InfoSchet = "UPDATE SPR_OKATO SET            \
                               checked = 1              \
                        WHERE  CODE = '" + Data + "'";

    Form11->ADOQuery2->Active = False;
    Form11->ADOQuery2->SQL->Clear();
    Form11->ADOQuery2->SQL->Add(InfoSchet);
    Form11->ADOQuery2->ExecSQL();

    this->Edit1->Text = "";
    ZagruzkaData();
    UpdateLen_Form11();

}
//---------------------------------------------------------------------------

void __fastcall TForm11::Button4Click(TObject *Sender)
{
    if (this->DBGrid1->Visible)
    {
        if (MessageBox(Application->Handle,
            L"Вы хотите удалить ОКАТО из избранного?",
            L"Внимание, происходит удаление ОКАТО",
            MB_ICONQUESTION | MB_YESNO) == IDYES)
        {
            String Data = this->DBGrid1->DataSource->DataSet->Fields->Fields[1]->Value;;
            String InfoSchet = "UPDATE SPR_OKATO SET            \
                                       checked = 0              \
                                WHERE  CODE = '" + Data + "'";

            Form11->ADOQuery2->Active = False;
            Form11->ADOQuery2->SQL->Clear();
            Form11->ADOQuery2->SQL->Add(InfoSchet);
            Form11->ADOQuery2->ExecSQL();

            this->Edit1->Text = "";
            ZagruzkaData();
            UpdateLen_Form11();
        }
    }
}
//---------------------------------------------------------------------------

void __fastcall TForm11::FormKeyPress(TObject *Sender, System::WideChar &Key)
{
	if (Key == '\x1B')
	{
		Key = 0;
		this->Close();
	}
}
//---------------------------------------------------------------------------

void __fastcall TForm11::DBGrid1ColumnMoved(TObject *Sender, int FromIndex, int ToIndex)

{
	this->DBGrid1->Columns->Items[ToIndex]->Index = FromIndex;
}
//---------------------------------------------------------------------------

