//---------------------------------------------------------------------------

#ifndef MainFormMOH
#define MainFormMOH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <Data.DB.hpp>
#include <Data.Win.ADODB.hpp>
#include <Vcl.DBGrids.hpp>
#include <Vcl.Grids.hpp>
#include <Vcl.Menus.hpp>
#include <Vcl.ComCtrls.hpp>
#include <Vcl.ToolWin.hpp>
#include <Vcl.ExtCtrls.hpp>
#include <Vcl.Buttons.hpp>
#include <Vcl.WinXCtrls.hpp>
#include <Vcl.CategoryButtons.hpp>
#include <System.Actions.hpp>
#include <System.ImageList.hpp>
#include <Vcl.ActnList.hpp>
#include <Vcl.ImgList.hpp>
#include <Vcl.DBCGrids.hpp>
//---------------------------------------------------------------------------
class Tmo_main : public TForm
{
__published:	// IDE-managed Components
	TADOConnection *ADOConnection1;
	TADOQuery *ADOQuery1;
	TADOQuery *ADOQuery2;
	TDataSource *DataSource1;
	TMainMenu *MainMenu1;
	TDBGrid *DBGrid1;
	TMenuItem *N1;
	TMenuItem *N2;
	TMenuItem *N3;
	TMenuItem *N5;
	TMenuItem *N6;
	TMenuItem *N7;
	TMenuItem *N8;
	TMenuItem *N9;
	TMenuItem *N10;
	TMenuItem *N11;
	TMenuItem *N12;
	TMenuItem *N15;
	TMenuItem *N16;
	TSplitView *SplitView1;
	TCategoryButtons *CategoryButtons1;
	TImageList *ImageList1;
	TPanel *Panel1;
	TMenuItem *N18;
	TMenuItem *N19;
	TMenuItem *N20;
	TMenuItem *N21;
	TMenuItem *oms1;
	TMenuItem *xml1;
	TMenuItem *xls1;
	TMenuItem *N26;
	TMenuItem *N27;
	TMenuItem *N28;
	TMenuItem *N29;
	TMenuItem *N30;
	TMenuItem *N4;
	TMenuItem *N31;
	TMenuItem *N32;
	TPanel *Panel2;
	TPanel *Panel3;
	TLabel *Label1;
	TPanel *Panel4;
	TPanel *Panel5;
	TEdit *Edit12;
	TLabel *Label27;
	TMenuItem *N13;
	void __fastcall FormActivate(TObject *Sender);
	void __fastcall N11Click(TObject *Sender);
    void __fastcall KMenu_Click (TObject* Sender);
	void __fastcall YEAR_Click (TObject *Sender);
	void __fastcall MONTH_Click (TObject *Sender);
	void __fastcall N8Click(TObject *Sender);
	void __fastcall N12Click(TObject *Sender);
	void __fastcall N9Click(TObject *Sender);
	void __fastcall N10Click(TObject *Sender);
	void __fastcall N16Click(TObject *Sender);
	void __fastcall N17Click(TObject *Sender);
	void __fastcall Image1Click(TObject *Sender);
	void __fastcall SplitView1Opened(TObject *Sender);
	void __fastcall SplitView1Closed(TObject *Sender);
	void __fastcall ProverkaPers();
	void __fastcall DBGrid1DrawColumnCell(TObject *Sender, const TRect &Rect, int DataCol,
          TColumn *Column, TGridDrawState State);
	void __fastcall DBGrid1DblClick(TObject *Sender);
	void __fastcall N20Click(TObject *Sender);
	void __fastcall N21Click(TObject *Sender);
	void __fastcall N19Click(TObject *Sender);
	void __fastcall EDAFunctionYearButtonDelete(TObject* Sender);
	void __fastcall EDAFunctionYearButtonCreate(TObject* Sender);
	void __fastcall CategoryButtons1Categories0Items0Click(TObject *Sender);
	void __fastcall CategoryButtons1Categories0Items1Click(TObject *Sender);
	void __fastcall CategoryButtons1Categories0Items3Click(TObject *Sender);
	void __fastcall CategoryButtons1Categories0Items2Click(TObject *Sender);
	void __fastcall DBGrid1CellClick(TColumn *Column);
	void __fastcall EDACreateButtonItem(TObject* Sender);
	void __fastcall EDACreateLabel(TObject* Sender, String stistica, int vertical, int TypeName);
	void __fastcall CategoryButtons1Categories0Items8Click(TObject *Sender);
	void __fastcall DBGrid1KeyUp(TObject *Sender, WORD &Key, TShiftState Shift);
	void __fastcall UpdateLen();
	void __fastcall CategoryButtons1Categories0Items9Click(TObject *Sender);
	void __fastcall CategoryButtons1Categories0Items7Click(TObject *Sender);
	void __fastcall CategoryButtons1Categories0Items4Click(TObject *Sender);
	void __fastcall Edit12Change(TObject *Sender);
	void __fastcall CategoryButtons1Categories0Items10Click(TObject *Sender);
	void __fastcall DBGrid1TitleClick(TColumn *Column);
	void __fastcall FormResize(TObject *Sender);
	void __fastcall DBGrid1ColumnMoved(TObject *Sender, int FromIndex, int ToIndex);
	void __fastcall N5Click(TObject *Sender);
	void __fastcall N13Click(TObject *Sender);
	void __fastcall N27Click(TObject *Sender);
	void __fastcall CategoryButtons1Categories0Items6Click(TObject *Sender);
	void __fastcall N31Click(TObject *Sender);



private:	// User declarations
public:		// User declarations
	__fastcall Tmo_main(TComponent* Owner);


};
//---------------------------------------------------------------------------
extern PACKAGE Tmo_main *mo_main;
struct StyleF{
	TColor 	Color_Select_Line,
			Color_Select_Text;

	TFont   *Font_Grid,
			*Font_Window;

	int     Size_Font_Grid,
			Size_Font_Window;

};
//---------------------------------------------------------------------------
#endif
