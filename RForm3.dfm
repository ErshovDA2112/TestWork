object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'Form3'
  ClientHeight = 300
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 472
    Top = 256
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Panel1: TPanel
    Left = 24
    Top = 121
    Width = 545
    Height = 129
    TabOrder = 1
    object GroupBox1: TGroupBox
      Left = 16
      Top = 9
      Width = 249
      Height = 72
      Caption = #1053#1072#1095#1072#1083#1086' '#1087#1077#1088#1080#1086#1076#1072
      TabOrder = 0
      object Label3: TLabel
        Left = 8
        Top = 14
        Width = 31
        Height = 13
        Caption = #1052#1077#1089#1103#1094
      end
      object Label7: TLabel
        Left = 130
        Top = 14
        Width = 19
        Height = 13
        Caption = #1043#1086#1076
      end
      object ComboBox1: TComboBox
        Left = 7
        Top = 33
        Width = 88
        Height = 21
        TabOrder = 0
        OnChange = ComboBox1Change
      end
      object ComboBox2: TComboBox
        Left = 130
        Top = 33
        Width = 87
        Height = 21
        TabOrder = 1
        OnChange = ComboBox2Change
      end
    end
    object GroupBox2: TGroupBox
      Left = 271
      Top = 9
      Width = 249
      Height = 72
      Caption = #1053#1072#1095#1072#1083#1086' '#1087#1077#1088#1080#1086#1076#1072
      TabOrder = 1
      object Label1: TLabel
        Left = 8
        Top = 14
        Width = 31
        Height = 13
        Caption = #1052#1077#1089#1103#1094
      end
      object Label2: TLabel
        Left = 130
        Top = 14
        Width = 19
        Height = 13
        Caption = #1043#1086#1076
      end
      object ComboBox3: TComboBox
        Left = 7
        Top = 33
        Width = 88
        Height = 21
        TabOrder = 0
        OnChange = ComboBox3Change
      end
      object ComboBox4: TComboBox
        Left = 130
        Top = 33
        Width = 87
        Height = 21
        TabOrder = 1
        OnChange = ComboBox4Change
      end
    end
  end
  object frxReport1: TfrxReport
    Version = '5.6'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43272.393729502300000000
    ReportOptions.LastChange = 43274.617089189800000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 368
    Top = 48
    Datasets = <
      item
        DataSet = frxReport1.ADOQuery1
        DataSetName = 'ADOQuery1'
      end>
    Variables = <
      item
        Name = ' '#1055#1077#1088#1077#1084#1077#1085#1085#1099#1077
        Value = Null
      end
      item
        Name = '@y1'
        Value = Null
      end
      item
        Name = '@m1'
        Value = Null
      end
      item
        Name = '@m2'
        Value = Null
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
      object ADODatabase1: TfrxADODatabase
        DatabaseName = 
          'Provider=SQLOLEDB.1;Password=Bpgjldsgjldthnfv100;Persist Securit' +
          'y Info=True;User ID=sa;Initial Catalog=ITMed54;Data Source=SERVE' +
          'R-IT;Use Procedure for Prepare=1;Auto Translate=True;Packet Size' +
          '=4096;Workstation ID=SYSTEM;Use Encryption for Data=False;Tag wi' +
          'th column collation when possible=False'
        LoginPrompt = False
        Connected = True
        pLeft = 148
        pTop = 88
      end
      object ADOQuery1: TfrxADOQuery
        UserName = 'ADOQuery1'
        CloseDataSource = True
        BCDToCurrency = False
        IgnoreDupParams = True
        Params = <
          item
            Name = 'Y1'
            DataType = ftInteger
            Expression = '<@y1>'
          end
          item
            Name = 'M1'
            DataType = ftInteger
            Expression = '<@m1>'
          end
          item
            Name = 'M2'
            DataType = ftInteger
            Expression = '<@m2>'
          end>
        SQL.Strings = (
          
            'Select '#39#1042#1089#1077#1075#1086#39' as naim,'#39'1.0'#39' as num, COUNT(*) AS countAll, '#39#1040'00-' +
            #1058'98'#39' AS MKB,'
          
            'isnull(isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0' +
            '),0) AS extr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl' +
            '.KD_Z else 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (' +
            '105, 106) THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 between '#39'A00'#39' and '#39'T98.9'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#1074' '#1090#1086#1084' '#1095#1080#1089#1083#1077': '#1085#1077#1082#1086#1090#1086#1088#1099#1077' '#1080#1085#1092#1077#1082#1094#1080#1086#1085#1085#1099#1077' '#1080' '#1087#1072#1088#1072#1079#1080#1090#1072#1088#1085#1099#1077' '#1073#1086#1083#1077#1079 +
            #1085#1080#39' as naim,'#39'2.0'#39' as num, COUNT(*) AS countAll, '#39#1040'00-'#1042'99'#39' AS MKB' +
            ', '
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 between '#39'A00'#39' and '#39'B99.9'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#1080#1079' '#1085#1080#1093': '#1082#1080#1096#1077#1095#1085#1099#1077' '#1080#1085#1092#1077#1082#1094#1080#1080#39' as naim,'#39'2.1'#39' as num, COUNT(*' +
            ') AS countAll, '#39#1040'00-'#1040'09'#39' AS MKB, '
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 between '#39'A00'#39' and '#39'A09.9'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#1090#1091#1073#1077#1088#1082#1091#1083#1077#1079' '#1086#1088#1075#1072#1085#1086#1074' '#1076#1099#1093#1072#1085#1080#1103#39' as naim,'#39'2.2'#39' as num, COUNT(' +
            '*) AS countAll, '#39#1040'15-A16'#39' AS MKB, '
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 between '#39'A15'#39' and '#39'A16.9'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#1084#1077#1085#1080#1085#1075#1086#1082#1086#1082#1082#1086#1074#1072#1103' '#1080#1085#1092#1077#1082#1094#1080#1103#39' as naim,'#39'2.3'#39' as num, COUNT(*)' +
            ' AS countAll, '#39#1040'39'#39' AS MKB, '
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 between '#39'A39'#39' and '#39'A39.9'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#1089#1077#1087#1089#1080#1089#39' as naim,'#39'2.4'#39' as num, COUNT(*) AS countAll, '#39#1040'40' +
            '-A41'#39' AS MKB, '
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 between '#39'A40'#39' and '#39'A41.9'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#1080#1085#1092#1077#1082#1094#1080#1080', '#1087#1077#1088#1077#1076#1072#1102#1097#1080#1077#1089#1103' '#1087#1088#1077#1080#1084#1091#1097#1077#1089#1090#1074#1077#1085#1085#1086' '#1087#1086#1083#1086#1074#1099#1084' '#1087#1091#1090#1077#1084#39' as' +
            ' naim,'#39'2.5'#39' as num, COUNT(*) AS countAll, '#39#1040'50-'#1040'64'#39' AS MKB, '
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 between '#39'A50'#39' and '#39'A64.9'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#1086#1089#1090#1088#1099#1081' '#1087#1086#1083#1080#1086#1084#1080#1077#1083#1080#1090#39' as naim,'#39'2.6'#39' as num, COUNT(*) AS co' +
            'untAll, '#39#1040'80'#39' AS MKB, '
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 between '#39'A80'#39' and '#39'A80.9'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#1074#1080#1088#1091#1089#1085#1099#1081' '#1075#1077#1087#1072#1090#1080#1090#39' as naim,'#39'2.7'#39' as num, COUNT(*) AS coun' +
            'tAll, '#39#1042'15-'#1042'19'#39' AS MKB, '
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 between '#39'B15'#39' and '#39'B19.9'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#1073#1086#1083#1077#1079#1085#1100', '#1074#1099#1079#1074#1072#1085#1085#1072#1103' '#1042#1048#1063#39' as naim,'#39'2.8'#39' as num, COUNT(*) A' +
            'S countAll, '#39#1042'20-'#1042'24'#39' AS MKB, '
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 between '#39'B20'#39' and '#39'B24.9'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#1085#1086#1074#1086#1086#1073#1088#1072#1079#1086#1074#1072#1085#1080#1103#39' as naim,'#39'3.0'#39' as num, COUNT(*) AS count' +
            'All, '#39#1057'00-D48'#39' AS MKB, '
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 between '#39'C00'#39' and '#39'B48.9'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#1074' '#1090#1086#1084' '#1095#1080#1089#1083#1077': '#1079#1083#1086#1082#1072#1095#1077#1089#1090#1074#1077#1085#1085#1099#1077' '#1085#1086#1074#1086#1086#1073#1088#1072#1079#1086#1074#1072#1085#1080#1103#39' as naim,'#39'3' +
            '.1'#39' as num, COUNT(*) AS countAll, '#39#1057'00-'#1057'97'#39' AS MKB, '
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 between '#39'C00'#39' and '#39'C97.9'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#1080#1079' '#1085#1080#1093': '#1079#1083#1086#1082#1072#1095#1077#1089#1090#1074#1077#1085#1085#1099#1077' '#1085#1086#1074#1086#1086#1073#1088#1072#1079#1086#1074#1072#1085#1080#1103' '#1083#1080#1084#1092#1086#1080#1076#1085#1086#1081', '#1082#1088#1086#1074 +
            #1077#1090#1074#1086#1088#1085#1086#1081' '#1080' '#1088#1086#1076#1089#1090#1074#1077#1085#1085#1099#1093' '#1080#1084' '#1090#1082#1072#1085#1077#1081#39' as naim,'#39'3.1.1'#39' as num, COUNT(' +
            '*) AS countAll, '#39#1057'81-'#1057'96'#39' AS MKB, '
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 between '#39'C81'#39' and '#39'C96.9'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#1080#1079' '#1085#1080#1093': '#1092#1086#1083#1083#1080#1082#1091#1083#1103#1088#1085#1072#1103' ('#1085#1086#1076#1091#1083#1103#1088#1085#1072#1103') '#1085#1077#1093#1086#1076#1078#1082#1080#1085#1089#1082#1072#1103' '#1083#1080#1084#1092#1086#1084#1072 +
            #39' as naim,'#39'3.1.1.1'#39' as num, COUNT(*) AS countAll, '#39#1057'82'#39' AS MKB, '
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 LIKE '#39'C82%'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#1084#1077#1083#1082#1086#1082#1083#1077#1090#1086#1095#1085#1072#1103' ('#1076#1080#1092#1092#1091#1079#1085#1072#1103') '#1085#1077#1093#1086#1076#1078#1082#1080#1085#1089#1082#1072#1103' '#1083#1080#1084#1092#1086#1084#1072#39' as nai' +
            'm,'#39'3.1.1.2'#39' as num, COUNT(*) AS countAll, '#39#1057'83.0'#39' AS MKB, '
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 = '#39'C83.0'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#1084#1077#1083#1082#1086#1082#1083#1077#1090#1086#1095#1085#1072#1103' '#1089' '#1088#1072#1089#1097#1077#1087#1083#1077#1085#1085#1099#1084#1080' '#1103#1076#1088#1072#1084#1080'  ('#1076#1080#1092#1092#1091#1079#1085#1072#1103') '#1085#1077#1093#1086#1076 +
            #1078#1082#1080#1085#1089#1082#1072#1103' '#1083#1080#1084#1092#1086#1084#1072#39' as naim,'#39'3.1.1.3'#39' as num, COUNT(*) AS countAll' +
            ', '#39#1057'83.1'#39' AS MKB, '
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 = '#39'C83.1'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#1082#1088#1091#1087#1085#1086#1082#1083#1077#1090#1086#1095#1085#1072#1103' ('#1076#1080#1092#1092#1091#1079#1085#1072#1103') '#1085#1077#1093#1086#1076#1078#1082#1080#1085#1089#1082#1072#1103' '#1083#1080#1084#1092#1086#1084#1072#39' as na' +
            'im,'#39'3.1.1.4'#39' as num, COUNT(*) AS countAll, '#39#1057'83.3'#39' AS MKB, '
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 = '#39'C83.3'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#1080#1084#1084#1091#1085#1086#1073#1083#1072#1089#1090#1085#1072#1103' ('#1076#1080#1092#1092#1091#1079#1085#1072#1103') '#1085#1077#1093#1086#1076#1078#1082#1080#1085#1089#1082#1072#1103' '#1083#1080#1084#1092#1086#1084#1072#39' as nai' +
            'm,'#39'3.1.1.5'#39' as num, COUNT(*) AS countAll, '#39#1057'83.4'#39' AS MKB, '
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 = '#39'C83.4'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#1076#1088#1091#1075#1080#1077' '#1090#1080#1087#1099' '#1076#1080#1092#1092#1091#1079#1085#1099#1093' '#1085#1077#1093#1086#1076#1078#1082#1080#1085#1089#1082#1080#1093' '#1083#1080#1084#1092#1086#1084#39' as naim,'#39'3.1' +
            '.1.6'#39' as num, COUNT(*) AS countAll, '#39#1057'83.8'#39' AS MKB, '
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 = '#39'C83.8'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#1076#1080#1092#1092#1091#1079#1085#1072#1103' '#1085#1077#1093#1086#1076#1078#1082#1080#1085#1089#1082#1072#1103' '#1083#1080#1084#1092#1086#1084#1072' '#1085#1077#1091#1090#1086#1095#1085#1077#1085#1085#1072#1103#39' as naim,'#39'3' +
            '.1.1.7'#39' as num, COUNT(*) AS countAll, '#39#1057'83.9'#39' AS MKB, '
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 = '#39'C83.9'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#1087#1077#1088#1080#1092#1077#1088#1080#1095#1077#1089#1082#1080#1077' '#1080' '#1082#1086#1078#1085#1099#1077' '#1058'-'#1082#1083#1077#1090#1086#1095#1085#1099#1077' '#1083#1080#1084#1092#1086#1084#1099#39' as naim,'#39'3.' +
            '1.1.8'#39' as num, COUNT(*) AS countAll, '#39#1057'84'#39' AS MKB, '
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 like '#39'C84%'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#1080#1079' '#1085#1080#1093': '#1076#1088#1091#1075#1080#1077' '#1085#1077#1091#1090#1086#1095#1085#1077#1085#1085#1099#1077' '#1058'-'#1082#1083#1077#1090#1086#1095#1085#1099#1077' '#1083#1080#1084#1092#1086#1084#1099#39' as nai' +
            'm,'#39'3.1.1.8'#39' as num, COUNT(*) AS countAll, '#39#1057'84.5'#39' AS MKB, '
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 = '#39'C84.5'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#1076#1088#1091#1075#1080#1077' '#1080' '#1085#1077#1091#1090#1086#1095#1085#1077#1085#1085#1099#1077' '#1090#1080#1087#1099' '#1085#1077#1093#1086#1076#1078#1082#1080#1085#1089#1082#1086#1081' '#1083#1080#1084#1092#1086#1084#1099#39' as nai' +
            'm,'#39'3.1.1.9'#39' as num, COUNT(*) AS countAll, '#39#1057'85'#39' AS MKB, '
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 like '#39'C85%'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#1084#1072#1082#1088#1086#1075#1083#1086#1073#1091#1083#1080#1085#1077#1084#1080#1103' '#1042#1072#1083#1100#1076#1077#1085#1089#1090#1088#1077#1084#1072#39' as naim,'#39'3.1.1.10'#39' as n' +
            'um, COUNT(*) AS countAll, '#39#1057'88.0'#39' AS MKB, '
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 = '#39'C88.0'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#1093#1088#1086#1085#1080#1095#1077#1089#1082#1080#1081'  '#1083#1080#1084#1092#1086#1094#1080#1090#1072#1088#1085#1099#1081' '#1083#1077#1081#1082#1086#1079#39' as naim,'#39'3.1.1.11'#39' as' +
            ' num, COUNT(*) AS countAll, '#39#1057'91.1'#39' AS MKB, '
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 = '#39'C91.1'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#1093#1088#1086#1085#1080#1095#1077#1089#1082#1080#1081' '#1084#1080#1077#1083#1086#1080#1076#1085#1099#1081' '#1083#1077#1081#1082#1086#1079#39' as naim,'#39'3.1.1.12'#39' as num' +
            ', COUNT(*) AS countAll, '#39#1057'92.1'#39' AS MKB, '
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 = '#39'C92.1'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#1076#1086#1073#1088#1086#1082#1072#1095#1077#1089#1090#1074#1077#1085#1085#1099#1077'  '#1085#1086#1074#1086#1086#1073#1088#1072#1079#1086#1074#1072#1085#1080#1103#39' as naim,'#39'3.2'#39' as num' +
            ', COUNT(*) AS countAll, '#39'D10-D36'#39' AS MKB, '
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 between '#39'D10'#39' and '#39'D36.9'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#1080#1079' '#1085#1080#1093': '#1083#1077#1081#1086#1084#1080#1086#1084#1072' '#1084#1072#1090#1082#1080#39' as naim,'#39'3.2.1'#39' as num, COUNT(' +
            '*) AS countAll, '#39'D25'#39' AS MKB, '
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 like '#39'D25%'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#1076#1086#1073#1088#1086#1082#1072#1095#1077#1089#1090#1074#1077#1085#1085#1099#1077' '#1085#1086#1074#1086#1086#1073#1088#1072#1079#1086#1074#1072#1085#1080#1103' '#1103#1080#1095#1085#1080#1082#1072#39' as naim,'#39'3.2' +
            '.2'#39' as num, COUNT(*) AS countAll, '#39'D27'#39' AS MKB, '
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 like '#39'D27%'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#1073#1086#1083#1077#1079#1085#1080' '#1082#1088#1086#1074#1080', '#1082#1088#1086#1074#1077#1090#1074#1086#1088#1085#1099#1093' '#1086#1088#1075#1072#1085#1086#1074' '#1080' '#1086#1090#1076#1077#1083#1100#1085#1099#1077' '#1085#1072#1088#1091#1096#1077#1085#1080 +
            #1103', '#1074#1086#1074#1083#1077#1082#1072#1102#1097#1080#1077' '#1080#1084#1084#1091#1085#1085#1099#1081' '#1084#1077#1093#1072#1085#1080#1079#1084#39' as naim,'#39'4.0'#39' as num, COUNT(*)' +
            ' AS countAll, '#39'D50-D89'#39' AS MKB, '
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 between '#39'D50'#39' and '#39'D89.9'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#1080#1079' '#1085#1080#1093':'#9' '#1072#1085#1077#1084#1080#1080#39' as naim,'#39'4.1'#39' as num, COUNT(*) AS coun' +
            'tAll, '#39'D50-D64'#39' AS MKB, '
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 between '#39'D50'#39' and '#39'D64.9'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#9#1080#1079' '#1085#1080#1093': '#1072#1087#1083#1072#1089#1090#1080#1095#1077#1089#1082#1080#1077' '#1072#1085#1077#1084#1080#1080#39' as naim,'#39'4.1.1'#39' as num, ' +
            'COUNT(*) AS countAll, '#39'D60-D61'#39' AS MKB, '
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 between '#39'D60'#39' and '#39'D61.9'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#1085#1072#1088#1091#1096#1077#1085#1080#1103' '#1089#1074#1077#1088#1090#1099#1074#1072#1077#1084#1086#1089#1090#1080' '#1082#1088#1086#1074#1080' , '#1087#1091#1088#1087#1091#1088#1072' '#1080' '#1076#1088#1091#1075#1080#1077' '#1075#1077#1084#1086#1088 +
            #1088#1072#1075#1080#1095#1077#1089#1082#1080#1077' '#1089#1086#1089#1090#1086#1103#1085#1080#1103#39' as naim,'#39'4.2'#39' as num, COUNT(*) AS countAll' +
            ', '#39'D65-D69'#39' AS MKB, '
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 between '#39'D65'#39' and '#39'D69.9'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#9#1080#1079' '#1085#1080#1093':'#9'  '#1076#1080#1089#1089#1077#1084#1080#1085#1080#1088#1086#1074#1072#1085#1085#1086#1077' '#1074#1085#1091#1090#1088#1080#1089#1086#1089#1091#1076#1080#1089#1090#1086#1077' '#1089#1074#1077#1088#1090#1099#1074#1072#1085 +
            #1080#1077' ('#1089#1080#1085#1076#1088#1086#1084' '#1076#1077#1092#1080#1073#1088#1080#1085#1072#1094#1080#1080')'#39' as naim,'#39'4.2.1'#39' as num, COUNT(*) AS c' +
            'ountAll, '#39'D65'#39' AS MKB, '
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 like '#39'D65%'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#9#1075#1077#1084#1086#1092#1080#1083#1080#1103#39' as naim,'#39'4.2.2'#39' as num, COUNT(*) AS countAl' +
            'l, '#39'D66- D68'#39' AS MKB, '
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 between '#39'D66'#39' and '#39'D68.9'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#1086#1090#1076#1077#1083#1100#1085#1099#1077' '#1085#1072#1088#1091#1096#1077#1085#1080#1103', '#1074#1086#1074#1083#1077#1082#1072#1102#1097#1080#1077' '#1080#1084#1084#1091#1085#1085#1099#1081' '#1084#1077#1093#1072#1085#1080#1079#1084#39' as ' +
            'naim,'#39'4.3'#39' as num, COUNT(*) AS countAll, '#39'D80-D89'#39' AS MKB, '
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 between '#39'D80'#39' and '#39'D89.9'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#1073#1086#1083#1077#1079#1085#1080' '#1101#1085#1076#1086#1082#1088#1080#1085#1085#1086#1081' '#1089#1080#1089#1090#1077#1084#1099', '#1088#1072#1089#1089#1090#1088#1086#1081#1089#1090#1074#1072' '#1087#1080#1090#1072#1085#1080#1103' '#1080' '#1085#1072#1088#1091 +
            #1096#1077#1085#1080#1103' '#1086#1073#1084#1077#1085#1072' '#1074#1077#1097#1077#1089#1090#1074#39' as naim,'#39'5.0'#39' as num, COUNT(*) AS countAll' +
            ', '#39#1045'00-'#1045'89'#39' AS MKB, '
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 between '#39'E00'#39' and '#39'E89.9'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#1080#1079' '#1085#1080#1093':'#9#1073#1086#1083#1077#1079#1085#1080' '#1097#1080#1090#1086#1074#1080#1076#1085#1086#1081' '#1078#1077#1083#1077#1079#1099', '#1089#1074#1103#1079#1072#1085#1085#1099#1077' '#1089' '#1081#1086#1076#1085#1086#1081' '#1085 +
            #1077#1076#1086#1089#1090#1072#1090#1086#1095#1085#1086#1089#1090#1100#1102' '#1080' '#1089#1093#1086#1076#1085#1099#1077' '#1089#1086#1089#1090#1086#1103#1085#1080#1103#39' as naim,'#39'5.1'#39' as num, COUNT' +
            '(*) AS countAll, '#39#1045'01-'#1045'03'#39' AS MKB, '
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 between '#39'E01'#39' and '#39'E03.9'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#1090#1080#1088#1077#1086#1090#1086#1082#1089#1080#1082#1086#1079' ('#1075#1080#1087#1077#1088#1090#1080#1088#1077#1086#1079')'#39' as naim,'#39'5.2'#39' as num, COUN' +
            'T(*) AS countAll, '#39#1045'05'#39' AS MKB, '
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 like '#39'E05%'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#1090#1080#1088#1077#1086#1080#1076#1080#1090#39' as naim,'#39'5.3'#39' as num, COUNT(*) AS countAll, ' +
            #39#1045'06'#39' AS MKB, '
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 like '#39'E06%'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#1089#1072#1093#1072#1088#1085#1099#1081' '#1076#1080#1072#1073#1077#1090#39' as naim,'#39'5.4'#39' as num, COUNT(*) AS coun' +
            'tAll, '#39#1045'10-'#1045'14'#39' AS MKB, '
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 between '#39'E10'#39' and '#39'E14.9'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#9#1074' '#1090#1086#1084' '#1095#1080#1089#1083#1077': '#1089#1072#1093#1072#1088#1085#1099#1081' '#1076#1080#1072#1073#1077#1090' '#1080#1085#1089#1091#1083#1080#1085#1079#1072#1074#1080#1089#1080#1084#1099#1081#39' as naim' +
            ','#39'5.4.1'#39' as num, COUNT(*) AS countAll, '#39#1045'10'#39' AS MKB, '
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 like '#39'E10%'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#9#1089#1072#1093#1072#1088#1085#1099#1081' '#1076#1080#1072#1073#1077#1090' '#1080#1085#1089#1091#1083#1080#1085#1085#1077#1079#1072#1074#1080#1089#1080#1084#1099#1081#39' as naim,'#39'5.4.2'#39' as' +
            ' num, COUNT(*) AS countAll, '#39#1045'11'#39' AS MKB, '
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 like '#39'E11%'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#9#9#1080#1079' '#1085#1080#1093' '#1089' '#1087#1086#1088#1072#1078#1077#1085#1080#1077#1084' '#1075#1083#1072#1079' ('#1080#1079' '#1089#1090#1088'. 5.4)'#39' as naim,'#39'5.4.' +
            '3'#39' as num, COUNT(*) AS countAll, '#39#1045'10.3, '#1045'11.3, '#1045'12.3, '#1045'13.3, '#1045'1' +
            '4.3'#39' AS MKB, '
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND (sl.DS1 = '#39'E10.3'#39' or sl.DS1 = '#39'E11.3'#39' or sl.DS1 = '#39 +
            'E12.3'#39' or sl.DS1 = '#39'E13.3'#39' or sl.DS1 = '#39'E14.3'#39')'
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#1075#1080#1087#1077#1088#1092#1091#1085#1082#1094#1080#1103' '#1075#1080#1087#1086#1092#1080#1079#1072#39' as naim,'#39'5.5'#39' as num, COUNT(*) AS' +
            ' countAll, '#39#1045'22'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 like '#39'E22%'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#1075#1080#1087#1086#1087#1080#1090#1091#1080#1090#1072#1088#1080#1079#1084#39' as naim,'#39'5.6'#39' as num, COUNT(*) AS count' +
            'All, '#39#1045'23.0'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 = '#39'E23.0'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#1085#1077#1089#1072#1093#1072#1088#1085#1099#1081' '#1076#1080#1072#1073#1077#1090#39' as naim,'#39'5.7'#39' as num, COUNT(*) AS cou' +
            'ntAll, '#39#1045'23.2'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 = '#39'E23.2'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#1072#1076#1088#1077#1085#1086#1075#1077#1085#1080#1090#1072#1083#1100#1085#1099#1077' '#1088#1072#1089#1089#1090#1088#1086#1081#1089#1090#1074#1072#39' as naim,'#39'5.8'#39' as num, CO' +
            'UNT(*) AS countAll, '#39#1045'25'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 like '#39'E25%'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#1076#1080#1089#1092#1091#1085#1082#1094#1080#1103' '#1103#1080#1095#1085#1080#1082#1086#1074#39' as naim,'#39'5.9'#39' as num, COUNT(*) AS c' +
            'ountAll, '#39#1045'28'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 like '#39'E28%'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#1076#1080#1089#1092#1091#1085#1082#1094#1080#1103' '#1103#1080#1095#1077#1082#39' as naim,'#39'5.10'#39' as num, COUNT(*) AS cou' +
            'ntAll, '#39#1045'29'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 like '#39'E29%'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#1086#1078#1080#1088#1077#1085#1080#1077#39' as naim,'#39'5.11'#39' as num, COUNT(*) AS countAll, '#39 +
            #1045'66'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 like '#39'E66%'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#1092#1077#1085#1080#1083#1082#1077#1090#1086#1085#1091#1088#1080#1103#39' as naim,'#39'5.12'#39' as num, COUNT(*) AS count' +
            'All, '#39#1045'70.0-1'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND (sl.DS1 = '#39'E70.0'#39' OR sl.DS1 = '#39'E70.1'#39')'
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#1085#1072#1088#1091#1096#1077#1085#1080#1103' '#1086#1073#1084#1077#1085#1072' '#1075#1072#1083#1072#1082#1090#1086#1079#1099' ('#1075#1072#1083#1072#1082#1090#1086#1079#1077#1084#1080#1103')'#39' as naim,'#39'5.13' +
            #39' as num, COUNT(*) AS countAll, '#39#1045'74.2'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 = '#39'E74.2'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#1073#1086#1083#1077#1079#1085#1100' '#1043#1086#1096#1077#39' as naim,'#39'5.14'#39' as num, COUNT(*) AS countAl' +
            'l, '#39#1045'75.2'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 = '#39'E75.2'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#1085#1072#1088#1091#1096#1077#1085#1080#1103' '#1086#1073#1084#1077#1085#1072' '#1075#1083#1080#1082#1086#1079#1072#1084#1080#1085#1086#1075#1083#1080#1082#1072#1085#1086#1074' ('#1084#1091#1082#1086#1087#1086#1083#1080#1089#1072#1093#1072#1088#1080#1076#1086#1079#1099 +
            ')'#39' as naim,'#39'5.15'#39' as num, COUNT(*) AS countAll, '#39#1045'76.0-3'#39' AS MKB' +
            ','
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 between '#39'E76.0'#39' AND '#39'E76.3'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#1084#1091#1082#1086#1074#1080#1089#1094#1080#1076#1086#1079#39' as naim,'#39'5.16'#39' as num, COUNT(*) AS countAl' +
            'l, '#39#1045'84'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 LIKE '#39'E84%'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#1087#1089#1080#1093#1080#1095#1077#1089#1082#1080#1077' '#1088#1072#1089#1089#1090#1088#1086#1081#1089#1090#1074#1072' '#1080' '#1088#1072#1089#1089#1090#1088#1086#1081#1089#1090#1074#1072' '#1087#1086#1074#1077#1076#1077#1085#1080#1103#39' as na' +
            'im,'#39'6.0'#39' as num, COUNT(*) AS countAll, '#39'F01-F99'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 between '#39'F01'#39' AND '#39'F99.9'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#1080#1079' '#1085#1080#1093': '#1087#1089#1080#1093#1080#1095#1077#1089#1082#1080#1077' '#1088#1072#1089#1089#1090#1088#1086#1081#1089#1090#1074#1072' '#1080' '#1088#1072#1089#1089#1090#1088#1086#1081#1089#1090#1074#1072' '#1087#1086#1074#1077#1076#1077#1085 +
            #1080#1103', '#1089#1074#1103#1079#1072#1085#1085#1099#1077' '#1089' '#1091#1087#1086#1090#1088#1077#1073#1083#1077#1085#1080#1077#1084' '#1087#1089#1080#1093#1086#1072#1082#1090#1080#1074#1085#1099#1093' '#1074#1077#1097#1077#1089#1090#1074#39' as naim,'#39'6.' +
            '1'#39' as num, COUNT(*) AS countAll, '#39'F10-F19'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 between '#39'F10'#39' AND '#39'F19.9'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#1073#1086#1083#1077#1079#1085#1080' '#1085#1077#1088#1074#1085#1086#1081' '#1089#1080#1089#1090#1077#1084#1099#39' as naim,'#39'7.0'#39' as num, COUNT(*) ' +
            'AS countAll, '#39'G00-G98'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 between '#39'G00'#39' AND '#39'G98.9'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#1080#1079' '#1085#1080#1093': '#1074#1086#1089#1087#1072#1083#1080#1090#1077#1083#1100#1085#1099#1077' '#1073#1086#1083#1077#1079#1085#1080' '#1094#1077#1085#1090#1088#1072#1083#1100#1085#1086#1081' '#1085#1077#1088#1074#1085#1086#1081' '#1089#1080#1089#1090 +
            #1077#1084#1099#39' as naim,'#39'7.1'#39' as num, COUNT(*) AS countAll, '#39'G00-G09'#39' AS MK' +
            'B,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 between '#39'G00'#39' AND '#39'G09.9'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#9#1080#1079' '#1085#1080#1093':'#1073#1072#1082#1090#1077#1088#1080#1072#1083#1100#1085#1099#1081' '#1084#1077#1085#1080#1085#1075#1080#1090#39' as naim,'#39'7.1.1'#39' as num,' +
            ' COUNT(*) AS countAll, '#39'G00'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 LIKE '#39'G00%'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#9#1101#1085#1094#1077#1092#1072#1083#1080#1090', '#1084#1080#1077#1083#1080#1090' '#1080' '#1101#1085#1094#1077#1092#1072#1083#1086#1084#1080#1077#1083#1080#1090#39' as naim,'#39'7.1.2'#39' as' +
            ' num, COUNT(*) AS countAll, '#39'G04'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 LIKE '#39'G04%'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#1089#1080#1089#1090#1077#1084#1085#1099#1077' '#1072#1090#1088#1086#1092#1080#1080', '#1087#1086#1088#1072#1078#1072#1102#1097#1080#1077' '#1087#1088#1077#1080#1084#1091#1097#1077#1089#1090#1074#1077#1085#1085#1086' '#1094#1077#1085#1090#1088#1072#1083#1100#1085 +
            #1091#1102' '#1085#1077#1088#1074#1085#1091#1102' '#1089#1080#1089#1090#1077#1084#1091#39' as naim,'#39'7.2'#39' as num, COUNT(*) AS countAll, ' +
            #39'G10-G12'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 between '#39'G10'#39' AND '#39'G12.9'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#1101#1082#1089#1090#1088#1072#1087#1080#1088#1072#1084#1080#1076#1085#1099#1077' '#1080' '#1076#1088#1091#1075#1080#1077' '#1076#1074#1080#1075#1072#1090#1077#1083#1100#1085#1099#1077' '#1085#1072#1088#1091#1096#1077#1085#1080#1103#39' as na' +
            'im,'#39'7.3'#39' as num, COUNT(*) AS countAll, '#39'G20,G21,G23-G25'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND (sl.DS1 between '#39'G20'#39' AND '#39'G21.9'#39' OR sl.DS1 between' +
            ' '#39'G23'#39' AND '#39'G25.9'#39')'
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#9#1080#1079' '#1085#1080#1093':'#1073#1086#1083#1077#1079#1085#1100' '#1055#1072#1088#1082#1080#1085#1089#1086#1085#1072#39' as naim,'#39'7.3.1'#39' as num, COU' +
            'NT(*) AS countAll, '#39'G20'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 LIKE '#39'G20%'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#9#1076#1088#1091#1075#1080#1077' '#1101#1082#1089#1090#1088#1072#1087#1080#1088#1072#1084#1080#1076#1085#1099#1077' '#1080' '#1076#1074#1080#1075#1072#1090#1077#1083#1100#1085#1099#1077' '#1085#1072#1088#1091#1096#1077#1085#1080#1103#39' as n' +
            'aim,'#39'7.3.2'#39' as num, COUNT(*) AS countAll, '#39'G25'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 LIKE '#39'G25%'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#1076#1088#1091#1075#1080#1077' '#1076#1077#1075#1077#1085#1077#1088#1072#1090#1080#1074#1085#1099#1077' '#1073#1086#1083#1077#1079#1085#1080' '#1085#1077#1088#1074#1085#1086#1081' '#1089#1080#1089#1090#1077#1084#1099#39' as naim,' +
            #39'7.4'#39' as num, COUNT(*) AS countAll, '#39'G30-G31'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 between '#39'G30'#39' AND '#39'G31.9'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#9#1080#1079' '#1085#1080#1093': '#1073#1086#1083#1077#1079#1085#1100' '#1040#1083#1100#1094#1075#1077#1081#1084#1077#1088#1072#39' as naim,'#39'7.4.1'#39' as num, C' +
            'OUNT(*) AS countAll, '#39'G30'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 LIKE '#39'G30%'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#1076#1077#1084#1080#1077#1083#1080#1085#1080#1079#1080#1088#1091#1102#1097#1080#1077' '#1073#1086#1083#1077#1079#1085#1080' '#1094#1077#1085#1090#1088#1072#1083#1100#1085#1086#1081' '#1085#1077#1088#1074#1085#1086#1081' '#1089#1080#1089#1090#1077#1084#1099#39' ' +
            'as naim,'#39'7.5'#39' as num, COUNT(*) AS countAll, '#39'G35-G37'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 between '#39'G35'#39' AND '#39'G37.9'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#9#1080#1079' '#1085#1080#1093':'#1088#1072#1089#1089#1077#1103#1085#1085#1099#1081' '#1089#1082#1083#1077#1088#1086#1079#39' as naim,'#39'7.5.1'#39' as num, COU' +
            'NT(*) AS countAll, '#39'G35'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 LIKE '#39'G35%'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#1101#1087#1080#1079#1086#1076#1080#1095#1077#1089#1082#1080#1077' '#1080' '#1087#1072#1088#1086#1082#1089#1080#1079#1084#1072#1083#1100#1085#1099#1077' '#1088#1072#1089#1089#1090#1088#1086#1081#1089#1090#1074#1072#39' as naim,'#39 +
            '7.6'#39' as num, COUNT(*) AS countAll, '#39'G40 -G47'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 between '#39'G40'#39' AND '#39'G47.9'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#9#1080#1079' '#1085#1080#1093': '#1101#1087#1080#1083#1077#1087#1089#1080#1103', '#1101#1087#1080#1083#1077#1087#1090#1080#1095#1077#1089#1082#1080#1081' '#1089#1090#1072#1090#1091#1089#39' as naim,'#39'7.6' +
            '.1'#39' as num, COUNT(*) AS countAll, '#39'G40-G41'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 between '#39'G40'#39' AND '#39'G41.9'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#9#1087#1088#1077#1093#1086#1076#1103#1097#1080#1077' '#1090#1088#1072#1085#1079#1080#1090#1086#1088#1085#1099#1077' '#1094#1077#1088#1077#1073#1088#1072#1083#1100#1085#1099#1077' '#1080#1096#1077#1084#1080#1095#1077#1089#1082#1080#1077' '#1087#1088#1080#1089#1090 +
            #1091#1087#1099'  ('#1072#1090#1072#1082#1080') '#1080' '#1088#1086#1076#1089#1090#1074#1077#1085#1085#1099#1077' '#1089#1080#1085#1076#1088#1086#1084#1099#39' as naim,'#39'7.6.2'#39' as num, COU' +
            'NT(*) AS countAll, '#39'G45'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 LIKE '#39'G45%'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#1087#1086#1088#1072#1078#1077#1085#1080#1103' '#1086#1090#1076#1077#1083#1100#1085#1099#1093' '#1085#1077#1088#1074#1086#1074', '#1085#1077#1088#1074#1085#1099#1093' '#1082#1086#1088#1077#1096#1082#1086#1074' '#1080' '#1089#1087#1083#1077#1090#1077#1085#1080 +
            #1081', '#1087#1086#1083#1080#1085#1077#1074#1088#1086#1087#1072#1090#1080#1080' '#1080' '#1076#1088#1091#1075#1080#1077' '#1087#1086#1088#1072#1078#1077#1085#1080#1103' '#1087#1077#1088#1080#1092#1077#1088#1080#1095#1077#1089#1082#1086#1081' '#1085#1077#1088#1074#1085#1086#1081'  '#1089#1080#1089 +
            #1090#1077#1084#1099#39' as naim,'#39'7.7'#39' as num, COUNT(*) AS countAll, '#39'G50-G64'#39' AS M' +
            'KB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 between '#39'G50'#39' AND '#39'G64.9'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#9#1080#1079' '#1085#1080#1093':'#1089#1080#1085#1076#1088#1086#1084' '#1043#1080#1081#1077#1085#1072'-'#1041#1072#1088#1088#1077#39' as naim,'#39'7.7.1'#39' as num, C' +
            'OUNT(*) AS countAll, '#39'G61.0'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 = '#39'G61.0'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#1073#1086#1083#1077#1079#1085#1080' '#1085#1077#1088#1074#1085#1086'-'#1084#1099#1096#1077#1095#1085#1086#1075#1086' '#1089#1080#1085#1072#1087#1089#1072' '#1080' '#1084#1099#1096#1094#39' as naim,'#39'7.8'#39' ' +
            'as num, COUNT(*) AS countAll, '#39'G70-G73'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 between '#39'G70'#39' AND '#39'G73.9'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#9#1080#1079' '#1085#1080#1093': '#1084#1080#1072#1089#1090#1077#1085#1080#1103#39' as naim,'#39'7.8.1'#39' as num, COUNT(*) AS' +
            ' countAll, '#39'G70.0,2,9'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND (sl.DS1 = '#39'G70.0'#39' OR sl.DS1 = '#39'G70.2'#39' OR sl.DS1 = '#39 +
            'G70.9'#39')'
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#9#1084#1099#1096#1077#1095#1085#1072#1103' '#1076#1080#1089#1090#1088#1086#1092#1080#1103' '#1044#1102#1096#1077#1085#1085#1072#39' as naim,'#39'7.8.2'#39' as num, CO' +
            'UNT(*) AS countAll, '#39'G71.0'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 = '#39'G71.0'#39' '
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#1094#1077#1088#1077#1073#1088#1072#1083#1100#1085#1099#1081' '#1087#1072#1088#1072#1083#1080#1095' '#1080' '#1076#1088#1091#1075#1080#1077' '#1087#1072#1088#1072#1083#1080#1090#1080#1095#1077#1089#1082#1080#1077' '#1089#1080#1085#1076#1088#1086#1084#1099#39' ' +
            'as naim,'#39'7.9'#39' as num, COUNT(*) AS countAll, '#39'G80- G83'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 between '#39'G80'#39' AND '#39'G83.9'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#9#1080#1079' '#1085#1080#1093': '#1094#1077#1088#1077#1073#1088#1072#1083#1100#1085#1099#1081' '#1087#1072#1088#1072#1083#1080#1095#39' as naim,'#39'7.9.1'#39' as num, ' +
            'COUNT(*) AS countAll, '#39'G80'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 LIKE '#39'G80%'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#1088#1072#1089#1089#1090#1088#1086#1081#1089#1090#1074#1072' '#1074#1077#1075#1077#1090#1072#1090#1080#1074#1085#1086#1081' ('#1072#1074#1090#1086#1085#1086#1084#1085#1086#1081') '#1085#1077#1088#1074#1085#1086#1081' '#1089#1080#1089#1090#1077#1084#1099#39 +
            ' as naim,'#39'7.10'#39' as num, COUNT(*) AS countAll, '#39'G90'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 LIKE '#39'G90%'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#1089#1086#1089#1091#1076#1080#1089#1090#1099#1077' '#1084#1080#1077#1083#1086#1087#1072#1090#1080#1080#39' as naim,'#39'7.11'#39' as num, COUNT(*) ' +
            'AS countAll, '#39'G95.1'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 = '#39'G95.1'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#1073#1086#1083#1077#1079#1085#1080' '#1075#1083#1072#1079#1072' '#1080' '#1077#1075#1086' '#1087#1088#1080#1076#1072#1090#1086#1095#1085#1086#1075#1086' '#1072#1087#1087#1072#1088#1072#1090#1072' '#39' as naim,'#39'8.0' +
            #39' as num, COUNT(*) AS countAll, '#39'H00-H59'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 between '#39'H00'#39' AND '#39'H59.9'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#1080#1079' '#1085#1080#1093': '#1103#1079#1074#1072' '#1088#1086#1075#1086#1074#1080#1094#1099#39' as naim,'#39'8.1'#39' as num, COUNT(*) A' +
            'S countAll, '#39#1053'16.0'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 = '#39'H16.0'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#1082#1072#1090#1072#1088#1072#1082#1090#1099#39' as naim,'#39'8.2'#39' as num, COUNT(*) AS countAll, ' +
            #39'H25-H26'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 between '#39'H25'#39' AND '#39'H26.9'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#1076#1077#1075#1077#1085#1077#1088#1072#1094#1080#1103' '#1084#1072#1082#1091#1083#1099' '#1080' '#1079#1072#1076#1085#1077#1075#1086' '#1087#1086#1083#1102#1089#1072#39' as naim,'#39'8.3'#39' as n' +
            'um, COUNT(*) AS countAll, '#39#1053'35.3'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 = '#39'H35.3'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#1075#1083#1072#1091#1082#1086#1084#1072#39' as naim,'#39'8.4'#39' as num, COUNT(*) AS countAll, '#39 +
            'H40'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 LIKE '#39'H40%'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#1085#1077#1074#1088#1080#1090' '#1079#1088#1080#1090#1077#1083#1100#1085#1086#1075#1086' '#1085#1077#1088#1074#1072#39' as naim,'#39'8.5'#39' as num, COUNT(*' +
            ') AS countAll, '#39'H46'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 LIKE '#39'H46%'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#1089#1083#1077#1087#1086#1090#1072' '#1080' '#1087#1086#1085#1080#1078#1077#1085#1085#1086#1077' '#1079#1088#1077#1085#1080#1077#39' as naim,'#39'8.6'#39' as num, COUN' +
            'T(*) AS countAll, '#39'H54'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 LIKE '#39'H54%'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#9#1080#1079' '#1085#1080#1093' '#1089#1083#1077#1087#1086#1090#1072' '#1086#1073#1086#1080#1093' '#1075#1083#1072#1079#39' as naim,'#39'8.6.1'#39' as num, COU' +
            'NT(*) AS countAll, '#39'H54.0'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 = '#39'H54.0'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#1073#1086#1083#1077#1079#1085#1080' '#1091#1093#1072' '#1080' '#1089#1086#1089#1094#1077#1074#1080#1076#1085#1086#1075#1086' '#1086#1090#1088#1086#1089#1090#1082#1072#39' as naim,'#39'9.0'#39' as nu' +
            'm, COUNT(*) AS countAll, '#39'H60-H95'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 between '#39'H60'#39' AND '#39'H95.9'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#1073#1086#1083#1077#1079#1085#1080' '#1089#1088#1077#1076#1085#1077#1075#1086' '#1091#1093#1072' '#1080' '#1089#1086#1089#1094#1077#1074#1080#1076#1085#1086#1075#1086' '#1086#1090#1088#1086#1089#1090#1082#1072#39' as naim,'#39'9' +
            '.1'#39' as num, COUNT(*) AS countAll, '#39#1053'65-'#1053'66, '#1053'68-'#1053'74'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND (sl.DS1 between '#39'H65'#39' AND '#39'H66.9'#39' OR sl.DS1 between' +
            ' '#39'H68'#39' AND '#39'H74.9'#39')'
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#9#1080#1079' '#1085#1080#1093': '#1086#1089#1090#1088#1099#1081' '#1086#1090#1080#1090#39' as naim,'#39'9.1.1'#39' as num, COUNT(*) ' +
            'AS countAll, '#39'H65.0, H65.1, H66.0'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND (sl.DS1 = '#39'H65.0'#39' OR sl.DS1 = '#39'H65.1'#39' OR sl.DS1 = '#39 +
            'H66.0'#39')'
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#9#1093#1088#1086#1085#1080#1095#1077#1089#1082#1080#1081' '#1086#1090#1080#1090#39' as naim,'#39'9.1.2'#39' as num, COUNT(*) AS ' +
            'countAll, '#39'H65.2-4,H66.1-3'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND (sl.DS1 between '#39'H65.2'#39' AND '#39'H65.4'#39' OR sl.DS1 betwe' +
            'en '#39'H66.1'#39' AND '#39'H66.3'#39')'
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#9#1073#1086#1083#1077#1079#1085#1080' '#1089#1083#1091#1093#1086#1074#1086#1081' ('#1077#1074#1089#1090#1072#1093#1080#1077#1074#1086#1081') '#1090#1088#1091#1073#1099#39' as naim,'#39'9.1.3'#39' ' +
            'as num, COUNT(*) AS countAll, '#39'H68-H69'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 between '#39'H68'#39' AND '#39'H69.9'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#9#1087#1077#1088#1092#1086#1088#1072#1094#1080#1103' '#1073#1072#1088#1072#1073#1072#1085#1085#1086#1081' '#1087#1077#1088#1077#1087#1086#1085#1082#1080#39' as naim,'#39'9.1.4'#39' as nu' +
            'm, COUNT(*) AS countAll, '#39'H72'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 LIKE '#39'H72%'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#9#1076#1088#1091#1075#1080#1077' '#1073#1086#1083#1077#1079#1085#1080' '#1089#1088#1077#1076#1085#1077#1075#1086' '#1091#1093#1072' '#1080' '#1089#1086#1089#1094#1077#1074#1080#1076#1085#1086#1075#1086' '#1086#1090#1088#1086#1089#1090#1082#1072#39' a' +
            's naim,'#39'9.1.5'#39' as num, COUNT(*) AS countAll, '#39'H74'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 LIKE '#39'H74%'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#1073#1086#1083#1077#1079#1085#1080' '#1074#1085#1091#1090#1088#1077#1085#1085#1077#1075#1086' '#1091#1093#1072#39' as naim,'#39'9.2'#39' as num, COUNT(*)' +
            ' AS countAll, '#39#1053'80, '#1053'81,'#1053'83'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND (sl.DS1 LIKE '#39'H80%'#39' OR sl.DS1 LIKE '#39'H81%'#39' OR sl.DS1' +
            ' LIKE '#39'H83%'#39')'
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#9#1080#1079' '#1085#1080#1093': '#1086#1090#1086#1089#1082#1083#1077#1088#1086#1079#39' as naim,'#39'9.2.1'#39' as num, COUNT(*) A' +
            'S countAll, '#39'H80'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 LIKE '#39'H80%'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#9#1073#1086#1083#1077#1079#1085#1100' '#1052#1077#1085#1100#1077#1088#1072#39' as naim,'#39'9.2.2'#39' as num, COUNT(*) AS c' +
            'ountAll, '#39'H81.0'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 = '#39'H81.0'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#1082#1086#1085#1076#1091#1082#1090#1080#1074#1085#1072#1103' '#1080' '#1085#1077#1081#1088#1086#1089#1077#1085#1089#1086#1088#1085#1072#1103' '#1087#1086#1090#1077#1088#1103' '#1089#1083#1091#1093#1072#39' as naim,'#39'9.' +
            '3'#39' as num, COUNT(*) AS countAll, '#39#1053'90'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 LIKE '#39'H90%'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#9#1080#1079' '#1085#1080#1093': '#1082#1086#1085#1076#1091#1082#1090#1080#1074#1085#1072#1103' '#1087#1086#1090#1077#1088#1103' '#1089#1083#1091#1093#1072' '#1076#1074#1091#1089#1090#1086#1088#1086#1085#1085#1103#1103#39' as nai' +
            'm,'#39'9.3.1'#39' as num, COUNT(*) AS countAll, '#39#1053'90.0'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 = '#39'H90.0'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#9#1085#1077#1081#1088#1086#1089#1077#1085#1089#1086#1088#1085#1072#1103' '#1087#1086#1090#1077#1088#1103' '#1089#1083#1091#1093#1072' '#1076#1074#1091#1089#1090#1086#1088#1086#1085#1085#1103#1103#39' as naim,'#39'9.3' +
            '.2'#39' as num, COUNT(*) AS countAll, '#39#1053'90.3'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 = '#39'H90.3'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#1073#1086#1083#1077#1079#1085#1080' '#1089#1080#1089#1090#1077#1084#1099' '#1082#1088#1086#1074#1086#1086#1073#1088#1072#1097#1077#1085#1080#1103#39' as naim,'#39'10.0'#39' as num, C' +
            'OUNT(*) AS countAll, '#39'I00-I99'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 between '#39'I00'#39' AND '#39'I99.9'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#1080#1079' '#1085#1080#1093': '#1086#1089#1090#1088#1072#1103' '#1088#1077#1074#1084#1072#1090#1080#1095#1077#1089#1082#1072#1103' '#1083#1080#1093#1086#1088#1072#1076#1082#1072#39' as naim,'#39'10.1'#39' ' +
            'as num, COUNT(*) AS countAll, '#39'I00-I02'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 between '#39'I00'#39' AND '#39'I02.9'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#1093#1088#1086#1085#1080#1095#1077#1089#1082#1080#1077' '#1088#1077#1074#1084#1072#1090#1080#1095#1077#1089#1082#1080#1077' '#1073#1086#1083#1077#1079#1085#1080' '#1089#1077#1088#1076#1094#1072#39' as naim,'#39'10.2' +
            #39' as num, COUNT(*) AS countAll, '#39'I05-I09'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 between '#39'I05'#39' AND '#39'I09.9'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#1073#1086#1083#1077#1079#1085#1080', '#1093#1072#1088#1072#1082#1090#1077#1088#1080#1079#1091#1102#1097#1080#1077#1089#1103' '#1087#1086#1074#1099#1096#1077#1085#1085#1099#1084' '#1082#1088#1086#1074#1103#1085#1099#1084' '#1076#1072#1074#1083#1077#1085#1080#1077 +
            #1084#39' as naim,'#39'10.3'#39' as num, COUNT(*) AS countAll, '#39'I10-I13'#39' AS MKB' +
            ','
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 between '#39'I10'#39' AND '#39'I13.9'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#9#1080#1079' '#1085#1080#1093': '#1101#1089#1089#1077#1085#1094#1080#1072#1083#1100#1085#1072#1103' '#1075#1080#1087#1077#1088#1090#1077#1085#1079#1080#1103#39' as naim,'#39'10.3.1'#39' as' +
            ' num, COUNT(*) AS countAll, '#39'I10'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 LIKE '#39'I10%'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#9#1075#1080#1087#1077#1088#1090#1077#1085#1079#1080#1074#1085#1072#1103' '#1073#1086#1083#1077#1079#1085#1100' '#1089#1077#1088#1076#1094#1072' ('#1075#1080#1087#1077#1088#1090#1086#1085#1080#1095#1077#1089#1082#1072#1103' '#1073#1086#1083#1077#1079#1085#1100 +
            ' '#1089' '#1087#1088#1077#1080#1084#1091#1097#1077#1089#1090#1074#1077#1085#1085#1099#1084' '#1087#1086#1088#1072#1078#1077#1085#1080#1077#1084' '#1089#1077#1088#1076#1094#1072')'#39' as naim,'#39'10.3.2'#39' as num,' +
            ' COUNT(*) AS countAll, '#39'I11'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 LIKE '#39'I11%'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#9#1075#1080#1087#1077#1088#1090#1077#1085#1079#1080#1074#1085#1072#1103' ('#1075#1080#1087#1077#1088#1090#1086#1085#1080#1095#1077#1089#1082#1072#1103') '#1073#1086#1083#1077#1079#1085#1100' '#1089' '#1087#1088#1077#1080#1084#1091#1097#1077#1089#1090#1074 +
            #1077#1085#1085#1099#1084' '#1087#1086#1088#1072#1078#1077#1085#1080#1077#1084'  '#1087#1086#1095#1077#1082#39' as naim,'#39'10.3.3'#39' as num, COUNT(*) AS co' +
            'untAll, '#39'I12'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 LIKE '#39'I12%'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#9#1075#1080#1087#1077#1088#1090#1077#1085#1079#1080#1074#1085#1072#1103' ('#1075#1080#1087#1077#1088#1090#1086#1085#1080#1095#1077#1089#1082#1072#1103') '#1073#1086#1083#1077#1079#1085#1100' '#1089' '#1087#1088#1077#1080#1084#1091#1097#1077#1089#1090#1074 +
            #1077#1085#1085#1099#1084' '#1087#1086#1088#1072#1078#1077#1085#1080#1077#1084' '#1089#1077#1088#1076#1094#1072' '#1080'  '#1087#1086#1095#1077#1082#39' as naim,'#39'10.3.4'#39' as num, COUNT' +
            '(*) AS countAll, '#39'I13'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 LIKE '#39'I13%'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#1080#1096#1077#1084#1080#1095#1077#1089#1082#1080#1077' '#1073#1086#1083#1077#1079#1085#1080' '#1089#1077#1088#1076#1094#1072#39' as naim,'#39'10.4'#39' as num, COUN' +
            'T(*) AS countAll, '#39'I20- I25'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 BETWEEN '#39'I20'#39' AND '#39'I25.9'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#9#1080#1079' '#1085#1080#1093': '#1089#1090#1077#1085#1086#1082#1072#1088#1076#1080#1103#39' as naim,'#39'10.4.1'#39' as num, COUNT(*)' +
            ' AS countAll, '#39'I20'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 LIKE '#39'I20%'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#9#9#1080#1079' '#1085#1077#1077': '#1085#1077#1089#1090#1072#1073#1080#1083#1100#1085#1072#1103' '#1089#1090#1077#1085#1086#1082#1072#1088#1076#1080#1103#39' as naim,'#39'10.4.1.1'#39' ' +
            'as num, COUNT(*) AS countAll, '#39'I20.0'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 = '#39'I20.0'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#9#1086#1089#1090#1088#1099#1081' '#1080#1085#1092#1072#1088#1082#1090' '#1084#1080#1086#1082#1072#1088#1076#1072#39' as naim,'#39'10.4.2'#39' as num, COUN' +
            'T(*) AS countAll, '#39'I21'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 LIKE '#39'I21%'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#9#1087#1086#1074#1090#1086#1088#1085#1099#1081' '#1080#1085#1092#1072#1088#1082#1090' '#1084#1080#1086#1082#1072#1088#1076#1072#39' as naim,'#39'10.4.3'#39' as num, C' +
            'OUNT(*) AS countAll, '#39'I22'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 LIKE '#39'I22%'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#9#1076#1088#1091#1075#1080#1077' '#1092#1086#1088#1084#1099' '#1086#1089#1090#1088#1099#1093' '#1080#1096#1077#1084#1080#1095#1077#1089#1082#1080#1093' '#1073#1086#1083#1077#1079#1085#1077#1081' '#1089#1077#1088#1076#1094#1072#39' as na' +
            'im,'#39'10.4.4'#39' as num, COUNT(*) AS countAll, '#39'I24'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 LIKE '#39'I24%'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#9#1093#1088#1086#1085#1080#1095#1077#1089#1082#1072#1103' '#1080#1096#1077#1084#1080#1095#1077#1089#1082#1072#1103' '#1073#1086#1083#1077#1079#1085#1100' '#1089#1077#1088#1076#1094#1072#39' as naim,'#39'10.4.' +
            '5'#39' as num, COUNT(*) AS countAll, '#39'I25'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 LIKE '#39'I25%'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#9#9#1080#1079' '#1085#1077#1077' '#1087#1086#1089#1090#1080#1085#1092#1072#1088#1082#1090#1085#1099#1081' '#1082#1072#1088#1076#1080#1086#1089#1082#1083#1077#1088#1086#1079#39' as naim,'#39'10.4.5.' +
            '1'#39' as num, COUNT(*) AS countAll, '#39'I25.8'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 = '#39'I25.8'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#1083#1077#1075#1086#1095#1085#1072#1103' '#1101#1084#1073#1086#1083#1080#1103#39' as naim,'#39'10.5'#39' as num, COUNT(*) AS co' +
            'untAll, '#39'I26'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 LIKE '#39'I26%'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#1076#1088#1091#1075#1080#1077' '#1073#1086#1083#1077#1079#1085#1080' '#1089#1077#1088#1076#1094#1072#39' as naim,'#39'10.6'#39' as num, COUNT(*) ' +
            'AS countAll, '#39'I30-I52'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 BETWEEN '#39'I30'#39' AND '#39'I52.9'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#9#1080#1079' '#1085#1080#1093': '#1086#1089#1090#1088#1099#1081' '#1080' '#1087#1086#1076#1086#1089#1090#1088#1099#1081' '#1101#1085#1076#1086#1082#1072#1088#1076#1080#1090#39' as naim,'#39'10.6.1' +
            #39' as num, COUNT(*) AS countAll, '#39'I33'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 LIKE '#39'I33%'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#9#1086#1089#1090#1088#1099#1081' '#1084#1080#1086#1082#1072#1088#1076#1080#1090#39' as naim,'#39'10.6.2'#39' as num, COUNT(*) AS' +
            ' countAll, '#39'I40'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 LIKE '#39'I40%'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#9#1082#1072#1088#1076#1080#1086#1084#1080#1086#1087#1072#1090#1080#1103#39' as naim,'#39'10.6.3'#39' as num, COUNT(*) AS c' +
            'ountAll, '#39'I42'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 LIKE '#39'I42%'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#9#1087#1088#1077#1076#1089#1077#1088#1076#1085#1086'-'#1078#1077#1083#1091#1076#1086#1095#1082#1086#1074#1072#1103' ('#1072#1090#1088#1080#1086#1074#1077#1085#1090#1088#1080#1082#1091#1083#1103#1088#1085#1072#1103') '#1073#1083#1086#1082#1072#1076#1072#39 +
            ' as naim,'#39'10.6.4'#39' as num, COUNT(*) AS countAll, '#39'I44.0- I44.3'#39' A' +
            'S MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 BETWEEN '#39'I44.0'#39' AND '#39'I44.3'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#9#1078#1077#1083#1091#1076#1086#1095#1082#1086#1074#1072#1103' '#1090#1072#1093#1080#1082#1072#1088#1076#1080#1103#39' as naim,'#39'10.6.5'#39' as num, COUN' +
            'T(*) AS countAll, '#39'I47.2'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 = '#39'I47.2'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#9#1092#1080#1073#1088#1080#1083#1083#1103#1094#1080#1103' '#1080' '#1090#1088#1077#1087#1077#1090#1072#1085#1080#1077' '#1087#1088#1077#1076#1089#1077#1088#1076#1080#1081#39' as naim,'#39'10.6.6'#39' ' +
            'as num, COUNT(*) AS countAll, '#39'I48'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 LIKE '#39'I48%'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#9#1094#1077#1088#1077#1073#1088#1086#1074#1072#1089#1082#1091#1083#1103#1088#1085#1099#1077' '#1073#1086#1083#1077#1079#1085#1080#39' as naim,'#39'10.7'#39' as num, COU' +
            'NT(*) AS countAll, '#39'I60-I69'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 BETWEEN '#39'I60'#39' AND '#39'I69.9'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#9#9#1080#1079' '#1085#1080#1093': '#1089#1091#1073#1072#1088#1072#1093#1085#1086#1080#1076#1072#1083#1100#1085#1086#1077' '#1082#1088#1086#1074#1086#1080#1079#1083#1080#1103#1085#1080#1077#39' as naim,'#39'10.' +
            '7.1'#39' as num, COUNT(*) AS countAll, '#39'I60'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 LIKE '#39'I60%'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#9#9#1074#1085#1091#1090#1088#1080#1084#1086#1079#1075#1086#1074#1086#1077' '#1080' '#1076#1088#1091#1075#1086#1077' '#1074#1085#1091#1090#1088#1080#1095#1077#1088#1077#1087#1085#1086#1077' '#1082#1088#1086#1074#1086#1080#1079#1083#1080#1103#1085#1080#1077#39 +
            ' as naim,'#39'10.7.2'#39' as num, COUNT(*) AS countAll, '#39'I61, I62'#39' AS MK' +
            'B,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND (sl.DS1 LIKE '#39'I61%'#39' OR sl.DS1 LIKE '#39'I62%'#39')'
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#9#9#1080#1085#1092#1072#1088#1082#1090' '#1084#1086#1079#1075#1072#39' as naim,'#39'10.7.3'#39' as num, COUNT(*) AS c' +
            'ountAll, '#39'I63'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 LIKE '#39'I63%'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#9#9#1080#1085#1089#1091#1083#1100#1090' '#1085#1077' '#1091#1090#1086#1095#1085#1077#1085#1085#1099#1081', '#1082#1072#1082' '#1082#1088#1086#1074#1086#1080#1079#1083#1080#1103#1085#1080#1077'  '#1080#1083#1080' '#1080#1085#1092#1072#1088#1082#1090 +
            #39' as naim,'#39'10.7.4'#39' as num, COUNT(*) AS countAll, '#39'I64'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 LIKE '#39'I64%'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#9#9#1079#1072#1082#1091#1087#1086#1088#1082#1072' '#1080' '#1089#1090#1077#1085#1086#1079' '#1087#1088#1077#1094#1077#1088#1077#1073#1088#1072#1083#1100#1085#1099#1093', '#1094#1077#1088#1077#1073#1088#1072#1083#1100#1085#1099#1093' '#1072#1088#1090#1077 +
            #1088#1080#1081', '#1085#1077' '#1087#1088#1080#1074#1086#1076#1103#1097#1080#1077' '#1082' '#1080#1085#1092#1072#1088#1082#1090#1091' '#1084#1086#1079#1075#1072#39' as naim,'#39'10.7.5'#39' as num, CO' +
            'UNT(*) AS countAll, '#39'I65- I66'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 BETWEEN '#39'I65'#39' AND '#39'I66.9'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#9#9#1076#1088#1091#1075#1080#1077' '#1094#1077#1088#1077#1073#1088#1086#1074#1072#1089#1082#1091#1083#1103#1088#1085#1099#1077' '#1073#1086#1083#1077#1079#1085#1080#39' as naim,'#39'10.7.6'#39' a' +
            's num, COUNT(*) AS countAll, '#39'I67'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 LIKE '#39'I67%'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#9#9#9#1080#1079' '#1085#1080#1093': '#1094#1077#1088#1077#1073#1088#1072#1083#1100#1085#1099#1081' '#1072#1090#1077#1088#1086#1089#1082#1083#1077#1088#1086#1079#39' as naim,'#39'10.7.6.1' +
            #39' as num, COUNT(*) AS countAll, '#39'I67.2'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 = '#39'I67.2'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#1072#1090#1077#1088#1086#1089#1082#1083#1077#1088#1086#1079' '#1072#1088#1090#1077#1088#1080#1081' '#1082#1086#1085#1077#1095#1085#1086#1089#1090#1077#1081', '#1090#1088#1086#1084#1073#1072#1085#1075#1080#1080#1090' '#1086#1073#1083#1080#1090#1077#1088#1080#1088 +
            #1091#1102#1097#1080#1081#39' as naim,'#39'10.8'#39' as num, COUNT(*) AS countAll, '#39'I70.2, I73.' +
            '1'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND (sl.DS1 = '#39'I70.2'#39' OR sl.DS1 = '#39'I73.1'#39')'
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#1073#1086#1083#1077#1079#1085#1080' '#1074#1077#1085', '#1083#1080#1084#1092#1072#1090#1080#1095#1077#1089#1082#1080#1093' '#1089#1086#1089#1091#1076#1086#1074' '#1080' '#1083#1080#1084#1092#1072#1090#1080#1095#1077#1089#1082#1080#1093' '#1091#1079#1083#1086 +
            #1074#39' as naim,'#39'10.9'#39' as num, COUNT(*) AS countAll, '#39'I80- I89'#39' AS MK' +
            'B,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 BETWEEN '#39'I80'#39' AND '#39'I89.9'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#9#1080#1079' '#1085#1080#1093': '#1092#1083#1077#1073#1080#1090' '#1080' '#1090#1088#1086#1084#1073#1086#1092#1083#1077#1073#1080#1090#39' as naim,'#39'10.9.1'#39' as num' +
            ', COUNT(*) AS countAll, '#39'I80'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 LIKE '#39'I80%'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#9#1090#1088#1086#1084#1073#1086#1079' '#1087#1086#1088#1090#1072#1083#1100#1085#1086#1081' '#1074#1077#1085#1099#39' as naim,'#39'10.9.2'#39' as num, COUN' +
            'T(*) AS countAll, '#39'I81'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 LIKE '#39'I81%'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#9#1074#1072#1088#1080#1082#1086#1079#1085#1086#1077' '#1088#1072#1089#1096#1080#1088#1077#1085#1080#1077' '#1074#1077#1085' '#1085#1080#1078#1085#1080#1093' '#1082#1086#1085#1077#1095#1085#1086#1089#1090#1077#1081#39' as naim,' +
            #39'10.9.3'#39' as num, COUNT(*) AS countAll, '#39'I83'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 LIKE '#39'I83%'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#9#1075#1077#1084#1086#1088#1088#1086#1081#39' as naim,'#39'10.9.4'#39' as num, COUNT(*) AS countAl' +
            'l, '#39'I84'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 LIKE '#39'I84%'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#1073#1086#1083#1077#1079#1085#1080' '#1086#1088#1075#1072#1085#1086#1074' '#1076#1099#1093#1072#1085#1080#1103#39' as naim,'#39'11.0'#39' as num, COUNT(*)' +
            ' AS countAll, '#39'J00-J98'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 BETWEEN '#39'J00'#39' AND '#39'J98.9'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#1080#1079' '#1085#1080#1093': '#1086#1089#1090#1088#1099#1077' '#1088#1077#1089#1087#1080#1088#1072#1090#1086#1088#1085#1099#1077' '#1080#1085#1092#1077#1082#1094#1080#1080' '#1074#1077#1088#1093#1085#1080#1093' '#1076#1099#1093#1072#1090#1077#1083#1100#1085 +
            #1099#1093' '#1087#1091#1090#1077#1081#39' as naim,'#39'11.1'#39' as num, COUNT(*) AS countAll, '#39'J00-J06'#39 +
            ' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 BETWEEN '#39'J00'#39' AND '#39'J06.9'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#9#1080#1079' '#1085#1080#1093': '#1086#1089#1090#1088#1099#1081' '#1083#1072#1088#1080#1085#1075#1080#1090' '#1080' '#1090#1088#1072#1093#1077#1080#1090#39' as naim,'#39'11.1.1'#39' as' +
            ' num, COUNT(*) AS countAll, '#39'J04'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 LIKE '#39'J04%'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#9#1086#1089#1090#1088#1099#1081' '#1086#1073#1089#1090#1088#1091#1082#1090#1080#1074#1085#1099#1081' '#1083#1072#1088#1080#1085#1075#1080#1090' ['#1082#1088#1091#1087'] '#1080' '#1101#1087#1080#1075#1083#1086#1090#1090#1080#1090' '#39' as' +
            ' naim,'#39'11.1.2'#39' as num, COUNT(*) AS countAll, '#39'J05'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 LIKE '#39'J05%'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#1075#1088#1080#1087#1087#39' as naim,'#39'11.2'#39' as num, COUNT(*) AS countAll, '#39'J1' +
            '0-J11'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 BETWEEN '#39'J10'#39' AND '#39'J11.9'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#1087#1085#1077#1074#1084#1086#1085#1080#1103#39' as naim,'#39'11.3'#39' as num, COUNT(*) AS countAll,' +
            ' '#39'J12-J18'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 BETWEEN '#39'J12'#39' AND '#39'J18.9'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#1086#1089#1090#1088#1099#1077' '#1088#1077#1089#1087#1080#1088#1072#1090#1086#1088#1085#1099#1077' '#1080#1085#1092#1077#1082#1094#1080#1080' '#1085#1080#1078#1085#1080#1093' '#1076#1099#1093#1072#1090#1077#1083#1100#1085#1099#1093' '#1087#1091#1090#1077#1081#39 +
            ' as naim,'#39'11.4'#39' as num, COUNT(*) AS countAll, '#39'J20-J22'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 BETWEEN '#39'J20'#39' AND '#39'J22.9'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#1072#1083#1083#1077#1088#1075#1080#1095#1077#1089#1082#1080#1081' '#1088#1080#1085#1080#1090' ('#1087#1086#1083#1083#1080#1085#1086#1079')'#39' as naim,'#39'11.5'#39' as num, ' +
            'COUNT(*) AS countAll, '#39'J30.1'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 = '#39'J30.1'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#1093#1088#1086#1085#1080#1095#1077#1089#1082#1080#1077' '#1073#1086#1083#1077#1079#1085#1080' '#1084#1080#1085#1076#1072#1083#1080#1085' '#1080' '#1072#1076#1077#1085#1086#1080#1076#1086#1074', '#1087#1077#1088#1080#1090#1086#1085#1079#1080#1083#1083#1103#1088 +
            #1085#1099#1081' '#1072#1073#1089#1094#1077#1089#1089#39' as naim,'#39'11.6'#39' as num, COUNT(*) AS countAll, '#39'J35- ' +
            'J36'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 BETWEEN '#39'J35'#39' AND '#39'J36.9'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#1073#1088#1086#1085#1093#1080#1090' '#1093#1088#1086#1085#1080#1095#1077#1089#1082#1080#1081' '#1080' '#1085#1077#1091#1090#1086#1095#1085#1077#1085#1085#1099#1081',  '#1101#1084#1092#1080#1079#1077#1084#1072#39' as naim,' +
            #39'11.7'#39' as num, COUNT(*) AS countAll, '#39'J40-J43'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 BETWEEN '#39'J40'#39' AND '#39'J43.9'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#1076#1088#1091#1075#1072#1103' '#1093#1088#1086#1085#1080#1095#1077#1089#1082#1072#1103' '#1086#1073#1089#1090#1088#1091#1082#1090#1080#1074#1085#1072#1103'  '#1083#1077#1075#1086#1095#1085#1072#1103' '#1073#1086#1083#1077#1079#1085#1100', '#1073#1088#1086 +
            #1085#1093#1086#1101#1082#1090#1072#1090#1080#1095#1077#1089#1082#1072#1103' '#1073#1086#1083#1077#1079#1085#1100#39' as naim,'#39'11.8'#39' as num, COUNT(*) AS coun' +
            'tAll, '#39'J44, J47'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND (sl.DS1 LIKE '#39'J44'#39' OR sl.DS1 LIKE '#39'J47'#39')'
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#1072#1089#1090#1084#1072'; '#1089#1090#1084#1072#1090#1080#1095#1077#1089#1082#1080#1081' '#1089#1090#1072#1090#1091#1089#39' as naim,'#39'11.9'#39' as num, COUN' +
            'T(*) AS countAll, '#39'J45, J46'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND (sl.DS1 LIKE '#39'J45'#39' OR sl.DS1 LIKE '#39'J46'#39')'
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#1076#1088#1091#1075#1080#1077' '#1080#1085#1090#1077#1088#1089#1090#1080#1094#1080#1072#1083#1100#1085#1099#1077' '#1083#1077#1075#1086#1095#1085#1099#1077' '#1073#1086#1083#1077#1079#1085#1080', '#1075#1085#1086#1081#1085#1099#1077' '#1080' '#1085#1077#1082 +
            #1088#1086#1090#1080#1095#1077#1089#1082#1080#1077' '#1089#1086#1089#1090#1086#1103#1085#1080#1103' '#1085#1080#1078#1085#1080#1093' '#1076#1099#1093#1072#1090#1077#1083#1100#1085#1099#1093' '#1087#1091#1090#1077#1081', '#1076#1088#1091#1075#1080#1077' '#1073#1086#1083#1077#1079#1085#1080' '#1087#1083 +
            #1077#1074#1088#1099#39' as naim,'#39'11.10'#39' as num, COUNT(*) AS countAll, '#39'J84-J94'#39' AS' +
            ' MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 BETWEEN '#39'J84'#39' AND '#39'J94.9'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#1073#1086#1083#1077#1079#1085#1080' '#1086#1088#1075#1072#1085#1086#1074' '#1087#1080#1097#1077#1074#1072#1088#1077#1085#1080#1103#39' as naim,'#39'12.0'#39' as num, COUN' +
            'T(*) AS countAll, '#39'K00-K92'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 BETWEEN '#39'K00'#39' AND '#39'K92.9'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#1080#1079' '#1085#1080#1093': '#1103#1079#1074#1072' '#1078#1077#1083#1091#1076#1082#1072' '#1080' '#1076#1074#1077#1085#1072#1076#1094#1072#1090#1080#1087#1077#1088#1089#1090#1085#1086#1081' '#1082#1080#1096#1082#1080#39' as nai' +
            'm,'#39'12.1'#39' as num, COUNT(*) AS countAll, '#39'K25-K26'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 BETWEEN '#39'K25'#39' AND '#39'K26.9'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#1075#1072#1089#1090#1088#1080#1090' '#1080' '#1076#1091#1086#1076#1077#1085#1080#1090#39' as naim,'#39'12.2'#39' as num, COUNT(*) AS ' +
            'countAll, '#39'K29'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 LIKE '#39'K29%'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#1075#1088#1099#1078#1080#39' as naim,'#39'12.3'#39' as num, COUNT(*) AS countAll, '#39'K4' +
            '0-K46'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 BETWEEN '#39'K40'#39' AND '#39'K46.9'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#1085#1077#1080#1085#1092#1077#1082#1094#1080#1086#1085#1085#1099#1081' '#1101#1085#1090#1077#1088#1080#1090' '#1080' '#1082#1086#1083#1080#1090#39' as naim,'#39'12.4'#39' as num, ' +
            'COUNT(*) AS countAll, '#39'K50-K52'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 BETWEEN '#39'K50'#39' AND '#39'K52.9'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#9#1080#1079' '#1085#1080#1093': '#1073#1086#1083#1077#1079#1085#1100' '#1050#1088#1086#1085#1072#39' as naim,'#39'12.4.1'#39' as num, COUNT(' +
            '*) AS countAll, '#39'K50'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 LIKE '#39'K50%'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#9#1103#1079#1074#1077#1085#1085#1099#1081' '#1082#1086#1083#1080#1090#39' as naim,'#39'12.4.2'#39' as num, COUNT(*) AS c' +
            'ountAll, '#39'K51'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 LIKE '#39'K51%'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#1076#1088#1091#1075#1080#1077' '#1073#1086#1083#1077#1079#1085#1080' '#1082#1080#1096#1077#1095#1085#1080#1082#1072#39' as naim,'#39'12.5'#39' as num, COUNT(' +
            '*) AS countAll, '#39#1050'55-'#1050'63'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 BETWEEN '#39'K55'#39' AND '#39'K63.9'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#9#1080#1079' '#1085#1080#1093': '#1087#1072#1088#1072#1083#1080#1090#1080#1095#1077#1089#1082#1080#1081' '#1080#1083#1077#1091#1089' '#1080' '#1085#1077#1087#1088#1086#1093#1086#1076#1080#1084#1086#1089#1090#1100' '#1082#1080#1096#1077#1095#1085#1080#1082 +
            #1072' '#1073#1077#1079' '#1075#1088#1099#1078#1080#39' as naim,'#39'12.5.1'#39' as num, COUNT(*) AS countAll, '#39#1050'56' +
            #39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 LIKE '#39'K56%'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#9#1076#1080#1074#1077#1088#1090#1080#1082#1091#1083#1103#1088#1085#1072#1103' '#1073#1086#1083#1077#1079#1085#1100' '#1082#1080#1096#1077#1095#1085#1080#1082#1072#39' as naim,'#39'12.5.2'#39' as' +
            ' num, COUNT(*) AS countAll, '#39#1050'57'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 LIKE '#39'K57%'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#1087#1077#1088#1080#1090#1086#1085#1080#1090#39' as naim,'#39'12.6'#39' as num, COUNT(*) AS countAll,' +
            ' '#39#1050'65'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 LIKE '#39'K65%'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#1073#1086#1083#1077#1079#1085#1080' '#1087#1077#1095#1077#1085#1080#39' as naim,'#39'12.7'#39' as num, COUNT(*) AS coun' +
            'tAll, '#39'K70-K76'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 BETWEEN '#39'K70'#39' AND '#39'K76.9'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#9#1080#1079' '#1085#1080#1093': '#1092#1080#1073#1088#1086#1079' '#1080' '#1094#1080#1088#1088#1086#1079' '#1087#1077#1095#1077#1085#1080#39' as naim,'#39'12.7.1'#39' as nu' +
            'm, COUNT(*) AS countAll, '#39#1050'74'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 LIKE '#39'K74%'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#1073#1086#1083#1077#1079#1085#1080' '#1078#1077#1083#1095#1085#1086#1075#1086' '#1087#1091#1079#1099#1088#1103', '#1078#1077#1083#1095#1077#1074#1099#1074#1086#1076#1103#1097#1080#1093' '#1087#1091#1090#1077#1081#39' as naim,' +
            #39'12.8'#39' as num, COUNT(*) AS countAll, '#39'K80-83'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 BETWEEN '#39'K80'#39' AND '#39'K83.9'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#1073#1086#1083#1077#1079#1085#1080' '#1087#1086#1076#1078#1077#1083#1091#1076#1086#1095#1085#1086#1081' '#1078#1077#1083#1077#1079#1099#39' as naim,'#39'12.9'#39' as num, CO' +
            'UNT(*) AS countAll, '#39#1050'85-'#1050'86'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 BETWEEN '#39'K85'#39' AND '#39'K86.9'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#9#1080#1079' '#1085#1080#1093': '#1086#1089#1090#1088#1099#1081' '#1087#1072#1085#1082#1088#1077#1072#1090#1080#1090#39' as naim,'#39'12.9.1'#39' as num, CO' +
            'UNT(*) AS countAll, '#39#1050'85'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 LIKE '#39'K85%'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#1073#1086#1083#1077#1079#1085#1080' '#1082#1086#1078#1080' '#1080' '#1087#1086#1076#1082#1086#1078#1085#1086#1081' '#1082#1083#1077#1090#1095#1072#1090#1082#1080#39' as naim,'#39'13.0'#39' as nu' +
            'm, COUNT(*) AS countAll, '#39'L00-L98'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 BETWEEN '#39'L00'#39' AND '#39'L98.9'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#1080#1079' '#1085#1080#1093': '#1087#1089#1086#1088#1080#1072#1079', '#1074#1089#1077#1075#1086#39' as naim,'#39'13.1'#39' as num, COUNT(*)' +
            ' AS countAll, '#39'L40'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 LIKE '#39'L40%'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#9#1080#1079' '#1085#1080#1093': '#1087#1089#1086#1088#1080#1072#1079' '#1072#1088#1090#1088#1086#1087#1072#1090#1080#1095#1077#1089#1082#1080#1081#39' as naim,'#39'13.1.1'#39' as n' +
            'um, COUNT(*) AS countAll, '#39'L40.5'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 = '#39'L40.5'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#1076#1080#1089#1082#1086#1080#1076#1085#1072#1103' '#1082#1088#1072#1089#1085#1072#1103' '#1074#1086#1083#1095#1072#1085#1082#1072#39' as naim,'#39'13.2'#39' as num, COU' +
            'NT(*) AS countAll, '#39'L93.0'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 = '#39'L93.0'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#1083#1086#1082#1072#1083#1080#1079#1086#1074#1072#1085#1085#1072#1103' '#1089#1082#1083#1077#1088#1086#1076#1077#1088#1084#1080#1103#39' as naim,'#39'13.3'#39' as num, COU' +
            'NT(*) AS countAll, '#39'L94.0'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 = '#39'L94.0'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#1073#1086#1083#1077#1079#1085#1080' '#1082#1086#1089#1090#1085#1086'-'#1084#1099#1096#1077#1095#1085#1086#1081' '#1089#1080#1089#1090#1077#1084#1099' '#1080' '#1089#1086#1077#1076#1080#1085#1080#1090#1077#1083#1100#1085#1086#1081' '#1090#1082#1072#1085#1080#39' ' +
            'as naim,'#39'14.0'#39' as num, COUNT(*) AS countAll, '#39'M00-M99'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 BETWEEN '#39'M00'#39' AND '#39'M99.9'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#1080#1079' '#1085#1080#1093': '#1072#1088#1090#1088#1086#1087#1072#1090#1080#1080#39' as naim,'#39'14.1'#39' as num, COUNT(*) AS ' +
            'countAll, '#39#1052'00-'#1052'25'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 BETWEEN '#39'M00'#39' AND '#39'M25.9'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#9#1080#1079' '#1085#1080#1093': '#1088#1077#1072#1082#1090#1080#1074#1085#1099#1077' '#1072#1088#1090#1088#1086#1087#1072#1090#1080#1080#39' as naim,'#39'14.1.1'#39' as num' +
            ', COUNT(*) AS countAll, '#39#1052'02'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 LIKE '#39'M02%'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#9#1089#1077#1088#1086#1087#1086#1079#1080#1090#1080#1074#1085#1099#1081' '#1080' '#1076#1088#1091#1075#1080#1077' '#1088#1077#1074#1084#1072#1090#1086#1080#1076#1085#1099#1077'  '#1072#1088#1090#1088#1080#1090#1099#39' as naim' +
            ','#39'14.1.2'#39' as num, COUNT(*) AS countAll, '#39#1052'05-'#1052'06'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 BETWEEN '#39'M05'#39' AND '#39'M06.9'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#9#1102#1085#1086#1096#1077#1089#1082#1080#1081' ('#1102#1074#1077#1085#1080#1083#1100#1085#1099#1081') '#1072#1088#1090#1088#1080#1090#39' as naim,'#39'14.1.3'#39' as num' +
            ', COUNT(*) AS countAll, '#39#1052'08'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 LIKE '#39'M08%'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#9#1072#1088#1090#1088#1086#1079#1099#39' as naim,'#39'14.1.4'#39' as num, COUNT(*) AS countAll' +
            ', '#39#1052'15-'#1052'19'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 BETWEEN '#39'M15'#39' AND '#39'M19.9'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#1089#1080#1089#1090#1077#1084#1085#1099#1077' '#1087#1086#1088#1072#1078#1077#1085#1080#1103' '#1089#1086#1077#1076#1080#1085#1080#1090#1077#1083#1100#1085#1086#1081' '#1090#1082#1072#1085#1080#39' as naim,'#39'14.2' +
            #39' as num, COUNT(*) AS countAll, '#39#1052'30-'#1052'35'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 BETWEEN '#39'M30'#39' AND '#39'M35.9'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#1076#1077#1092#1086#1088#1084#1080#1088#1091#1102#1097#1080#1077' '#1076#1086#1088#1089#1086#1087#1072#1090#1080#1080#39' as naim,'#39'14.3'#39' as num, COUNT(' +
            '*) AS countAll, '#39'M40-M43'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 BETWEEN '#39'M40'#39' AND '#39'M43.9'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#1089#1087#1086#1085#1076#1080#1083#1086#1087#1072#1090#1080#1080#39' as naim,'#39'14.4'#39' as num, COUNT(*) AS count' +
            'All, '#39#1052'45-'#1052'49'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 BETWEEN '#39'M45'#39' AND '#39'M49.9'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#1087#1086#1088#1072#1078#1077#1085#1080#1103' '#1089#1080#1085#1086#1074#1080#1072#1083#1100#1085#1099#1093' '#1086#1073#1086#1083#1086#1095#1077#1082' '#1080' '#1089#1091#1093#1086#1078#1080#1083#1080#1081#39' as naim,'#39'1' +
            '4.5'#39' as num, COUNT(*) AS countAll, '#39#1052'65-'#1052'68'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 BETWEEN '#39'M65'#39' AND '#39'M68.9'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#1086#1089#1090#1077#1086#1087#1072#1090#1080#1080' '#1080' '#1093#1086#1085#1076#1088#1086#1087#1072#1090#1080#1080#39' as naim,'#39'14.6'#39' as num, COUNT(' +
            '*) AS countAll, '#39'M80-M94'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 BETWEEN '#39'M80'#39' AND '#39'M94.9'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#9#1080#1079' '#1085#1080#1093' '#1086#1089#1090#1077#1086#1087#1086#1088#1086#1079#1099#39' as naim,'#39'14.6.1'#39' as num, COUNT(*) ' +
            'AS countAll, '#39#1052'80-'#1052'81'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 BETWEEN '#39'M80'#39' AND '#39'M81.9'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#1073#1086#1083#1077#1079#1085#1080' '#1084#1086#1095#1077#1087#1086#1083#1086#1074#1086#1081' '#1089#1080#1089#1090#1077#1084#1099#39' as naim,'#39'15.0'#39' as num, COUN' +
            'T(*) AS countAll, '#39'N00-N99'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 BETWEEN '#39'N00'#39' AND '#39'N99.9'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#1080#1079' '#1085#1080#1093': '#1075#1083#1086#1084#1077#1088#1091#1083#1103#1088#1085#1099#1077', '#1090#1091#1073#1091#1083#1086#1080#1085#1090#1077#1088#1089#1090#1080#1094#1080#1072#1083#1100#1085#1099#1077' '#1073#1086#1083#1077#1079#1085#1080' '#1087 +
            #1086#1095#1077#1082', '#1076#1088#1091#1075#1080#1077' '#1073#1086#1083#1077#1079#1085#1080' '#1087#1086#1095#1082#1080'  '#1080' '#1084#1086#1095#1077#1090#1086#1095#1085#1080#1082#1072#39' as naim,'#39'15.1'#39' as num' +
            ', COUNT(*) AS countAll, '#39'N00-N15,N25-N28'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND (sl.DS1 BETWEEN '#39'N00'#39' AND '#39'N15.9'#39' OR sl.DS1 BETWEEN' +
            ' '#39'N25'#39' AND '#39'N28.9'#39')'
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#1087#1086#1095#1077#1095#1085#1072#1103' '#1085#1077#1076#1086#1089#1090#1072#1090#1086#1095#1085#1086#1089#1090#1100#39' as naim,'#39'15.2'#39' as num, COUNT(' +
            '*) AS countAll, '#39'N17-N19'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 BETWEEN '#39'N17'#39' AND '#39'N19.9'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#1084#1086#1095#1077#1082#1072#1084#1077#1085#1085#1072#1103' '#1073#1086#1083#1077#1079#1085#1100#39' as naim,'#39'15.3'#39' as num, COUNT(*) A' +
            'S countAll, '#39'N20-N21, N23'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND (sl.DS1 BETWEEN '#39'N20'#39' AND '#39'N21.9'#39' OR sl.DS1 LIKE '#39'N' +
            '23%'#39')'
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#1076#1088#1091#1075#1080#1077' '#1073#1086#1083#1077#1079#1085#1080' '#1084#1086#1095#1077#1074#1086#1081' '#1089#1080#1089#1090#1077#1084#1099#39' as naim,'#39'15.4'#39' as num, ' +
            'COUNT(*) AS countAll, '#39'N30- N32, N34-N36, N39'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND (sl.DS1 BETWEEN '#39'N30'#39' AND '#39'N32.9'#39' OR sl.DS1 BETWEEN' +
            ' '#39'N34'#39' AND '#39'N36.9'#39' OR sl.DS1 LIKE '#39'N39%'#39')'
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#1073#1086#1083#1077#1079#1085#1080' '#1087#1088#1077#1076#1089#1090#1072#1090#1077#1083#1100#1085#1086#1081' '#1078#1077#1083#1077#1079#1099#39' as naim,'#39'15.5'#39' as num, C' +
            'OUNT(*) AS countAll, '#39'N40-N42'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 BETWEEN '#39'N40'#39' AND '#39'N42.9'#39' '
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#1076#1086#1073#1088#1086#1082#1072#1095#1077#1089#1090#1074#1077#1085#1085#1072#1103' '#1076#1080#1089#1087#1083#1072#1079#1080#1103' '#1084#1086#1083#1086#1095#1085#1086#1081' '#1078#1077#1083#1077#1079#1099#39' as naim,'#39'1' +
            '5.6'#39' as num, COUNT(*) AS countAll, '#39'N60'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 LIKE '#39'N60%'#39'  '
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#1074#1086#1089#1087#1072#1083#1080#1090#1077#1083#1100#1085#1099#1077' '#1073#1086#1083#1077#1079#1085#1080' '#1078#1077#1085#1089#1082#1080#1093' '#1090#1072#1079#1086#1074#1099#1093' '#1086#1088#1075#1072#1085#1086#1074#39' as naim' +
            ','#39'15.7'#39' as num, COUNT(*) AS countAll, '#39'N70-N76'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 BETWEEN '#39'N70'#39' AND '#39'N76.9'#39' '
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#9#1080#1079' '#1085#1080#1093': '#1089#1072#1083#1100#1087#1080#1085#1075#1080#1090' '#1080' '#1086#1086#1092#1086#1088#1080#1090#39' as naim,'#39'15.7.1'#39' as num,' +
            ' COUNT(*) AS countAll, '#39'N70'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 LIKE '#39'N70%'#39' '
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#1101#1085#1076#1086#1084#1077#1090#1088#1080#1086#1079#39' as naim,'#39'15.8'#39' as num, COUNT(*) AS countAl' +
            'l, '#39'N80'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 LIKE '#39'N80%'#39' '
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#1088#1072#1089#1089#1090#1088#1086#1081#1089#1090#1074#1072' '#1084#1077#1085#1089#1090#1088#1091#1072#1094#1080#1081' '#39' as naim,'#39'15.9'#39' as num, COUNT' +
            '(*) AS countAll, '#39'N91-N94'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 BETWEEN '#39'N91'#39' AND '#39'N94.9'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#1078#1077#1085#1089#1082#1086#1077' '#1073#1077#1089#1087#1083#1086#1076#1080#1077#39' as naim,'#39'15.10'#39' as num, COUNT(*) AS ' +
            'countAll, '#39'N97'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 LIKE '#39'N97%'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#1073#1077#1088#1077#1084#1077#1085#1085#1086#1089#1090#1100', '#1088#1086#1076#1099' '#1080' '#1087#1086#1089#1083#1077#1088#1086#1076#1086#1074#1086#1081' '#1087#1077#1088#1080#1086#1076#39' as naim,'#39'16.0'#39 +
            ' as num, COUNT(*) AS countAll, '#39'O00-O99'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 BETWEEN '#39'O00'#39' AND '#39'O99.9'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#1086#1090#1076#1077#1083#1100#1085#1099#1077' '#1089#1086#1089#1090#1086#1103#1085#1080#1103', '#1074#1086#1079#1085#1080#1082#1072#1102#1097#1080#1077' '#1074' '#1087#1077#1088#1080#1085#1072#1090#1072#1083#1100#1085#1086#1084' '#1087#1077#1088#1080#1086#1076#1077 +
            #39' as naim,'#39'17.0'#39' as num, COUNT(*) AS countAll, '#39'P00-P96'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 BETWEEN '#39'P00'#39' AND '#39'P96.9'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#1074#1088#1086#1078#1076#1077#1085#1085#1099#1077' '#1072#1085#1086#1084#1072#1083#1080#1080' ('#1087#1086#1088#1086#1082#1080' '#1088#1072#1079#1074#1080#1090#1080#1103'), '#1076#1077#1092#1086#1088#1084#1072#1094#1080#1080' '#1080' '#1093#1088#1086#1084 +
            #1086#1089#1086#1084#1085#1099#1077' '#1085#1072#1088#1091#1096#1077#1085#1080#1103#39' as naim,'#39'18.0'#39' as num, COUNT(*) AS countAll, ' +
            #39'Q00-Q99'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 BETWEEN '#39'Q00'#39' AND '#39'Q99.9'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#1080#1079' '#1085#1080#1093': '#1074#1088#1086#1078#1076#1077#1085#1085#1099#1077' '#1072#1085#1086#1084#1072#1083#1080#1080' ['#1087#1086#1088#1086#1082#1080' '#1088#1072#1079#1074#1080#1090#1080#1103']'#1085#1077#1088#1074#1085#1086#1081' '#1089#1080 +
            #1089#1090#1077#1084#1099#39' as naim,'#39'18.1'#39' as num, COUNT(*) AS countAll, '#39'Q00-Q07'#39' AS' +
            ' MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 BETWEEN '#39'Q00'#39' AND '#39'Q07.9'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#1074#1088#1086#1078#1076#1077#1085#1085#1099#1077' '#1072#1085#1086#1084#1072#1083#1080#1080' '#1089#1080#1089#1090#1077#1084#1099' '#1082#1088#1086#1074#1086#1086#1073#1088#1072#1097#1077#1085#1080#1103#39' as naim,'#39'18' +
            '.2'#39' as num, COUNT(*) AS countAll, '#39'Q20-Q28'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 BETWEEN '#39'Q20'#39' AND '#39'Q28.9'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#1074#1088#1086#1078#1076#1077#1085#1085#1099#1077' '#1072#1085#1086#1084#1072#1083#1080#1080' '#1082#1080#1096#1077#1095#1085#1080#1082#1072#39' as naim,'#39'18.3'#39' as num, C' +
            'OUNT(*) AS countAll, '#39'Q41,Q42'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND (sl.DS1 LIKE '#39'Q41%'#39' OR sl.DS1 LIKE '#39'Q42%'#39')'
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#1073#1086#1083#1077#1079#1085#1100' '#1043#1080#1088#1096#1087#1088#1091#1085#1075#1072#39' as naim,'#39'18.4'#39' as num, COUNT(*) AS ' +
            'countAll, '#39'Q43'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 LIKE '#39'Q43%'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#1074#1088#1086#1078#1076#1077#1085#1085#1099#1077' '#1072#1085#1086#1084#1072#1083#1080#1080' '#1090#1077#1083#1072' '#1080' '#1096#1077#1081#1082#1080' '#1084#1072#1090#1082#1080', '#1076#1088#1091#1075#1080#1077' '#1074#1088#1086#1078#1076#1077#1085#1085 +
            #1099#1077' '#1072#1085#1086#1084#1072#1083#1080#1080' '#1078#1077#1085#1089#1082#1080#1093' '#1087#1086#1083#1086#1074#1099#1093' '#1086#1088#1075#1072#1085#1086#1074#39' as naim,'#39'18.5'#39' as num, COUN' +
            'T(*) AS countAll, '#39'Q51-Q52'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 BETWEEN '#39'Q51'#39' AND '#39'Q52.9'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#1085#1077#1086#1087#1088#1077#1076#1077#1083#1077#1085#1085#1086#1089#1090#1100' '#1087#1086#1083#1072' '#1080' '#1087#1089#1077#1074#1076#1086#1075#1077#1088#1084#1072#1092#1088#1086#1076#1080#1090#1080#1079#1084#39' as naim,'#39 +
            '18.6'#39' as num, COUNT(*) AS countAll, '#39'Q56'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 LIKE '#39'Q56%'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#1074#1088#1086#1078#1076#1077#1085#1085#1099#1081' '#1080#1093#1090#1080#1086#1079#39' as naim,'#39'18.7'#39' as num, COUNT(*) AS c' +
            'ountAll, '#39'Q80'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 LIKE '#39'Q80%'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#1085#1077#1081#1088#1086#1092#1080#1073#1088#1086#1084#1072#1090#1086#1079' ('#1085#1077#1079#1083#1086#1082#1072#1095#1077#1089#1090#1074#1077#1085#1085#1099#1081')'#39' as naim,'#39'18.8'#39' as ' +
            'num, COUNT(*) AS countAll, '#39'Q85.0'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 = '#39'Q85.0'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#1089#1080#1085#1076#1088#1086#1084' '#1044#1072#1091#1085#1072#39' as naim,'#39'18.9'#39' as num, COUNT(*) AS count' +
            'All, '#39'Q90'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 LIKE '#39'Q90%'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#1089#1080#1084#1087#1090#1086#1084#1099', '#1087#1088#1080#1079#1085#1072#1082#1080' '#1080' '#1086#1090#1082#1083#1086#1085#1077#1085#1080#1103' '#1086#1090' '#1085#1086#1088#1084#1099', '#1074#1099#1103#1074#1083#1077#1085#1085#1099#1077' '#1087#1088#1080 +
            ' '#1082#1083#1080#1085#1080#1095#1077#1089#1082#1080#1093' '#1080' '#1083#1072#1073#1086#1088#1072#1090#1086#1088#1085#1099#1093' '#1080#1089#1089#1083#1077#1076#1086#1074#1072#1085#1080#1103#1093', '#1085#1077' '#1082#1083#1072#1089#1089#1080#1092#1080#1094#1080#1088#1086#1074#1072#1085#1085#1099#1077 +
            ' '#1074' '#1076#1088#1091#1075#1080#1093' '#1088#1091#1073#1088#1080#1082#1072#1093#39' as naim,'#39'19.0'#39' as num, COUNT(*) AS countAll,' +
            ' '#39'R00-R99'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 BETWEEN '#39'R00'#39' AND '#39'R99.9'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#1090#1088#1072#1074#1084#1099', '#1086#1090#1088#1072#1074#1083#1077#1085#1080#1103' '#1080' '#1085#1077#1082#1086#1090#1086#1088#1099#1077' '#1076#1088#1091#1075#1080#1077' '#1087#1086#1089#1083#1077#1076#1089#1090#1074#1080#1103' '#1074#1086#1079#1076#1077#1081 +
            #1089#1090#1074#1080#1103' '#1074#1085#1077#1096#1085#1080#1093' '#1087#1088#1080#1095#1080#1085#39' as naim,'#39'20.0'#39' as num, COUNT(*) AS countAl' +
            'l, '#39'S00-T98'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 BETWEEN '#39'S00'#39' AND '#39'T98.9'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#1080#1079' '#1085#1080#1093': '#1087#1077#1088#1077#1083#1086#1084#1099#39' as naim,'#39'20.1'#39' as num, COUNT(*) AS co' +
            'untAll, '#39'S02,S12,S22, S32, S42, S52, S62, S72, S82, S92, T02, T0' +
            '8, T10, '#1058'12, '#1058'14.2'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND (sl.DS1 LIKE '#39'S02%'#39' OR sl.DS1 LIKE '#39'S12%'#39' OR sl.DS1' +
            ' LIKE '#39'S22%'#39' OR sl.DS1 LIKE '#39'S32%'#39' OR sl.DS1 LIKE '#39'S42%'#39
          
            'OR sl.DS1 LIKE '#39'S52%'#39' OR sl.DS1 LIKE '#39'S62%'#39' OR sl.DS1 LIKE '#39'S72%' +
            #39' OR sl.DS1 LIKE '#39'S82%'#39' OR sl.DS1 LIKE '#39'S92%'#39' OR sl.DS1 LIKE '#39'T0' +
            '2%'#39' OR sl.DS1 LIKE '#39'T08%'#39
          'OR sl.DS1 LIKE '#39'S10%'#39' OR sl.DS1 LIKE '#39'T12%'#39' OR sl.DS1 = '#39'T14.2'#39')'
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#9#1080#1079' '#1085#1080#1093': '#1087#1077#1088#1077#1083#1086#1084#1099' '#1095#1077#1088#1077#1087#1072' '#1080' '#1083#1080#1094#1077#1074#1099#1093' '#1082#1086#1089#1090#1077#1081#39' as naim,'#39'20.' +
            '1.1'#39' as num, COUNT(*) AS countAll, '#39'S02'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 LIKE '#39'S02%'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#1074#1085#1091#1090#1088#1080#1095#1077#1088#1077#1087#1085#1072#1103' '#1090#1088#1072#1074#1084#1072#39' as naim,'#39'20.2'#39' as num, COUNT(*) ' +
            'AS countAll, '#39'S06'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 LIKE '#39'S06%'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#1090#1077#1088#1084#1080#1095#1077#1089#1082#1080#1077' '#1080' '#1093#1080#1084#1080#1095#1077#1089#1082#1080#1077' '#1086#1078#1086#1075#1080#39' as naim,'#39'20.3'#39' as num, ' +
            'COUNT(*) AS countAll, '#39'T20-T30'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 BETWEEN '#39'T20'#39' AND '#39'T30.9'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#1086#1090#1088#1072#1074#1083#1077#1085#1080#1103' '#1083#1077#1082#1072#1088#1089#1090#1074#1077#1085#1085#1099#1084#1080' '#1089#1088#1077#1076#1089#1090#1074#1072#1084#1080', '#1084#1077#1076#1080#1082#1072#1084#1077#1085#1090#1072#1084#1080' '#1080' '#1073 +
            #1080#1086#1083#1086#1075#1080#1095#1077#1089#1082#1080#1084#1080' '#1074#1077#1097#1077#1089#1090#1074#1072#1084#1080', '#1090#1086#1082#1089#1080#1095#1077#1089#1082#1086#1077' '#1076#1077#1081#1089#1090#1074#1080#1077' '#1074#1077#1097#1077#1089#1090#1074'  '#1087#1088#1077#1080#1084#1091#1097#1077 +
            #1089#1090#1074#1077#1085#1085#1086' '#1085#1077#1084#1077#1076#1080#1094#1080#1085#1089#1082#1086#1075#1086' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1103#39' as naim,'#39'20.4'#39' as num, COUNT(' +
            '*) AS countAll, '#39'T36-T65'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 BETWEEN '#39'T36'#39' AND '#39'T65.9'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#9#1080#1079' '#1085#1080#1093': '#1090#1086#1082#1089#1080#1095#1077#1089#1082#1086#1077' '#1076#1077#1081#1089#1090#1074#1080#1077' '#1072#1083#1082#1086#1075#1086#1083#1103#39' as naim,'#39'20.4.1' +
            #39' as num, COUNT(*) AS countAll, '#39'T51'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 LIKE '#39'T51%'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#1050#1088#1086#1084#1077' '#1090#1086#1075#1086':'#9#1092#1072#1082#1090#1086#1088#1099', '#1074#1083#1080#1103#1102#1097#1080#1077' '#1085#1072' '#1089#1086#1089#1090#1086#1103#1085#1080#1077' '#1079#1076#1086#1088#1086#1074#1100#1103' '#1080' '#1086#1073 +
            #1088#1072#1097#1077#1085#1080#1103' '#1074' '#1091#1095#1088#1077#1078#1076#1077#1085#1080#1103' '#1079#1076#1088#1072#1074#1086#1086#1093#1088#1072#1085#1077#1085#1080#1103#39' as naim,'#39'21.0'#39' as num, COU' +
            'NT(*) AS countAll, '#39'Z00-Z99'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 BETWEEN '#39'Z00'#39' AND '#39'Z99.9'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#1080#1079' '#1085#1080#1093': '#1085#1086#1089#1080#1090#1077#1083#1100#1089#1090#1074#1086' '#1074#1086#1079#1073#1091#1076#1080#1090#1077#1083#1103' '#1080#1085#1092#1077#1082#1094#1080#1086#1085#1085#1086#1081' '#1073#1086#1083#1077#1079#1085#1080#39' ' +
            'as naim,'#39'21.1'#39' as num, COUNT(*) AS countAll, '#39'Z22'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND sl.DS1 LIKE '#39'Z22%'#39
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1 UNION ALL'
          
            'Select '#39#9#1085#1072#1083#1080#1095#1080#1077' '#1080#1083#1077#1086#1089#1090#1086#1084#1099', '#1082#1086#1083#1086#1089#1090#1086#1084#1099#39' as naim,'#39'21.2'#39' as num, CO' +
            'UNT(*) AS countAll, '#39'Z93.2,Z93.3'#39' AS MKB,'
          
            'isnull(SUM(CASE WHEN zsl.for_pom = 1 THEN 1 ELSE 0 END),0) AS ex' +
            'tr, isnull(SUM(CASE when zsl.KD_Z is not null then zsl.KD_Z else' +
            ' 0 END),0) as kday, isnull(SUM(CASE WHEN zsl.rslt in (105, 106) ' +
            'THEN 1 ELSE 0 END),0) as umerlo '
          
            'from R_ZAP z join R_SCHET sc on sc._id=z._schet_id join R_Z_SL z' +
            'sl on zsl._idzap=z._id join R_SL sl on sl._zslid=zsl._id join R_' +
            'PACIENT pac on z._pid=pac._id join R_PERS pa on pa.ID_PAC=pac.ID' +
            '_PAC'
          
            'WHERE DATEDIFF(YEAR,dr,sl.DATE_2) +(SIGN(DATEDIFF(DAY,dr,DATEADD' +
            '(YEAR,YEAR(dr)-YEAR(sl.DATE_2),sl.DATE_2)))-1)/2>=18 AND  zsl.us' +
            'l_ok = 1 AND (sl.DS1 = '#39'Z93.2'#39' OR sl.DS1 = '#39'Z93.3'#39') '
          
            'AND sc.year=:Y1 and sc.month>=:M1 and sc.month<=:M2 and year(DAT' +
            'E_2)=:Y1'
          '                                       ')
        CommandTimeout = 30
        Database = frxReport1.ADODatabase1
        LockType = ltReadOnly
        pLeft = 240
        pTop = 88
        Parameters = <
          item
            Name = 'Y1'
            DataType = ftInteger
            Expression = '<@y1>'
          end
          item
            Name = 'M1'
            DataType = ftInteger
            Expression = '<@m1>'
          end
          item
            Name = 'M2'
            DataType = ftInteger
            Expression = '<@m2>'
          end>
      end
    end
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object Header1: TfrxHeader
        FillType = ftBrush
        Height = 109.606370000000000000
        Top = 16.000000000000000000
        Width = 1046.929810000000000000
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 144.000000000000000000
        Width = 1046.929810000000000000
        DataSet = frxReport1.ADOQuery1
        DataSetName = 'ADOQuery1'
        RowCount = 0
        object Memo1: TfrxMemoView
          Left = 960.000620000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 873.071430000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object ADOQuery1naim: TfrxMemoView
          Width = 404.409710000000000000
          Height = 18.897650000000000000
          DataField = 'naim'
          DataSet = frxReport1.ADOQuery1
          DataSetName = 'ADOQuery1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[ADOQuery1."naim"]')
          ParentFont = False
        end
        object ADOQuery1num: TfrxMemoView
          Left = 404.409710000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DataField = 'num'
          DataSet = frxReport1.ADOQuery1
          DataSetName = 'ADOQuery1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[ADOQuery1."num"]')
          ParentFont = False
        end
        object ADOQuery1countAll: TfrxMemoView
          Left = 555.590910000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'countAll'
          DataSet = frxReport1.ADOQuery1
          DataSetName = 'ADOQuery1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[ADOQuery1."countAll"]')
          ParentFont = False
        end
        object ADOQuery1MKB: TfrxMemoView
          Left = 476.220780000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'MKB'
          DataSet = frxReport1.ADOQuery1
          DataSetName = 'ADOQuery1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[ADOQuery1."MKB"]')
          ParentFont = False
        end
        object ADOQuery1extr: TfrxMemoView
          Left = 634.961040000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'extr'
          DataSet = frxReport1.ADOQuery1
          DataSetName = 'ADOQuery1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[ADOQuery1."extr"]')
          ParentFont = False
        end
        object ADOQuery1kday: TfrxMemoView
          Left = 714.331170000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'kday'
          DataSet = frxReport1.ADOQuery1
          DataSetName = 'ADOQuery1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[ADOQuery1."kday"]')
          ParentFont = False
        end
        object ADOQuery1umerlo: TfrxMemoView
          Left = 793.701300000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'umerlo'
          DataSet = frxReport1.ADOQuery1
          DataSetName = 'ADOQuery1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[ADOQuery1."umerlo"]')
          ParentFont = False
        end
      end
    end
  end
  object frxADOComponents1: TfrxADOComponents
    DefaultDatabase = mo_main.ADOConnection1
    Left = 432
    Top = 64
  end
end
