//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop
//Пробую чтото добавлять
#include "MainFormMO.h"
#include "Main.h"
#include "windows.h"
#include <vector>
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
Tmo_main *mo_main;
Main Fun;

TButton *Butt;
TLabel *Label;
TCategoryButtons *ButtonItemEDA;

String YEAR;
String MONTH;
StyleF Prodject_Style;              //Создание структуры с параметрами стилей

//------------------------ Temp Value ---------------------------------------
String SPR;          // Имя справочника для загрузки Unit9
vector<TMenuItem *> KMenu;        //масив из контекстного меню
int KMind;                         //номен созданного меню
int Kol_Label;
int TypeReqvest;

String EDAFunctionCreateQSL(int Type, String id_schet);
String EDAFunctionCreateQSL_D(int Type, String id_schet);
String EDAFunctionCreateQSL_HMP(int Type, String id_schet);

int SchetForYarik;

const String SQL_SCHET = "SELECT [_id] 												\
								, row_number() over (order by _id desc) as [№ ] 	\
								,[CODE]						'Код'					\
								,CONCAT(case                                        \
											 when [MONTH] = '1'  then 'Январь'      \
											 when [MONTH] = '2'  then 'Февраль'     \
											 when [MONTH] = '3'  then 'Март'        \
											 when [MONTH] = '4'  then 'Апрель'      \
											 when [MONTH] = '5'  then 'Май'         \
											 when [MONTH] = '6'  then 'Июнь'        \
											 when [MONTH] = '7'  then 'Июль'        \
											 when [MONTH] = '8'  then 'Август'      \
											 when [MONTH] = '9'  then 'Сентябрь'    \
											 when [MONTH] = '10' then 'Октябрь'     \
											 when [MONTH] = '11' then 'Ноябрь'      \
											 when [MONTH] = '12' then 'Декабрь'     \
										end,  										\
										' ',                             		 	\
										[YEAR]) 			'Отчетный период'	 	\
								,[NSCHET] 					'Номер счёта' 			\
								,[DISP] 					'Тип дисп.' 			\
								,(case when IS_HMP = '1'        					\
									   then 'да'                					\
									   else 'нет' end) 		'ВМП' 					\
								,[SUMMAV] 					'Сумма выст.'			\
								,[SUMMAP] 					'Сумма прин.'			\
								,[SANK_MEK]                 'МЭК'                   \
								,[SANK_MEE]                 'МЭЭ'                   \
								,[SANK_EKMP]                'ЭКМП'                  \
								,[COMMENTS] 				'Комментарий' 			\
								,[DSCHET]                   'Дата счета'            \
								,[FILENAME]                 'Имя файла'             \
								,[CODE_MO] 					'CODE_MO' 				\
							FROM [R_SCHET] 											\
							WHERE YEAR = ";
int SostForm;
int SostSort_U1;
String DataSort_U1;
String DopData_U1;

String SnilsWorking;
String TypeWorkUser;

 /*
const String SQL_ZAP = "SELECT R_ZAP._id AS \'Запись\', \
						R_PACIENT.NPOLIS AS \'Номер полиса\', \
						R_PERS.FAM AS \'Фамилия\', \
						R_PERS.IM AS \'Имя\', \
						R_PERS.OT AS \'Отчество\', \
						R_PERS.DR AS \'Дата рождения\', \
						R_PERS.FAM_P AS \'Фамилия представителя\', \
						R_PERS.IM_P AS \'Имя представителя\', \
						R_PERS.OT_P AS \'Отчество представителя\', \
						R_PERS.DR_P AS \'Дата рождения представителя\', \
						(case when R_PACIENT.NOVOR = '0' then 'Нет' else 'Да' end) 'Новорожденный' \
				        FROM R_ZAP INNER JOIN R_PACIENT ON R_ZAP._pid = R_PACIENT._id INNER JOIN \
				        R_PERS ON R_PACIENT.ID_PAC = R_PERS.ID_PAC WHERE R_ZAP._schet_id LIKE ";
*/
//---------------------------------------------------------------------------
__fastcall Tmo_main::Tmo_main(TComponent* Owner)
	: TForm(Owner)
{
}

//---------------------------------------------------------------------------
void __fastcall Tmo_main::FormActivate(TObject *Sender)
{
	Prodject_Style.Color_Select_Line = clHotLight;
	Prodject_Style.Color_Select_Text = clWhite;

	TypeWorkUser = "";

	this->CategoryButtons1->ShowHint = true;
	this->CategoryButtons1->Categories->Items[0]->Items->Items[0]->Hint = this->CategoryButtons1->Categories->Items[0]->Items->Items[0]->Caption;

	if (this->WindowState == wsNormal)    SostForm = 1;
	if (this->WindowState == wsMaximized) SostForm = 2;

	Kol_Label = 0;
	TypeReqvest = 0;

	SostSort_U1 = 1;
	DataSort_U1 = " ORDER BY CODE ASC";

	if (!ButtonItemEDA) ButtonItemEDA = new TCategoryButtons (this);
	ButtonItemEDA->Parent = Panel2;
	ButtonItemEDA->Enabled = true;
	ButtonItemEDA->Left = 15;
	ButtonItemEDA->Top = 83;
	ButtonItemEDA->Height = 472;
	ButtonItemEDA->Width = 405;
	ButtonItemEDA->ButtonHeight = 20;
	ButtonItemEDA->ButtonWidth  = 425;
	ButtonItemEDA->ButtonOptions >>boVerticalCategoryCaptions;
	ButtonItemEDA->Font->Style = TFontStyles() << fsBold;
	ButtonItemEDA->Name = "ButtonItemEDA_"+IntToStr(Kol_Label);
	ButtonItemEDA->Anchors = TAnchors() << akRight << akBottom << akTop << akLeft;
	ButtonItemEDA->Visible = false;
	mo_main->Panel2->Visible = false;

	mo_main->Constraints->MinHeight = 500;
	mo_main->Constraints->MinWidth = 1000;
	mo_main->Caption = "АРМ оператора";
	if (FileExists("set.sqp"))
 	{
		TStringList* temp = new TStringList;
		temp->LoadFromFile("set.sqp");
		mo_main->ADOConnection1->ConnectionString = "Provider              = SQLOLEDB.1;            \
													 Password              = Bpgjldsgjldthnfv100;   \
													 Persist Security Info = True;                  \
													 User ID               = sa;                    \
													 Initial Catalog       = ITMed54; " + temp->Text;

		mo_main->ADOConnection1->Connected = True;
		mo_main->ADOConnection1->DefaultDatabase = "ITMed54";

        //Функция загрузки пользователей

		Form14->ShowModal();
		if (TypeWorkUser == "")
		{
			Close();
		}

		//ProverkaPers();

		Fun.OpenSQL("SELECT DISTINCT [YEAR] 	\
					 FROM [R_SCHET]             \
					 ORDER BY [YEAR] DESC");
		mo_main->ADOQuery2->First();
		for (int i = 0; !mo_main->ADOQuery2->Eof; i++)
		{
			Butt = new TButton(this);
			Butt->Parent = Panel1;
			Butt->Top = 5;
			Butt->Left = i*40+5;
			Butt->Height = 20;
	 		Butt->Width = 40;
			Butt->Caption = mo_main->ADOQuery2->FieldByName("YEAR")->AsString;
			Butt->OnClick = YEAR_Click;
			if (i == 0)
	 		{
				YEAR = mo_main->ADOQuery2->FieldByName("YEAR")->AsString;
				Butt->Name = "EndDATE";
			}
			else
			{
				 Butt->Name ="ButtonYear" + Butt->Caption;
			}
			mo_main->ADOQuery2->Next();
		}

		Fun.OpenSQL("SELECT DISTINCT [MONTH]    	\
					 FROM [R_SCHET]             	\
					 WHERE [YEAR] = " + YEAR + "    \
					 ORDER BY [MONTH] DESC");

		mo_main->ADOQuery2->First();
		for (int i = 12; i!=0; i--)
		{
			Butt = new TButton(this);
			Butt->Parent = Panel1;
			Butt->Enabled = False;
	 		Butt->Top = (12-i)*20+25;
	 		Butt->Left = 5;
			Butt->Height = 20;
			Butt->Width = 40;
			Butt->Name = "MyButton" + IntToStr(i);
			Butt->Caption = IntToStr(i);
			Butt->OnClick = MONTH_Click;
			if (i == mo_main->ADOQuery2->FieldByName("MONTH")->AsInteger)
	 		{
	  			Butt->Enabled = True;
			}
			mo_main->ADOQuery2->Next();
		}

        //Функция автоматического нажатия максимального года
  		int ic = 0;
		for (ic; ic < mo_main->ComponentCount; ic++)
		{
			if (mo_main->Components[ic]->Name == "EndDATE")
			{
	 			((TButton *)(mo_main->Components[ic]))->Click();
				break;
			}
   		}

		String Zapros = "SELECT SPR_F003.nam_mok                        \
						 FROM SPR_F003                                  \
						 WHERE SPR_F003.mcod in (SELECT SETTINGS._mcod	\
												 FROM SETTINGS)";
		Fun.OpenSQL(Zapros);
		if (this->ADOQuery2->RecordCount > 0)
		{
			this->ADOQuery2->Open();
			this->ADOQuery2->First();
			mo_main->Caption = this->ADOQuery2->FieldByName(this->ADOQuery2->Fields->Fields[0]->FieldName)->AsString + " - АРМ ОПЕРАТОРА";
		}

	}

	mo_main->DBGrid1->Top = 26;
	mo_main->DBGrid1->Left = 46;
	if (this->DBGrid1->Visible) this->DBGrid1->SetFocus();
}

