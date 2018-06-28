//---------------------------------------------------------------------------
//Что-то подправил
#include <vcl.h>
#include <fstream>
#include <iostream>
#pragma hdrstop

#include "Otchet.h"
#include "Main.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)

#pragma resource "*.dfm"


const String TMP_SCHET = "SELECT   [Param_1]    \
								  ,[Param_2]    \
								  ,[Param_3]    \
								  ,[Param_4]    \
								  ,[Param_5]    \
								  ,[Param_6]    \
								  ,[Param_7]    \
								  ,[Param_8]    \
								  ,[Param_9]    \
								  ,[Param_10]   \
								  ,[Param_11]   \
								  ,[Param_12]   \
								  ,[Param_13]	\
						  FROM [MyTempTable] ORDER BY _id ASC";

const String MY_SCHET = "SELECT [_id] 												\
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
								,[DSCHET]                   'Дата счета'            \
							FROM [R_SCHET]";

String Zapros_R_SL = "SELECT  R_SL.DS1                             							    \
							 ,SPR_M001._id                                                   	\
							 ,R_SL.DN                                                           \
							 ,R_PERS.DR                                                         \
					  FROM   R_SL       													 	\
							 LEFT JOIN SPR_M001 ON (SPR_M001.MKB10 = R_SL.DS1) 					\
							 LEFT JOIN R_Z_SL        on R_SL._zslid      = R_Z_SL._id           \
							 LEFT JOIN R_ZAP         on R_Z_SL._idzap    = R_ZAP._id            \
							 LEFT JOIN R_PACIENT 	 on R_ZAP._pid       = R_PACIENT._id        \
							 LEFT JOIN R_PERS        on R_PACIENT.ID_PAC = R_PERS.ID_PAC        \
					  WHERE  R_SL._zslid in  (SELECT R_Z_SL._id							   	    \
											  FROM R_Z_SL										\
											  WHERE R_Z_SL._idzap in (SELECT R_ZAP._id			\
																	  FROM R_ZAP				\
																	  WHERE R_ZAP._schet_id = '";

String Zapros_R_SL_D = " SELECT   R_SL_D.DS1                             							    \
								 ,SPR_M001._id                                                   	    \
								 ,R_SL_D.PR_D_N                                                         \
								 ,R_SL_D.DS1_PR                                                         \
						  FROM   R_SL_D       													 	    \
								 LEFT JOIN SPR_M001 ON (SPR_M001.MKB10 = R_SL_D.DS1) 					\
						  WHERE  R_SL_D._zslid in  (SELECT R_Z_SL_D._id							   	    \
													FROM   R_Z_SL_D										\
													WHERE R_Z_SL_D._idzap in (SELECT R_ZAP._id			\
																			  FROM R_ZAP				\
																			  WHERE R_ZAP._schet_id = '";

String Zapros_R_SL_HMP = " SELECT R_SL_HMP.DS1                          							    \
								 ,SPR_M001._id                                                   	\
								 ,R_PERS.DR                                                         \
						  FROM   R_SL_HMP      													 	\
								 LEFT JOIN SPR_M001 ON (SPR_M001.MKB10 = R_SL_HMP.DS1) 				\
								 LEFT JOIN R_Z_SL_HMP    on R_SL_HMP._zslid   = R_Z_SL_HMP._id      \
								 LEFT JOIN R_ZAP         on R_Z_SL_HMP._idzap = R_ZAP._id           \
								 LEFT JOIN R_PACIENT 	 on R_ZAP._pid        = R_PACIENT._id       \
								 LEFT JOIN R_PERS        on R_PACIENT.ID_PAC  = R_PERS.ID_PAC       \
						  WHERE  R_SL_HMP._zslid in  (SELECT R_Z_SL_HMP._id							\
													  FROM R_Z_SL_HMP								\
													  WHERE R_Z_SL_HMP._idzap in (SELECT R_ZAP._id	\
																				  FROM R_ZAP		\
																				  WHERE R_ZAP._schet_id = '";

struct Tab_Param
{
	String Param_1,
		   Param_2,
		   Param_3,
		   Param_4,
		   Param_5,
		   Param_6,
		   Param_7,
		   Param_8,
		   Param_9,
		   Param_10,
		   Param_11,
		   Param_12,
		   Param_13,
		   Param_14;
} Struct_Param;

AnsiString Src;

TTreeNode *NewRoot;
AnsiString Dir1;
AnsiString Address;
int n = 0;
extern int SchetForYarik;

int Vozrast_0_4;
int Vozrast_5_9;
int Vozrast_14_15;
int Vozrast_15_18;
int KolCount;
int SnyatDisp;
int SostoitDisp;
int VzyatDisp;
int TypeSchet;
int DS1_PR;
int Vzyato_10;
int Viyavleno_11;
int ViyavlenoProfOsmoyr;
int ViyavlenoDisp;
String MyCHET;
String YEAR_OT;
String MONTH_OT;
int KolPers;
int Sovp;

