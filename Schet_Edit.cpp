//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Schet_Edit.h"
#include "Main.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
Tmo_schet *mo_schet;
 F3 Fun_3;

 struct R_SCHET {String _id,
						CODE,
						CODE_MO,
						YEAR,
						MONTH,
						NSCHET,
						DSCHET,
						PLAT,
						SUMMAV,
						COMMENTS,
						SUMMAP,
						SANK_MEK,
						SANK_MEE,
						SANK_EKMP,
						DISP,
						FILENAME,
						SD_Z,
						IS_HMP;
				} SCHET;

 char date [80];    // Значение даты в формате YYYYMMDD
 char year [5];       // Значение года в системе
 char month [3];      // Значение текущего месяца
 char day [3];        // Значение текущего дня
 int id_up;
 String s_date;
 String s_year;
 String s_month;
 String s_day;
 String s_end_day;      // Значение последнего дня месяца
 String s_end_date;     // Значение даты для создания нового счета
 String region;         // Переменная содержит в себе выбранный регион в реальном времени
 String CODE, CODE_MO;
//---------------------------------------------------------------------------
__fastcall Tmo_schet::Tmo_schet(TComponent* Owner)
    : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall Tmo_schet::FormActivate(TObject *Sender)
{
    mo_schet->Edit3->Text = "";
    mo_schet->ComboBox1->Text ="";
	mo_schet->CheckBox1->Checked = false;
    mo_schet->CheckBox2->Checked = false;

	this->Edit4->Visible = false;

    //mo_schet->Caption = "Добавление счёта";
    //-------------- Определение текущего времени ------------------------------
    time_t rawtime;
	struct tm * timeinfo;
	time ( &rawtime );
	timeinfo = localtime ( &rawtime );
	strftime (date,80,"%Y%m%d",timeinfo);
	strftime (year,5,"%Y",timeinfo);
	strftime (month,3,"%m",timeinfo);
    strftime (day,3,"%d",timeinfo);

    mo_schet->Edit1->Text = year;
    mo_schet->Edit2->Text = month;
    s_year = mo_schet->Edit1->Text;
	s_month = mo_schet->Edit2->Text;

    Fun_3.QuickSearch_F3("SELECT [IDDT]                            \
                          FROM [SPR_V016]                          \
						  where DATEBEG <= GetDate() and (DATEEND > GetDate() or DATEEND is null)", "IDDT", "ComboBox", 1);

	//Добавление кода МО
    //Вопрос как быть если их несколько
    do
	{
		Fun_3.OpenSQL("SELECT SETTINGS._mcod   \
					   FROM SETTINGS  ");
		if (mo_main->ADOQuery2->RecordCount > 0)
		{
			mo_main->ADOQuery2->Open();
			mo_main->ADOQuery2->First();
			SCHET.CODE_MO = mo_main->ADOQuery2->FieldByName(mo_main->ADOQuery2->Fields->Fields[0]->FieldName)->AsString;

			if (SCHET.CODE_MO == "")
			{
				HWND hWnd = GetForegroundWindow();
				MessageBoxA(hWnd, "Медицинская организация не назначена. \n Выберите Вашу медицинскую организацию.", "Внимание!", MB_OK);
				mo_select_mo->ShowModal();
			}
		}
    }
    while (SCHET.CODE_MO == "");

    //----- Добавление или изменение Счета -------------------------------------
	if (mo_schet->Caption == "Изменение реквизитов счёта")
	{
		int i;
        id_up = mo_main->DBGrid1->DataSource->DataSet->Fields->Fields[0]->Value;

		Fun_3.OpenSQL("SELECT 	[YEAR],     \
								[MONTH],    \
								[DISP],     \
								[COMMENTS], \
								[IS_HMP], 	\
								[NSCHET],   \
								[CODE],     \
								[CODE_MO]   \
					   FROM R_SCHET         \
					   WHERE [_id]='" + IntToStr(id_up) + "'");
		mo_schet->Edit1->Text = SCHET.YEAR = mo_main->ADOQuery2->FieldByName("YEAR")->AsString;
		mo_schet->Edit2->Text = SCHET.MONTH = mo_main->ADOQuery2->FieldByName("MONTH")->AsString;

		CODE    = mo_main->ADOQuery2->FieldByName("CODE")->AsString;
		CODE_MO = mo_main->ADOQuery2->FieldByName("CODE_MO")->AsString;

		if (SCHET.MONTH.Length() == 1)
        {
			mo_schet->Edit2->Text = SCHET.MONTH = "0" + SCHET.MONTH;
        }

		mo_schet->ComboBox1->Text = SCHET.DISP = mo_main->ADOQuery2->FieldByName("DISP")->AsString;
		mo_schet->Edit3->Text     = SCHET.CODE = mo_main->ADOQuery2->FieldByName("COMMENTS")->AsString;
		SCHET.IS_HMP              = mo_main->ADOQuery2->FieldByName("IS_HMP")->AsString;

        if (SCHET.IS_HMP == "1") mo_schet->CheckBox1->Checked = true;
		else mo_schet->CheckBox1->Checked = false;
		this->Edit1->Enabled = false;
		this->Edit2->Enabled = false;
		this->ComboBox1->Enabled = false;
		this->CheckBox1->Enabled = false;
		this->CheckBox2->Checked = true;
		this->Edit4->Visible = true;
		this->Edit4->Text = mo_main->ADOQuery2->FieldByName("NSCHET")->AsString;;
	}
}
//---------------------------------------------------------------------------
void __fastcall Tmo_schet::Button3Click(TObject *Sender)
{
	int i;
	String TT, Proverka;

	if (mo_schet->Caption == "Добавление счёта")
    {
        if ((mo_schet->Edit2->Text != "0") && (mo_schet->Edit2->Text.Length() == 1))
        {
            mo_schet->Edit2->Text = "0" + mo_schet->Edit2->Text;
        }

        if (
            (StrToInt(mo_schet->Edit1->Text) == 0) ||
            (mo_schet->Edit1->Text == "")          ||
            (mo_schet->Edit1->Text.Length() != 4)
           )
        {
            HWND hWnd = GetForegroundWindow();
            MessageBoxA(hWnd, "Введите отчетный год!", "Внимание!", MB_OK);
            mo_schet->Edit1->SetFocus();
			Abort();
        }

        if (
            (StrToInt(mo_schet->Edit2->Text) == 0)  ||
            (mo_schet->Edit2->Text == "")           ||
            (mo_schet->Edit2->Text.Length() != 2)
           )
        {
            HWND hWnd = GetForegroundWindow();
            MessageBoxA(hWnd, "Введите отчетный месяц!", "Внимание!", MB_OK);
            mo_schet->Edit2->SetFocus();
            Abort();
        }

		SCHET.CODE  = Fun_3.FindOneRowNotNull("SELECT top 1 [CODE],                  				\
															cast([CODE] as numeric(8,0) ) + 0 num    \
											   from [R_SCHET] order by _id desc","num");
		if (SCHET.CODE.Length() == 0) SCHET.CODE = "1";
		else SCHET.CODE = IntToStr(StrToInt(SCHET.CODE) + 1);

		SCHET.YEAR  = mo_schet->Edit1->Text;                                             //N4
		SCHET.MONTH = mo_schet->Edit2->Text;                                            //N2

		if (this->CheckBox2->Checked)
        {
			if (this->Edit4->Text.Length() > 0)
			{
				SCHET.NSCHET = "'" + mo_schet->Edit4->Text + "'";
			}
            else
            {
				HWND hWnd = GetForegroundWindow();
				MessageBoxA(hWnd, "Ошибка при ручном вводе номера счета!", "Внимание!", MB_OK);
				mo_schet->Edit4->SetFocus();
				Abort();
            }
        }
        else
		{
			for (i = SCHET.CODE.Length(); i < 8; i++)
            {
                TT += "0";
			}
            if (SCHET.CODE.ToInt() >= 100000000)
            {
				HWND hWnd = GetForegroundWindow();
				MessageBoxA(hWnd, "Возникло исключение, достигнуто максимальное \n значение счетов больше 99999999 в рамках одной МО!", "Внимание!", MB_OK);
                Abort();
            }
			SCHET.NSCHET = "'" + SCHET.CODE_MO + "-" + TT + SCHET.CODE + "'";
        }

		String Disp;                            //T15

        if (mo_schet->ComboBox1->Text != "")
        {
            SCHET.DISP = "'" + mo_schet->ComboBox1->Text + "'"; //T4
			Disp = " AND DISP = " + SCHET.DISP;
		}
		else
		{
			SCHET.DISP = "NULL";
			Disp = " AND DISP IS NULL";
        }

        s_year = mo_schet->Edit1->Text;
        s_month = mo_schet->Edit2->Text;
        s_end_day = IntToStr(MonthDays[IsLeapYear(StrToInt(s_year))][StrToInt(s_month)-1]);   // Определяем последний день в месяце
        s_end_date = s_year + s_month + s_end_day;

        String VMH;
		if (mo_schet->CheckBox1->Checked) VMH = "'1'";
		else VMH = "'0'";

		Proverka = "SELECT [_id] \
					FROM  R_SCHET \
					WHERE DSCHET = '" + s_year + "-" + s_month + "-" + s_end_day +"' AND IS_HMP = " + VMH  + Disp;


		Fun_3.OpenSQL(Proverka);
		if (mo_main->ADOQuery2->RecordCount != 0)
		{
			HWND hWnd = GetForegroundWindow();
			MessageBoxA(hWnd,"Создание повторного счета за \n    один период невозможно!", "Внимание!!!", MB_OK);
			Abort();
		}

		Proverka = "SELECT [_id] \
					FROM  R_SCHET \
					WHERE NSCHET = " + SCHET.NSCHET;

		Fun_3.OpenSQL(Proverka);
		if (mo_main->ADOQuery2->RecordCount != 0)
		{
			HWND hWnd = GetForegroundWindow();
			MessageBoxA(hWnd,"Создание счета c одинаковым названием невозможно!", "Внимание!!!", MB_OK);
			Abort();
		}



		if (mo_schet->Edit3->Text!="") SCHET.COMMENTS = "'" + mo_schet->Edit3->Text + "'";     //T250
        else SCHET.COMMENTS = "NULL";

		SCHET.SUMMAV = "0.00";                            //N15.2
		SCHET.DSCHET = "'" + s_end_date + "'";            //D
        SCHET.SD_Z = "0";

        if (mo_schet->CheckBox1->Checked == True) SCHET.IS_HMP = 1;
        else SCHET.IS_HMP = 0;//IS_HMP
		String ttemp = "INSERT INTO [R_SCHET]      \
									([CODE],        \
									 [CODE_MO],     \
									 [YEAR],        \
									 [MONTH],       \
									 [NSCHET],      \
									 [DSCHET],      \
									 [SUMMAV],      \
									 [DISP],        \
									 [COMMENTS],    \
									 [SD_Z],        \
									 [IS_HMP]) OUTPUT inserted._id\
						VALUES (" + SCHET.CODE      + ","
								  + SCHET.CODE_MO   + ","
								  + SCHET.YEAR      + ","
								  + SCHET.MONTH     + ","
								  + SCHET.NSCHET    + ","
								  + SCHET.DSCHET    + ","
								  + SCHET.SUMMAV    + ","
								  + SCHET.DISP      + ","
								  + SCHET.COMMENTS  + ","
								  + SCHET.SD_Z  	+ ","
								  + SCHET.IS_HMP    + ")";

        Fun_3.InsernSQL(ttemp);

        mo_schet->Close();

        Fun_3.OpenSQL_Grid_Refresh();
        Fun_3.Refresh_Button();
    }

	if (mo_schet->Caption == "Изменение реквизитов счёта")
	{
		if (this->CheckBox2->Checked == false)
		{
			String temp = CODE;
			temp = IntToStr(StrToInt(CODE) + 1);
			for (i = temp.Length(); i < 8; i++)
            {
                TT += "0";
			}
			if (temp.ToInt() >= 100000000)
            {
				HWND hWnd = GetForegroundWindow();
				MessageBoxA(hWnd, "Возникло исключение, достигнуто максимальное \n значение счетов больше 99999999 в рамках одной МО!", "Внимание!", MB_OK);
                Abort();
            }
			SCHET.NSCHET = "'" + CODE_MO + "-" + TT + CODE + "'";
		}
		else
		{
			if (mo_schet->Edit4->Text.Length() > 0)
			{
				SCHET.NSCHET = "'" + mo_schet->Edit4->Text + "'";
			}
			else
			{
				HWND hWnd = GetForegroundWindow();
				MessageBoxA(hWnd, "Ошибка при ручном вводе номера счете!", "Внимание!", MB_OK);
				mo_schet->Edit4->SetFocus();
				Abort();
            }
        }

		s_year     = SCHET.YEAR  = mo_schet->Edit1->Text;
		s_month    = SCHET.MONTH = mo_schet->Edit2->Text;
		s_end_day  = IntToStr(MonthDays[IsLeapYear(StrToInt(s_year))][StrToInt(s_month)-1]);   // Определяем последний день в месяце
		s_end_date = s_year + s_month + s_end_day;

		s_year  = mo_schet->Edit1->Text;                                                 //N4
        s_month = mo_schet->Edit2->Text;                                                //N2

		if (mo_schet->ComboBox1->Text!="") SCHET.DISP = "'" + mo_schet->ComboBox1->Text + "'"; //T4
        else SCHET.DISP = "NULL";

		if (mo_schet->Edit3->Text!="") SCHET.COMMENTS="'" + mo_schet->Edit3->Text + "'";     //T250
        else SCHET.COMMENTS = "NULL";

        SCHET.DSCHET = "'"+ s_end_date +"'";                                            //D
		if (mo_schet->CheckBox1->Checked == True) SCHET.IS_HMP = 1;
		else SCHET.IS_HMP = 0;//IS_HMP

		if (mo_schet->Edit4->Text.Length() == 0)
		{
			HWND hWnd = GetForegroundWindow();
			MessageBoxA(hWnd, "Ошибка при ручном вводе номера счета!", "Внимание!", MB_OK);
			mo_schet->Edit4->SetFocus();
			Abort();
		}

		Proverka = "SELECT [CODE] \
					FROM  R_SCHET \
					WHERE NSCHET = " + SCHET.NSCHET;

		Fun_3.OpenSQL(Proverka);
		if (mo_main->ADOQuery2->RecordCount != 0)
		{
			String qq = mo_main->ADOQuery2->FieldByName("CODE")->AsString;
			if (qq != CODE)
			{
				HWND hWnd = GetForegroundWindow();
				MessageBoxA(hWnd,"Создание счета c одинаковым названием невозможно!", "Внимание!!!", MB_OK);
				Abort();
			}
		}

		Fun_3.InsernSQL("UPDATE [R_SCHET] SET \
                                [YEAR]     =" + SCHET.YEAR     + ",\
								[MONTH]    =" + SCHET.MONTH    + ",\
								[NSCHET]   =" + SCHET.NSCHET   + ",\
								[DSCHET]   =" + SCHET.DSCHET   + ",\
                                [DISP]     =" + SCHET.DISP     + ",\
                                [COMMENTS] =" + SCHET.COMMENTS + ", \
                                [IS_HMP]   =" + SCHET.IS_HMP   +
                        "WHERE [_id]="+IntToStr(id_up));


		HWND hWnd = GetForegroundWindow();
		MessageBoxA(hWnd, "Cчет изменен!", "Внимание!", MB_OK);
        mo_schet->Close();

		Fun_3.OpenSQL_Grid_Refresh();
		Fun_3.Refresh_Button();
    }
}
//---------------------------------------------------------------------------

