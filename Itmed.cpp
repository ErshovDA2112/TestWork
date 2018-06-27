//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
#include <tchar.h>
//---------------------------------------------------------------------------
#include <Vcl.Styles.hpp>
#include <Vcl.Themes.hpp>
USEFORM("SpisokUserCreate.cpp", Form13);
USEFORM("Spravochnik_TFOMS.cpp", mo_lpu_1);
USEFORM("Schet_Edit.cpp", mo_schet);
USEFORM("Select_MO.cpp", mo_select_mo);
USEFORM("Unit5.cpp", Form5);
USEFORM("VrachCreate.cpp", mo_doctors);
USEFORM("Unit11.cpp", Form11);
USEFORM("Unit2.cpp", mo_connect);
USEFORM("PersPacientCreate.cpp", Form9);
USEFORM("MainFormMO.cpp", mo_main);
USEFORM("InsertPassword.cpp", Form14);
USEFORM("Otchet_9_17.cpp", Form7);
USEFORM("Otdelenie.cpp", mo_podr);
USEFORM("Otchet.cpp", Form12);
USEFORM("Otchet_0_9.cpp", Form1);
USEFORM("RForm3.cpp", Form3);
//---------------------------------------------------------------------------
int WINAPI _tWinMain(HINSTANCE, HINSTANCE, LPTSTR, int)
{
	try
	{
		Application->Initialize();
		Application->MainFormOnTaskBar = true;
		Application->CreateForm(__classid(Tmo_main), &mo_main);
		Application->CreateForm(__classid(Tmo_connect), &mo_connect);
		Application->CreateForm(__classid(Tmo_schet), &mo_schet);
		Application->CreateForm(__classid(Tmo_select_mo), &mo_select_mo);
		Application->CreateForm(__classid(TForm5), &Form5);
		Application->CreateForm(__classid(Tmo_lpu_1), &mo_lpu_1);
		Application->CreateForm(__classid(Tmo_podr), &mo_podr);
		Application->CreateForm(__classid(Tmo_doctors), &mo_doctors);
		Application->CreateForm(__classid(TForm9), &Form9);
		Application->CreateForm(__classid(TForm11), &Form11);
		Application->CreateForm(__classid(TForm12), &Form12);
		Application->CreateForm(__classid(TForm13), &Form13);
		Application->CreateForm(__classid(TForm14), &Form14);
		Application->CreateForm(__classid(TForm1), &Form1);
		Application->CreateForm(__classid(TForm7), &Form7);
		Application->CreateForm(__classid(TForm3), &Form3);
		Application->Run();
	}
	catch (Exception &exception)
	{
		Application->ShowException(&exception);
	}
	catch (...)
	{
		try
		{
			throw Exception("");
		}
		catch (Exception &exception)
		{
			Application->ShowException(&exception);
		}
	}
	return 0;
}
//---------------------------------------------------------------------------