//---------------------------------------------------------------------------
void __fastcall Tmo_main::ProverkaPers()
{
	String PersInfo = "SELECT * FROM R_PERS";
	Fun.OpenSQL(PersInfo);
    int j;

	String DataLen,ItogData, Otchectvo;

	if (mo_main->ADOQuery2->RecordCount > 0)
	{
		mo_main->ADOQuery2->Open();
		for (j = 0; j < this->ADOQuery2->FieldCount; j++)
		{
			DataLen = ADOQuery2->Fields->Fields[j]->FieldName;

			if (DataLen == "OT_EXIST")
			{
				for (mo_main->ADOQuery2->First(); !mo_main->ADOQuery2->Eof; mo_main->ADOQuery2->Next())
				{
					ItogData = mo_main->ADOQuery2->FieldByName(DataLen)->AsString;
					Otchectvo = mo_main->ADOQuery2->FieldByName("OT")->AsString;
					if (ItogData.Length() == 0)
					{

					}
					else
					{

                    }
				}
			}
		}
	}
}

//---------------------------------------------------------------------------
void __fastcall Tmo_main::DBGrid1CellClick(TColumn *Column)
{
	EDACreateButtonItem(mo_main);
}

//------------------------------------------------------------------
void __fastcall Tmo_main::KMenu_Click (TObject* Sender)
{
	AnsiString temp;
 	if (((TMenuItem*)Sender)->Caption == "Все")
 	{
		temp = "export.exe " + mo_main->DBGrid1->DataSource->DataSet->Fields->Fields[0]->AsString + " true";
	}
	else
	{
		temp = "export.exe " + mo_main->DBGrid1->DataSource->DataSet->Fields->Fields[0]->AsString + " false " + Fun.SetInt(((TMenuItem*)Sender)->Caption);
	}

 	char cmd[100];
	strcpy(cmd, temp.c_str());

	WinExec(cmd,SW_SHOW);
}

//-----------------------------------------------------------------
void __fastcall Tmo_main::YEAR_Click (TObject* Sender)
{
	this->Edit12->Text = "";
	Fun.OpenSQL_Grid(SQL_SCHET + ((TButton*)Sender)->Caption + DataSort_U1);
	TypeReqvest = 1;
	UpdateLen();

	YEAR = StrToInt(((TButton*)Sender)->Caption);
	MONTH = "";

	Fun.OpenSQL("SELECT DISTINCT [MONTH] FROM [R_SCHET] WHERE [YEAR] = " + YEAR + " ORDER BY [MONTH] DESC");
	mo_main->ADOQuery2->First();
	int ic;
	for (int i = 12; i!=0; i--)
	{
	   	ic = 0;
	   	for (ic; ic < mo_main->ComponentCount; ic++)
	   	{
			if (mo_main->Components[ic]->Name == ("MyButton" + IntToStr(i)))
			{
				if (((TButton *)(mo_main->Components[ic]))->Caption == mo_main->ADOQuery2->FieldByName("MONTH")->AsString)
				{
					((TButton *)(mo_main->Components[ic]))->Enabled = True;
					mo_main->ADOQuery2->Next();
				}
				else
		 		{
		 			((TButton *)(mo_main->Components[ic]))->Enabled = False;
		 		}
			}
	   }
	}

	EDACreateButtonItem(mo_main);
}

