//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "SpisokUserCreate.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TForm13 *Form13;

String SpisokUser =  "SELECT   row_number() over (order by USER_TYPE) AS [№ ]   			\
							  ,(case                                        				\
								   when [USER_TYPE] = '0'  then 'Администратор'      		\
								   when [USER_TYPE] = '1'  then 'Врач'     					\
								   when [USER_TYPE] = '2'  then 'Оператор ввода данных'     \
								end)              					  AS [Тип]                                            \
							  ,USER_NAME     						  AS [Пользователь]	    \
					  FROM [SYSTEM_USER]";

String FullSpisokUser =  "SELECT  _id 					\
								  ,USER_TYPE            \
								  ,USER_NAME     		\
								  ,PASSWORD 			\
								  ,SNILS 			\
					      FROM [SYSTEM_USER]";

//---------------------------------------------------------------------------
__fastcall TForm13::TForm13(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall TForm13::RadioGroup1Click(TObject *Sender)
{
	if (this->RadioGroup1->ItemIndex == 0)
	{
		this->Panel2->Visible = true;
		this->Panel3->Visible = false;
		this->Panel4->Visible = false;
		this->Panel2->Left = 602;
		this->Panel2->Top = 55;

		this->Edit1->Text = "";
		this->Edit3->Text = "";
		this->Edit4->Text = "";

		this->ComboBox1->Enabled = true;
	}

	if (this->RadioGroup1->ItemIndex == 1)
	{
		this->Panel2->Visible = false;
		this->Panel3->Visible = true;
		this->Panel4->Visible = false;
		this->Panel3->Left = 602;
		this->Panel3->Top = 55;

		this->DBGrid1CellClick(0);

		this->ComboBox1->Enabled = true;
	}

	if (this->RadioGroup1->ItemIndex == 2)
	{
		this->Panel2->Visible = false;
		this->Panel3->Visible = false;
		this->Panel4->Visible = true;
		this->Panel4->Left = 602;
		this->Panel4->Top = 55;

		this->DBGrid1CellClick(0);

		this->ComboBox1->Enabled = false;
	}
}
//---------------------------------------------------------------------------

void __fastcall TForm13::FormActivate(TObject *Sender)
{
	Form13->ADOQuery1->Active = False;
	Form13->ADOQuery1->SQL->Clear();
	Form13->ADOQuery1->SQL->Add(SpisokUser);
	Form13->ADOQuery1->Active = True;

	UpdateLen();

	this->RadioGroup1->ItemIndex = 0;
	this->RadioGroup1Click(0);
}
//---------------------------------------------------------------------------

void __fastcall TForm13::Button1Click(TObject *Sender)
{
	HWND hWnd = GetForegroundWindow();
	String Snils = "NULL";
	String ID, Simvol;

	//Создание новой записи
	if (this->RadioGroup1->ItemIndex == 0)
	{
		if (this->Edit3->Text.Length() == 0)
		{
			MessageBoxA(hWnd, "Пароль отсутствует!", "Внимание!", MB_OK);
			Abort();
		}

		if (this->Edit1->Text.Length() == 0)
		{
			MessageBoxA(hWnd, "Логин пользователя отсутствует!", "Внимание!", MB_OK);
			Abort();
		}

		if (this->Edit3->Text != this->Edit4->Text)
		{
			MessageBoxA(hWnd, "Неверное подтверждение пароля.", "Внимание!", MB_OK);
			Abort();
		}
		String Zapros = SpisokUser + " WHERE USER_NAME = '" + this->Edit1->Text + "'" ;

		this->ADOQuery2->Active = False;
		this->ADOQuery2->SQL->Clear();
		this->ADOQuery2->SQL->Add(Zapros);
		this->ADOQuery2->Active = True;

		if (this->ADOQuery2->RecordCount > 0)
		{
			MessageBoxA(hWnd, "Пользователь с таким логином уже существует!", "Внимание!", MB_OK);
			Abort();
		}

		if (this->ComboBox2->Visible)
		{
			if (this->ComboBox2->Text.Length() > 0)
			{
				ID = "";
				for (int i = 0; i < this->ComboBox2->Text.Length(); i++)
				{
					Simvol = this->ComboBox2->Text.SubString(i + 1, 1);
					if (Simvol == " ") break;
					ID = ID + Simvol;
				}

				Zapros = "SELECT SNILS			\
						  FROM SPRTER_DOCTORS 	\
						  WHERE SPRTER_DOCTORS._id = '" + ID + "'";

				this->ADOQuery2->Active = False;
				this->ADOQuery2->SQL->Clear();
				this->ADOQuery2->SQL->Add(Zapros);
				this->ADOQuery2->Active = True;

				if (this->ADOQuery2->RecordCount == 1)
				{
					Snils = this->ADOQuery2->FieldByName(this->ADOQuery2->Fields->Fields[0]->FieldName)->AsString;
				}
				else
				{
					MessageBoxA(hWnd, "Ошибка в таблице врачей!", "Внимание!", MB_OK);
					Abort();
                }
			}
			else
			{
				MessageBoxA(hWnd, "Врач не выбран!", "Внимание!", MB_OK);
				Abort();
            }
		}

		Zapros = "INSERT INTO [SYSTEM_USER] ( [USER_NAME],   \
											  [USER_TYPE],   \
											  [PASSWORD],    \
											  [SNILS])  	 \
						  OUTPUT INSERTED._id VALUES ('" + this->Edit1->Text 					+ "', " +
													 "'" + IntToStr(this->ComboBox1->ItemIndex) + "', " +
													 "'" + this->Edit3->Text        			+ "', " +
													 "'" + Snils								+ "')" ;
		this->ADOQuery2->Active = False;
		this->ADOQuery2->SQL->Clear();
		this->ADOQuery2->SQL->Add(Zapros);
		this->ADOQuery2->Active = True;

		MessageBoxA(hWnd, "Пользователь успешно добавлен!", "Внимание!", MB_OK);

		this->Edit1->Text = "";
		this->Edit3->Text = "";
		this->Edit4->Text = "";
		this->FormActivate(0);
	}

	//Редактирование существующей записи
	if (this->RadioGroup1->ItemIndex == 1)
	{
		String Zapros = FullSpisokUser + " WHERE USER_NAME = '" + this->DBGrid1->DataSource->DataSet->Fields->Fields[2]->AsString + "'";

		this->ADOQuery2->Active = False;
		this->ADOQuery2->SQL->Clear();
		this->ADOQuery2->SQL->Add(Zapros);
		this->ADOQuery2->Active = True;

		if (this->ADOQuery2->RecordCount == 1)
		{
			if (this->Edit6->Text == this->ADOQuery2->FieldByName(this->ADOQuery2->Fields->Fields[3]->FieldName)->AsString)
			{
				if (this->Edit2->Text.Length() == 0)
				{
					MessageBoxA(hWnd, "Пароль отсутствует!", "Внимание!", MB_OK);
					Abort();
				}

				if (this->Edit1->Text.Length() == 0)
				{
					MessageBoxA(hWnd, "Логин пользователя отсутствует!", "Внимание!", MB_OK);
					Abort();
				}

				if (this->Edit2->Text != this->Edit5->Text)
				{
					MessageBoxA(hWnd, "Неверное подтверждение пароля.", "Внимание!", MB_OK);
					Abort();
				}

				Zapros = "UPDATE [SYSTEM_USER] SET                                          			\
								   [PASSWORD]  = '"  + this->Edit2->Text + "'                 		\
								  ,[USER_NAME] = '"  + this->Edit1->Text + "'                 		\
								  ,[USER_TYPE] = '"  + IntToStr(this->ComboBox1->ItemIndex)  + "'   \
						  WHERE USER_NAME = '" + this->DBGrid1->DataSource->DataSet->Fields->Fields[2]->AsString + "'";

				this->ADOQuery2->Active = False;
				this->ADOQuery2->SQL->Clear();
				this->ADOQuery2->SQL->Add(Zapros);
				this->ADOQuery2->ExecSQL();

				this->Edit1->Text = "";
				this->Edit3->Text = "";
				this->Edit4->Text = "";
				this->FormActivate(0);

				MessageBoxA(hWnd, "Данные пользователь успешно скорректированы!", "Внимание!", MB_OK);
			}
			else
			{
				MessageBoxA(hWnd, "Введен неправильно старый пароль!", "Внимание!", MB_OK);
            }

		}
	}

	//Удаление существующей записи
	if (this->RadioGroup1->ItemIndex == 2)
	{
		String Zapros = FullSpisokUser + " WHERE USER_NAME = '" + this->DBGrid1->DataSource->DataSet->Fields->Fields[2]->AsString + "'";

		this->ADOQuery2->Active = False;
		this->ADOQuery2->SQL->Clear();
		this->ADOQuery2->SQL->Add(Zapros);
		this->ADOQuery2->Active = True;

		if (this->ADOQuery2->RecordCount == 1)
		{
			if (this->Edit7->Text == this->ADOQuery2->FieldByName(this->ADOQuery2->Fields->Fields[3]->FieldName)->AsString)
			{
				Zapros = "DELETE FROM [SYSTEM_USER] WHERE USER_NAME = '" + this->DBGrid1->DataSource->DataSet->Fields->Fields[2]->AsString + "'";
				this->ADOQuery2->Active = False;
				this->ADOQuery2->SQL->Clear();
				this->ADOQuery2->SQL->Add(Zapros);
				this->ADOQuery2->ExecSQL();

				this->Edit1->Text = "";
				this->Edit3->Text = "";
				this->Edit4->Text = "";
				this->FormActivate(0);

				MessageBoxA(hWnd, "Пользователь успешно удален!", "Внимание!", MB_OK);
			}
			else
			{
				MessageBoxA(hWnd, "Неправильно введен пароль!", "Внимание!", MB_OK);
			}
		}
	}
}
//---------------------------------------------------------------------------

void __fastcall TForm13::DBGrid1CellClick(TColumn *Column)
{
	if ((this->RadioGroup1->ItemIndex == 1) || (this->RadioGroup1->ItemIndex == 2))
	{
		String Zapros = SpisokUser + " WHERE USER_NAME = '" + this->DBGrid1->DataSource->DataSet->Fields->Fields[2]->AsString + "'";

		this->ADOQuery2->Active = False;
		this->ADOQuery2->SQL->Clear();
		this->ADOQuery2->SQL->Add(Zapros);
		this->ADOQuery2->Active = True;

		if (this->ADOQuery2->RecordCount == 1)
		{
			this->Edit1->Text = this->ADOQuery2->FieldByName(this->ADOQuery2->Fields->Fields[2]->FieldName)->AsString;
			if (this->ADOQuery2->FieldByName(this->ADOQuery2->Fields->Fields[1]->FieldName)->AsString == "Администратор")
			{
				this->ComboBox1->ItemIndex = 0;
				this->Edit3->Text = "";
				this->Edit4->Text = "";
			}
			if (this->ADOQuery2->FieldByName(this->ADOQuery2->Fields->Fields[1]->FieldName)->AsString == "Врач")
			{
				this->ComboBox1->ItemIndex = 1;
				this->Edit2->Text = "";
				this->Edit5->Text = "";
				this->Edit6->Text = "";
			}
			if (this->ADOQuery2->FieldByName(this->ADOQuery2->Fields->Fields[1]->FieldName)->AsString == "Оператор ввода данных")
			{
				this->ComboBox1->ItemIndex = 2;
				this->Edit7->Text = "";
            }
		}

		this->ComboBox1Change(0);
	}
}

//---------------------------------------------------------------------------
void __fastcall TForm13::UpdateLen()
{
	int j, k;
	int Maxlen = 0;
	int TekLen = 0;
	int TotalLenMas[100] = {0};
	String DataLen = "";
	String ItogData = "";

	if (this->ADOQuery1->RecordCount > 0)
	{
		this->DBGrid1->Visible = false;
		int TotalLenDbgrid = 0;
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
				this->DBGrid1->Columns->Items[j]->Width = 5;
				TotalLenDbgrid += 5;
				TotalLenMas[j] = 5;
			}
			else
			{
				this->DBGrid1->Columns->Items[j]->Width = Maxlen + 5;
				this->DBGrid1->Columns->Items[j]->Alignment = taLeftJustify;
				TotalLenDbgrid += Maxlen + 5;
				TotalLenMas[j] = Maxlen + 5;
			}
		}
		this->ADOQuery1->First();
		this->DBGrid1->Visible = true;

		j = 1;
		k = 0;
		while (1)
		{
			if (TotalLenMas[j] == 0) break;
			k += TotalLenMas[j];
			j++;
		}
		if (this->DBGrid1->Width - 40 > k)
		{
			k = this->DBGrid1->Width - k - 58;
			for (j = 0; j < this->ADOQuery1->FieldCount; j++)
			{
				this->DBGrid1->Columns->Items[j]->Width += (this->DBGrid1->Columns->Items[j]->Width * k) / TotalLenDbgrid;
			}
		}

	}
	else
	{
		this->DBGrid1->Visible = false;
	}
}

