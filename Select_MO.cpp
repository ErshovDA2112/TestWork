//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Select_MO.h"
#include "Main.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"

Tmo_select_mo *mo_select_mo;
Main MO_4;

struct MyStruct_MO
{
	String tf_code,
		   _mcod,
		   prizn_ksg,
		   prizn_kpg;
} MO;

//---------------------------------------------------------------------------
__fastcall Tmo_select_mo::Tmo_select_mo(TComponent* Owner)
	: TForm(Owner)
{
}

//---------------------------------------------------------------------------
void __fastcall Tmo_select_mo::FormActivate(TObject *Sender)
{
	mo_select_mo->Constraints->MinHeight = 250;
	mo_select_mo->Constraints->MinWidth = 700;
	mo_select_mo->ComboBox1->Items->Clear();
	mo_select_mo->Caption = "Выбор медицинской организации";

	String Zapros = "SELECT  [_id]												\
							 ,row_number() over (order by _id) AS [№ ]   		\
							 ,[tf_code]   AS [Регион]   						\
							 ,[_mcod]     AS [Код МО]   						\
							 ,[prizn_ksg] AS [Активность КСГ]  					\
							 ,[prizn_kpg] AS [Активность КПГ]  					\
					  FROM [SETTINGS] ";

	this->ADOQuery2->Active = False;
	this->ADOQuery2->SQL->Clear();
	this->ADOQuery2->SQL->Add(Zapros);
	this->ADOQuery2->Active = True;
	UpdateLen();
								 /*
 	if (mo_main->ADOQuery2->FieldByName("VALUE")->AsString !="")
 	{
		String temp1, temp2;
  		temp1 = temp2 = mo_main->ADOQuery2->FieldByName("VALUE")->AsString;
		MO_4.QuickSearch_F4("select CONCAT([mcod],' - ',[nam_mok]) AS MO \
							 from [SPR_F003] \
							 where d_begin<=GetDate() and (d_end>GetDate() or d_end is null) \
								   and [mcod] like '"+temp1.Delete(3,temp1.Length())+"%'","MO","ComboBox",1);

		mo_select_mo->ComboBox1->Text = temp2;
  		mo_select_mo->ComboBox1->Font->Color = clBlack;
		MO_4.OpenSQL("SELECT   [tf_okato] AS ОКАТО \
							  ,[mcod] 		AS [Код медицинской организации] 	\
							  ,[nam_mop] 	AS [Полное наименование]			\
							  ,[nam_mok] 	AS [Сокращенное наименование]		\
							  ,[inn] 		AS [ИНН]							\
							  ,[Ogrn] 		AS [ОГРН]							\
							  ,[KPP] 		AS [KPP]							\
							  ,[index_j] 	AS [Индекс]							\
							  ,[addr_j] 	AS [Адрес]\
							  ,[okopf] \
							  ,[vedpri] \
							  ,[org] \
							  ,[fam_ruk] \
							  ,[im_ruk] \
							  ,[ot_ruk] \
							  ,[phone] \
							  ,[fax] \
							  ,[e_mail] \
							  ,[n_doc] \
							  ,[d_start] \
							  ,[data_e] \
							  ,[mp] \
							  ,[www] \
							  ,[d_begin] \
							  ,[d_end] \
							  ,[name_e] \
							  ,[DUVED] \
							  ,[d_edit] \
					  FROM [SPR_F003] \
					  WHERE d_begin<=GetDate() and (d_end>GetDate() or d_end is null) AND [mcod] = '"+mo_select_mo->ComboBox1->Text.Delete(7,mo_select_mo->ComboBox1->Text.Length())+"'");

	  	mo_select_mo->ValueListEditor1->Strings->Clear();
	  	for (int i = 0; i < mo_main->ADOQuery2->FieldCount ; i++)
	  	{
			mo_select_mo->ValueListEditor1->Strings->AddPair(mo_main->ADOQuery2->Fields->Fields[i]->FullName,
			mo_main->ADOQuery2->FieldByName(mo_main->ADOQuery2->Fields->Fields[i]->FullName)->AsString);
		}

        //Выбор базовой ставки
		MO_4.OpenSQL("SELECT [BS] FROM [SPR_KSG_BS]");

		String Simvol, Itog;

		if (mo_main->ADOQuery2->RecordCount == 1)
		{
			this->Edit1->Text = mo_main->ADOQuery2->FieldByName(mo_main->ADOQuery2->Fields->Fields[0]->FullName)->AsString;
			if (this->Edit1->Text.Length() > 0)
			{
				for (int i = 0; i < this->Edit1->Text.Length(); i++)
				{
					Simvol = this->Edit1->Text.SubString(i + 1,1);
					if (Simvol == ",") Simvol = ".";
					Itog = Itog + Simvol;
				}
				this->Edit1->Text = Itog;
			}

		}
        else this->Edit1->Text = "0.00";

	}
	*/
	mo_select_mo->ComboBox1->Text = "";

}

