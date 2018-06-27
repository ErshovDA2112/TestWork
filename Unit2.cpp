//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop


#include "Unit2.h"
#include "Unit1.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
using namespace std;

Tmo_connect *mo_connect;

struct tab1
{
    String name, ip, port, user, password, DB, connectDB;
}Connect;

//---------------------------------------------------------------------------
__fastcall Tmo_connect::Tmo_connect(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------

//есть предложение активировать функцию Tmo_connect::Button2Click только в том случае если поля заполнены
//тогда не придется постоянно делать проеврки.
//есть ли необходисть проверки на ввод символов?
void __fastcall Tmo_connect::Button2Click(TObject *Sender)
{
    if (mo_connect->Button2->Caption == "Изменить")
    {
        mo_connect->Edit2->Visible = True; mo_connect->Label3->Visible = True;
        mo_connect->Edit3->Visible = True; mo_connect->Label4->Visible = True;
        mo_connect->Edit4->Visible = True; mo_connect->Label5->Visible = True;
        mo_connect->Edit5->Visible = True; mo_connect->Label6->Visible = True;
        mo_connect->Edit6->Visible = True; mo_connect->Label8->Visible = True;
        mo_connect->Label7->Caption = "";
        mo_connect->Button1->Visible = True;
        mo_connect->Label7->Top = 158;
        mo_connect->Height = 300;
        Abort();
    }

    if (mo_connect->Edit2->Text !="")
    {
        Connect.ip = mo_connect->Edit2->Text;
    }
	else
    {
		HWND hWnd = GetForegroundWindow();
		MessageBoxA(hWnd, "Введите адрес сервера!", "Внимание!", MB_OK);
        mo_connect->Edit2->SetFocus();
        Abort();
    }

    if (mo_connect->Edit3->Text !="")
    {
        Connect.port = mo_connect->Edit3->Text;
    }
    else
	{
		HWND hWnd = GetForegroundWindow();
		MessageBoxA(hWnd, "Введите порт сервера!", "Внимание!", MB_OK);
        mo_connect->Edit3->SetFocus();
        Abort();
    }

    if (mo_connect->Edit4->Text !="")
    {
        Connect.user = mo_connect->Edit4->Text;
    }
    else
    {
		HWND hWnd = GetForegroundWindow();
		MessageBoxA(hWnd, "Введите имя пользователя!", "Внимание!", MB_OK);
        mo_connect->Edit4->SetFocus();
        Abort();
    }

    if (mo_connect->Edit5->Text !="")
    {
        Connect.password = mo_connect->Edit5->Text;
    }
    else
    {
		//Почему адресс по идеии должен быть пароль
		HWND hWnd = GetForegroundWindow();
		MessageBoxA(hWnd, "Введите адрес сервера!", "Внимание!", MB_OK);
        mo_connect->Edit5->SetFocus();
        Abort();
    }

    if (mo_connect->Edit6->Text !="")
    {
    Connect.DB = mo_connect->Edit6->Text;
    }
    else
	{
		HWND hWnd = GetForegroundWindow();
		MessageBoxA(hWnd, "Введите имя базы данных!", "Внимание!", MB_OK);
		mo_connect->Edit6->SetFocus();
        Abort();
    }

    TStringList* temp = new TStringList;
    temp->Text = "Provider=SQLOLEDB.1;Password="+Connect.password+";\
				Persist Security Info=True;User ID="+Connect.user+";Initial \
				Catalog="+Connect.DB+";Data Source="+Connect.ip+","+Connect.port;

    temp->SaveToFile("set.sqp");
    temp->~TStringList();

    mo_main->ADOConnection1->ConnectionString = temp->Text;
    mo_main->ADOConnection1->DefaultDatabase = Connect.DB;
    mo_main->ADOConnection1->Connected = True;

}

//---------------------------------------------------------------------------
void __fastcall Tmo_connect::Button1Click(TObject *Sender)
{
    if (mo_connect->Edit2->Text !="")
    {
        //Connect.ip = mo_connect->Edit2->Text;
        mo_connect->IdIcmpClient1->Host = mo_connect->Edit2->Text;
        mo_connect->IdIcmpClient1->Ping();
        if (mo_connect->IdIcmpClient1->ReplyStatus->FromIpAddress == mo_connect->IdIcmpClient1->Host & mo_connect->IdIcmpClient1->ReplyStatus->ReplyStatusType == rsEcho)
        {
            mo_connect->Label7->Caption = "Сервер доступен!";
        }
        else
        {
            mo_connect->Label7->Caption = "Сервер недоступен!";
        }
    }
    else
	{
		HWND hWnd = GetForegroundWindow();
		MessageBoxA(hWnd, "Введите адрес сервера!", "Внимание!", MB_OK);
        mo_connect->Edit2->SetFocus();
        Abort();
    }
}
//---------------------------------------------------------------------------

void __fastcall Tmo_connect::FormActivate(TObject *Sender)
{
    if (mo_main->ADOConnection1->Connected == True)
    {
        mo_connect->Edit2->Visible = False; mo_connect->Label3->Visible = False;
        mo_connect->Edit3->Visible = False; mo_connect->Label4->Visible = False;
        mo_connect->Edit4->Visible = False; mo_connect->Label5->Visible = False;
        mo_connect->Edit5->Visible = False; mo_connect->Label6->Visible = False;
        mo_connect->Edit6->Visible = False; mo_connect->Label8->Visible = False;
        mo_connect->Label7->Caption = "База подключена! Какая удача!";
        mo_connect->Button1->Visible = False;
        mo_connect->Button2->Caption = "Изменить";
        mo_connect->Label7->Top = 10;
        mo_connect->Height = 150;
    }
}
//---------------------------------------------------------------------------