//---------------------------------------------------------------------------
void __fastcall Tmo_main::UpdateLen()
{
	int j, k;
	int Maxlen = 0;
	int TekLen = 0;
	int TotalLenMas[100] = {0};
	String DataLen = "";
	String ItogData = "";

	if (mo_main->ADOQuery1->RecordCount > 0)
	{
		mo_main->DBGrid1->Visible = false;
		mo_main->DBGrid1->DataSource->DataSet->Fields->Fields[0]->Visible  = true;
		mo_main->DBGrid1->DataSource->DataSet->Fields->Fields[15]->Visible = true;
		int TotalLenDbgrid = 0;
		mo_main->ADOQuery1->Open();
		for (j = 0; j < this->ADOQuery1->FieldCount; j++)
		{
			if ((j == 0) || (j == 15)) continue;
        	if (ADOQuery1->Fields->Fields[j]->Visible == false) continue;
			DataLen = ADOQuery1->Fields->Fields[j]->FieldName;
			Maxlen = this->DBGrid1->Canvas->TextWidth(DataLen);

			for (mo_main->ADOQuery1->First(); !mo_main->ADOQuery1->Eof; mo_main->ADOQuery1->Next())
			{
				ItogData = mo_main->ADOQuery1->FieldByName(DataLen)->AsString;
				TekLen = this->DBGrid1->Canvas->TextWidth(ItogData);
				if (TekLen > Maxlen) Maxlen = TekLen;
			}
			if (Maxlen == 0)
			{
				mo_main->DBGrid1->Columns->Items[j]->Width = 5;
				TotalLenDbgrid += 5;
				TotalLenMas[j] = 5;
			}
			else
			{
				mo_main->DBGrid1->Columns->Items[j]->Width = Maxlen + 5;
				mo_main->DBGrid1->Columns->Items[j]->Alignment = taLeftJustify;
				TotalLenDbgrid += Maxlen + 5;
				TotalLenMas[j] = Maxlen + 5;
			}
		}
		mo_main->ADOQuery1->First();
		mo_main->DBGrid1->DataSource->DataSet->Fields->Fields[0]->Visible = false;
		mo_main->DBGrid1->DataSource->DataSet->Fields->Fields[15]->Visible = false;
		mo_main->DBGrid1->Visible = true;

		j = 1;
		k = 0;
		while (1)
		{
			if (TotalLenMas[j] == 0) break;
			k += TotalLenMas[j];
			j++;
		}
		if (mo_main->DBGrid1->Width - 40 > k)
		{
			k = mo_main->DBGrid1->Width - k - 40;
			for (j = 0; j < this->ADOQuery1->FieldCount - 2; j++)
			{
				mo_main->DBGrid1->Columns->Items[j]->Width += (mo_main->DBGrid1->Columns->Items[j]->Width * k) / TotalLenDbgrid;
			}
		}

	}
	else
	{
		mo_main->DBGrid1->Visible = false;
		this->Panel2->Visible = false;
	}
}

//---------------------------------------------------------------------------
void __fastcall Tmo_main::MONTH_Click (TObject* Sender)
{
	this->Edit12->Text = "";
	MONTH = " AND [MONTH] = " + ((TButton*)Sender)->Caption;
	Fun.OpenSQL_Grid(SQL_SCHET + YEAR + MONTH + DataSort_U1);
	TypeReqvest = 2;
	UpdateLen();
	EDACreateButtonItem(mo_main);
}


//---------------------------------------------------------------------------
//Функция динамического создания ButtonItem
void __fastcall Tmo_main::EDACreateButtonItem(TObject* Sender)
{
	if (mo_main->Panel2->Visible)
	{
		mo_main->Panel2->Visible = false;
		int i,j;
		String stistica = "";
		ButtonItemEDA->Visible = true;

		//Информаиц по счету
		String NumberSchet = mo_main->DBGrid1->DataSource->DataSet->Fields->Fields[15]->Value;
		String InfoSchet = "SELECT *						\
							FROM [ITMed].[dbo].[spr_f003]	\
							where mcod=" + NumberSchet;
		Fun.OpenSQL(InfoSchet);
		if (mo_main->ADOQuery2->RecordCount == 1)
		   	{
				for (i = 0; i < 10; i++)
				{
					for (j = 0; j < mo_main->ComponentCount; j++)
					{
						if (mo_main->Components[j]->Name == "Label_"+IntToStr(i+1))
						{
							delete mo_main->Components[j];
							break;
			 			}
					}
				}

				Label = new TLabel (this);
				Label->Parent = Panel2;
				Label->Enabled = true;
				Label->Top = 25;
				Label->Left = 15;
				Label->Height = 13;
				Label->Name = "Label_1";//+IntToStr(1);
				Label->Caption = mo_main->ADOQuery2->FieldByName("nam_mok")->AsString;

				Label = new TLabel (this);
				Label->Parent = Panel2;
				Label->Enabled = true;
				Label->Top = 43;
				Label->Left = 15;
				Label->Height = 13;
				Label->Name = "Label_2";//+IntToStr(1);
				Label->Caption = "Код организации: " + NumberSchet;

				Label = new TLabel (this);
				Label->Parent = Panel2;
				Label->Enabled = true;
				Label->Top = 63;
				Label->Left = 15;
				Label->Height = 13;
				Label->Name = "Label_3";
				Label->Caption = "Отчётные период: " + mo_main->DBGrid1->DataSource->DataSet->Fields->Fields[3]->AsString;
		   	}

		int id_data = mo_main->DBGrid1->DataSource->DataSet->Fields->Fields[0]->Value;
		String id_schet = IntToStr(id_data);
		if (ButtonItemEDA->Categories->Count > 0) ButtonItemEDA->Categories->Clear();
		Kol_Label = 0;

		Fun.OpenSQL("SELECT [DISP], 	\
							[IS_HMP]    \
					 FROM [R_SCHET]     \
					 WHERE [_id] ='" + id_schet + "'");
		if ((mo_main->ADOQuery2->FieldByName("DISP")->AsString == "")&&(mo_main->ADOQuery2->FieldByName("IS_HMP")->AsBoolean == false))
		{
			stistica = EDAFunctionCreateQSL(0, id_schet);
			EDACreateLabel(mo_main, stistica, 5, 0);

			stistica = EDAFunctionCreateQSL(1, id_schet);
			EDACreateLabel(mo_main, stistica, 5, 1);

			//--SPR_V008.VMPNAME 'Вид МП',
			stistica = EDAFunctionCreateQSL(2, id_schet);
			EDACreateLabel(mo_main, stistica ,5, 2);

			//-- SPR_P_PER.NAME 'Признак поступления',
			//stistica = EDAFunctionCreateQSL(3, id_schet);
			//EDACreateLabel(mo_main, stistica ,5, 3);

			//-- spr_v012.IZNAME 'Исход Заболевания',
			stistica = EDAFunctionCreateQSL(4, id_schet);
			EDACreateLabel(mo_main, stistica ,5, 4);

			//--spr_v009.RMPNAME 'Результат обращения',
			stistica = EDAFunctionCreateQSL(5, id_schet);
			EDACreateLabel(mo_main, stistica ,5, 5);
		}

		Fun.OpenSQL("SELECT [DISP],[IS_HMP] FROM [R_SCHET] WHERE [_id] ='"+id_schet+"'");
		if ((mo_main->ADOQuery2->FieldByName("DISP")->AsString != "")&&(mo_main->ADOQuery2->FieldByName("IS_HMP")->AsBoolean == false))
	    {
			//--SPR_V008.VMPNAME 'Вид МП',
			stistica = EDAFunctionCreateQSL_D(0, id_schet);
			EDACreateLabel(mo_main, stistica, 5, 20);

			//-- SPR_V017.DRNAME 'Результат диспансеризации',
			stistica = EDAFunctionCreateQSL_D(0, id_schet);
			EDACreateLabel(mo_main, stistica, 15, 21);
	    }

			Fun.OpenSQL("SELECT [DISP],[IS_HMP] FROM [R_SCHET] WHERE [_id] ='"+id_schet+"'");
		if ((mo_main->ADOQuery2->FieldByName("DISP")->AsString == "")&&(mo_main->ADOQuery2->FieldByName("IS_HMP")->AsBoolean == true))
	    {
				//--SPR_V006.UMPNAME 'Условия оказания МП',
				stistica = EDAFunctionCreateQSL_HMP(0, id_schet);
				EDACreateLabel(mo_main, stistica, 5, 40);

				//--SPR_V008.VMPNAME 'Вид МП',
				stistica = EDAFunctionCreateQSL_HMP(1, id_schet);
				EDACreateLabel(mo_main, stistica, 5, 41);

				//--SPR_V014.FRMMPNAME 'Форма МП',
				stistica = EDAFunctionCreateQSL_HMP(2, id_schet);
				EDACreateLabel(mo_main, stistica ,5, 42);

				//--SPR_V018.HVIDNAME 'Вид Высокотехнологической МП',
				//stistica = EDAFunctionCreateQSL_HMP(3, id_schet);
				//EDACreateLabel(mo_main, stistica ,5, 43);

				//--SPR_V019.HMNAME 'Метод Высокотехнологической МП',
				//stistica = EDAFunctionCreateQSL_HMP(4, id_schet);
				//EDACreateLabel(mo_main, stistica ,5, 44);

				//--SPR_EXTR.NAME 'Направление',
				//stistica = EDAFunctionCreateQSL_HMP(5, id_schet);
				//EDACreateLabel(mo_main, stistica ,5, 45);
		}
		mo_main->Panel2->Visible = true;
	}
}

