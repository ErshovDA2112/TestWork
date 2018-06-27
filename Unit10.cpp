//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Unit10.h"
#include "Main.h"

#include "vector"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TForm10 *Form10;
F10 Fun;                             //Создание обьекта класса F10

extern StyleF Prodject_Style;        //структура оформлени компонентов
String ind_Button_OKATO = "";        //Индификатор нажатой кнопки
int NumL = 0;                        //номер компонента label
int NumLL = 0;                       //номер компонента label
int NumLC = 0;                       //номер компонента label
vector<TLabel *> Label_OKATO;        //масив из label
vector<TLabel *> Label_OKATO_PATCH;  //масив из label
vector<TLabel *> Label_OKATO_ORHER;  //масив из label
const int LTop = 10;                 //отступ между строками

//---------------------------------------------------------------------------
__fastcall TForm10::TForm10(TComponent* Owner)
    : TForm(Owner)
{
}

//---------------------------------------------------------------------------
void __fastcall TForm10::LabelOKATOMOUSEENTER(TObject *Sender)
{
    ((TLabel*)Sender)->Font->Color = Prodject_Style.Color_Select_Line;
    ((TLabel*)Sender)->Font->Style = TFontStyles() << fsBold << fsUnderline;
}

//---------------------------------------------------------------------------
void __fastcall TForm10::LabelOKATOMOUSELEAVE(TObject *Sender)
{
    ((TLabel*)Sender)->Font->Color = clWindowText;
    ((TLabel*)Sender)->Font->Style = TFontStyles() << fsBold;
}
//---------------------------------------------------------------------------

void __fastcall TForm10::LabelOKATOMOUSEENTER2(TObject *Sender)
{
    ((TLabel*)Sender)->Font->Color = Prodject_Style.Color_Select_Line;
    ((TLabel*)Sender)->Font->Style = TFontStyles() << fsUnderline;
}

//---------------------------------------------------------------------------
void __fastcall TForm10::LabelOKATOMOUSELEAVE2(TObject *Sender)
{
    ((TLabel*)Sender)->Font->Color = clWindowText;
    ((TLabel*)Sender)->Font->Style = TFontStyles() >> fsUnderline;
}

