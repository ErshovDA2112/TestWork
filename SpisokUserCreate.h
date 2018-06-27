//---------------------------------------------------------------------------

#ifndef SpisokUserCreateH
#define SpisokUserCreateH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <Data.DB.hpp>
#include <Vcl.DBGrids.hpp>
#include <Vcl.ExtCtrls.hpp>
#include <Vcl.Grids.hpp>

#include "Main.h"
#include <Data.Win.ADODB.hpp>
//---------------------------------------------------------------------------
class TForm13 : public TForm
{
__published:	// IDE-managed Components
	TPanel *Panel1;
	TDBGrid *DBGrid1;
	TEdit *Edit1;
	TComboBox *ComboBox1;
	TPanel *Panel2;
	TEdit *Edit3;
	TEdit *Edit4;
	TRadioGroup *RadioGroup1;
	TADOQuery *ADOQuery1;
	TDataSource *DataSource1;
	TLabel *Label1;
	TLabel *Label2;
	TLabel *Label3;
	TLabel *Label4;
	TButton *Button1;
	TPanel *Panel3;
	TLabel *Label5;
	TLabel *Label6;
	TEdit *Edit2;
	TEdit *Edit5;
	TLabel *Label7;
	TEdit *Edit6;
	TADOQuery *ADOQuery2;
	TPanel *Panel4;
	TLabel *Label8;
	TEdit *Edit7;
	TComboBox *ComboBox2;
	TLabel *Label9;
	void __fastcall RadioGroup1Click(TObject *Sender);
	void __fastcall FormActivate(TObject *Sender);
	void __fastcall Button1Click(TObject *Sender);
	void __fastcall DBGrid1CellClick(TColumn *Column);
	void __fastcall UpdateLen();
	void __fastcall DBGrid1DrawColumnCell(TObject *Sender, const TRect &Rect, int DataCol,
          TColumn *Column, TGridDrawState State);
	void __fastcall DBGrid1ColumnMoved(TObject *Sender, int FromIndex, int ToIndex);
	void __fastcall ComboBox1Change(TObject *Sender);

private:	// User declarations
public:		// User declarations
	__fastcall TForm13(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm13 *Form13;
//---------------------------------------------------------------------------
#endif
