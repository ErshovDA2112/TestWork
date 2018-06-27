
#ifndef Unit11H
#define Unit11H
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <Vcl.ComCtrls.hpp>
#include <Vcl.ExtCtrls.hpp>
#include <Data.DB.hpp>
#include <Data.Win.ADODB.hpp>
#include <Vcl.DBGrids.hpp>
#include <Vcl.Grids.hpp>
//---------------------------------------------------------------------------
class TForm11 : public TForm
{
__published:    // IDE-managed Components
    TPanel *Panel1;
    TScrollBox *ScrollBox1;
    TButton *Button1;
    TADOQuery *ADOQuery1;
	TEdit *Edit1;
	TLabel *Label1;
	TButton *Button2;
	TDBGrid *DBGrid1;
	TDataSource *DataSource1;
	TPanel *Panel2;
	TPanel *Panel4;
	TADOQuery *ADOQuery2;
	TDataSource *DataSource2;
	TButton *Button3;
	TButton *Button4;
	TButton *Button5;
	void __fastcall UpdateLen_Form11();
	void __fastcall ZagruzkaData();
	void __fastcall FormActivate(TObject *Sender);
    void __fastcall Button1Click(TObject *Sender);
    void __fastcall LabelOKATOCLICK(TObject *Sender);
    void __fastcall LabelOKATOCLICK2(TObject *Sender);
    void __fastcall LabelOKATOMOUSEENTER(TObject *Sender);
    void __fastcall LabelOKATOMOUSELEAVE(TObject *Sender);
    void __fastcall LabelOKATOMOUSEENTER2(TObject *Sender);
    void __fastcall LabelOKATOMOUSELEAVE2(TObject *Sender);
    void __fastcall FormCloseQuery(TObject *Sender, bool &CanClose);
    void __fastcall FormMouseWheel(TObject *Sender, TShiftState Shift, int WheelDelta,
          TPoint &MousePos, bool &Handled);
	void __fastcall Edit1Change(TObject *Sender);
	void __fastcall Button2Click(TObject *Sender);
	void __fastcall DBGrid1DblClick(TObject *Sender);
	void __fastcall Edit1KeyUp(TObject *Sender, WORD &Key, TShiftState Shift);
	void __fastcall DBGrid1KeyUp(TObject *Sender, WORD &Key, TShiftState Shift);
	void __fastcall DBGrid1DrawColumnCell(TObject *Sender, const TRect &Rect, int DataCol,
          TColumn *Column, TGridDrawState State);
	void __fastcall FormClose(TObject *Sender, TCloseAction &Action);
	void __fastcall ScrollBox1MouseWheel(TObject *Sender, TShiftState Shift, int WheelDelta,
          TPoint &MousePos, bool &Handled);
	void __fastcall ScrollBox1Click(TObject *Sender);
	void __fastcall Button3Click(TObject *Sender);
	void __fastcall Button5Click(TObject *Sender);
	void __fastcall Button4Click(TObject *Sender);
	void __fastcall FormKeyPress(TObject *Sender, System::WideChar &Key);
	void __fastcall DBGrid1ColumnMoved(TObject *Sender, int FromIndex, int ToIndex);

private:    // User declarations
public:     // User declarations
    __fastcall TForm11(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm11 *Form11;
//---------------------------------------------------------------------------
#endif