//---------------------------------------------------------------------------
void __fastcall TForm10::LabelOKATOCLICK2(TObject *Sender)
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

    int Select_NumLC = StrToInt(temp);
    int END_NumLC = Select_NumLC+1;
    if ((Select_NumLC >= 0)&&(Select_NumLC != NumLC))
    {
        Select_NumLC++;
        for (Select_NumLC ; Select_NumLC < NumLC; Select_NumLC++)
        {
            delete Label_OKATO_PATCH[Select_NumLC];
            Label_OKATO_PATCH.pop_back();
        }
        NumLC = END_NumLC;
    }

    String OKATO = Fun.SetInt(((TLabel*)Sender)->Caption);

    String SQL_String = "SELECT CONCAT(CODE,' ',NAME) OKATO, ADDITIONAL_INFO FROM [SPR_OKATO] WHERE PARENT_CODE = '"+Fun.SetInt(((TLabel*)Sender)->Caption)+"' ORDER BY CODE";

    Form10->ADOQuery1->Active = False;
    Form10->ADOQuery1->SQL->Clear();
    Form10->ADOQuery1->SQL->Add(SQL_String);
    Form10->ADOQuery1->Active = True;

    //Fun.openSQL("SELECT CONCAT(CODE,' ',NAME) OKATO, ADDITIONAL_INFO FROM [SPR_OKATO] WHERE PARENT_CODE = '"+Fun.SetInt(((TLabel*)Sender)->Caption)+"' ORDER BY CODE");

    for (int i = 0; i < NumL; i++)
    {
        delete Label_OKATO[i];
        Label_OKATO.pop_back();
    }
    NumL = 0;

    for (int i = 0; i < NumLL; i++)
    {
        delete Label_OKATO_ORHER[i];
        Label_OKATO_ORHER.pop_back();
    }

    NumLL = 0;

    Form10->ADOQuery1->First();
    for (NumL = 0; !Form10->ADOQuery1->Eof; NumL++)
    {
        Label_OKATO.push_back(new TLabel(Form10));
        Label_OKATO[NumL]->Parent = Form10->ScrollBox1;
        Label_OKATO[NumL]->Caption = Form10->ADOQuery1->FieldByName("OKATO")->AsString;
        Label_OKATO[NumL]->Left = 20;
        Label_OKATO[NumL]->Name = "Label_OKATO"+IntToStr(NumL);
        if (NumL == 0)
        {
            Label_OKATO[NumL]->Top = 10; //(NumL*20)+10;
        }
        else
        {
            Label_OKATO[NumL]->Top = Label_OKATO[NumL-1]->Top + Label_OKATO[NumL-1]->Height + LTop;
        }

        Label_OKATO[NumL]->Font->Size = 14;
        Label_OKATO[NumL]->WordWrap = true;
        Label_OKATO[NumL]->Width = Form10->Width * 0.2;
        /*Label_OKATO[NumL]->Top = (NumL*20)+10;
        Label_OKATO[NumL]->Font->Size = 14;*/
        Label_OKATO[NumL]->Font->Style = TFontStyles() << fsBold /*<< fsItalic*/;
        Label_OKATO[NumL]->OnClick = LabelOKATOCLICK;
        Label_OKATO[NumL]->OnMouseEnter = LabelOKATOMOUSEENTER;
        Label_OKATO[NumL]->OnMouseLeave = LabelOKATOMOUSELEAVE;

        Label_OKATO_ORHER.push_back(new TLabel(Form10));
        Label_OKATO_ORHER[NumLL]->Parent = Form10->ScrollBox1;
        if (Form10->ADOQuery1->FieldByName("ADDITIONAL_INFO")->AsString !="") {
        Label_OKATO_ORHER[NumLL]->Caption = Form10->ADOQuery1->FieldByName("ADDITIONAL_INFO")->AsString;
    }
    else
    {
        Label_OKATO_ORHER[NumLL]->Caption = " ";
    }
    Label_OKATO_ORHER[NumLL]->Left =  Form10->Width * 0.22;
    Label_OKATO_ORHER[NumLL]->Name = "Label_OKATO_ORHER"+IntToStr(NumLL);
    Label_OKATO_ORHER[NumLL]->Top = Label_OKATO[NumL]->Top;
    Label_OKATO_ORHER[NumLL]->Font->Size = 14;
    Label_OKATO_ORHER[NumLL]->Font->Style = TFontStyles() << fsBold /*<< fsItalic*/;
    Label_OKATO_ORHER[NumLL]->OnClick = LabelOKATOCLICK;
    Label_OKATO_ORHER[NumLL]->OnMouseEnter = LabelOKATOMOUSEENTER;
    Label_OKATO_ORHER[NumLL]->OnMouseLeave = LabelOKATOMOUSELEAVE;
    NumLL++;
    Form10->ADOQuery1->Next();
    }
 //ShowMessage("NumLC = " + IntToStr(NumLC));
}

