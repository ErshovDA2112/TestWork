//---------------------------------------------------------------------------

#ifndef OtchetH
#define OtchetH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <Vcl.ComCtrls.hpp>
#include <System.ImageList.hpp>
#include <Vcl.ImgList.hpp>
#include <Vcl.ExtCtrls.hpp>
#include <Data.DB.hpp>
#include <Data.Win.ADODB.hpp>
#include <Vcl.DBGrids.hpp>
#include <Vcl.Grids.hpp>

//---------------------------------------------------------------------------
class TForm12 : public TForm
{
__published:	// IDE-managed Components
	TTreeView *TreeView1;
	TButton *Button2;
	TImageList *ImageList1;
	TLabel *Label1;
	TPanel *Panel1;
	TLabel *Label2;
	TLabel *Label3;
	TPageControl *PageControl1;
	TTabSheet *TabSheet1;
	TTabSheet *TabSheet2;
	TButton *Button1;
	TADOQuery *ADOQuery1;
	TDataSource *DataSource1;
	TDBGrid *DBGrid1;
	TButton *Button3;
	TADOQuery *ADOQuery3;
	TADOQuery *ADOQuery2;
	TComboBox *ComboBox1;
	TComboBox *ComboBox2;
	TComboBox *ComboBox3;
	TComboBox *ComboBox4;
	void __fastcall Button2Click(TObject *Sender);
	void __fastcall PoiskDS_0_4(String FisrtDS,String SecondDS, int TypeWork);
	void __fastcall PoiskDS_15_18(String FisrtDS,String SecondDS, int TypeWork);
	void __fastcall UpdateLen();
	void __fastcall CreateTreeView(AnsiString Dir, TTreeNode *Root);
	void __fastcall TreeView1Click(TObject *Sender);
	void __fastcall TreeView1GetSelectedIndex(TObject *Sender, TTreeNode *Node);
	void __fastcall TreeView1DblClick(TObject *Sender);
	void __fastcall FormActivate(TObject *Sender);
	void __fastcall Button1Click(TObject *Sender);
	void __fastcall DBGrid1ColumnMoved(TObject *Sender, int FromIndex, int ToIndex);
	void __fastcall DBGrid1DrawColumnCell(TObject *Sender, const TRect &Rect, int DataCol,
          TColumn *Column, TGridDrawState State);
	void __fastcall DBGrid1CellClick(TColumn *Column);
	void __fastcall Button3Click(TObject *Sender);
    void __fastcall InfoShet();

private:	// User declarations
public:		// User declarations
	__fastcall TForm12(TComponent* Owner);

};
//---------------------------------------------------------------------------
extern PACKAGE TForm12 *Form12;
//---------------------------------------------------------------------------
#endif
