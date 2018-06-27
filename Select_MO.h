//---------------------------------------------------------------------------

#ifndef Select_MOH
#define Select_MOH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <Vcl.ExtCtrls.hpp>
#include <Vcl.Grids.hpp>
#include <Vcl.ValEdit.hpp>
#include <Vcl.ComCtrls.hpp>
#include <Data.DB.hpp>
#include <Data.Win.ADODB.hpp>
#include <Vcl.DBGrids.hpp>
//---------------------------------------------------------------------------
class Tmo_select_mo : public TForm
{
__published:	// IDE-managed Components
	TPanel *Panel1;
	TLabel *Label1;
	TValueListEditor *ValueListEditor1;
	TButton *Button1;
	TLabel *Label2;
	TPanel *Panel2;
	TEdit *Edit1;
	TLabel *Label3;
	TEdit *Edit5;
	TLabel *Label7;
	TButton *Button3;
	TButton *Button2;
	TDataSource *DataSource2;
	TADOQuery *ADOQuery2;
	TDBGrid *DBGrid2;
	TLabel *Label8;
	TLabel *Label9;
	TCheckBox *CheckBox1;
	TCheckBox *CheckBox2;
	TComboBox *ComboBox1;
	TLabel *Label4;
	TEdit *Edit2;
	void __fastcall FormActivate(TObject *Sender);
	void __fastcall ComboBox1KeyUp(TObject *Sender, WORD &Key, TShiftState Shift);
	void __fastcall ComboBox1KeyPress(TObject *Sender, System::WideChar &Key);
	void __fastcall Button2Click(TObject *Sender);
	void __fastcall ComboBox1Change(TObject *Sender);
	void __fastcall Button1Click(TObject *Sender);
	void __fastcall ValueListEditor1KeyPress(TObject *Sender, System::WideChar &Key);
	void __fastcall ComboBox1MouseEnter(TObject *Sender);
	void __fastcall Edit1KeyPress(TObject *Sender, System::WideChar &Key);
	void __fastcall Button3Click(TObject *Sender);
    void __fastcall UpdateLen();
	void __fastcall Edit5KeyPress(TObject *Sender, System::WideChar &Key);
	void __fastcall DBGrid2DrawColumnCell(TObject *Sender, const TRect &Rect, int DataCol,
          TColumn *Column, TGridDrawState State);
	void __fastcall DBGrid2ColumnMoved(TObject *Sender, int FromIndex, int ToIndex);
	void __fastcall DBGrid2CellClick(TColumn *Column);
	void __fastcall Edit2KeyPress(TObject *Sender, System::WideChar &Key);



private:	// User declarations
public:		// User declarations
	__fastcall Tmo_select_mo(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE Tmo_select_mo *mo_select_mo;
//---------------------------------------------------------------------------
#endif
