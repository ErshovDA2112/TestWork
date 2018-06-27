#ifndef Unit10H
#define Unit10H
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <Vcl.ComCtrls.hpp>
#include <Vcl.ExtCtrls.hpp>
#include <Data.DB.hpp>
#include <Data.Win.ADODB.hpp>
//---------------------------------------------------------------------------
class TForm10 : public TForm
{
__published:    // IDE-managed Components
    TTreeView *TreeView1;
    TPanel *Panel1;
    TPanel *Panel2;
    TScrollBox *ScrollBox1;
    TButton *Button1;
    TADOQuery *ADOQuery1;
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
private:    // User declarations
public:     // User declarations
    __fastcall TForm10(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm10 *Form10;
//---------------------------------------------------------------------------
#endif
