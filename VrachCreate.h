//---------------------------------------------------------------------------

#ifndef VrachCreateH
#define VrachCreateH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <Data.DB.hpp>
#include <Vcl.DBGrids.hpp>
#include <Vcl.ExtCtrls.hpp>
#include <Vcl.Grids.hpp>
#include <Data.Win.ADODB.hpp>
#include <Vcl.CategoryButtons.hpp>
#include <Vcl.ButtonGroup.hpp>
#include <Vcl.ComCtrls.hpp>
#include <Vcl.Menus.hpp>
#include <System.ImageList.hpp>
#include <Vcl.ImgList.hpp>
#include <Vcl.WinXCtrls.hpp>
//---------------------------------------------------------------------------
class Tmo_doctors : public TForm
{
__published:	// IDE-managed Components

	TPanel *Panel3;
	TPanel *Panel4;
	TDBGrid *DBGrid1;
	TADOQuery *ADOQuery1;
	TDataSource *DataSource1;
	TLabel *Label1;
	TLabel *Label2;
	TLabel *Label3;
	TLabel *Label4;
	TLabel *Label5;
	TDBGrid *DBGrid2;
	TLabel *Label8;
	TEdit *Edit1;
	TEdit *Edit2;
	TEdit *Edit3;
	TEdit *Edit4;
	TEdit *Edit5;
	TButton *Button1;
	TLabel *Label9;
	TComboBox *ComboBox1;
	TDateTimePicker *DateTimePicker1;
	TLabel *Label10;
	TLabel *Label11;
	TButton *Button2;
	TLabel *Label13;
	TEdit *Edit8;
	TEdit *Edit9;
	TLabel *Label14;
	TADOQuery *ADOQuery2;
	TDataSource *DataSource2;
	TImageList *ImageList1;
	TSplitView *SplitView1;
	TCategoryButtons *CategoryButtons1;
	TPanel *Panel1;
	TPanel *Panel2;
	TLabel *Label6;
	TADOQuery *ADOQuery3;
	TLabel *Label7;
	TLabel *Label12;
	TLabel *Label15;
	TEdit *Edit6;
	TEdit *Edit7;
	TLabel *Label16;
	TButton *Button3;
	TEdit *Edit10;
	TLabel *Label17;
	TButton *Button4;
	TPanel *Panel5;
	TButton *Button5;
	TPanel *Panel6;
	TComboBox *ComboBox2;
	TDBGrid *DBGrid4;
	TButton *Button6;
	TButton *Button7;
	TButton *Button8;
	TLabel *Label19;
	TLabel *Label20;
	TDataSource *DataSource4;
	TADOQuery *ADOQuery4;
	TLabel *Label18;
	TGroupBox *GroupBox4;
	TLabel *Label21;
	TLabel *Label22;
	TLabel *Label23;
	TComboBox *ComboBox3;
	TComboBox *ComboBox4;
	TComboBox *ComboBox5;
	TGroupBox *GroupBox1;
	TLabel *Label24;
	TLabel *Label25;
	TLabel *Label26;
	TComboBox *ComboBox6;
	TComboBox *ComboBox7;
	TComboBox *ComboBox8;
	TPanel *Panel7;
	TEdit *Edit12;
	TLabel *Label27;
	TPanel *Panel8;
	TPanel *Panel9;
	TCheckBox *CheckBox1;
	TADOQuery *ADOQuery5;

