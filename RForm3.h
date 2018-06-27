//---------------------------------------------------------------------------

#ifndef RForm3H
#define RForm3H
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include "frxADOComponents.hpp"
#include "frxClass.hpp"
#include <Vcl.ExtCtrls.hpp>
//---------------------------------------------------------------------------
class TForm3 : public TForm
{
__published:	// IDE-managed Components
	TfrxReport *frxReport1;
	TfrxADOComponents *frxADOComponents1;
	TButton *Button1;
	TPanel *Panel1;
	TGroupBox *GroupBox1;
	TComboBox *ComboBox1;
	TLabel *Label3;
	TComboBox *ComboBox2;
	TLabel *Label7;
	TGroupBox *GroupBox2;
	TLabel *Label1;
	TLabel *Label2;
	TComboBox *ComboBox3;
	TComboBox *ComboBox4;
	void __fastcall FormCreate(TObject *Sender);
	void __fastcall Button1Click(TObject *Sender);
	void __fastcall ComboBox1Change(TObject *Sender);
	void __fastcall ComboBox2Change(TObject *Sender);
	void __fastcall ComboBox3Change(TObject *Sender);
	void __fastcall ComboBox4Change(TObject *Sender);
private:	// User declarations
public:		// User declarations
	__fastcall TForm3(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm3 *Form3;
//---------------------------------------------------------------------------
#endif