//---------------------------------------------------------------------------
//Функция динамического создания label
void __fastcall Tmo_main::EDACreateLabel(TObject* Sender, String stistica, int vertical, int TypeName)
{
	int i;
	ButtonItemEDA->Font->Style = TFontStyles() << fsBold;
	ButtonItemEDA->Categories->Add();

	switch (TypeName)
		{
		case 0: ButtonItemEDA->Categories->Items[Kol_Label]->Caption = "Условия оказания МП";
				break;
		case 1: ButtonItemEDA->Categories->Items[Kol_Label]->Caption = "Форма МП";
				break;
		case 2: ButtonItemEDA->Categories->Items[Kol_Label]->Caption = "Вид МП";
				break;
		case 3: ButtonItemEDA->Categories->Items[Kol_Label]->Caption = "Признак поступления";
				break;
		case 4: ButtonItemEDA->Categories->Items[Kol_Label]->Caption = "Исход заболевания";
				break;
		case 5: ButtonItemEDA->Categories->Items[Kol_Label]->Caption = "Результат обращения";
				break;
		case 20: ButtonItemEDA->Categories->Items[Kol_Label]->Caption = "Вид МП";
				break;
		case 21: ButtonItemEDA->Categories->Items[Kol_Label]->Caption = "Результат диспансеризации";
				break;
		case 40: ButtonItemEDA->Categories->Items[Kol_Label]->Caption = "Условия оказания МП";
				break;
		case 41: ButtonItemEDA->Categories->Items[Kol_Label]->Caption = "Вид МП";
				break;
		case 42: ButtonItemEDA->Categories->Items[Kol_Label]->Caption = "Форма МП";
				break;
		case 43: ButtonItemEDA->Categories->Items[Kol_Label]->Caption = "Вид Высокотехнологической МП";
				break;
		case 44: ButtonItemEDA->Categories->Items[Kol_Label]->Caption = "Метод Высокотехнологической МП";
				break;
		case 45: ButtonItemEDA->Categories->Items[Kol_Label]->Caption = "Направление";
				break;
		default: break;
		}

	Fun.OpenSQL(stistica);
	ButtonItemEDA->Categories->Items[Kol_Label]->Collapsed = true;

	String itogo = "";
	String it_1 = "";
	int j = 0;
	bool FlagFound = false;
	for (i = 0; !mo_main->ADOQuery2->Eof; i++)
		{
			it_1 = mo_main->ADOQuery2->FieldByName("id")->AsString;
			if(it_1 == "100500")
			{
				itogo = mo_main->ADOQuery2->FieldByName("name")->AsString + ": " + mo_main->ADOQuery2->FieldByName("cnt")->AsString;
				ButtonItemEDA->Categories->Items[Kol_Label]->Caption +=  " ( " + mo_main->ADOQuery2->FieldByName("cnt")->AsString + " )";
				FlagFound = true;
			}
			else
			{
				ButtonItemEDA->Categories->Items[Kol_Label]->Items->Add();
				ButtonItemEDA->Categories->Items[Kol_Label]->Items->Items[j]->Caption = mo_main->ADOQuery2->FieldByName("name")->AsString + ": " + mo_main->ADOQuery2->FieldByName("cnt")->AsString;
				j++;
			}
			mo_main->ADOQuery2->Next();
		}
	if (FlagFound)
	{
		ButtonItemEDA->Categories->Items[Kol_Label]->Items->Add();
		ButtonItemEDA->Categories->Items[Kol_Label]->Items->Items[j]->Caption = itogo;
		ButtonItemEDA->Categories->Items[Kol_Label]->Collapsed = true;
	}
	Kol_Label++;

	mo_main->Refresh();
}

