object mo_lpu_1: Tmo_lpu_1
  Left = 0
  Top = 0
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1058#1060#1054#1052#1057
  ClientHeight = 307
  ClientWidth = 1126
  Color = clBtnFace
  Constraints.MaxHeight = 345
  Constraints.MaxWidth = 1142
  Constraints.MinHeight = 345
  Constraints.MinWidth = 1142
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1126
    Height = 307
    Align = alClient
    TabOrder = 0
    object Panel2: TPanel
      Left = 656
      Top = 1
      Width = 469
      Height = 305
      Align = alRight
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object Label1: TLabel
        Left = 152
        Top = 8
        Width = 195
        Height = 13
        Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1086#1076#1080#1085' '#1080#1083#1080' '#1085#1077#1089#1082#1086#1083#1100#1082#1086' '#1058#1060#1054#1052#1057
      end
      object Label2: TLabel
        Left = 8
        Top = 32
        Width = 70
        Height = 13
        Caption = #1055#1086#1080#1089#1082' '#1058#1060#1054#1052#1057
      end
      object Edit1: TEdit
        Left = 10
        Top = 51
        Width = 445
        Height = 21
        TabOrder = 0
        OnChange = Edit1Change
      end
      object DBGrid1: TDBGrid
        Left = 8
        Top = 78
        Width = 445
        Height = 185
        DataSource = DataSource1
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnColumnMoved = DBGrid1ColumnMoved
      end
      object Button3: TButton
        Left = 304
        Top = 269
        Width = 147
        Height = 25
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074' '#1080#1079#1073#1088#1072#1085#1085#1086#1077
        TabOrder = 2
        OnClick = Button3Click
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 649
      Height = 305
      Align = alLeft
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      object Label3: TLabel
        Left = 272
        Top = 8
        Width = 96
        Height = 13
        Caption = #1048#1079#1073#1088#1072#1085#1085#1099#1077' '#1058#1060#1054#1052#1057
      end
      object Button1: TButton
        Left = 480
        Top = 268
        Width = 153
        Height = 25
        Caption = #1059#1076#1072#1083#1080#1090#1100' '#1080#1079' '#1080#1079#1073#1088#1072#1085#1085#1086#1075#1086
        TabOrder = 0
        OnClick = Button1Click
      end
      object DBGrid2: TDBGrid
        Left = 10
        Top = 50
        Width = 623
        Height = 212
        DataSource = DataSource2
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnColumnMoved = DBGrid2ColumnMoved
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 848
    Top = 113
  end
  object ADOQuery1: TADOQuery
    Connection = mo_main.ADOConnection1
    Parameters = <>
    Left = 912
    Top = 113
  end
  object DataSource2: TDataSource
    DataSet = ADOQuery2
    Left = 328
    Top = 145
  end
  object ADOQuery2: TADOQuery
    Connection = mo_main.ADOConnection1
    Parameters = <>
    Left = 280
    Top = 145
  end
  object ADOQuery3: TADOQuery
    Connection = mo_main.ADOConnection1
    Parameters = <>
    Left = 912
    Top = 161
  end
  object DataSource3: TDataSource
    DataSet = ADOQuery3
    Left = 848
    Top = 161
  end
end