//---------------------------------------------------------------------------
void __fastcall TForm10::LabelOKATOCLICK(TObject *Sender)
{
    String NAME, OKATO;
    if (Fun.SetInt(((TLabel*)Sender)->Caption) != "")
    {
        NAME = ((TLabel*)Sender)->Caption;
        OKATO = Fun.SetInt(((TLabel*)Sender)->Caption);
    }
    else
    {
        NAME = Label_OKATO[StrToInt(Fun.SetInt(((TLabel*)Sender)->Name))]->Caption;
        OKATO = Fun.SetInt(Label_OKATO[StrToInt(Fun.SetInt(((TLabel*)Sender)->Name))]->Caption);
    }

    String SQL_String ="SELECT CONCAT(CODE,' ',NAME) OKATO, ADDITIONAL_INFO FROM [SPR_OKATO] WHERE PARENT_CODE = '"+OKATO/*Fun.SetInt(((TLabel*)Sender)->Caption)*/+"' ORDER BY CODE";

    Form10->ADOQuery1->Active = False;
    Form10->ADOQuery1->SQL->Clear();
    Form10->ADOQuery1->SQL->Add(SQL_String);
    Form10->ADOQuery1->Active = True;

    if (Form10->ADOQuery1->RecordCount == 0)
    {

        if (ind_Button_OKATO == "B1")
        {
            Form9->Button1->Caption = OKATO;
        }
        else
        {
            if (ind_Button_OKATO == "B2")
            {
                Form9->Button2->Caption = OKATO;
            }
        }
        for (int i = 0; i < NumL; i++)
        {
            delete Label_OKATO[i];
            Label_OKATO.pop_back();
        }

        for (int i = 0; i < NumLC; i++)
        {
            delete Label_OKATO_PATCH[i];
            Label_OKATO_PATCH.pop_back();
        }
        NumL = 0;
        NumLC = 0;
        Form10->Close();
        Abort();
    }

    for (int i = 0; i < NumL; i++)
    {
        delete Label_OKATO[i];
        Label_OKATO.pop_back();
    }
    NumL = 0;
    for (int i = 0; i < NumLL; i++)
    {
        delete Label_OKATO_ORHER[i];
        Label_OKATO_ORHER.pop_back();
    }
    NumLL = 0;

    Form10->ADOQuery1->First();
    for (NumL = 0; !Form10->ADOQuery1->Eof; NumL++)
    {
        Label_OKATO.push_back(new TLabel(Form10));
        Label_OKATO[NumL]->Parent = Form10->ScrollBox1;
        Label_OKATO[NumL]->Caption = Form10->ADOQuery1->FieldByName("OKATO")->AsString;
        Label_OKATO[NumL]->Left = 20;
        Label_OKATO[NumL]->Name = "Label_OKATO"+IntToStr(NumL);
        if (NumL == 0)
        {
            Label_OKATO[NumL]->Top = 10; //(NumL*20)+10;
        }
        else
        {
            Label_OKATO[NumL]->Top = Label_OKATO[NumL-1]->Top + Label_OKATO[NumL-1]->Height + LTop;
        }
        Label_OKATO[NumL]->Font->Size = 14;
        Label_OKATO[NumL]->WordWrap = true;
        Label_OKATO[NumL]->Width = Form10->Width * 0.2;
        Label_OKATO[NumL]->Font->Style = TFontStyles() << fsBold /*<< fsItalic*/;
        Label_OKATO[NumL]->OnClick = LabelOKATOCLICK;
        Label_OKATO[NumL]->OnMouseEnter = LabelOKATOMOUSEENTER;
        Label_OKATO[NumL]->OnMouseLeave = LabelOKATOMOUSELEAVE;

        Label_OKATO_ORHER.push_back(new TLabel(Form10));
        Label_OKATO_ORHER[NumLL]->Parent = Form10->ScrollBox1;
        if (Form10->ADOQuery1->FieldByName("ADDITIONAL_INFO")->AsString !="")
        {
            Label_OKATO_ORHER[NumLL]->Caption = Form10->ADOQuery1->FieldByName("ADDITIONAL_INFO")->AsString;
        }
        else
        {
            Label_OKATO_ORHER[NumLL]->Caption = " ";
        }
        Label_OKATO_ORHER[NumLL]->Left =  Form10->Width * 0.22;
        Label_OKATO_ORHER[NumLL]->Name = "Label_OKATO_ORHER"+IntToStr(NumLL);
        Label_OKATO_ORHER[NumLL]->Top = Label_OKATO[NumL]->Top;
        Label_OKATO_ORHER[NumLL]->Font->Size = 14;
        Label_OKATO_ORHER[NumLL]->Font->Style = TFontStyles() << fsBold /*<< fsItalic*/;
        Label_OKATO_ORHER[NumLL]->OnClick = LabelOKATOCLICK;
        Label_OKATO_ORHER[NumLL]->OnMouseEnter = LabelOKATOMOUSEENTER;
        Label_OKATO_ORHER[NumLL]->OnMouseLeave = LabelOKATOMOUSELEAVE;
        NumLL++;
        Form10->ADOQuery1->Next();
    }

    Label_OKATO_PATCH.push_back(new TLabel(Form10));
    Label_OKATO_PATCH[NumLC]->Parent = Form10->Panel1;
    Label_OKATO_PATCH[NumLC]->Caption = NAME;
    if (NumLC == 0)
        Label_OKATO_PATCH[NumLC]->Left = 10;
    else
        Label_OKATO_PATCH[NumLC]->Left = Label_OKATO_PATCH[NumLC-1]->Left + Label_OKATO_PATCH[NumLC-1]->Width +15;

    Label_OKATO_PATCH[NumLC]->Name = "Label_OKATO_PATCH"+IntToStr(NumLC);
    Label_OKATO_PATCH[NumLC]->Top = 30;
    Label_OKATO_PATCH[NumLC]->OnClick = LabelOKATOCLICK2;
    Label_OKATO_PATCH[NumLC]->OnMouseEnter = LabelOKATOMOUSEENTER2;
    Label_OKATO_PATCH[NumLC]->OnMouseLeave = LabelOKATOMOUSELEAVE2;
    NumLC++;
 //ShowMessage("NumLC = " + IntToStr(NumLC));
}
//---------------------------------------------------------------------------