//---------------------------------------------------------------------------
//Вызов функции SQL запроса по общему случаю
String EDAFunctionCreateQSL(int Type, String id_schet)
{
	String stistica = "";
	switch (Type)
		{
		case 0: stistica = "  												\
					declare @t table (id int, name nvarchar(50), cnt int) 	\
					insert into @t          								\
					SELECT idump, UMPNAME, 0      							\
					FROM SPR_V006             								\
					update t set  t.cnt=o.cnt     							\
					from @t t                								\
					join(	select usl_ok, count(*) cnt      				\
						from R_Z_SL sl   									\
						LEFT JOIN  [R_ZAP] z on sl.[_idzap] = z.[_id]     	\
						WHERE z.[_schet_id] = " + id_schet + "   			\
						group by usl_ok       								\
					) o on o.usl_ok=t.id     								\
					insert into @t (id, name , cnt) values (100500, 'Итого', (select sum(cnt) from @t t )) \
					select * from @t order by id";
				break;
		case 1: stistica = "  												\
					declare @t table (id int, name nvarchar(50), cnt int) 	\
					insert into @t          								\
					SELECT IDFRMMP, FRMMPNAME, 0      						\
					FROM SPR_V014             								\
					update t set  t.cnt=o.cnt     							\
					from @t t                								\
					join(	select FOR_POM id, count(*) cnt      			\
							from R_Z_SL sl   								\
							LEFT JOIN  [R_ZAP] z on sl.[_idzap] = z.[_id]  \
							WHERE z.[_schet_id] = " + id_schet + " 			\
							group by FOR_POM    							\
						) o on o.id=t.id    								\
					insert into @t (id, name , cnt) values (100500, 'Итого', (select sum(cnt) from @t t )) \
					select * from @t order by id";
                    break;
			case 2:	stistica = "  											\
					declare @t table (id int, name nvarchar(254), cnt int) 	\
					insert into @t 											\
					SELECT  IDVMP, VMPNAME, 0      							\
					FROM SPR_V008             								\
					where IDVMP IN (1,2,3,4,11,12,13,21,22,31,32)			\
					update t set  t.cnt=o.cnt     							\
					from @t t                								\
					join(	select VIDPOM id, count(*) cnt      			\
							from R_Z_SL sl   								\
							LEFT JOIN  [R_ZAP] z on sl.[_idzap] = z.[_id] 	\
							WHERE z.[_schet_id] = "+ id_schet + "			\
							group by VIDPOM   								\
						) o on o.id=t.id    								\
					insert into @t (id, name , cnt) values (100500, 'Итого', (select sum(cnt) from @t t )) \
					select * from @t order by id";
					break;
			case 3: stistica = "  											\
					declare @t table (id int, name nvarchar(50), cnt int) 	\
					insert into @t 											\
					SELECT  _id, NAME, 0      								\
					FROM SPR_P_PER             								\
					update t set  t.cnt=o.cnt     							\
					from @t t                								\
					join(	select P_PER id, count(*) cnt      				\
							from R_Z_SL sl   								\
							LEFT JOIN  [R_ZAP] z on sl.[_idzap] = z.[_id]  \
							WHERE z.[_schet_id] = "+ id_schet + "			\
							group by P_PER    								\
						) o on o.id=t.id    								\
					insert into @t (id, name , cnt) values (100500, 'Итого', (select sum(cnt) from @t t )) \
					select * from @t order by id";
					break;
			case 4: stistica = "  											\
					declare @t table (id int, name nvarchar(50), cnt int) 	\
					insert into @t 											\
					select  IDIZ, IZNAME, 0     							\
					from spr_v012             								\
					where IDIZ IN (101,102,103,104,201,202,203,204,301,302,303,304,305,306,401,402,403)	\
					update t set  t.cnt=o.cnt     							\
					from @t t                								\
					join(	select ISHOD id, count(*) cnt      				\
							from R_Z_SL sl   								\
							LEFT JOIN  [R_ZAP] z on sl.[_idzap] = z.[_id] 	\
							WHERE z.[_schet_id] = "+ id_schet + "			\
							group by ISHOD    								\
						) o on o.id=t.id    								\
					insert into @t (id, name , cnt) values (100500, 'Итого', (select sum(cnt) from @t t )) \
					select * from @t order by cnt DESC";
					break;
			case 5: stistica = "  											\
					declare @t table (id int, name nvarchar(254), cnt int) 	\
					insert into @t 											\
					select  IDRMP, RMPNAME, 0      							\
					from spr_v009             								\
					update t set  t.cnt=o.cnt     							\
					from @t t                								\
					join(	select RSLT id, count(*) cnt   					\
							from R_Z_SL sl   								\
							LEFT JOIN  [R_ZAP] z on sl.[_idzap] = z.[_id]  \
							WHERE z.[_schet_id] = "+ id_schet + "			\
							group by RSLT    								\
						) o on o.id=t.id    								\
					insert into @t (id, name , cnt) values (100500, 'Итого', (select sum(cnt) from @t t )) \
					select * from @t order by cnt DESC";
					break;
		default: break;
		}
return (stistica);
}

//---------------------------------------------------------------------------
//Вызов функции SQL запроса по общему диспансаризация
String EDAFunctionCreateQSL_D(int Type, String id_schet)
{
	String stistica = "";
	switch (Type)
		{
		case 0: stistica = "  												\
					declare @t table (id int, name nvarchar(254), cnt int) 	\
					insert into @t 											\
					SELECT  IDVMP, VMPNAME, 0      							\
					FROM SPR_V008             								\
					update t set  t.cnt=o.cnt     							\
					from @t t                								\
					join(	select VIDPOM id, count(*) cnt      			\
							from R_Z_SL_D sl   							\
							LEFT JOIN  [R_ZAP] z on sl.[_idzap] = z.[_id]  \
							WHERE z.[_schet_id] = " + id_schet + "   		\
							group by VIDPOM    								\
						) o on o.id=t.id    								\
					insert into @t (id, name , cnt) values (100500, 'Итого', (select sum(cnt) from @t t )) \
					select * from @t order by id ";
				break;
		case 1: stistica = "  												\
					declare @t table (id int, name nvarchar(255), cnt int) 	\
					insert into @t 											\
					SELECT  IDDR, DRNAME, 0      							\
					FROM SPR_V017             								\
					update t set  t.cnt=o.cnt     							\
					from @t t                								\
					join(	select RSLT_D id, count(*) cnt      			\
							from R_Z_SL_D sl 								\
							LEFT JOIN  [R_ZAP] z on sl.[_idzap] = z.[_id] 	\
							WHERE z.[_schet_id] = " + id_schet + "        	\
							group by RSLT_D        							\
						) o on o.id=t.id    								\
					insert into @t (id, name , cnt) values (100500, 'Итого', (select sum(cnt) from @t t )) \
					select * from @t order by id";
                    break;
		default: break;
		}
return (stistica);
}

