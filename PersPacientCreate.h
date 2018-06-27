//---------------------------------------------------------------------------

#ifndef PersPacientCreateH
#define PersPacientCreateH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <Vcl.ComCtrls.hpp>
#include <Vcl.ExtCtrls.hpp>
#include <Vcl.Menus.hpp>
#include <Data.DB.hpp>
#include <Data.Win.ADODB.hpp>
#include <System.ImageList.hpp>
#include <Vcl.CategoryButtons.hpp>
#include <Vcl.DBGrids.hpp>
#include <Vcl.Grids.hpp>
#include <Vcl.ImgList.hpp>
#include <Vcl.WinXCtrls.hpp>
//---------------------------------------------------------------------------
class TForm9 : public TForm
{
__published:	// IDE-managed Components
	TButton *Button3;
	TButton *Button4;
	TEdit *Edit24;
	TGroupBox *GroupBox1;
	TLabel *Label13;
	TLabel *Label14;
	TLabel *Label15;
	TLabel *Label16;
	TLabel *Label17;
	TComboBox *ComboBox1;
	TEdit *Edit1;
	TEdit *Edit2;
	TEdit *Edit3;
	TGroupBox *GroupBox2;
	TLabel *Label19;
	TLabel *Label20;
	TLabel *Label21;
	TLabel *Label22;
	TComboBox *ComboBox2;
	TEdit *Edit5;
	TEdit *Edit6;
	TEdit *Edit7;
	TCheckBox *CheckBox6;
	TGroupBox *GroupBox3;
	TLabel *Label1;
	TLabel *Label18;
	TLabel *Label28;
	TComboBox *ComboBox4;
	TEdit *Edit11;
	TEdit *Edit4;
	TLabel *Label24;
	TLabel *Label29;
	TLabel *Label30;
	TEdit *Edit8;
	TButton *Button1;
	TButton *Button2;
	TGroupBox *GroupBox5;
	TLabel *Label25;
	TLabel *Label26;
	TLabel *Label27;
	TComboBox *ComboBox3;
	TEdit *Edit10;
	TEdit *Edit9;
	TLabel *Label32;
	TMainMenu *MainMenu1;
	TMenuItem *N1;
	TMenuItem *N2;
	TMenuItem *N3;
	TMenuItem *N4;
	TImageList *ImageList1;
	TSplitView *SplitView1;
	TCategoryButtons *CategoryButtons1;
	TPanel *Panel1;
	TPanel *Panel2;
	TADOQuery *ADOQuery1;
	TDataSource *DataSource1;
	TDBGrid *DBGrid1;
	TPanel *Panel3;
	TPanel *Panel4;
	TEdit *Edit12;
	TLabel *Label4;
	TADOQuery *ADOQuery2;
	TEdit *Edit13;
	TLabel *Label5;
	TEdit *Edit14;
	TLabel *Label6;
	TComboBox *ComboBox5;
	TComboBox *ComboBox6;
	TComboBox *ComboBox7;
	TLabel *Label3;
	TLabel *Label7;
	TGroupBox *GroupBox4;
	TGroupBox *GroupBox6;
	TLabel *Label8;
	TLabel *Label9;
	TLabel *Label10;
	TComboBox *ComboBox8;
	TComboBox *ComboBox9;
	TComboBox *ComboBox10;
	TGroupBox *GroupBox7;
	TADOQuery *ADOQuery3;
	TComboBox *ComboBox11;
	TLabel *Label11;
	TLabel *Label31;
	TLabel *Label33;
	TButton *Button6;
	TCheckBox *CheckBox1;
	TLabel *Label12;
	TLabel *Label2;
	TPanel *Panel5;
	TPanel *Panel6;
	TCheckBox *CheckBox2;
	TCheckBox *CheckBox3;
	TLabel *Label23;
	TEdit *Edit15;
	TLabel *Label34;
	TDBGrid *DBGrid4;
	TDataSource *DataSource4;
	TADOQuery *ADOQuery4;
	TLabel *Label35;
	TPanel *Panel7;
	TButton *Button5;
	TButton *Button7;
	TButton *Button8;
	TButton *Button9;
	TLabel *Label36;
	void __fastcall CategoryButtons1Categories0Items0Click(TObject *Sender);
	void __fastcall SplitView1Closed(TObject *Sender);
	void __fastcall SplitView1Opened(TObject *Sender);
	void __fastcall FormActivate(TObject *Sender);
	void __fastcall UpdateLen_Form9();
	void __fastcall UpdateLen_Pacient();
	void __fastcall DownLoadDBgrid1(String Data);
	void __fastcall ProverkaSnils(String SnilsData);
	void __fastcall InfoPacient();
	void __fastcall ClearDataForm();
	void __fastcall Request2(String Data);
	void __fastcall Function_R_DOST(String DataValue);
	void __fastcall Function_R_DOST_P(String DataValue);
	void __fastcall ChangeData();
	void __fastcall DBGrid4MyClick();
	void __fastcall SetMonthPacientIndex();
	void __fastcall SetMonthPredstavitelIndex();
	void __fastcall StatusErrosDost(String DataValue, int Type);
	void __fastcall StatusErrosDost_P(String DataValue, int Type);
	void __fastcall InfoSluch(String ItogData);
	void __fastcall SQL_Reqest_2(String Data);
	void __fastcall SQL_Reqest_3(String Data);
	void __fastcall CategoryButtons1Categories0Items1Click(TObject *Sender);
	void __fastcall CategoryButtons1Categories0Items2Click(TObject *Sender);
	void __fastcall CategoryButtons1Categories0Items3Click(TObject *Sender);
	void __fastcall DBGrid1CellClick(TColumn *Column);
	void __fastcall Edit11KeyPress(TObject *Sender, System::WideChar &Key);
	void __fastcall Edit11KeyUp(TObject *Sender, WORD &Key, TShiftState Shift);
	void __fastcall DBGrid1KeyUp(TObject *Sender, WORD &Key, TShiftState Shift);
	void __fastcall CheckBox6Click(TObject *Sender);
	void __fastcall ComboBox6Change(TObject *Sender);
	void __fastcall ComboBox9Change(TObject *Sender);
	void __fastcall Button1Click(TObject *Sender);
	void __fastcall Button2Click(TObject *Sender);
	void __fastcall Edit3Change(TObject *Sender);
	void __fastcall Edit5Change(TObject *Sender);
	void __fastcall Edit6Change(TObject *Sender);
	void __fastcall Edit7Change(TObject *Sender);
	void __fastcall Edit2Change(TObject *Sender);
	void __fastcall Edit1Change(TObject *Sender);
	void __fastcall ComboBox4Change(TObject *Sender);
	void __fastcall ComboBox3Change(TObject *Sender);
	void __fastcall ComboBox11Change(TObject *Sender);
	void __fastcall ComboBox7Change(TObject *Sender);
	void __fastcall ComboBox5Change(TObject *Sender);
	void __fastcall ComboBox10Change(TObject *Sender);
	void __fastcall ComboBox8Change(TObject *Sender);
	void __fastcall Edit8Change(TObject *Sender);
	void __fastcall Edit11Change(TObject *Sender);
	void __fastcall Edit4Change(TObject *Sender);
	void __fastcall Edit9Change(TObject *Sender);
	void __fastcall Edit10Change(TObject *Sender);
	void __fastcall Edit13Change(TObject *Sender);
	void __fastcall Edit14Change(TObject *Sender);
	void __fastcall Edit24Change(TObject *Sender);
	void __fastcall Button4Click(TObject *Sender);
	void __fastcall ComboBox6KeyPress(TObject *Sender, System::WideChar &Key);
	void __fastcall ComboBox9KeyPress(TObject *Sender, System::WideChar &Key);
	void __fastcall Button3Click(TObject *Sender);
	void __fastcall Edit1KeyPress(TObject *Sender, System::WideChar &Key);
	void __fastcall Button6Click(TObject *Sender);
	void __fastcall Edit2KeyPress(TObject *Sender, System::WideChar &Key);
	void __fastcall Edit3KeyPress(TObject *Sender, System::WideChar &Key);
	void __fastcall ComboBox5KeyPress(TObject *Sender, System::WideChar &Key);
	void __fastcall ComboBox8KeyPress(TObject *Sender, System::WideChar &Key);
	void __fastcall ComboBox7KeyPress(TObject *Sender, System::WideChar &Key);
	void __fastcall ComboBox10KeyPress(TObject *Sender, System::WideChar &Key);
	void __fastcall CheckBox1Click(TObject *Sender);
	void __fastcall Edit14KeyPress(TObject *Sender, System::WideChar &Key);
	void __fastcall Edit10KeyPress(TObject *Sender, System::WideChar &Key);
	void __fastcall Edit4KeyPress(TObject *Sender, System::WideChar &Key);
	void __fastcall CategoryButtons1Categories0Items4Click(TObject *Sender);
	void __fastcall DBGrid1DblClick(TObject *Sender);
	void __fastcall ComboBox3KeyUp(TObject *Sender, WORD &Key, TShiftState Shift);
	void __fastcall ComboBox4KeyUp(TObject *Sender, WORD &Key, TShiftState Shift);
	void __fastcall DBGrid1DrawColumnCell(TObject *Sender, const TRect &Rect, int DataCol,
          TColumn *Column, TGridDrawState State);
	void __fastcall Edit12Change(TObject *Sender);
	void __fastcall CheckBox2Click(TObject *Sender);
	void __fastcall CheckBox3Click(TObject *Sender);
	void __fastcall ComboBox2KeyUp(TObject *Sender, WORD &Key, TShiftState Shift);
	void __fastcall CheckBox2Exit(TObject *Sender);
	void __fastcall FormKeyPress(TObject *Sender, System::WideChar &Key);
	void __fastcall CheckBox2KeyPress(TObject *Sender, System::WideChar &Key);
	void __fastcall ComboBox1KeyPress(TObject *Sender, System::WideChar &Key);
	void __fastcall ComboBox11KeyPress(TObject *Sender, System::WideChar &Key);
	void __fastcall ComboBox1KeyUp(TObject *Sender, WORD &Key, TShiftState Shift);
	void __fastcall ComboBox11KeyUp(TObject *Sender, WORD &Key, TShiftState Shift);
	void __fastcall FormResize(TObject *Sender);
	void __fastcall ComboBox4KeyPress(TObject *Sender, System::WideChar &Key);
	void __fastcall Edit13KeyPress(TObject *Sender, System::WideChar &Key);
	void __fastcall ComboBox3KeyPress(TObject *Sender, System::WideChar &Key);
	void __fastcall Edit9KeyPress(TObject *Sender, System::WideChar &Key);
	void __fastcall Edit8KeyPress(TObject *Sender, System::WideChar &Key);
	void __fastcall CheckBox1KeyPress(TObject *Sender, System::WideChar &Key);
	void __fastcall Edit24KeyPress(TObject *Sender, System::WideChar &Key);
	void __fastcall Edit5KeyPress(TObject *Sender, System::WideChar &Key);
	void __fastcall Edit6KeyPress(TObject *Sender, System::WideChar &Key);
	void __fastcall Edit7KeyPress(TObject *Sender, System::WideChar &Key);
	void __fastcall ComboBox2KeyPress(TObject *Sender, System::WideChar &Key);
	void __fastcall CheckBox3KeyPress(TObject *Sender, System::WideChar &Key);
	void __fastcall CheckBox6KeyPress(TObject *Sender, System::WideChar &Key);
	void __fastcall DBGrid1ColumnMoved(TObject *Sender, int FromIndex, int ToIndex);
	void __fastcall CategoryButtons1Categories0Items5Click(TObject *Sender);
	void __fastcall DBGrid1TitleClick(TColumn *Column);
	void __fastcall DBGrid4DrawColumnCell(TObject *Sender, const TRect &Rect, int DataCol,
          TColumn *Column, TGridDrawState State);
	void __fastcall Button5Click(TObject *Sender);
	void __fastcall Button7Click(TObject *Sender);
	void __fastcall Button8Click(TObject *Sender);
	void __fastcall DBGrid4ColumnMoved(TObject *Sender, int FromIndex, int ToIndex);
	void __fastcall DBGrid4CellClick(TColumn *Column);
	void __fastcall Edit15KeyPress(TObject *Sender, System::WideChar &Key);
	void __fastcall Edit12KeyPress(TObject *Sender, System::WideChar &Key);
	void __fastcall Edit10KeyUp(TObject *Sender, WORD &Key, TShiftState Shift);
	void __fastcall Button9Click(TObject *Sender);





private:	// User declarations
public:		// User declarations
	__fastcall TForm9(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm9 *Form9;
//---------------------------------------------------------------------------
#endif