TForm12 *Form12;
//---------------------------------------------------------------------------
__fastcall TForm12::TForm12(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TForm12::FormActivate(TObject *Sender)
{
	TTreeNode *Node;
	this->ADOQuery1->Active = False;
	this->ADOQuery1->SQL->Clear();
	this->ADOQuery1->SQL->Add(MY_SCHET);
	this->ADOQuery1->Active = True;
	UpdateLen();
	this->Constraints->MaxHeight = 	this->Constraints->MinHeight;
	this->Constraints->MaxWidth  = 	this->Constraints->MinWidth;

	this->DBGrid1CellClick(0);

	Dir1 = "D:\\WORK\\REPT" ;
	n = 0;
	this->TreeView1->Items->BeginUpdate();
	this->TreeView1->Items->Clear(); //Очистка списка
	this->TreeView1->Items->Add(NULL,Dir1);

	Node = this->TreeView1->Items->Item[0];
	Node->ImageIndex = n;

	CreateTreeView(Dir1, Node);

	this->TreeView1->Items->EndUpdate();
	this->Label3->Caption = "Номер счета : " + IntToStr(SchetForYarik);
}

//---------------------------------------------------------------------------
void __fastcall TForm12::UpdateLen()
{
	int j;
	int Maxlen = 0;
	int TekLen = 0;
	String DataLen = "";
    String ItogData = "";

	this->DBGrid1->Visible = false;

	if (this->ADOQuery1->RecordCount > 0)
	{
		this->ADOQuery1->Open();
		for (j = 0; j < this->ADOQuery1->FieldCount; j++)
		{
			DataLen = this->ADOQuery1->Fields->Fields[j]->FieldName;
			Maxlen = this->DBGrid1->Canvas->TextWidth(DataLen);

			for (this->ADOQuery1->First(); !this->ADOQuery1->Eof; this->ADOQuery1->Next())
			{
				ItogData = this->ADOQuery1->FieldByName(DataLen)->AsString;
				TekLen = this->DBGrid1->Canvas->TextWidth(ItogData);
				if (TekLen > Maxlen) Maxlen = TekLen;
			}
			if (Maxlen == 0)
			{
				this->DBGrid1->Columns->Items[j]->Width = 6;
			}
			else
			{
				this->DBGrid1->Columns->Items[j]->Width = Maxlen + 7;
				this->DBGrid1->Columns->Items[j]->Alignment = taLeftJustify;
			}
		}
		this->ADOQuery1->First();
		this->DBGrid1->Visible = true;
		this->DBGrid1->DataSource->DataSet->Fields->Fields[1]->Visible = false;
	}
}

//---------------------------------------------------------------------------
void __fastcall TForm12::CreateTreeView(AnsiString Dir, TTreeNode *Root)
{
	TSearchRec sr;
	Src = Dir;
	AnsiString Dir_1;

	if (FindFirst(Src+"\\*", faAnyFile, sr) == 0)
	{
		do
		{
			if (!((sr.Name == ".") || (sr.Name == "..")))
			{
				Dir_1 =  Src+"\\"+sr.Name;
				NewRoot = this->TreeView1->Items->AddChild(Root,sr.Name);
				n++;
				NewRoot->ImageIndex = n;
				CreateTreeView(Dir_1, NewRoot);  // РЕКУРСИВНЫЙ ВЫЗОВ
				Src = Dir;
			}
		}
		while (FindNext(sr) == 0);
		FindClose(sr);
	}
	else
	{
		Root->ImageIndex = -1;
	}
	n--;
}

//---------------------------------------------------------------------------
void __fastcall TForm12::Button2Click(TObject *Sender)
{
	TypeSchet = 0;
	KolPers = 0;
   	Sovp = 0;

	String FisrtDS, SecondDS,TekName;
	int FisrtID, SecondID;
	String ZP;

	InfoShet();

	Form7->QRLabel63->Caption = "Код по ОКЕИ: - Человек " + IntToStr(Sovp);

	Struct_Param.Param_13 = "!!!!";

	String Zapros = "DELETE FROM [ITMed54].[dbo].[MyTempTable]";
	this->ADOQuery3->Active = False;
	this->ADOQuery3->SQL->Clear();
	this->ADOQuery3->SQL->Add(Zapros);
	this->ADOQuery3->ExecSQL();

	char line[1024];
	ifstream F("OTCHET\\Test.ini");

	int Kol = 0;
	if(!F)
	{
		Abort();
	}
	while(F.getline(line, sizeof(line)))
	{
		if (Kol == 0) Struct_Param.Param_1 = line;
		if (Kol == 1) Struct_Param.Param_2 = line;
		if (Kol == 2) FisrtDS = line;
		if (Kol == 3)
		{
			SecondDS = line;
			if (FisrtDS == SecondDS.SubString(1,3))
			{
				Struct_Param.Param_3 = FisrtDS;
			}
			else
			{
				Struct_Param.Param_3 = FisrtDS + "-" + SecondDS.SubString(1,3);
			}
			PoiskDS_15_18(FisrtDS,SecondDS,1);
			//всего 14-18 [4]
			Struct_Param.Param_4  = IntToStr(KolCount);
			//из них юноши [7]
			Struct_Param.Param_5  = IntToStr(Vozrast_15_18);

			Struct_Param.Param_6  = IntToStr(VzyatDisp);
			Struct_Param.Param_7  = IntToStr(DS1_PR);
			Struct_Param.Param_8  = IntToStr(Vzyato_10);
			Struct_Param.Param_9  = IntToStr(ViyavlenoProfOsmoyr);
			Struct_Param.Param_10 = IntToStr(ViyavlenoDisp);
			Struct_Param.Param_11 = IntToStr(SnyatDisp);
			Struct_Param.Param_12 = IntToStr(SostoitDisp);
		}

		ZP = line;
		if (ZP == "//---------------")
		{
			Kol = 0;
			Zapros = "INSERT INTO [MyTempTable] ([Param_1],   \
												 [Param_2],   \
												 [Param_3],   \
												 [Param_4],   \
												 [Param_5],   \
												 [Param_6],   \
												 [Param_7],   \
												 [Param_8],   \
												 [Param_9],   \
												 [Param_10],  \
												 [Param_11],  \
												 [Param_12],  \
												 [Param_13])  \
						  OUTPUT INSERTED._id VALUES ('" + Struct_Param.Param_1 + "'," +
													 "'" + Struct_Param.Param_2 + "'," +
													 "'" + Struct_Param.Param_3 + "'," +
													 "'" + Struct_Param.Param_4 + "'," +
													 "'" + Struct_Param.Param_5 + "'," +
													 "'" + Struct_Param.Param_6 + "'," +
													 "'" + Struct_Param.Param_7 + "'," +
													 "'" + Struct_Param.Param_8 + "'," +
													 "'" + Struct_Param.Param_9 + "'," +
													 "'" + Struct_Param.Param_10 + "'," +
													 "'" + Struct_Param.Param_11 + "'," +
													 "'" + Struct_Param.Param_12 + "'," +
													 "'" + Struct_Param.Param_13 + "')";

			this->ADOQuery3->Active = False;
			this->ADOQuery3->SQL->Clear();
			this->ADOQuery3->SQL->Add(Zapros);
			this->ADOQuery3->Active = True;
			continue;
		}
		if (Kol == 4) FisrtDS = line;
		if (Kol == 5)
		{
			SecondDS = line;
			PoiskDS_15_18(FisrtDS,SecondDS,2);
			if (FisrtDS == SecondDS.SubString(1,3))
			{
				Struct_Param.Param_3 = Struct_Param.Param_3 + ", \n " + FisrtDS;
			}
			else
			{
				Struct_Param.Param_3 = Struct_Param.Param_3 + ", \n " + FisrtDS + "-" + SecondDS.SubString(1,3);
			}
			Struct_Param.Param_4 = IntToStr(StrToInt(Struct_Param.Param_4) + KolCount);
		}

		if (Kol == 6) FisrtDS = line;
		if (Kol == 7)
		{
			SecondDS = line;
			PoiskDS_15_18(FisrtDS,SecondDS,2);
			if (FisrtDS == SecondDS.SubString(1,3))
			{
				Struct_Param.Param_3 = Struct_Param.Param_3 + ", \n " + FisrtDS;
			}
			else
			{
				Struct_Param.Param_3 = Struct_Param.Param_3 + ", \n " + FisrtDS + "-" + SecondDS.SubString(1,3);
			}
			Struct_Param.Param_4 = IntToStr(StrToInt(Struct_Param.Param_4) + KolCount);
		}
		Kol++;
	 }

	Form7->ADOQuery3->Active = False;
	Form7->ADOQuery3->SQL->Clear();
	Form7->ADOQuery3->SQL->Add(TMP_SCHET);
	Form7->ADOQuery3->Active = True;

	Form7->QRDBText1->DataField = Form7->ADOQuery3->Fields->Fields[0]->FieldName;
	Form7->QRDBText2->DataField = Form7->ADOQuery3->Fields->Fields[1]->FieldName;
	Form7->QRDBText3->DataField = Form7->ADOQuery3->Fields->Fields[2]->FieldName;
	Form7->QRDBText4->DataField = Form7->ADOQuery3->Fields->Fields[3]->FieldName;
	Form7->QRDBText5->DataField = Form7->ADOQuery3->Fields->Fields[4]->FieldName;
	Form7->QRDBText6->DataField = Form7->ADOQuery3->Fields->Fields[5]->FieldName;
	Form7->QRDBText7->DataField = Form7->ADOQuery3->Fields->Fields[6]->FieldName;
	Form7->QRDBText8->DataField = Form7->ADOQuery3->Fields->Fields[7]->FieldName;
	Form7->QRDBText9->DataField = Form7->ADOQuery3->Fields->Fields[8]->FieldName;
	Form7->QRDBText10->DataField = Form7->ADOQuery3->Fields->Fields[9]->FieldName;
	Form7->QRDBText11->DataField = Form7->ADOQuery3->Fields->Fields[10]->FieldName;
	Form7->QRDBText12->DataField = Form7->ADOQuery3->Fields->Fields[11]->FieldName;
	Form7->QRDBText13->DataField = Form7->ADOQuery3->Fields->Fields[12]->FieldName;
//	this->QRDBText27->DataField = this->ADOQuery2->Fields->Fields[13]->FieldName;

	Form7->QuickRep2->Preview() ;

}

//---------------------------------------------------------------------------
void __fastcall TForm12::TreeView1Click(TObject *Sender)
{
  TTreeNode *CurItem, *Prev;

	if ( !TreeView1 -> Selected -> HasChildren )
	{
		Prev = TreeView1 -> Selected;
		Address = Prev -> Text;

		while ( Prev )
		{
			if ( Prev -> HasChildren ) Address = Prev -> Text + "\\" + Address;
			Prev = Prev -> Parent;
		}
	}
	this->Label1->Caption=Address;
}

//---------------------------------------------------------------------------
void __fastcall TForm12::TreeView1GetSelectedIndex(TObject *Sender, TTreeNode *Node)
{
	Node->SelectedIndex = Node->ImageIndex;
}
//---------------------------------------------------------------------------

void __fastcall TForm12::TreeView1DblClick(TObject *Sender)
{
	ShowMessage("Запуск отчетности. В стадии разработки");
}

//---------------------------------------------------------------------------
void __fastcall TForm12::PoiskDS_0_4(String FisrtDS,String SecondDS, int TypeWork)
{
	bool Work;
	if (TypeWork ==1 ) 
	{
		Vozrast_0_4  = 0;
		Vozrast_5_9  = 0;
		KolCount     = 0;
		SnyatDisp    = 0;
		SostoitDisp  = 0;
		VzyatDisp    = 0;
		DS1_PR       = 0;
		Vzyato_10    = 0;
		Viyavleno_11 = 0;
	}
	
	String DataTemp;		
	int FisrtID, SecondID, Tek;
	String ZP ="SELECT SPR_M001._id     \
				FROM SPR_M001           \
				WHERE SPR_M001.MKB10 = '" + FisrtDS + "'";
	this->ADOQuery2->Active = False;
	this->ADOQuery2->SQL->Clear();
	this->ADOQuery2->SQL->Add(ZP);
	this->ADOQuery2->Active = True;
	if (this->ADOQuery2->RecordCount == 1)
	{
		FisrtID = this->ADOQuery2->FieldByName(this->ADOQuery2->Fields->Fields[0]->FieldName)->AsInteger;
	}
	else
	{
		HWND hWnd = GetForegroundWindow();
		FisrtDS ="Неправильный код диагноза: " + FisrtDS;
		char *MesData = AnsiString(FisrtDS).c_str();
		MessageBoxA(hWnd, MesData, "Внимание!", MB_OK);
		Abort();
	}

	ZP ="SELECT SPR_M001._id     \
		 FROM SPR_M001           \
		 WHERE SPR_M001.MKB10 = '" + SecondDS + "'";

	this->ADOQuery2->Active = False;
	this->ADOQuery2->SQL->Clear();
	this->ADOQuery2->SQL->Add(ZP);
	this->ADOQuery2->Active = True;
	if (this->ADOQuery2->RecordCount == 1)
	{
		SecondID = this->ADOQuery2->FieldByName(this->ADOQuery2->Fields->Fields[0]->FieldName)->AsInteger;
	}
	else
	{
		HWND hWnd = GetForegroundWindow();
		SecondDS = "Неправильный код диагноза: " + SecondDS;
		char *MesData = AnsiString(SecondDS).c_str();
		MessageBoxA(hWnd, MesData, "Обшика в ini файле!", MB_OK);
		Abort();
	}

	//Данные по обычному счету
	if (TypeSchet == 1)
	{
		ZP = Zapros_R_SL +  MyCHET + "'))";
		this->ADOQuery2->Active = False;
		this->ADOQuery2->SQL->Clear();
		this->ADOQuery2->SQL->Add(ZP);
		this->ADOQuery2->Active = True;
		if (this->ADOQuery2->RecordCount >0)
		{
			this->ADOQuery2->Open();
			for (this->ADOQuery2->First(); !this->ADOQuery2->Eof; this->ADOQuery2->Next())
			{
				Work = false;
				//Поиск диагноза согласно диапазона
				Tek = this->ADOQuery2->FieldByName(this->ADOQuery2->Fields->Fields[1]->FieldName)->AsInteger;
				if ((Tek >= FisrtID) && (SecondID >= Tek))
				{			
					//День рождения пациентов
					DataTemp = this->ADOQuery2->FieldByName(this->ADOQuery2->Fields->Fields[3]->FieldName)->AsString;
					if ((StrToInt(YEAR_OT) - StrToInt(DataTemp.SubString(1,4))) < 15) 
					{
						KolCount++;
						Work = true;
					}
					
					if ((StrToInt(YEAR_OT) - StrToInt(DataTemp.SubString(1,4))) < 5)
					{
						Vozrast_0_4++;
						Work = true;
					}
					if (
						((StrToInt(YEAR_OT) - StrToInt(DataTemp.SubString(1,4))) > 4) &&
						((StrToInt(YEAR_OT) - StrToInt(DataTemp.SubString(1,4))) < 10)
					   )
					{
						Vozrast_5_9++;
						Work = true;						
					}

					if (Work)
					{
						//Диспансерное наблюдение
						Tek = this->ADOQuery2->FieldByName(this->ADOQuery2->Fields->Fields[2]->FieldName)->AsInteger;
						if ((Tek == 4) || (Tek == 6)) SnyatDisp++;
						if (Tek == 1) SostoitDisp++;
						if (Tek == 2) VzyatDisp++;
                    }
					//String YEAR_OT;
					//String MONTH_OT;
				}
			}
		}
	}

	if (TypeSchet == 2)
	{
		ZP =Zapros_R_SL_D + MyCHET + "'))";
		this->ADOQuery2->Active = False;
		this->ADOQuery2->SQL->Clear();
		this->ADOQuery2->SQL->Add(ZP);
		this->ADOQuery2->Active = True;
		if (this->ADOQuery2->RecordCount >0)
		{
			this->ADOQuery2->Open();
			for (this->ADOQuery2->First(); !this->ADOQuery2->Eof; this->ADOQuery2->Next())
			{
				Work = false;
				//Поиск диагноза согласно диапазона
				Tek = this->ADOQuery2->FieldByName(this->ADOQuery2->Fields->Fields[1]->FieldName)->AsInteger;
				if ((Tek >= FisrtID) && (SecondID >= Tek))
				{
					//День рождения пациентов
					//String YEAR_OT;
					//String MONTH_OT;					
					DataTemp = this->ADOQuery2->FieldByName(this->ADOQuery2->Fields->Fields[2]->FieldName)->AsString;
					
					if ((StrToInt(YEAR_OT) - StrToInt(DataTemp.SubString(1,4))) < 15) 
					{
						KolCount++;
						Work = true;
					}
										
					if ((StrToInt(YEAR_OT) - StrToInt(DataTemp.SubString(1,4))) < 5)
					{
						Vozrast_0_4++;
						Work = true;						
					}
					if (
						((StrToInt(YEAR_OT) - StrToInt(DataTemp.SubString(1,4))) > 4) &&
						((StrToInt(YEAR_OT) - StrToInt(DataTemp.SubString(1,4))) < 10)
					   )
					{
						Vozrast_5_9++;
						Work = true;						
					}
					if (Work) 
					{
						//Диспансерное наблюдение
						Tek = this->ADOQuery2->FieldByName(this->ADOQuery2->Fields->Fields[2]->FieldName)->AsInteger;
						//if ((Tek == 4) || (Tek == 6)) SnyatDisp++;
						if (Tek == 1) SostoitDisp++;
						if (Tek == 2) VzyatDisp++;
						//Установлен впервые
						Tek = this->ADOQuery2->FieldByName(this->ADOQuery2->Fields->Fields[3]->FieldName)->AsInteger;
						if (Tek == 1) DS1_PR++;	
						if (
							this->ADOQuery2->FieldByName(this->ADOQuery2->Fields->Fields[2]->FieldName)->AsInteger ==
							this->ADOQuery2->FieldByName(this->ADOQuery2->Fields->Fields[3]->FieldName)->AsInteger 
						   ) 
						{
							Vzyato_10++;
						}											
					}
				}
			}
		}															  
	}

	if (TypeSchet == 3)
	{
		ZP = Zapros_R_SL_HMP + MyCHET + "'))";//	\
		this->ADOQuery2->Active = False;
		this->ADOQuery2->SQL->Clear();
		this->ADOQuery2->SQL->Add(ZP);
		this->ADOQuery2->Active = True;
		if (this->ADOQuery2->RecordCount >0)
		{
			this->ADOQuery2->Open();
			for (this->ADOQuery2->First(); !this->ADOQuery2->Eof; this->ADOQuery2->Next())
			{
				Work = false;
				//Поиск диагноза согласно диапазона
				Tek = this->ADOQuery2->FieldByName(this->ADOQuery2->Fields->Fields[1]->FieldName)->AsInteger;
				if ((Tek >= FisrtID) && (SecondID >= Tek))
				{			
					//День рождения пациентов
					//String YEAR_OT;
					//String MONTH_OT;									
					DataTemp = this->ADOQuery2->FieldByName(this->ADOQuery2->Fields->Fields[2]->FieldName)->AsString;
					if ((StrToInt(YEAR_OT) - StrToInt(DataTemp.SubString(1,4))) < 15) 
					{
						KolCount++;
						Work = true;
					}
					
					if ((StrToInt(YEAR_OT) - StrToInt(DataTemp.SubString(1,4))) < 5)
					{
						Vozrast_0_4++;
						Work = true;						
					}
					if (
						((StrToInt(YEAR_OT) - StrToInt(DataTemp.SubString(1,4))) > 4) &&
						((StrToInt(YEAR_OT) - StrToInt(DataTemp.SubString(1,4))) < 10)
					   )
					{
						Vozrast_5_9++;
						Work = true;						
					}

					if (Work) 
					{
						//Диспансерное наблюдение
						//Tek = this->ADOQuery2->FieldByName(this->ADOQuery2->Fields->Fields[2]->FieldName)->AsInteger;
						//if ((Tek == 4) || (Tek == 6)) SnyatDisp++;
						//if (Tek == 1) SostoitDisp++;
						//if (Tek == 2) VzyatDisp++;						
					}
				}
			}
		}
	}
}

//---------------------------------------------------------------------------
void __fastcall TForm12::PoiskDS_15_18(String FisrtDS,String SecondDS, int TypeWork)
{
	bool Work;
	if (TypeWork ==1 )
	{
		Vozrast_14_15 = 0;
		Vozrast_15_18 = 0;
		KolCount     = 0;
		SnyatDisp    = 0;
		SostoitDisp  = 0;
		VzyatDisp    = 0;
		DS1_PR       = 0;
		Vzyato_10    = 0;
		ViyavlenoDisp = 0;
		ViyavlenoProfOsmoyr = 0;
	}

	String DataTemp;
	int FisrtID, SecondID, Tek;
	String ZP ="SELECT SPR_M001._id     \
				FROM SPR_M001           \
				WHERE SPR_M001.MKB10 = '" + FisrtDS + "'";
	this->ADOQuery3->Active = False;
	this->ADOQuery3->SQL->Clear();
	this->ADOQuery3->SQL->Add(ZP);
	this->ADOQuery3->Active = True;
	if (this->ADOQuery3->RecordCount == 1)
	{
		FisrtID = this->ADOQuery3->FieldByName(this->ADOQuery3->Fields->Fields[0]->FieldName)->AsInteger;
	}
	else
	{
		HWND hWnd = GetForegroundWindow();
		FisrtDS ="Неправильный код диагноза: " + FisrtDS;
		char *MesData = AnsiString(FisrtDS).c_str();
		MessageBoxA(hWnd, MesData, "Внимание!", MB_OK);
		Abort();
	}

	ZP ="SELECT SPR_M001._id     \
		 FROM SPR_M001           \
		 WHERE SPR_M001.MKB10 = '" + SecondDS + "'";

	this->ADOQuery3->Active = False;
	this->ADOQuery3->SQL->Clear();
	this->ADOQuery3->SQL->Add(ZP);
	this->ADOQuery3->Active = True;
	if (this->ADOQuery3->RecordCount == 1)
	{
		SecondID = this->ADOQuery3->FieldByName(this->ADOQuery3->Fields->Fields[0]->FieldName)->AsInteger;
	}
	else
	{
		HWND hWnd = GetForegroundWindow();
		SecondDS = "Неправильный код диагноза: " + SecondDS;
		char *MesData = AnsiString(SecondDS).c_str();
		MessageBoxA(hWnd, MesData, "Обшика в ini файле!", MB_OK);
		Abort();
	}

	//Данные по обычному счету
	if (TypeSchet == 1)
	{
		ZP = Zapros_R_SL + MyCHET + "'))";

		this->ADOQuery3->Active = False;
		this->ADOQuery3->SQL->Clear();
		this->ADOQuery3->SQL->Add(ZP);
		this->ADOQuery3->Active = True;
		if (this->ADOQuery3->RecordCount >0)
		{
			this->ADOQuery3->Open();
			for (this->ADOQuery3->First(); !this->ADOQuery3->Eof; this->ADOQuery3->Next())
			{
				Work = false;
				//Поиск диагноза согласно диапазона
				Tek = this->ADOQuery3->FieldByName(this->ADOQuery3->Fields->Fields[1]->FieldName)->AsInteger;
				if ((Tek >= FisrtID) && (SecondID >= Tek))
				{
					//День рождения пациентов
					DataTemp = this->ADOQuery3->FieldByName(this->ADOQuery3->Fields->Fields[3]->FieldName)->AsString;

					if (
						((StrToInt(YEAR_OT) - StrToInt(DataTemp.SubString(1,4))) > 13) &&
						((StrToInt(YEAR_OT) - StrToInt(DataTemp.SubString(1,4))) < 18)
					   )
					{
						KolCount++;
						Work = true;
					}

					if (
						((StrToInt(YEAR_OT) - StrToInt(DataTemp.SubString(1,4))) > 13) &&
						((StrToInt(YEAR_OT) - StrToInt(DataTemp.SubString(1,4))) < 16)
					   )
					{
						Vozrast_14_15++;
						Work = true;
					}					if (
						((StrToInt(YEAR_OT) - StrToInt(DataTemp.SubString(1,4))) > 15) &&
						((StrToInt(YEAR_OT) - StrToInt(DataTemp.SubString(1,4))) < 18)
					   )
					{
						Vozrast_15_18++;
						Work = true;
					}

					if (Work)
					{
						//Диспансерное наблюдение
						Tek = this->ADOQuery3->FieldByName(this->ADOQuery3->Fields->Fields[2]->FieldName)->AsInteger;
						if ((Tek == 4) || (Tek == 6)) SnyatDisp++;
						if (Tek == 1) SostoitDisp++;
						if (Tek == 2) VzyatDisp++;
					}
					//String YEAR_OT;
					//String MONTH_OT;
				}
			}
		}
	}

	if (TypeSchet == 2)
	{
		ZP = Zapros_R_SL_D + MyCHET + "'))";
		this->ADOQuery3->Active = False;
		this->ADOQuery3->SQL->Clear();
		this->ADOQuery3->SQL->Add(ZP);
		this->ADOQuery3->Active = True;
		if (this->ADOQuery3->RecordCount >0)
		{
			this->ADOQuery3->Open();
			for (this->ADOQuery3->First(); !this->ADOQuery3->Eof; this->ADOQuery3->Next())
			{
				Work = false;
				//Поиск диагноза согласно диапазона
				Tek = this->ADOQuery3->FieldByName(this->ADOQuery3->Fields->Fields[1]->FieldName)->AsInteger;
				if ((Tek >= FisrtID) && (SecondID >= Tek))
				{
					//День рождения пациентов
					//String YEAR_OT;
					//String MONTH_OT;
					DataTemp = this->ADOQuery3->FieldByName(this->ADOQuery3->Fields->Fields[2]->FieldName)->AsString;

					if (
						((StrToInt(YEAR_OT) - StrToInt(DataTemp.SubString(1,4))) > 9) &&
						((StrToInt(YEAR_OT) - StrToInt(DataTemp.SubString(1,4))) < 15)
					   )
					{
						Vozrast_14_15++;
						Work = true;
					}					if (
						((StrToInt(YEAR_OT) - StrToInt(DataTemp.SubString(1,4))) > 14) &&
						((StrToInt(YEAR_OT) - StrToInt(DataTemp.SubString(1,4))) < 18)
					   )
					{
						Vozrast_15_18++;
						Work = true;
					}
					if (Work)
					{
						//Диспансерное наблюдение
						Tek = this->ADOQuery3->FieldByName(this->ADOQuery3->Fields->Fields[2]->FieldName)->AsInteger;
						//if ((Tek == 4) || (Tek == 6)) SnyatDisp++;
						if (Tek == 1) SostoitDisp++;
						if (Tek == 2) VzyatDisp++;
						//Установлен впервые
						Tek = this->ADOQuery3->FieldByName(this->ADOQuery3->Fields->Fields[3]->FieldName)->AsInteger;
						if (Tek == 1) DS1_PR++;
						if (
							this->ADOQuery3->FieldByName(this->ADOQuery3->Fields->Fields[2]->FieldName)->AsInteger ==
							this->ADOQuery3->FieldByName(this->ADOQuery3->Fields->Fields[3]->FieldName)->AsInteger
						   )
						{
							Vzyato_10++;
						}
					}
				}
			}
		}
	}

	if (TypeSchet == 3)
	{
		ZP = Zapros_R_SL_HMP + MyCHET + "'))";//	\
		this->ADOQuery3->Active = False;
		this->ADOQuery3->SQL->Clear();
		this->ADOQuery3->SQL->Add(ZP);
		this->ADOQuery3->Active = True;
		if (this->ADOQuery3->RecordCount >0)
		{
			this->ADOQuery3->Open();
			for (this->ADOQuery3->First(); !this->ADOQuery3->Eof; this->ADOQuery3->Next())
			{
				Work = false;
				//Поиск диагноза согласно диапазона
				Tek = this->ADOQuery3->FieldByName(this->ADOQuery3->Fields->Fields[1]->FieldName)->AsInteger;
				if ((Tek >= FisrtID) && (SecondID >= Tek))
				{
					//День рождения пациентов
					//String YEAR_OT;
					//String MONTH_OT;
					DataTemp = this->ADOQuery3->FieldByName(this->ADOQuery3->Fields->Fields[2]->FieldName)->AsString;
					if (
						((StrToInt(YEAR_OT) - StrToInt(DataTemp.SubString(1,4))) > 9) &&
						((StrToInt(YEAR_OT) - StrToInt(DataTemp.SubString(1,4))) < 15)
					   )
					{
						Vozrast_14_15++;
						Work = true;
					}					if (
						((StrToInt(YEAR_OT) - StrToInt(DataTemp.SubString(1,4))) > 14) &&
						((StrToInt(YEAR_OT) - StrToInt(DataTemp.SubString(1,4))) < 18)
					   )
					{
						Vozrast_15_18++;
						Work = true;
					}

					if (Work)
					{
						//Диспансерное наблюдение
						//Tek = this->ADOQuery2->FieldByName(this->ADOQuery2->Fields->Fields[2]->FieldName)->AsInteger;
						//if ((Tek == 4) || (Tek == 6)) SnyatDisp++;
						//if (Tek == 1) SostoitDisp++;
						//if (Tek == 2) VzyatDisp++;
					}
				}
			}
		}
	}
}

//---------------------------------------------------------------------------
void __fastcall TForm12::InfoShet()
{
	String ZP,TekName;
	String MasName[512];
	int i;
	for (i = 0; i < 512; i++) MasName[i] = "";

	//Установление типа счета
	ZP = "SELECT  [DISP]        \
				 ,[IS_HMP]      \
				 ,[YEAR]        \
				 ,[MONTH]       \
		  FROM R_SCHET          \
		  WHERE [_id] = '" + MyCHET + "'";

	this->ADOQuery2->Active = False;
	this->ADOQuery2->SQL->Clear();
	this->ADOQuery2->SQL->Add(ZP);
	this->ADOQuery2->Active = True;
	if (this->ADOQuery2->RecordCount == 1)
	{
		if (
			(this->ADOQuery2->FieldByName(this->ADOQuery2->Fields->Fields[0]->FieldName)->AsString.Length() == 0) &&
			(this->ADOQuery2->FieldByName(this->ADOQuery2->Fields->Fields[1]->FieldName)->AsString == "False")
		   )
		{
			TypeSchet = 1;
		}

		if (
			(this->ADOQuery2->FieldByName(this->ADOQuery2->Fields->Fields[0]->FieldName)->AsString.Length() != 0) &&
			(this->ADOQuery2->FieldByName(this->ADOQuery2->Fields->Fields[1]->FieldName)->AsString == "False")
		   )
		{
			TypeSchet = 2;
		}

		if (this->ADOQuery2->FieldByName(this->ADOQuery2->Fields->Fields[1]->FieldName)->AsString == "True")
		{
			TypeSchet = 3;
        }

		YEAR_OT = this->ADOQuery2->FieldByName(this->ADOQuery2->Fields->Fields[2]->FieldName)->AsString;
		MONTH_OT = this->ADOQuery2->FieldByName(this->ADOQuery2->Fields->Fields[3]->FieldName)->AsString;
	}

	if (TypeSchet == 1)
	{
		ZP =" SELECT R_Z_SL._id							   	    						\
					 ,R_PERS.ID_PAC                           							\
			  FROM R_Z_SL																\
					 LEFT JOIN R_ZAP         on R_Z_SL._idzap    = R_ZAP._id            \
					 LEFT JOIN R_PACIENT 	 on R_ZAP._pid       = R_PACIENT._id        \
					 LEFT JOIN R_PERS        on R_PACIENT.ID_PAC = R_PERS.ID_PAC        \
			  WHERE R_Z_SL._idzap in (SELECT R_ZAP._id									\
									  FROM R_ZAP										\
									  WHERE R_ZAP._schet_id = '" + MyCHET + "')";
	}

	if (TypeSchet == 2)
	{
		ZP =" SELECT R_Z_SL_D._id							   	    					\
					 ,R_PERS.ID_PAC                           							\
			  FROM R_Z_SL_D																\
					 LEFT JOIN R_ZAP         on R_Z_SL_D._idzap  = R_ZAP._id            \
					 LEFT JOIN R_PACIENT 	 on R_ZAP._pid       = R_PACIENT._id        \
					 LEFT JOIN R_PERS        on R_PACIENT.ID_PAC = R_PERS.ID_PAC        \
			  WHERE R_Z_SL_D._idzap in (SELECT R_ZAP._id								\
										FROM R_ZAP										\
										WHERE R_ZAP._schet_id = '" + MyCHET + "')";
	}

	if (TypeSchet == 3)
	{
		ZP =" SELECT R_Z_SL_HMP._id							   	    					\
					 ,R_PERS.ID_PAC                           							\
			  FROM R_Z_SL_HMP															\
					 LEFT JOIN R_ZAP         on R_Z_SL_HMP._idzap    = R_ZAP._id        \
					 LEFT JOIN R_PACIENT 	 on R_ZAP._pid       = R_PACIENT._id        \
					 LEFT JOIN R_PERS        on R_PACIENT.ID_PAC = R_PERS.ID_PAC        \
			  WHERE R_Z_SL_HMP._idzap in (SELECT R_ZAP._id								\
										  FROM R_ZAP									\
										  WHERE R_ZAP._schet_id = '" + MyCHET + "')";
	}

	this->ADOQuery2->Active = False;
	this->ADOQuery2->SQL->Clear();
	this->ADOQuery2->SQL->Add(ZP);
	this->ADOQuery2->Active = True;

	if (this->ADOQuery2->RecordCount > 0)
	{
		this->ADOQuery2->Open();
		for (this->ADOQuery2->First(); !this->ADOQuery2->Eof; this->ADOQuery2->Next())
		{
			TekName = this->ADOQuery2->FieldByName(this->ADOQuery2->Fields->Fields[1]->FieldName)->AsString;
			Sovp = 0;
			i = 0;

			while (MasName[i].Length()!=0)
			{
				if (TekName == MasName[i])
				{
					Sovp++;
					break;
				}
				i++;
			}

			if (Sovp == 0)
			{
				MasName[i] = TekName;
			}
		}
		Sovp = 0;
		while (MasName[Sovp].Length()!=0)
		{
			Sovp ++;
		}
	}

}

//---------------------------------------------------------------------------
void __fastcall TForm12::Button1Click(TObject *Sender)
{
	TypeSchet = 0;
	KolPers = 0;
	Sovp = 0;

	String FisrtDS, SecondDS,TekName;
	int FisrtID, SecondID;
	String ZP;

	InfoShet();

	Form1->QRLabel1->Caption = "Код по ОКЕИ: - Человек " + IntToStr(Sovp);

	Struct_Param.Param_13 = "!!!!";

	String Zapros = "DELETE FROM [ITMed54].[dbo].[MyTempTable]";
	this->ADOQuery2->Active = False;
	this->ADOQuery2->SQL->Clear();
	this->ADOQuery2->SQL->Add(Zapros);
	this->ADOQuery2->ExecSQL();

	char line[1024];
	ifstream F("OTCHET\\Test.ini");

	int Kol = 0;
	if(!F)
	{
		Abort();
	}
	while(F.getline(line, sizeof(line)))
	{
		if (Kol == 0) Struct_Param.Param_1 = line;
		if (Kol == 1) Struct_Param.Param_2 = line;
		if (Kol == 2) FisrtDS = line;
		if (Kol == 3)
		{
			SecondDS = line;
			if (FisrtDS == SecondDS.SubString(1,3))
			{
				Struct_Param.Param_3 = FisrtDS;
			}
			else
			{
				Struct_Param.Param_3 = FisrtDS + "-" + SecondDS.SubString(1,3);
			}
			PoiskDS_0_4(FisrtDS,SecondDS,1);
			Struct_Param.Param_4  = IntToStr(KolCount);
			Struct_Param.Param_5  = IntToStr(Vozrast_0_4);
			Struct_Param.Param_6  = IntToStr(Vozrast_5_9);
			Struct_Param.Param_7  = IntToStr(VzyatDisp);
			Struct_Param.Param_8  = IntToStr(DS1_PR);
			Struct_Param.Param_9  = IntToStr(Vzyato_10);
			Struct_Param.Param_10 = IntToStr(Viyavleno_11);
			Struct_Param.Param_11 = IntToStr(SnyatDisp);
			Struct_Param.Param_12 = IntToStr(SostoitDisp);
		}

		ZP = line;
		if (ZP == "//---------------")
		{
			Kol = 0;
			Zapros = "INSERT INTO [MyTempTable] ([Param_1],   \
												 [Param_2],   \
												 [Param_3],   \
												 [Param_4],   \
												 [Param_5],   \
												 [Param_6],   \
												 [Param_7],   \
												 [Param_8],   \
												 [Param_9],   \
												 [Param_10],  \
												 [Param_11],  \
												 [Param_12],  \
												 [Param_13])  \
						  OUTPUT INSERTED._id VALUES ('" + Struct_Param.Param_1 + "'," +
													 "'" + Struct_Param.Param_2 + "'," +
													 "'" + Struct_Param.Param_3 + "'," +
													 "'" + Struct_Param.Param_4 + "'," +
													 "'" + Struct_Param.Param_5 + "'," +
													 "'" + Struct_Param.Param_6 + "'," +
													 "'" + Struct_Param.Param_7 + "'," +
													 "'" + Struct_Param.Param_8 + "'," +
													 "'" + Struct_Param.Param_9 + "'," +
													 "'" + Struct_Param.Param_10 + "'," +
													 "'" + Struct_Param.Param_11 + "'," +
													 "'" + Struct_Param.Param_12 + "'," +
													 "'" + Struct_Param.Param_13 + "')";

			this->ADOQuery2->Active = False;
			this->ADOQuery2->SQL->Clear();
			this->ADOQuery2->SQL->Add(Zapros);
			this->ADOQuery2->Active = True;
			continue;
		}
		if (Kol == 4) FisrtDS = line;
		if (Kol == 5)
		{
			SecondDS = line;
			PoiskDS_0_4(FisrtDS,SecondDS,2);
			if (FisrtDS == SecondDS.SubString(1,3))
			{
				Struct_Param.Param_3 = Struct_Param.Param_3 + ", \n " + FisrtDS;
			}
			else
			{
				Struct_Param.Param_3 = Struct_Param.Param_3 + ", \n " + FisrtDS + "-" + SecondDS.SubString(1,3);
			}
			Struct_Param.Param_4 = IntToStr(StrToInt(Struct_Param.Param_4) + KolCount);
		}

		if (Kol == 6) FisrtDS = line;
		if (Kol == 7)
		{
			SecondDS = line;
			PoiskDS_0_4(FisrtDS,SecondDS,2);
			if (FisrtDS == SecondDS.SubString(1,3))
			{
				Struct_Param.Param_3 = Struct_Param.Param_3 + ", \n " + FisrtDS;
			}
			else
			{
				Struct_Param.Param_3 = Struct_Param.Param_3 + ", \n " + FisrtDS + "-" + SecondDS.SubString(1,3);
			}
			Struct_Param.Param_4 = IntToStr(StrToInt(Struct_Param.Param_4) + KolCount);
		}
		Kol++;
	 }

	Form1->ADOQuery2->Active = False;
	Form1->ADOQuery2->SQL->Clear();
	Form1->ADOQuery2->SQL->Add(TMP_SCHET);
	Form1->ADOQuery2->Active = True;

	Form1->QRDBText1->DataField = Form1->ADOQuery2->Fields->Fields[0]->FieldName;
	Form1->QRDBText2->DataField = Form1->ADOQuery2->Fields->Fields[1]->FieldName;
	Form1->QRDBText3->DataField = Form1->ADOQuery2->Fields->Fields[2]->FieldName;
	Form1->QRDBText4->DataField = Form1->ADOQuery2->Fields->Fields[3]->FieldName;
	Form1->QRDBText5->DataField = Form1->ADOQuery2->Fields->Fields[4]->FieldName;
	Form1->QRDBText6->DataField = Form1->ADOQuery2->Fields->Fields[5]->FieldName;
	Form1->QRDBText7->DataField = Form1->ADOQuery2->Fields->Fields[6]->FieldName;
	Form1->QRDBText8->DataField = Form1->ADOQuery2->Fields->Fields[7]->FieldName;
	Form1->QRDBText9->DataField = Form1->ADOQuery2->Fields->Fields[8]->FieldName;
	Form1->QRDBText10->DataField = Form1->ADOQuery2->Fields->Fields[9]->FieldName;
	Form1->QRDBText11->DataField = Form1->ADOQuery2->Fields->Fields[10]->FieldName;
	Form1->QRDBText12->DataField = Form1->ADOQuery2->Fields->Fields[11]->FieldName;
	Form1->QRDBText13->DataField = Form1->ADOQuery2->Fields->Fields[12]->FieldName;

	Form1->QuickRep1->Preview() ;
}
//---------------------------------------------------------------------------

void __fastcall TForm12::DBGrid1ColumnMoved(TObject *Sender, int FromIndex, int ToIndex)
          
{
	this->DBGrid1->Columns->Items[ToIndex]->Index = FromIndex;	
}
//---------------------------------------------------------------------------

void __fastcall TForm12::DBGrid1DrawColumnCell(TObject *Sender, const TRect &Rect,
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

void __fastcall TForm12::DBGrid1CellClick(TColumn *Column)
{
	this->Label3->Caption = "Номер счета : " + this->ADOQuery1->FieldByName(this->ADOQuery1->Fields->Fields[0]->FieldName)->AsString; 
	MyCHET = this->ADOQuery1->FieldByName(this->ADOQuery1->Fields->Fields[0]->FieldName)->AsString;
}
//---------------------------------------------------------------------------

void __fastcall TForm12::Button3Click(TObject *Sender)
{
//	
}
//---------------------------------------------------------------------------