//---------------------------------------------------------------------------
//Вызов функции SQL запроса по высокотехнологическому случаю
String EDAFunctionCreateQSL_HMP(int Type, String id_schet)
{
	String stistica = "";
	switch (Type)
		{
		case 0: stistica = "  												\
					declare @t table (id int, name nvarchar(50), cnt int) 	\
					insert into @t 											\
					SELECT idump, UMPNAME, 0  								\
					FROM SPR_V006											\
					update t set  t.cnt=o.cnt 								\
					from @t t 												\
					join(   select usl_ok, count(*) cnt 					\
							from R_Z_SL_HMP sl 							\
							LEFT JOIN  [R_ZAP] z on sl.[_idzap] = z.[_id]  \
							WHERE z.[_schet_id] = " + id_schet + "   		\
							group by usl_ok									\
						) o on o.usl_ok=t.id 								\
					insert into @t (id, name , cnt) values (100500, 'Итого', (select sum(cnt) from @t t )) \
					select * from @t order by id";
				break;
		case 1: stistica = "  												\
					declare @t table (id int, name nvarchar(254), cnt int) 	\
					insert into @t 											\
					SELECT  IDVMP, VMPNAME, 0      							\
					FROM SPR_V008             								\
					update t set  t.cnt=o.cnt     							\
					from @t t                								\
					join(	select VIDPOM id, count(*) cnt      			\
							from R_Z_SL_HMP sl   							\
							LEFT JOIN  [R_ZAP] z on sl.[_idzap] = z.[_id]  \
							WHERE z.[_schet_id] = " + id_schet + "   		\
							group by VIDPOM    								\
						) o on o.id=t.id    								\
					insert into @t (id, name , cnt) values (100500, 'Итого', (select sum(cnt) from @t t )) \
					select * from @t order by id ";
                    break;
		case 2: stistica = "  												\
					declare @t table (id int, name nvarchar(50), cnt int) 	\
					insert into @t          								\
					SELECT IDFRMMP, FRMMPNAME, 0      						\
					FROM SPR_V014             								\
					update t set  t.cnt=o.cnt     							\
					from @t t                								\
					join(	select FOR_POM id, count(*) cnt      			\
							from R_Z_SL_HMP sl   							\
							LEFT JOIN  [R_ZAP] z on sl.[_idzap] = z.[_id]  \
							WHERE z.[_schet_id] = " + id_schet + "   		\
							group by FOR_POM   								\
						) o on o.id=t.id    								\
					insert into @t (id, name , cnt) values (100500, 'Итого', (select sum(cnt) from @t t )) \
					select * from @t order by id   ";
                    break;
		case 3: stistica = "  														\
					declare @t table (id nvarchar(12), name nvarchar(255), cnt int) \
					insert into @t         											\
					SELECT IDHVID, HVIDNAME, 0      								\
					FROM SPR_V018             										\
					update t set  t.cnt=o.cnt     									\
					from @t t               										\
					join(	select VID_HMP id, count(*) cnt      					\
							from R_Z_SL_HMP sl   									\
							LEFT JOIN  [R_ZAP] z on sl.[_idzap] = z.[_id]     		\
							WHERE z.[_schet_id] = " + id_schet + " 					\
							group by VID_HMP    									\
						) o on o.id=t.id    										\
					insert into @t (id, name , cnt) values (100500, 'Итого', (select sum(cnt) from @t t )) \
					select * from @t order by cnt DESC ";
                    break;
		case 4: stistica = "  												\
					declare @t table (id int, name nvarchar(255), cnt int) 	\
					insert into @t         									\
					SELECT SPR_V019.IDHM, HMNAME, 0      					\
					FROM SPR_V019             								\
                    where SPR_V019.IDHM IN (1,2,3,4,5,6)					\
					update t set  t.cnt=o.cnt     							\
					from @t t                								\
					join(	select METOD_HMP id, count(*) cnt      			\
							from R_Z_SL_HMP sl   							\
							LEFT JOIN  [R_ZAP] z on sl.[_idzap] = z.[_id] 	\
							WHERE z.[_schet_id] =  " + id_schet + " 	   	\
							group by METOD_HMP    							\
						) o on o.id=t.id   									\
					insert into @t (id, name , cnt) values (100500, 'Итого', (select sum(cnt) from @t t )) \
					select * from @t order by cnt DESC  ";
					break;
		case 5: stistica = "  												\
					declare @t table (id int, name nvarchar(255), cnt int) 	\
					insert into @t         									\
					SELECT SPR_EXTR._id, SPR_EXTR.NAME, 0      				\
					FROM SPR_EXTR             								\
					update t set  t.cnt=o.cnt     							\
					from @t t                								\
					join(	select EXTR id, count(*) cnt      				\
							from R_Z_SL_HMP sl   							\
							LEFT JOIN  [R_ZAP] z on sl.[_idzap] = z.[_id]  \
							WHERE z.[_schet_id] = " + id_schet + " 			\
							group by EXTR    								\
						) o on o.id=t.id    								\
					insert into @t (id, name , cnt) values (100500, 'Итого', (select sum(cnt) from @t t )) \
					select * from @t order by id  ";
                    break;
		default: break;
		}
return (stistica);
}

//---------------------------------------------------------------------------
//Вызов формы Unit2.cpp
void __fastcall Tmo_main::N11Click(TObject *Sender)
{
	mo_connect->ShowModal();
}
//---------------------------------------------------------------------------

void __fastcall Tmo_main::N8Click(TObject *Sender)
{
   	if (!mo_schet) mo_schet = new Tmo_schet(mo_schet);
	mo_schet->Caption = "Добавление счёта";
	mo_schet->ShowModal();
	EDAFunctionYearButtonDelete(mo_main);
 	EDAFunctionYearButtonCreate(mo_main);
}

//---------------------------------------------------------------------------
//Функция динамического удаления года
void __fastcall Tmo_main::EDAFunctionYearButtonDelete(TObject* Sender)
{
    int i,j;
	Fun.OpenSQL("SELECT DISTINCT [YEAR] FROM [R_SCHET] ORDER BY [YEAR] DESC");
	mo_main->ADOQuery2->First();
	for (int i = 0; !mo_main->ADOQuery2->Eof; i++)
	{
	String Temp = mo_main->ADOQuery2->FieldByName("YEAR")->AsString;
		for (j = 0; j < mo_main->ComponentCount; j++)
		{
			if ((mo_main->Components[j]->Name == "ButtonYear" + Temp) || (mo_main->Components[j]->Name == "EndDATE"))
			{
				delete mo_main->Components[j];
				break;
 			}
 		}
		mo_main->ADOQuery2->Next();
	}
}

//---------------------------------------------------------------------------
//Функция динамического создания года
void __fastcall Tmo_main::EDAFunctionYearButtonCreate(TObject* Sender)
{
    int i,j;
	Fun.OpenSQL("SELECT DISTINCT [YEAR] FROM [R_SCHET] ORDER BY [YEAR] DESC");
	mo_main->ADOQuery2->First();
	for (int i = 0; !mo_main->ADOQuery2->Eof; i++)
	{
		Butt = new TButton(this);
		Butt->Parent = Panel1;
		Butt->Top = 5;
		Butt->Left = i*40+5;
		Butt->Height = 20;
		Butt->Width = 40;
		Butt->Caption = mo_main->ADOQuery2->FieldByName("YEAR")->AsString;
		Butt->OnClick = YEAR_Click;
		if (i == 0)
		{
			YEAR = mo_main->ADOQuery2->FieldByName("YEAR")->AsString;
			Butt->Name = "EndDATE";
		}
		else Butt->Name ="ButtonYear" + Butt->Caption;
		mo_main->ADOQuery2->Next();
	}

   	for (i = 0; i < mo_main->ComponentCount; i++)
   		{
			if (mo_main->Components[i]->Name == "EndDATE")
			{
	 			((TButton *)(mo_main->Components[i]))->Click();
	 			break;
			}
   		}
}

//---------------------------------------------------------------------------
void __fastcall Tmo_main::N9Click(TObject *Sender)
{
  	if (!mo_schet) mo_schet = new Tmo_schet(mo_schet);
	mo_schet->Caption = "Изменение реквизитов счёта";
	mo_schet->ShowModal();
}

//---------------------------------------------------------------------------
void __fastcall Tmo_main::N12Click(TObject *Sender)
{
 	mo_select_mo->ShowModal();
}

//Удаление счета
//---------------------------------------------------------------------------
void __fastcall Tmo_main::N10Click(TObject *Sender)
{
if (MessageBox(Application->Handle,
	L"Вы хотите удалить счет?",
	L"Внимание, происходит удаление счета",
	MB_ICONQUESTION | MB_YESNO) == IDYES)
	{
		EDAFunctionYearButtonDelete(mo_main);
		Fun.DeleteLineSQL("DELETE FROM [R_SCHET] WHERE [_id]=",mo_main->DBGrid1->DataSource->DataSet->Fields->Fields[0]->Value);
		EDAFunctionYearButtonCreate(mo_main);
	}
}

//---------------------------------------------------------------------------
void __fastcall Tmo_main::N16Click(TObject *Sender)
{
 	Form5->ShowModal();
}