void __fastcall Tmo_schet::CheckBox1Click(TObject *Sender)
{
    if (mo_schet->CheckBox1->Checked == true)
    {
        mo_schet->ComboBox1->Text = "";
        mo_schet->ComboBox1->Enabled = false;
    }
    else
    {
        mo_schet->ComboBox1->Enabled = true;
    }
}
//---------------------------------------------------------------------------


void __fastcall Tmo_schet::Edit1KeyPress(TObject *Sender, System::WideChar &Key)
{
    if ((Key == '\b') || ((Key >= '0') && (Key <= '9')))
    {

    }
    else
    {
        if (mo_schet->Edit2->Text.Length() >= 4)
        {
            Abort();
        }
    }

    if ((Key >= '0') && (Key <= '9')&&(mo_schet->Edit1->Text.Length()<4) || Key == VK_BACK) {}
    else
        if (Key == VK_RETURN)
        {
            //Edit2->SetFocus(); Edit2->SelStart = Edit2->Text.Length();
        }
        else Key = 0;
}
//---------------------------------------------------------------------------

void __fastcall Tmo_schet::Edit2KeyPress(TObject *Sender, System::WideChar &Key)
{
    if ((Key == '\b') || ((Key >= '0') && (Key <= '9')))
    {

    }
    else
    {
        if (mo_schet->Edit2->Text.Length() >= 2)
        {
            Abort();
        }
    }

    if ((mo_schet->Edit2->Text.Length()==0)&&(Key >= '0') && (Key <= '9')&&(mo_schet->Edit2->Text.Length()<2) || Key == VK_BACK) {}
    else
        if ((mo_schet->Edit2->Text.SubString(1,1)=='0')&&(Key >= '1') && (Key <= '9')&&(mo_schet->Edit2->Text.Length()<2) || Key == VK_BACK) {}
        else
            if ((mo_schet->Edit2->Text.SubString(1,1)=='1')&&(Key >= '0') && (Key <= '2')&&(mo_schet->Edit2->Text.Length()<2) || Key == VK_BACK) {}
            else
                if (Key == VK_RETURN)
                {
                    //mo_schet->ComboBox1->SetFocus();
                }
                else Key = 0;
}
//---------------------------------------------------------------------------