//---------------------------------------------------------------------------
void __fastcall Tmo_select_mo::UpdateLen()
{
	int j;
	int Maxlen = 0;
	int TekLen = 0;
	String DataLen = "";
	String ItogData = "";

	if (this->ADOQuery2->RecordCount > 0)
	{
		this->DBGrid2->Visible = false;
		int TotalLenDbgrid = 0;
		this->ADOQuery2->Open();
		for (j = 0; j < this->ADOQuery2->FieldCount; j++)
		{
			DataLen = this->ADOQuery2->Fields->Fields[j]->FieldName;
			Maxlen = this->DBGrid2->Canvas->TextWidth(DataLen);

			for (this->ADOQuery2->First(); !this->ADOQuery2->Eof; this->ADOQuery2->Next())
			{
				ItogData = this->ADOQuery2->FieldByName(DataLen)->AsString;
				TekLen = this->DBGrid2->Canvas->TextWidth(ItogData);
				if (TekLen > Maxlen) Maxlen = TekLen;
			}
			if (Maxlen == 0)
			{
				this->DBGrid2->Columns->Items[j]->Width = 5;
			}
			else
			{
				this->DBGrid2->Columns->Items[j]->Width = Maxlen + 5;
				this->DBGrid2->Columns->Items[j]->Alignment = taLeftJustify;
			}
		}
		this->ADOQuery2->First();
		this->DBGrid2->Visible = true;
		this->DBGrid2->DataSource->DataSet->Fields->Fields[0]->Visible = false;
	}
	else
	{
		this->DBGrid2->Visible = false;
	}
}


//---------------------------------------------------------------------------
void __fastcall Tmo_select_mo::ComboBox1KeyUp(TObject *Sender, WORD &Key, TShiftState Shift)
{
	if ((Key == 38) || (Key == 40))
	{
		this->ComboBox1->SelLength = 0;
		this->ComboBox1->SelStart = 0;
	}

    /*
	mo_select_mo->ComboBox1->Font->Color = clBlack;

	String find_cod_mo;
	if (mo_select_mo->ComboBox1->Text.Length()<3)
  	{
		find_cod_mo += mo_select_mo->ComboBox1->Text;
  	}

  	if ((mo_select_mo->ComboBox1->Text.Length()==2)&&(Key != VK_BACK))
  	{
		MO_4.QuickSearch_F4("select CONCAT([mcod],' - ',[nam_mok]) AS MO \
							 from [SPR_F003] \
							 where d_begin<=GetDate() and (d_end>GetDate() or d_end is null) \
								   and [mcod] like '" + find_cod_mo + "%'","MO","ComboBox",1);
   		mo_main->ADOQuery2->First();
   		mo_select_mo->ComboBox1->Text.Delete(2,mo_select_mo->ComboBox1->Text.Length());
   		mo_select_mo->ComboBox1->SelStart = mo_select_mo->ComboBox1->Text.Length();
  	}

  	if ((mo_select_mo->ComboBox1->Text.Length() > 6)&&(Key != VK_BACK))
  	{
   		MO_4.OpenSQL("SELECT [tf_okato] AS ОКАТО \
							,[mcod] AS \"Код медицинской организации\" \
							,[nam_mop] \
							,[nam_mok] \
							,[inn] \
							,[Ogrn] \
							,[KPP] \
							,[index_j] \
							,[addr_j] \
							,[okopf] \
							,[vedpri] \
							,[org] \
							,[fam_ruk] \
							,[im_ruk] \
							,[ot_ruk] \
							,[phone] \
							,[fax] \
							,[e_mail] \
							,[n_doc] \
							,[d_start] \
							,[data_e] \
							,[mp] \
							,[www] \
							,[d_begin] \
							,[d_end] \
							,[name_e] \
							,[DUVED] \
							,[d_edit] \
					FROM [SPR_F003] WHERE d_begin<=GetDate() and (d_end>GetDate() or d_end is null) AND [mcod] = '"+mo_select_mo->ComboBox1->Text.Delete(7,mo_select_mo->ComboBox1->Text.Length())+"'");

	  	mo_select_mo->ValueListEditor1->Strings->Clear();
	  	for (int i = 0; i < mo_main->ADOQuery2->FieldCount ; i++)
	  	{
			mo_select_mo->ValueListEditor1->Strings->AddPair(mo_main->ADOQuery2->Fields->Fields[i]->FullName,
			mo_main->ADOQuery2->FieldByName(mo_main->ADOQuery2->Fields->Fields[i]->FullName)->AsString);
	  	}
	}
	*/
}