//---------------------------------------------------------------------------
void __fastcall Tmo_main::N17Click(TObject *Sender)
{
    /*
	int id = mo_main->DBGrid1->DataSource->DataSet->Fields->Fields[0]->Value;
	AnsiString temp = "res.exe "+IntToStr(id);
 	//const int sz = temp.Length()+1;

 	char cmd[100];

	strcpy(cmd, temp.c_str());

 	WinExec(cmd,SW_SHOW);
	//ShellExecute(0,'open',"sdfgd sd" ,"sdfsdf" ,0,SW_SHOW);
	*/
}
//---------------------------------------------------------------------------

void __fastcall Tmo_main::Image1Click(TObject *Sender)
{
	if (mo_main->SplitView1->Opened) mo_main->SplitView1->Close();
	else mo_main->SplitView1->Open();
}

//---------------------------------------------------------------------------
void __fastcall Tmo_main::SplitView1Opened(TObject *Sender)
{
	mo_main->CategoryButtons1->Width = mo_main->SplitView1->OpenedWidth;
}

//---------------------------------------------------------------------------
void __fastcall Tmo_main::SplitView1Closed(TObject *Sender)
{
	mo_main->CategoryButtons1->Width = 50;
}

//---------------------------------------------------------------------------
void __fastcall Tmo_main::DBGrid1DrawColumnCell(TObject *Sender, const TRect &Rect,
		  int DataCol, TColumn *Column, TGridDrawState State)
{
	F1MyDBGrid *grid = static_cast<F1MyDBGrid*>(Sender);
	if (grid->DataLink->ActiveRecord == grid->Row -1)
	{
	 TField *F = Column->Field;
	 TCanvas *Cvs = DBGrid1->Canvas;
	 Cvs->Brush->Color = clSkyBlue;
     Cvs->FillRect(Rect);
	 Cvs->Font->Color = clBlack;
     Cvs->TextOut(Rect.Left+2, Rect.Top+2, F->Text);
	 Cvs->TextOut(Rect.Left+2, Rect.Top+2, F->Text);
	}
}

//---------------------------------------------------------------------------
void __fastcall Tmo_main::DBGrid1DblClick(TObject *Sender)
{
	if (mo_main->DBGrid1->DataSource->DataSet->RecordCount > 0 )
	{
		int id = mo_main->DBGrid1->DataSource->DataSet->Fields->Fields[0]->Value;
		AnsiString temp = "ItMedMor.exe "+IntToStr(id) + " " + 	TypeWorkUser + " " + SnilsWorking;
		char cmd[100];
		strcpy(cmd, temp.c_str());
		WinExec(cmd,SW_SHOW);
	}
}

//---------------------------------------------------------------------------
void __fastcall Tmo_main::N20Click(TObject *Sender)
{
	mo_doctors->ShowModal();
}

//---------------------------------------------------------------------------
void __fastcall Tmo_main::N21Click(TObject *Sender)
{
	mo_podr->ShowModal();
}

//---------------------------------------------------------------------------
void __fastcall Tmo_main::N19Click(TObject *Sender)
{
	mo_lpu_1->ShowModal();
}

//---------------------------------------------------------------------------
void __fastcall Tmo_main::CategoryButtons1Categories0Items0Click(TObject *Sender)

{
	if (mo_main->SplitView1->Opened) mo_main->SplitView1->Close();
	else mo_main->SplitView1->Open();
}
//---------------------------------------------------------------------------

void __fastcall Tmo_main::CategoryButtons1Categories0Items1Click(TObject *Sender)
{
	if (!mo_schet) mo_schet = new Tmo_schet(mo_schet);
	mo_schet->Caption = "Добавление счёта";
	mo_schet->ShowModal();

 	EDAFunctionYearButtonDelete(mo_main);
	EDAFunctionYearButtonCreate(mo_main);
}
//---------------------------------------------------------------------------

void __fastcall Tmo_main::CategoryButtons1Categories0Items2Click(TObject *Sender)
{
	if (!mo_schet) mo_schet = new Tmo_schet(mo_schet);
	mo_schet->Caption = "Изменение реквизитов счёта";
	mo_schet->ShowModal();
    UpdateLen();
}

//---------------------------------------------------------------------------
void __fastcall Tmo_main::CategoryButtons1Categories0Items3Click(TObject *Sender)
{
if (MessageBox(Application->Handle,
	L"Вы хотите удалить счет?",
	L"Внимание, происходит удаление счета",
	MB_ICONQUESTION | MB_YESNO) == IDYES)
	{
		EDAFunctionYearButtonDelete(mo_main);
		Fun.DeleteLineSQL("DELETE FROM [R_SCHET] WHERE [_id]=",mo_main->DBGrid1->DataSource->DataSet->Fields->Fields[0]->Value);
		EDAFunctionYearButtonCreate(mo_main);
	}
}

//---------------------------------------------------------------------------
void __fastcall Tmo_main::CategoryButtons1Categories0Items8Click(TObject *Sender)
{
	if (this->DBGrid1->Visible)
	{
		if (mo_main->Panel2->Visible)
		{
			mo_main->Panel2->Visible = false;
			UpdateLen();
		}
		else
		{
			mo_main->Panel2->Visible = true;
			UpdateLen();
			EDACreateButtonItem(mo_main);
		}
	}
}

//---------------------------------------------------------------------------
void __fastcall Tmo_main::DBGrid1KeyUp(TObject *Sender, WORD &Key, TShiftState Shift)
{
	if ((Key == 9) || (Key == 38) || (Key == 40))
	{
		EDACreateButtonItem(mo_main);
    }
}

//---------------------------------------------------------------------------
void __fastcall Tmo_main::CategoryButtons1Categories0Items9Click(TObject *Sender)
{
	if (mo_main->DBGrid1->DataSource->DataSet->RecordCount > 0 )
	{
			int id = mo_main->DBGrid1->DataSource->DataSet->Fields->Fields[0]->Value;
			AnsiString temp = "ItMedMor.exe "+IntToStr(id);
			char cmd[100];
			strcpy(cmd, temp.c_str());
			WinExec(cmd,SW_SHOW);
	}
}

//---------------------------------------------------------------------------
void __fastcall Tmo_main::CategoryButtons1Categories0Items7Click(TObject *Sender)
{
	Form9->ShowModal();
}

//---------------------------------------------------------------------------
void __fastcall Tmo_main::CategoryButtons1Categories0Items4Click(TObject *Sender)
{
	AnsiString temp = "export.exe " + mo_main->DBGrid1->DataSource->DataSet->Fields->Fields[0]->AsString;
	char cmd[100];
	strcpy(cmd, temp.c_str());
	WinExec(cmd,SW_SHOW);
}

