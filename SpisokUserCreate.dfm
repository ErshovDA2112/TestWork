object Form13: TForm13
  Left = 0
  Top = 0
  Caption = #1057#1086#1079#1076#1072#1085#1080#1077' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1077#1081
  ClientHeight = 252
  ClientWidth = 849
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 849
    Height = 252
    Align = alClient
    TabOrder = 0
    DesignSize = (
      849
      252)
    object Label1: TLabel
      Left = 399
      Top = 61
      Width = 100
      Height = 13
      Caption = #1058#1080#1087' '#1091#1095#1077#1090#1085#1086#1081' '#1079#1072#1087#1080#1089#1080
    end
    object Label2: TLabel
      Left = 399
      Top = 104
      Width = 30
      Height = 13
      Caption = #1051#1086#1075#1080#1085
    end
    object Label9: TLabel
      Left = 399
      Top = 149
      Width = 56
      Height = 13
      Caption = #1060#1048#1054' '#1042#1088#1072#1095#1072
    end
    object DBGrid1: TDBGrid
      Left = 8
      Top = 9
      Width = 385
      Height = 233
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = DataSource1
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnCellClick = DBGrid1CellClick
      OnColumnMoved = DBGrid1ColumnMoved
      OnDrawColumnCell = DBGrid1DrawColumnCell
    end
    object Edit1: TEdit
      Left = 399
      Top = 122
      Width = 197
      Height = 21
      TabOrder = 3
    end
    object ComboBox1: TComboBox
      Left = 397
      Top = 81
      Width = 197
      Height = 21
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 2
      Text = #1040#1076#1084#1080#1085#1080#1089#1090#1088#1072#1090#1086#1088
      OnChange = ComboBox1Change
      Items.Strings = (
        #1040#1076#1084#1080#1085#1080#1089#1090#1088#1072#1090#1086#1088
        #1042#1088#1072#1095
        #1054#1087#1077#1088#1072#1090#1086#1088' '#1074#1074#1086#1076#1072' '#1076#1072#1085#1085#1099#1093)
    end
    object Panel2: TPanel
      Left = 399
      Top = 221
      Width = 233
      Height = 101
      TabOrder = 5
      object Label3: TLabel
        Left = 8
        Top = 7
        Width = 37
        Height = 13
        Caption = #1055#1072#1088#1086#1083#1100
      end
      object Label4: TLabel
        Left = 8
        Top = 52
        Width = 122
        Height = 13
        Caption = #1055#1086#1076#1090#1074#1077#1088#1078#1076#1077#1085#1080#1077' '#1087#1072#1088#1086#1083#1103
      end
      object Edit3: TEdit
        Left = 8
        Top = 28
        Width = 217
        Height = 21
        TabOrder = 0
      end
      object Edit4: TEdit
        Left = 8
        Top = 71
        Width = 217
        Height = 21
        TabOrder = 1
      end
    end
    object RadioGroup1: TRadioGroup
      Left = 399
      Top = 8
      Width = 436
      Height = 41
      Caption = #1058#1080#1087' '#1088#1072#1073#1086#1090#1099
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        #1044#1086#1073#1072#1074#1080#1090#1100'          '
        #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
        #1059#1076#1072#1083#1080#1090#1100'           ')
      TabOrder = 1
      OnClick = RadioGroup1Click
    end
    object Button1: TButton
      Left = 728
      Top = 210
      Width = 107
      Height = 25
      Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100
      TabOrder = 7
      OnClick = Button1Click
    end
    object Panel3: TPanel
      Left = 602
      Top = 55
      Width = 233
      Height = 141
      TabOrder = 4
      object Label5: TLabel
        Left = 8
        Top = 49
        Width = 117
        Height = 13
        Caption = #1042#1074#1077#1076#1080#1090#1077' '#1085#1086#1074#1099#1081' '#1087#1072#1088#1086#1083#1100
      end
      object Label6: TLabel
        Left = 8
        Top = 90
        Width = 122
        Height = 13
        Caption = #1055#1086#1076#1090#1074#1077#1088#1078#1076#1077#1085#1080#1077' '#1087#1072#1088#1086#1083#1103
      end
      object Label7: TLabel
        Left = 8
        Top = 6
        Width = 122
        Height = 13
        Caption = #1042#1074#1077#1076#1080#1090#1077' '#1089#1090#1072#1088#1099#1081' '#1087#1072#1088#1086#1083#1100
      end
      object Edit2: TEdit
        Left = 8
        Top = 67
        Width = 217
        Height = 21
        TabOrder = 1
      end
      object Edit5: TEdit
        Left = 8
        Top = 109
        Width = 217
        Height = 21
        TabOrder = 2
      end
      object Edit6: TEdit
        Left = 8
        Top = 26
        Width = 217
        Height = 21
        TabOrder = 0
      end
    end
    object Panel4: TPanel
      Left = 616
      Top = 231
      Width = 233
      Height = 55
      TabOrder = 6
      object Label8: TLabel
        Left = 8
        Top = 9
        Width = 82
        Height = 13
        Caption = #1042#1074#1077#1076#1080#1090#1077' '#1087#1072#1088#1086#1083#1100
      end
      object Edit7: TEdit
        Left = 8
        Top = 28
        Width = 217
        Height = 21
        TabOrder = 0
      end
    end
    object ComboBox2: TComboBox
      Left = 397
      Top = 164
      Width = 197
      Height = 21
      Style = csDropDownList
      TabOrder = 8
    end
  end
  object ADOQuery1: TADOQuery
    Connection = mo_main.ADOConnection1
    Parameters = <>
    Left = 120
    Top = 72
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 184
    Top = 128
  end
  object ADOQuery2: TADOQuery
    Connection = mo_main.ADOConnection1
    Parameters = <>
    Left = 184
    Top = 64
  end
end
