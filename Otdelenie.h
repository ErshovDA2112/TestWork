//---------------------------------------------------------------------------

#ifndef OtdelenieH
#define OtdelenieH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <Vcl.ExtCtrls.hpp>
#include <Data.DB.hpp>
#include <Data.Win.ADODB.hpp>
#include <Vcl.DBGrids.hpp>
#include <Vcl.Grids.hpp>
//---------------------------------------------------------------------------
class Tmo_podr : public TForm
{
__published:	// IDE-managed Components
	TPanel *Panel1;
	TPanel *Panel2;
	TPanel *Panel3;
	TDataSource *DataSource2;
	TDataSource *DataSource1;
	TADOQuery *ADOQuery1;
	TADOQuery *ADOQuery2;
	TDBGrid *DBGrid1;
	TDBGrid *DBGrid2;
	TButton *Button1;
	TButton *Button2;
	TButton *Button3;
	TEdit *Edit1;
	TButton *Button7;
	TCheckBox *CheckBox1;
	TEdit *Edit3;
	TPanel *Panel4;
	TButton *Button4;
	TButton *Button5;
	TButton *Button6;
	TLabel *Label1;
	TLabel *Label2;
	TLabel *Label3;
	TLabel *Label4;
	TComboBox *ComboBox1;
	TLabel *Label5;
	TPanel *Panel5;
	TLabel *Label6;
	TLabel *Label7;
	TLabel *Label8;
	TCheckBox *CheckBox2;
	TEdit *Edit2;
	TEdit *Edit4;
	TButton *Button8;
	TComboBox *ComboBox2;
	TLabel *Label9;
	TLabel *Label10;
	TADOQuery *ADOQuery3;
	void __fastcall UpdateLen_Podrazdelenie();
	void __fastcall UpdateLen_Otdelenie();
	void __fastcall DouwnLoadDoctorsPodzazdelenue();
	void __fastcall DouwnLoadDoctorsOtdelenue();
	void __fastcall FormMouseWheel(TObject *Sender, TShiftState Shift, int WheelDelta,
          TPoint &MousePos, bool &Handled);
	void __fastcall FormActivate(TObject *Sender);
	void __fastcall DBGrid1DrawColumnCell(TObject *Sender, const TRect &Rect, int DataCol,
          TColumn *Column, TGridDrawState State);
	void __fastcall DBGrid2DrawColumnCell(TObject *Sender, const TRect &Rect, int DataCol,
          TColumn *Column, TGridDrawState State);
	void __fastcall Button2Click(TObject *Sender);
	void __fastcall Button3Click(TObject *Sender);
	void __fastcall Button5Click(TObject *Sender);
	void __fastcall Button4Click(TObject *Sender);
	void __fastcall DBGrid1CellClick(TColumn *Column);
	void __fastcall DBGrid2CellClick(TColumn *Column);
	void __fastcall Edit1Change(TObject *Sender);
	void __fastcall Edit3Change(TObject *Sender);
	void __fastcall Edit2Change(TObject *Sender);
	void __fastcall Edit4Change(TObject *Sender);
	void __fastcall Button7Click(TObject *Sender);
	void __fastcall Button8Click(TObject *Sender);
	void __fastcall ComboBox1Change(TObject *Sender);
	void __fastcall ComboBox2Change(TObject *Sender);
	void __fastcall Button1Click(TObject *Sender);
	void __fastcall Button6Click(TObject *Sender);
	void __fastcall DBGrid1KeyUp(TObject *Sender, WORD &Key, TShiftState Shift);
	void __fastcall DBGrid2KeyUp(TObject *Sender, WORD &Key, TShiftState Shift);
	void __fastcall DBGrid1TitleClick(TColumn *Column);
	void __fastcall DBGrid2TitleClick(TColumn *Column);
	void __fastcall DBGrid1ColumnMoved(TObject *Sender, int FromIndex, int ToIndex);
	void __fastcall DBGrid2ColumnMoved(TObject *Sender, int FromIndex, int ToIndex);


private:	// User declarations
public:		// User declarations
	__fastcall Tmo_podr(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE Tmo_podr *mo_podr;
//---------------------------------------------------------------------------
#endif