void __fastcall Tmo_schet::ComboBox1KeyPress(TObject *Sender, System::WideChar &Key)
{
    if (Key == VK_RETURN)
    {
        mo_schet->CheckBox1->SetFocus();
    }
    else Key = 0;
}
//---------------------------------------------------------------------------

void __fastcall Tmo_schet::CheckBox1KeyPress(TObject *Sender, System::WideChar &Key)
{
    if (Key == VK_RETURN)
    {
        mo_schet->Edit3->SetFocus(); Edit3->SelStart = Edit3->Text.Length();
    }
}
//---------------------------------------------------------------------------

void __fastcall Tmo_schet::Edit3KeyPress(TObject *Sender, System::WideChar &Key)
{
    if (Key == VK_RETURN)
    {
        mo_schet->Button3->SetFocus();
    }
}
//---------------------------------------------------------------------------


void __fastcall Tmo_schet::Edit1KeyUp(TObject *Sender, WORD &Key, TShiftState Shift)

{
    if (Key == 13)
    {
        this->Edit2->SetFocus();
    }
}
//---------------------------------------------------------------------------

void __fastcall Tmo_schet::Edit2KeyUp(TObject *Sender, WORD &Key, TShiftState Shift)

{
    if (Key == 13)
    {
        this->CheckBox2->SetFocus();
    }
}
//---------------------------------------------------------------------------