void __fastcall TForm10::FormActivate(TObject *Sender)
{

    String SQL_String ="SELECT CONCAT(CODE,' ',NAME) OKATO, ADDITIONAL_INFO FROM [SPR_OKATO] WHERE PARENT_CODE IS NULL ORDER BY CODE";

    Form10->ADOQuery1->Active = False;
    Form10->ADOQuery1->SQL->Clear();
    Form10->ADOQuery1->SQL->Add(SQL_String);
    Form10->ADOQuery1->Active = True;


    Form10->ADOQuery1->First();
    for (NumL = 0; !Form10->ADOQuery1->Eof; NumL++)
    {
        Label_OKATO.push_back(new TLabel(Form10));
        Label_OKATO[NumL]->Parent = Form10->ScrollBox1;
        Label_OKATO[NumL]->Caption = Form10->ADOQuery1->FieldByName("OKATO")->AsString;
        Label_OKATO[NumL]->Left = 20;
        Label_OKATO[NumL]->Name = "Label_OKATO"+IntToStr(NumL);
        if (NumL == 0)
        {
            Label_OKATO[NumL]->Top = 10; //(NumL*20)+10;
        }
        else
        {
            Label_OKATO[NumL]->Top = Label_OKATO[NumL-1]->Top + Label_OKATO[NumL-1]->Height + LTop;
        }
        Label_OKATO[NumL]->Font->Size = 14;
        Label_OKATO[NumL]->WordWrap = true;
        Label_OKATO[NumL]->Width = Form10->Width * 0.2;
        Label_OKATO[NumL]->Font->Style = TFontStyles() << fsBold /*<< fsItalic*/;
        Label_OKATO[NumL]->OnClick = LabelOKATOCLICK;
        Label_OKATO[NumL]->OnMouseEnter = LabelOKATOMOUSEENTER;
        Label_OKATO[NumL]->OnMouseLeave = LabelOKATOMOUSELEAVE;

        Label_OKATO_ORHER.push_back(new TLabel(Form10));
        Label_OKATO_ORHER[NumLL]->Parent = Form10->ScrollBox1;
        if (Form10->ADOQuery1->FieldByName("ADDITIONAL_INFO")->AsString !="")
        {
            Label_OKATO_ORHER[NumLL]->Caption = Form10->ADOQuery1->FieldByName("ADDITIONAL_INFO")->AsString;
        }
        else
        {
            Label_OKATO_ORHER[NumLL]->Caption = " ";
        }
        Label_OKATO_ORHER[NumLL]->Left =  Form10->Width * 0.22;
        Label_OKATO_ORHER[NumLL]->Name = "Label_OKATO_ORHER"+IntToStr(NumLL);
        Label_OKATO_ORHER[NumLL]->Top = Label_OKATO[NumL]->Top;
        Label_OKATO_ORHER[NumLL]->Font->Size = 14;
        Label_OKATO_ORHER[NumLL]->Font->Style = TFontStyles() << fsBold /*<< fsItalic*/;
        Label_OKATO_ORHER[NumLL]->OnClick = LabelOKATOCLICK;
        Label_OKATO_ORHER[NumLL]->OnMouseEnter = LabelOKATOMOUSEENTER;
        Label_OKATO_ORHER[NumLL]->OnMouseLeave = LabelOKATOMOUSELEAVE;
        NumLL++;
        Form10->ADOQuery1->Next();
    }
}