//---------------------------------------------------------------------------
void __fastcall Tmo_select_mo::ComboBox1KeyPress(TObject *Sender, System::WideChar &Key)

{
 if ((Key >= '0') && (Key <= '9') || Key == VK_BACK) {} else Key = 0;
}

//---------------------------------------------------------------------------
void __fastcall Tmo_select_mo::Button2Click(TObject *Sender)
{
	MO_4.InsernSQL("DELETE 			\
					FROM [SETTINGS] \
					WHERE SETTINGS._id = '" + this->DBGrid2->DataSource->DataSet->Fields->Fields[0]->AsString + "'");

	String Zapros = "SELECT  [_id]												\
							 ,row_number() over (order by _id) AS [№ ]   		\
							 ,[tf_code]   AS [Регион]   						\
							 ,[_mcod]     AS [Код МО]   						\
							 ,[prizn_ksg] AS [Активность КСГ]  					\
							 ,[prizn_kpg] AS [Активность КПГ]  					\
					  FROM [SETTINGS] ";

	this->ADOQuery2->Active = False;
	this->ADOQuery2->SQL->Clear();
	this->ADOQuery2->SQL->Add(Zapros);
	this->ADOQuery2->Active = True;
	UpdateLen();

	ShowMessage("Медицинская организация удалена!");
}

//---------------------------------------------------------------------------
void __fastcall Tmo_select_mo::ComboBox1Change(TObject *Sender)
{
	if (this->ComboBox1->Text.Length() > 2)
	{
		String TempName = this->ComboBox1->Text.SubString(1,6);
		String Zapros = "SELECT  [tf_okato] AS ОКАТО 							\
								,[mcod] 	AS [Код медицинской организации] 	\
								,[nam_mop] 	AS [Полное наименование]			\
								,[nam_mok] 	AS [Сокращенное наименование]		\
								,[inn] 		AS [ИНН]							\
								,[Ogrn] 	AS [ОГРН]							\
								,[KPP] 		AS [KPP]							\
								,[index_j] 	AS [Индекс]							\
								,[addr_j] 	AS [Адрес]							\
								,[okopf] \
								,[vedpri] \
								,[org] \
								,[fam_ruk] \
								,[im_ruk] \
								,[ot_ruk] \
								,[phone] \
								,[fax] \
								,[e_mail] \
								,[n_doc] \
								,[d_start] \
								,[data_e] \
								,[mp] \
								,[www] \
								,[d_begin] \
								,[d_end] \
								,[name_e] \
								,[DUVED] \
								,[d_edit] \
						FROM [SPR_F003]                                         \
						WHERE d_begin<=GetDate() AND                            \
							 (d_end>GetDate() or d_end is null) AND             \
							 mcod LIKE '" + TempName + "%'";
		MO_4.OpenSQL(Zapros);


		if (mo_main->ADOQuery2->RecordCount > 0)
		{
			String ItogData;
			while (this->ComboBox1->Items->Count > 0) this->ComboBox1->Items->Delete(0);

			mo_main->ADOQuery2->Open();
			for (mo_main->ADOQuery2->First(); !mo_main->ADOQuery2->Eof; mo_main->ADOQuery2->Next())
			{
				ItogData = mo_main->ADOQuery2->FieldByName(mo_main->ADOQuery2->Fields->Fields[1]->FieldName)->AsString + " " +
						   mo_main->ADOQuery2->FieldByName(mo_main->ADOQuery2->Fields->Fields[3]->FieldName)->AsString;
				this->ComboBox1->Items->Add(ItogData);
			}

			if (mo_main->ADOQuery2->RecordCount == 1)
			{
				this->ComboBox1->Text = ItogData;
				this->ComboBox1->ItemIndex = 0;
				//this->ComboBox1->SelStart = 0;
			}


			mo_main->ADOQuery2->First();
			mo_select_mo->ValueListEditor1->Strings->Clear();
			for (int i = 0; i < mo_main->ADOQuery2->FieldCount ; i++)
			{
				mo_select_mo->ValueListEditor1->Strings->AddPair(mo_main->ADOQuery2->Fields->Fields[i]->FullName,
				mo_main->ADOQuery2->FieldByName(mo_main->ADOQuery2->Fields->Fields[i]->FullName)->AsString);
			}
		}
		//this->ComboBox1->SelLength = 0;
		//this->ComboBox1->SelStart = 0;
	}
	else
	{
		while (this->ComboBox1->Items->Count > 0) this->ComboBox1->Items->Delete(0);
	}
}