	void __fastcall FormActivate(TObject *Sender);
	void __fastcall Button1Click(TObject *Sender);
	void __fastcall Button2Click(TObject *Sender);
	void __fastcall DateTimePicker1Change(TObject *Sender);
	void __fastcall DBGrid1CellClick(TColumn *Column);
	//void __fastcall N1Click(TObject *Sender);
	//void __fastcall N2Click(TObject *Sender);
	//void __fastcall N3Click(TObject *Sender);
//	void __fastcall N6Click(TObject *Sender);
  //	void __fastcall N8Click(TObject *Sender);
	void __fastcall UpdateLen();
	void __fastcall ProverkaSnils(String SnilsData);
	void __fastcall UpdateData();
	void __fastcall ChangeData();
	void __fastcall PozDoc(int DataValue);
    void __fastcall WidthForm(int Type);
	void __fastcall SetMonthPacientIndex();
	void __fastcall SetMonthPredstavitelIndex();
	void __fastcall UpdateDataPanel5();
	void __fastcall StartSQL(String SQLString);
	void __fastcall UpdateSertivifat();
	void __fastcall DolUpdate();
	void __fastcall ActiveButton5();
	void __fastcall ActiveButton1();
	void __fastcall ValidSertuifikat();
	//void __fastcall UpdateColumnLen(int ColumnId, int Maximum);
	void __fastcall CategoryButtons1Categories0Items0Click(TObject *Sender);
	void __fastcall SplitView1Closed(TObject *Sender);
	void __fastcall SplitView1Opened(TObject *Sender);
	void __fastcall CategoryButtons1Categories0Items3Click(TObject *Sender);
	void __fastcall CategoryButtons1Categories0Items1Click(TObject *Sender);
	void __fastcall CategoryButtons1Categories0Items2Click(TObject *Sender);
	void __fastcall CategoryButtons1Categories0Items5Click(TObject *Sender);
	void __fastcall Button3Click(TObject *Sender);
	void __fastcall DBGrid2CellClick(TColumn *Column);
	void __fastcall Button5Click(TObject *Sender);
	void __fastcall Button4Click(TObject *Sender);
	void __fastcall CategoryButtons1Categories0Items6Click(TObject *Sender);
	void __fastcall CategoryButtons1Categories0Items4Click(TObject *Sender);
	void __fastcall DBGrid1KeyUp(TObject *Sender, WORD &Key, TShiftState Shift);
	void __fastcall Edit4KeyPress(TObject *Sender, System::WideChar &Key);
	void __fastcall Edit1KeyPress(TObject *Sender, System::WideChar &Key);
	void __fastcall Edit4KeyUp(TObject *Sender, WORD &Key, TShiftState Shift);
	void __fastcall Button6Click(TObject *Sender);
	void __fastcall Button7Click(TObject *Sender);
	void __fastcall Button8Click(TObject *Sender);
	void __fastcall Edit2KeyPress(TObject *Sender, System::WideChar &Key);
	void __fastcall Edit3KeyPress(TObject *Sender, System::WideChar &Key);
	void __fastcall Edit6KeyPress(TObject *Sender, System::WideChar &Key);
	void __fastcall Edit10Change(TObject *Sender);
	void __fastcall Edit9Change(TObject *Sender);
	void __fastcall Edit6Change(TObject *Sender);
	void __fastcall Edit1Change(TObject *Sender);
	void __fastcall Edit2Change(TObject *Sender);
	void __fastcall Edit4Change(TObject *Sender);
	void __fastcall Edit5KeyPress(TObject *Sender, System::WideChar &Key);
	void __fastcall ComboBox4Change(TObject *Sender);
	void __fastcall ComboBox7Change(TObject *Sender);
	void __fastcall ComboBox3Change(TObject *Sender);
	void __fastcall ComboBox3KeyPress(TObject *Sender, System::WideChar &Key);
	void __fastcall ComboBox5Change(TObject *Sender);
	void __fastcall ComboBox4KeyPress(TObject *Sender, System::WideChar &Key);
	void __fastcall ComboBox5KeyPress(TObject *Sender, System::WideChar &Key);
	void __fastcall ComboBox6Change(TObject *Sender);
	void __fastcall ComboBox7KeyPress(TObject *Sender, System::WideChar &Key);
	void __fastcall ComboBox8KeyPress(TObject *Sender, System::WideChar &Key);
	void __fastcall ComboBox6KeyPress(TObject *Sender, System::WideChar &Key);
	void __fastcall ComboBox8Change(TObject *Sender);
	void __fastcall DBGrid1DrawColumnCell(TObject *Sender, const TRect &Rect, int DataCol,
          TColumn *Column, TGridDrawState State);
	void __fastcall CategoryButtons1Categories0Items7Click(TObject *Sender);
	void __fastcall Edit12Change(TObject *Sender);
	void __fastcall Edit8Change(TObject *Sender);
	void __fastcall Edit5Change(TObject *Sender);
	void __fastcall Edit3Change(TObject *Sender);
	void __fastcall CheckBox1Click(TObject *Sender);
	void __fastcall DBGrid1TitleClick(TColumn *Column);
	void __fastcall Edit8KeyPress(TObject *Sender, System::WideChar &Key);
	void __fastcall DBGrid1ColumnMoved(TObject *Sender, int FromIndex, int ToIndex);
	void __fastcall DBGrid4ColumnMoved(TObject *Sender, int FromIndex, int ToIndex);
	void __fastcall DBGrid2ColumnMoved(TObject *Sender, int FromIndex, int ToIndex);
	void __fastcall FormKeyPress(TObject *Sender, System::WideChar &Key);
	void __fastcall ComboBox1KeyPress(TObject *Sender, System::WideChar &Key);
	void __fastcall Edit10KeyPress(TObject *Sender, System::WideChar &Key);
	void __fastcall CheckBox1KeyPress(TObject *Sender, System::WideChar &Key);
	void __fastcall ComboBox2KeyPress(TObject *Sender, System::WideChar &Key);
	void __fastcall Edit9KeyPress(TObject *Sender, System::WideChar &Key);
	void __fastcall DateTimePicker1KeyPress(TObject *Sender, System::WideChar &Key);
	void __fastcall Edit7KeyPress(TObject *Sender, System::WideChar &Key);






private:	// User declarations
public:		// User declarations
	__fastcall Tmo_doctors(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE Tmo_doctors *mo_doctors;
//---------------------------------------------------------------------------
#endif