//---------------------------------------------------------------------------
void __fastcall Tmo_main::Edit12Change(TObject *Sender)
{
	String StrokaPoiska = this->Edit12->Text;

    if (StrokaPoiska.Length()> 0)
	{
	   DopData_U1 = " AND (NSCHET LIKE '%" + StrokaPoiska + "%' OR DSCHET LIKE '%" + StrokaPoiska +"%')";
		if (TypeReqvest == 1)
		{
			Fun.OpenSQL_Grid(SQL_SCHET + YEAR + DopData_U1 + DataSort_U1);
			UpdateLen();
		}

		if (TypeReqvest == 2)
		{
			Fun.OpenSQL_Grid(SQL_SCHET + YEAR + MONTH + DopData_U1 + DataSort_U1);
			UpdateLen();
		}

	}
	else
	{
		DopData_U1 = "";
		if (TypeReqvest == 1)
		{
			Fun.OpenSQL_Grid(SQL_SCHET + YEAR + DopData_U1 + DataSort_U1);
			UpdateLen();
		}
		if (TypeReqvest == 2)
		{
			Fun.OpenSQL_Grid(SQL_SCHET + YEAR + MONTH + DopData_U1 + DataSort_U1);
			UpdateLen();
		}
	}

}

//---------------------------------------------------------------------------
void __fastcall Tmo_main::CategoryButtons1Categories0Items10Click(TObject *Sender)
{
	AnsiString temp = "ItMedMor.exe -1 " + TypeWorkUser + " " + SnilsWorking;
	char cmd[100];
	strcpy(cmd, temp.c_str());
	WinExec(cmd,SW_SHOW);
}

//---------------------------------------------------------------------------
void __fastcall Tmo_main::DBGrid1TitleClick(TColumn *Column)
{
	String Data = Column->FieldName;
	if (Data == "Код")
	{
		if (SostSort_U1 == 1)
		{
			SostSort_U1 = 2;
			DataSort_U1 = " ORDER BY CODE DESC";
		}
		else
		{
			SostSort_U1 = 1;
			DataSort_U1 = " ORDER BY CODE ASC";
		}
	}

	if (Data == "№ ")
	{
		if (SostSort_U1 == 3)
		{
			SostSort_U1 = 4;
			DataSort_U1 = " ORDER BY row_number() over (order by _id desc) DESC";
		}
		else
		{
			SostSort_U1 = 3;
			DataSort_U1 = " ORDER BY row_number() over (order by _id desc) ASC";
		}
	}

	if (Data == "Отчетный период")
	{
		if (SostSort_U1 == 5)
		{
			SostSort_U1 = 6;
			DataSort_U1 = " ORDER BY CONCAT(case                                    \
											 when [MONTH] = '1'  then 'Январь'      \
											 when [MONTH] = '2'  then 'Февраль'     \
											 when [MONTH] = '3'  then 'Март'        \
											 when [MONTH] = '4'  then 'Апрель'      \
											 when [MONTH] = '5'  then 'Май'         \
											 when [MONTH] = '6'  then 'Июнь'        \
											 when [MONTH] = '7'  then 'Июль'        \
											 when [MONTH] = '8'  then 'Август'      \
											 when [MONTH] = '9'  then 'Сентябрь'    \
											 when [MONTH] = '10' then 'Октябрь'     \
											 when [MONTH] = '11' then 'Ноябрь'      \
											 when [MONTH] = '12' then 'Декабрь'     \
										end,  										\
										' ',                             		 	\
										[YEAR]) DESC";
		}
		else
		{
			SostSort_U1 = 5;
			DataSort_U1 = " ORDER BY CONCAT(case                                    \
											 when [MONTH] = '1'  then 'Январь'      \
											 when [MONTH] = '2'  then 'Февраль'     \
											 when [MONTH] = '3'  then 'Март'        \
											 when [MONTH] = '4'  then 'Апрель'      \
											 when [MONTH] = '5'  then 'Май'         \
											 when [MONTH] = '6'  then 'Июнь'        \
											 when [MONTH] = '7'  then 'Июль'        \
											 when [MONTH] = '8'  then 'Август'      \
											 when [MONTH] = '9'  then 'Сентябрь'    \
											 when [MONTH] = '10' then 'Октябрь'     \
											 when [MONTH] = '11' then 'Ноябрь'      \
											 when [MONTH] = '12' then 'Декабрь'     \
										end,  										\
										' ',                             		 	\
										[YEAR]) ASC";
		}
	}

	if (Data == "Номер счёта")
	{
		if (SostSort_U1 == 7)
		{
			SostSort_U1 = 8;
			DataSort_U1 = " ORDER BY NSCHET DESC";
		}
		else
		{
			SostSort_U1 = 7;
			DataSort_U1 = " ORDER BY NSCHET ASC";
		}
	}

	if (Data == "Тип дисп.")
	{
		if (SostSort_U1 == 9)
		{
			SostSort_U1 = 10;
			DataSort_U1 = " ORDER BY DISP DESC";
		}
		else
		{
			SostSort_U1 = 9;
			DataSort_U1 = " ORDER BY DISP ASC";
		}
	}

	if (TypeReqvest == 1)
	{
		Fun.OpenSQL_Grid(SQL_SCHET + YEAR + DopData_U1 + DataSort_U1);
		UpdateLen();
	}
	if (TypeReqvest == 2)
	{
		Fun.OpenSQL_Grid(SQL_SCHET + YEAR + MONTH + DopData_U1 + DataSort_U1);
		UpdateLen();
	}
}

//---------------------------------------------------------------------------
void __fastcall Tmo_main::FormResize(TObject *Sender)
{
	if ((this->WindowState == wsNormal) && (SostForm == 2))
	{
		SostForm = 1;
		UpdateLen();
	}
	if ((this->WindowState == wsMaximized) && (SostForm == 1))
	{
		SostForm = 2;
		UpdateLen();
	}
		ButtonItemEDA->Height = this->Height - 151;
}

//---------------------------------------------------------------------------
void __fastcall Tmo_main::DBGrid1ColumnMoved(TObject *Sender, int FromIndex, int ToIndex)
{
	this->DBGrid1->Columns->Items[ToIndex]->Index = FromIndex;
}
//---------------------------------------------------------------------------


void __fastcall Tmo_main::N5Click(TObject *Sender)
{
	AnsiString temp = "import.exe itmed";
	char cmd[100];
	strcpy(cmd, temp.c_str());
	WinExec(cmd,SW_SHOW);
}
//---------------------------------------------------------------------------


void __fastcall Tmo_main::N13Click(TObject *Sender)
{
	Form13->ShowModal();
}
//---------------------------------------------------------------------------

void __fastcall Tmo_main::N27Click(TObject *Sender)
{
	SchetForYarik = mo_main->DBGrid1->DataSource->DataSet->Fields->Fields[0]->Value;
    Form12->Caption = "Печать отчетности";
	Form12->ShowModal();
}
//---------------------------------------------------------------------------

void __fastcall Tmo_main::CategoryButtons1Categories0Items6Click(TObject *Sender)
{
	SchetForYarik = mo_main->DBGrid1->DataSource->DataSet->Fields->Fields[0]->Value;
    Form12->Caption = "Печать отчетности";
	Form12->ShowModal();
}
//---------------------------------------------------------------------------

void __fastcall Tmo_main::N31Click(TObject *Sender)
{
	Form3->ShowModal();
}
//---------------------------------------------------------------------------