//---------------------------------------------------------------------------
void __fastcall TForm10::Button1Click(TObject *Sender)
{
    for (int i = 0; i < NumLC; i++)
    {
        delete Label_OKATO_PATCH[i];
        Label_OKATO_PATCH.pop_back();
    }
    NumLC = 0;
    for (int i = 0; i < NumL; i++)
    {
        delete Label_OKATO[i];
        Label_OKATO.pop_back();
    }
    NumL = 0;
    for (int i = 0; i < NumLL; i++)
    {
        delete Label_OKATO_ORHER[i];
        Label_OKATO_ORHER.pop_back();
    }
    NumLL = 0;

    String SQL_String = "SELECT CONCAT(CODE,' ',NAME) OKATO, ADDITIONAL_INFO FROM [SPR_OKATO] WHERE PARENT_CODE IS NULL ORDER BY CODE";
    Form10->ADOQuery1->Active = False;
    Form10->ADOQuery1->SQL->Clear();
    Form10->ADOQuery1->SQL->Add(SQL_String);
    Form10->ADOQuery1->Active = True;


    Form10->ADOQuery1->First();

    for (NumL = 0; !Form10->ADOQuery1->Eof; NumL++)
    {
        Label_OKATO.push_back(new TLabel(Form10));
        Label_OKATO[NumL]->Parent = Form10->ScrollBox1;
        Label_OKATO[NumL]->Caption = Form10->ADOQuery1->FieldByName("OKATO")->AsString;
        Label_OKATO[NumL]->Left = 20;
        Label_OKATO[NumL]->Name = "Label_OKATO"+IntToStr(NumL);
        if (NumL == 0)
        {
            Label_OKATO[NumL]->Top = 10; //(NumL*20)+10;
        }
        else
        {
            Label_OKATO[NumL]->Top = Label_OKATO[NumL-1]->Top + Label_OKATO[NumL-1]->Height + LTop;
        }
        Label_OKATO[NumL]->Font->Size = 14;
        Label_OKATO[NumL]->Font->Style = TFontStyles() << fsBold /*<< fsItalic*/;
        Label_OKATO[NumL]->OnClick = LabelOKATOCLICK;
        Label_OKATO[NumL]->OnMouseEnter = LabelOKATOMOUSEENTER;
        Label_OKATO[NumL]->OnMouseLeave = LabelOKATOMOUSELEAVE;

        Label_OKATO_ORHER.push_back(new TLabel(Form10));
        Label_OKATO_ORHER[NumLL]->Parent = Form10->ScrollBox1;
        if (Form10->ADOQuery1->FieldByName("ADDITIONAL_INFO")->AsString !="")
        {
            Label_OKATO_ORHER[NumLL]->Caption = Form10->ADOQuery1->FieldByName("ADDITIONAL_INFO")->AsString;
        }
        else
        {
            Label_OKATO_ORHER[NumLL]->Caption = " ";
        }
        Label_OKATO_ORHER[NumLL]->Left =  Form10->Width * 0.22;
        Label_OKATO_ORHER[NumLL]->Name = "Label_OKATO_ORHER"+IntToStr(NumLL);
        Label_OKATO_ORHER[NumLL]->Top = Label_OKATO[NumL]->Top;
        Label_OKATO_ORHER[NumLL]->Font->Size = 14;
        Label_OKATO_ORHER[NumLL]->Font->Style = TFontStyles() << fsBold /*<< fsItalic*/;
        Label_OKATO_ORHER[NumLL]->OnClick = LabelOKATOCLICK;
        Label_OKATO_ORHER[NumLL]->OnMouseEnter = LabelOKATOMOUSEENTER;
        Label_OKATO_ORHER[NumLL]->OnMouseLeave = LabelOKATOMOUSELEAVE;
        NumLL++;
        Form10->ADOQuery1->Next();
    }
}

//---------------------------------------------------------------------------
void __fastcall TForm10::FormCloseQuery(TObject *Sender, bool &CanClose)
{
    for (int i = 0; i < NumL; i++)
    {
        delete Label_OKATO[i];
        Label_OKATO.pop_back();
    }
    NumL = 0;
    for (int i = 0; i < NumLC; i++)
    {
        delete Label_OKATO_PATCH[i];
        Label_OKATO_PATCH.pop_back();
    }
    NumLC = 0;
    for (int i = 0; i < NumLL; i++)
    {
        delete Label_OKATO_ORHER[i];
        Label_OKATO_ORHER.pop_back();
    }
    NumLL = 0;
}

//---------------------------------------------------------------------------
void __fastcall TForm10::FormMouseWheel(TObject *Sender, TShiftState Shift, int WheelDelta,
          TPoint &MousePos, bool &Handled)
{
    Form10->ScrollBox1->VertScrollBar->Position -= WheelDelta;
}
//---------------------------------------------------------------------------