//---------------------------------------------------------------------------
void __fastcall Tmo_select_mo::Button1Click(TObject *Sender)
{
	MO._mcod = mo_select_mo->ComboBox1->Text.Delete(7,mo_select_mo->ComboBox1->Text.Length());
	String Zapros;
	if (MO._mcod.Length() != 6)
 	{
		ShowMessage("Некорректный код МО!");
 	}
	else
	{
		//Проверка на существоание организации

		Zapros = "SELECT _mcod	\
				  FROM SETTINGS";
		MO_4.OpenSQL(Zapros);
		if (mo_main->ADOQuery2->RecordCount > 0)
		{
			mo_main->ADOQuery2->Open();
			for (mo_main->ADOQuery2->First(); !mo_main->ADOQuery2->Eof; mo_main->ADOQuery2->Next())
			{
				if (MO._mcod == mo_main->ADOQuery2->FieldByName(mo_main->ADOQuery2->Fields->Fields[0]->FullName)->AsString)
				{
					ShowMessage("Невозможно создать повторную организацию");
					Abort();
                }
            }

        }

		if (this->Edit5->Text.Length() != 2)
		{
			ShowMessage("Неправильный код региона");
			Abort();
		}

		//Код региона
		MO.tf_code = this->Edit5->Text;

		//Использование КСГ
		if (this->CheckBox1->Checked) MO.prizn_ksg = "1";
		else MO.prizn_ksg = "0";

		//Использование КПГ
		if (this->CheckBox1->Checked) MO.prizn_kpg = "1";
		else MO.prizn_kpg = "0";

		Zapros = 	"INSERT INTO [SETTINGS] ( [tf_code]     \
											 ,[_mcod]       \
											 ,[prizn_ksg]   \
											 ,[prizn_kpg])  \
					 OUTPUT INSERTED._id VALUES ('" + MO.tf_code 	+ "'," +
												"'" + MO._mcod   	+ "'," +
												"'" + MO.prizn_ksg 	+ "'," +
												"'" + MO.prizn_kpg  + "')";

		MO_4.OpenSQL(Zapros);

		//Работает не правильно
		MO_4.InsernSQL("DELETE FROM [ITMed54].[dbo].[SPR_KSG_BS]");

		if (this->Edit1->Text == "0.00" || this->Edit1->Text.Length() < 2)
		{
			ShowMessage("Отсутствует базовая ставка круглосуточного стационара");
			Abort();
		}

		if (this->Edit2->Text == "0.00" || this->Edit2->Text.Length() < 2)
		{
			ShowMessage("Отсутствует базовая ставка дневного стационара");
			Abort();
		}

		//Добавление базовой ставки круглосуточного стационара
		MO_4.OpenSQL("INSERT INTO [SPR_KSG_BS] ([_tf_code], 	\
												[_idump],       \
												[BS],     		\
												[DBEG],   		\
												[DEND])   		\
						  OUTPUT INSERTED._id VALUES ( '" + MO.tf_code + "','1','"
														  + this->Edit1->Text
														  + "','2018-01-01', '2019-01-01')");

		//Добавление базовой ставки дневного стационара
		MO_4.OpenSQL("INSERT INTO [SPR_KSG_BS] ([_tf_code], 	\
												[_idump],       \
												[BS],     		\
												[DBEG],   		\
												[DEND])   		\
						  OUTPUT INSERTED._id VALUES ( '" + MO.tf_code + "','2','"
														  + this->Edit2->Text
														  + "','2018-01-01', '2019-01-01')");

  		ShowMessage("Медицинская организация назначена!");

		String Zapros = "SELECT  [_id]												\
								 ,row_number() over (order by _id) AS [№ ]   		\
								 ,[tf_code]   AS [Регион]   						\
								 ,[_mcod]     AS [Код МО]   						\
								 ,[prizn_ksg] AS [Активность КСГ]  					\
								 ,[prizn_kpg] AS [Активность КПГ]  					\
						  FROM [SETTINGS] ";

		this->ADOQuery2->Active = False;
		this->ADOQuery2->SQL->Clear();
		this->ADOQuery2->SQL->Add(Zapros);
		this->ADOQuery2->Active = True;
		UpdateLen();
 	}
}

