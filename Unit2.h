//---------------------------------------------------------------------------

#ifndef Unit2H
#define Unit2H
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <IdBaseComponent.hpp>
#include <IdComponent.hpp>
#include <IdIcmpClient.hpp>
#include <IdRawBase.hpp>
#include <IdRawClient.hpp>
//---------------------------------------------------------------------------
class Tmo_connect : public TForm
{
__published:	// IDE-managed Components
	TLabel *Label1;
	TGroupBox *GroupBox1;
	TLabel *Label3;
	TEdit *Edit2;
	TLabel *Label4;
	TEdit *Edit3;
	TLabel *Label5;
	TEdit *Edit4;
	TEdit *Edit5;
	TLabel *Label6;
	TButton *Button1;
	TButton *Button2;
	TLabel *Label7;
	TLabel *Label8;
	TEdit *Edit6;
	TIdIcmpClient *IdIcmpClient1;
	void __fastcall Button2Click(TObject *Sender);
	void __fastcall Button1Click(TObject *Sender);
	void __fastcall FormActivate(TObject *Sender);
private:	// User declarations
public:		// User declarations
	__fastcall Tmo_connect(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE Tmo_connect *mo_connect;
//---------------------------------------------------------------------------
#endif
