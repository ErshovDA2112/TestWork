//---------------------------------------------------------------------------

#ifndef Schet_EditH
#define Schet_EditH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <Vcl.ExtCtrls.hpp>
//---------------------------------------------------------------------------
class Tmo_schet : public TForm
{
__published:	// IDE-managed Components
	TEdit *Edit1;
	TEdit *Edit2;
	TComboBox *ComboBox1;
	TCheckBox *CheckBox1;
	TButton *Button3;
	TLabel *Label1;
	TPanel *Panel1;
	TLabel *Label2;
	TLabel *Label3;
	TLabel *Label4;
	TLabel *Label5;
	TLabel *Label6;
	TLabel *Label7;
	TEdit *Edit3;
	TPanel *Panel2;
	TPanel *Panel3;
	TCheckBox *CheckBox2;
	TEdit *Edit4;
	void __fastcall FormActivate(TObject *Sender);
	void __fastcall Button3Click(TObject *Sender);
	void __fastcall CheckBox1Click(TObject *Sender);
	void __fastcall Edit1KeyPress(TObject *Sender, System::WideChar &Key);
	void __fastcall Edit2KeyPress(TObject *Sender, System::WideChar &Key);
	void __fastcall ComboBox1KeyPress(TObject *Sender, System::WideChar &Key);
	void __fastcall CheckBox1KeyPress(TObject *Sender, System::WideChar &Key);
	void __fastcall Edit3KeyPress(TObject *Sender, System::WideChar &Key);
	void __fastcall Edit1KeyUp(TObject *Sender, WORD &Key, TShiftState Shift);
	void __fastcall Edit2KeyUp(TObject *Sender, WORD &Key, TShiftState Shift);
	void __fastcall ComboBox1KeyUp(TObject *Sender, WORD &Key, TShiftState Shift);
	void __fastcall CheckBox1KeyUp(TObject *Sender, WORD &Key, TShiftState Shift);
	void __fastcall Edit3KeyUp(TObject *Sender, WORD &Key, TShiftState Shift);
	void __fastcall CheckBox2Click(TObject *Sender);
	void __fastcall FormClose(TObject *Sender, TCloseAction &Action);
	void __fastcall FormKeyPress(TObject *Sender, System::WideChar &Key);
	void __fastcall Edit4KeyPress(TObject *Sender, System::WideChar &Key);
	void __fastcall CheckBox2KeyPress(TObject *Sender, System::WideChar &Key);
	void __fastcall FormDestroy(TObject *Sender);
private:	// User declarations
public:		// User declarations
	__fastcall Tmo_schet(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE Tmo_schet *mo_schet;
//---------------------------------------------------------------------------
#endif