void __fastcall Tmo_schet::ComboBox1KeyUp(TObject *Sender, WORD &Key, TShiftState Shift)

{
    if (Key == 13)
    {
        this->CheckBox1->SetFocus();
    }
}
//---------------------------------------------------------------------------

void __fastcall Tmo_schet::CheckBox1KeyUp(TObject *Sender, WORD &Key, TShiftState Shift)

{
    if (Key == 13)
    {
        this->Edit3->SetFocus();
    }
}
//---------------------------------------------------------------------------

void __fastcall Tmo_schet::Edit3KeyUp(TObject *Sender, WORD &Key, TShiftState Shift)

{
    if (Key == 13)
    {
        this->Button3->SetFocus();
    }
}
//---------------------------------------------------------------------------

void __fastcall Tmo_schet::CheckBox2Click(TObject *Sender)
{
	if (this->CheckBox2->Checked) this->Edit4->Visible = true;
    else this->Edit4->Visible = false;
}

//---------------------------------------------------------------------------
void __fastcall Tmo_schet::FormClose(TObject *Sender, TCloseAction &Action)
{
		Fun_3.OpenSQL_Grid_Refresh();
		Fun_3.Refresh_Button();

		Action = caFree;
}
//---------------------------------------------------------------------------

void __fastcall Tmo_schet::FormKeyPress(TObject *Sender, System::WideChar &Key)
{
	if (Key == '\x1B')
    {
		Key = 0;
        this->Close();
    }
}
//---------------------------------------------------------------------------


void __fastcall Tmo_schet::Edit4KeyPress(TObject *Sender, System::WideChar &Key)
{
	if (Key == '\r')
	{
		Key = 0;
		if (mo_schet->Caption == "Изменение реквизитов счёта") this->Edit3->SetFocus();
		if (mo_schet->Caption == "Добавление счёта") this->ComboBox1->SetFocus();
	}
}
//---------------------------------------------------------------------------

void __fastcall Tmo_schet::CheckBox2KeyPress(TObject *Sender, System::WideChar &Key)

{
	if (Key == '\r')
	{
        Key = 0;
		if (this->CheckBox2->Checked) this->Edit4->SetFocus();
		else
		{
			if (mo_schet->Caption == "Изменение реквизитов счёта") this->Edit3->SetFocus();
			if (mo_schet->Caption == "Добавление счёта") this->ComboBox1->SetFocus();
		}
	}
}
//---------------------------------------------------------------------------

void __fastcall Tmo_schet::FormDestroy(TObject *Sender)
{
	mo_schet = NULL;
}
//---------------------------------------------------------------------------