//---------------------------------------------------------------------------

void __fastcall TForm13::DBGrid1DrawColumnCell(TObject *Sender, const TRect &Rect,
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

void __fastcall TForm13::DBGrid1ColumnMoved(TObject *Sender, int FromIndex, int ToIndex)

{
	this->DBGrid1->Columns->Items[ToIndex]->Index = FromIndex;
}
//---------------------------------------------------------------------------

void __fastcall TForm13::ComboBox1Change(TObject *Sender)
{
	String Zapros;
	while (this->ComboBox2->Items->Count  > 0)  this->ComboBox2->Items->Delete(0);

	if (this->ComboBox1->ItemIndex == 1)
	{
		this->ComboBox2->Visible = true;
		this->Label9->Visible = true;
		Zapros = "SELECT CONCAT(  SPRTER_DOCTORS._id,\' \',                \
								  SPRTER_DOCTORS.FAM,\' \',                \
								  SPRTER_DOCTORS.IM, \' \',                \
								  SPRTER_DOCTORS.OT)        	 AS [Врач] \
				  FROM 	SPRTER_DOCTORS";
		this->ADOQuery2->Active = False;
		this->ADOQuery2->SQL->Clear();
		this->ADOQuery2->SQL->Add(Zapros);
		this->ADOQuery2->Active = True;

		if (this->ADOQuery2->RecordCount > 0)
		{
			this->ADOQuery2->Open();
			for (this->ADOQuery2->First(); !this->ADOQuery2->Eof; this->ADOQuery2->Next())
			{
				this->ComboBox2->Items->Add(this->ADOQuery2->FieldByName(this->ADOQuery2->Fields->Fields[0]->FieldName)->AsString);
            }
		}
	}
	else
	{
		this->ComboBox2->Visible = false;
		this->Label9->Visible = false;
	}
}
//---------------------------------------------------------------------------