//---------------------------------------------------------------------------
void __fastcall Tmo_select_mo::ValueListEditor1KeyPress(TObject *Sender, System::WideChar &Key)
{
 	Key = 0;
}

//---------------------------------------------------------------------------
void __fastcall Tmo_select_mo::ComboBox1MouseEnter(TObject *Sender)
{
/*
	if (mo_select_mo->ComboBox1->Text == "Код региона")
	{
		mo_select_mo->ComboBox1->Text = "";
		mo_select_mo->ComboBox1->Font->Color = clBlack;
	}
	*/
}

//---------------------------------------------------------------------------
void __fastcall Tmo_select_mo::Edit1KeyPress(TObject *Sender, System::WideChar &Key)
{
	String Simvol;
	bool Povtor = false;
	if (Key == ',') Key = '.';
	for (int i = 0; i < this->Edit1->Text.Length(); i++)
	{
		Simvol = this->Edit1->Text.SubString(i + 1, 1);
		if (Simvol ==".") Povtor = true;
	}
	if (((Key >= '0') && (Key <= '9')) || (Key == '.') || (Key == '\b'))
	{
		if (Povtor && (Key == '.'))
		{
			Key = 0;
			Abort();
		}
	}
}
//---------------------------------------------------------------------------


void __fastcall Tmo_select_mo::Button3Click(TObject *Sender)
{
//
}
//---------------------------------------------------------------------------

void __fastcall Tmo_select_mo::Edit5KeyPress(TObject *Sender, System::WideChar &Key)
{
	if (((Key >= '0') && (Key <= '9')) || (Key == '\b'))
	{}
	else Abort();
}
//---------------------------------------------------------------------------


void __fastcall Tmo_select_mo::DBGrid2DrawColumnCell(TObject *Sender, const TRect &Rect,
          int DataCol, TColumn *Column, TGridDrawState State)
{
	F1MyDBGrid *grid = static_cast<F1MyDBGrid*>(Sender);
	if (grid->DataLink->ActiveRecord == grid->Row -1)
	{
	 TField *F = Column->Field;
	 TCanvas *Cvs = DBGrid2->Canvas;
	 Cvs->Brush->Color = clSkyBlue;
     Cvs->FillRect(Rect);
	 Cvs->Font->Color = clBlack;
     Cvs->TextOut(Rect.Left+2, Rect.Top+2, F->Text);
	 Cvs->TextOut(Rect.Left+2, Rect.Top+2, F->Text);
	}
}
//---------------------------------------------------------------------------

void __fastcall Tmo_select_mo::DBGrid2ColumnMoved(TObject *Sender, int FromIndex,
          int ToIndex)
{
	this->DBGrid2->Columns->Items[ToIndex]->Index = FromIndex;
}
//---------------------------------------------------------------------------

void __fastcall Tmo_select_mo::DBGrid2CellClick(TColumn *Column)
{
	String Zapros = "SELECT   [tf_code]   AS [Регион]   \
							 ,[_mcod]     AS [Код МО]   \
							 ,[prizn_ksg] AS [Активность КСГ]  \
							 ,[prizn_kpg] AS [Активность КПГ]  \
					  FROM [SETTINGS] ";
}
//---------------------------------------------------------------------------

void __fastcall Tmo_select_mo::Edit2KeyPress(TObject *Sender, System::WideChar &Key)
{
	String Simvol;
	bool Povtor = false;
	if (Key == ',') Key = '.';
	for (int i = 0; i < this->Edit2->Text.Length(); i++)
	{
		Simvol = this->Edit2->Text.SubString(i + 1, 1);
		if (Simvol == ".") Povtor = true;
	}
	if (((Key >= '0') && (Key <= '9')) || (Key == '.') || (Key == '\b'))
	{
		if (Povtor && (Key == '.'))
		{
			Key = 0;
			Abort();
		}
	}
}
//---------------------------------------------------------------------------

