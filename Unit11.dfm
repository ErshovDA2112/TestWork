object Form11: TForm11
  Left = 0
  Top = 0
  Caption = #1055#1086#1080#1089#1082' '#1084#1077#1089#1090#1072' '#1078#1080#1090#1077#1083#1100#1089#1090#1074#1072' '#1087#1086' '#1054#1050#1040#1058#1054
  ClientHeight = 535
  ClientWidth = 1184
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Panel4: TPanel
    Left = 0
    Top = 0
    Width = 1184
    Height = 535
    Align = alClient
    TabOrder = 0
    object Panel2: TPanel
      Left = 508
      Top = 1
      Width = 675
      Height = 533
      Align = alClient
      Caption = 'Panel2'
      TabOrder = 0
      object ScrollBox1: TScrollBox
        Left = 3
        Top = 76
        Width = 666
        Height = 413
        TabOrder = 0
        OnClick = ScrollBox1Click
        OnMouseWheel = ScrollBox1MouseWheel
      end
      object Button1: TButton
        Left = 14
        Top = 499
        Width = 104
        Height = 25
        Caption = #1057#1073#1088#1086#1089' '#1076#1072#1085#1085#1099#1093
        TabOrder = 1
        OnClick = Button1Click
      end
      object Button3: TButton
        Left = 548
        Top = 499
        Width = 121
        Height = 25
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
        TabOrder = 2
        Visible = False
        OnClick = Button3Click
      end
      object Button5: TButton
        Left = 387
        Top = 499
        Width = 132
        Height = 25
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074' '#1080#1079#1073#1088#1072#1085#1085#1086#1077
        TabOrder = 3
        OnClick = Button5Click
      end
      object Button4: TButton
        Left = 196
        Top = 499
        Width = 135
        Height = 25
        Caption = #1059#1076#1072#1083#1080#1090#1100' '#1080#1079' '#1080#1079#1073#1088#1072#1085#1085#1086#1075#1086
        TabOrder = 4
        OnClick = Button4Click
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 507
      Height = 533
      Align = alLeft
      TabOrder = 1
      DesignSize = (
        507
        533)
      object Label1: TLabel
        Left = 5
        Top = 12
        Width = 348
        Height = 23
        Caption = #1055#1086#1080#1089#1082' '#1084#1077#1089#1090#1072' '#1078#1080#1090#1077#1083#1100#1089#1090#1074#1072' '#1087#1086' '#1054#1050#1040#1058#1054
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Button2: TButton
        Left = 189
        Top = 499
        Width = 80
        Height = 25
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        TabOrder = 0
        Visible = False
        OnClick = Button2Click
      end
      object Edit1: TEdit
        Left = 5
        Top = 47
        Width = 496
        Height = 21
        TabOrder = 1
        OnChange = Edit1Change
        OnKeyUp = Edit1KeyUp
      end
      object DBGrid1: TDBGrid
        Left = 4
        Top = 74
        Width = 497
        Height = 451
        Anchors = [akLeft, akTop, akBottom]
        DataSource = DataSource2
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ReadOnly = True
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnColumnMoved = DBGrid1ColumnMoved
        OnDrawColumnCell = DBGrid1DrawColumnCell
        OnDblClick = DBGrid1DblClick
        OnKeyUp = DBGrid1KeyUp
      end
    end
  end
  object ADOQuery1: TADOQuery
    Connection = mo_main.ADOConnection1
    Parameters = <>
    Left = 480
    Top = 66
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 440
    Top = 66
  end
  object ADOQuery2: TADOQuery
    Connection = mo_main.ADOConnection1
    Parameters = <>
    Left = 480
    Top = 130
  end
  object DataSource2: TDataSource
    DataSet = ADOQuery2
    Left = 440
    Top = 130
  end
end
