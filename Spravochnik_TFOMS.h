//---------------------------------------------------------------------------

#ifndef Spravochnik_TFOMSH
#define Spravochnik_TFOMSH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <Vcl.ExtCtrls.hpp>
#include <Vcl.Menus.hpp>
#include <Vcl.Buttons.hpp>
#include <System.ImageList.hpp>
#include <Vcl.ImgList.hpp>
#include <Vcl.DBCtrls.hpp>
#include <Data.DB.hpp>
#include <Vcl.DBGrids.hpp>
#include <Vcl.Grids.hpp>
#include <Data.Win.ADODB.hpp>
#include <System.Character.hpp>
//---------------------------------------------------------------------------
class Tmo_lpu_1 : public TForm
{
__published:	// IDE-managed Components
	TPanel *Panel1;
	TPanel *Panel2;
	TPanel *Panel3;
	TEdit *Edit1;
	TDBGrid *DBGrid1;
	TButton *Button3;
	TLabel *Label1;
	TDataSource *DataSource1;
	TADOQuery *ADOQuery1;
	TLabel *Label2;
	TButton *Button1;
	TDBGrid *DBGrid2;
	TLabel *Label3;
	TDataSource *DataSource2;
	TADOQuery *ADOQuery2;
	TADOQuery *ADOQuery3;
	TDataSource *DataSource3;
	void __fastcall FormActivate(TObject *Sender);
	void __fastcall Button3Click(TObject *Sender);
	void __fastcall Button1Click(TObject *Sender);
	void __fastcall RefreshChecked();
	void __fastcall UpdateChecked(int checked);
	void __fastcall Edit1Change(TObject *Sender);
	void __fastcall DBGrid2ColumnMoved(TObject *Sender, int FromIndex, int ToIndex);
	void __fastcall DBGrid1ColumnMoved(TObject *Sender, int FromIndex, int ToIndex);


private:	// User declarations
public:		// User declarations
	__fastcall Tmo_lpu_1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE Tmo_lpu_1 *mo_lpu_1;
//---------------------------------------------------------------------------
#endif
