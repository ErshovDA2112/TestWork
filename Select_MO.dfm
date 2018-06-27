object mo_select_mo: Tmo_select_mo
  Left = 0
  Top = 0
  Caption = 'mo_select_mo'
  ClientHeight = 572
  ClientWidth = 860
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 860
    Height = 496
    Align = alClient
    BorderStyle = bsSingle
    TabOrder = 0
    DesignSize = (
      856
      492)
    object Label2: TLabel
      Left = 355
      Top = 46
      Width = 168
      Height = 13
      Caption = #1042#1099#1073#1086#1088' '#1084#1077#1076#1080#1094#1080#1085#1089#1082#1086#1081' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1080
    end
    object Label1: TLabel
      Left = 236
      Top = 11
      Width = 290
      Height = 19
      Caption = #1042#1099#1073#1086#1088' '#1052#1077#1076#1080#1094#1080#1085#1089#1082#1080#1093' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1081'.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 13
      Top = 240
      Width = 329
      Height = 19
      Caption = #1052#1077#1076#1080#1094#1080#1085#1089#1082#1072#1103' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103' '#1085#1077' '#1074#1099#1073#1088#1072#1085#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 9
      Top = 48
      Width = 178
      Height = 13
      Caption = #1057#1087#1080#1089#1086#1082' '#1084#1077#1076#1080#1094#1080#1077#1085#1089#1082#1080#1093' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1081
    end
    object ValueListEditor1: TValueListEditor
      Left = 355
      Top = 70
      Width = 483
      Height = 402
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      OnKeyPress = ValueListEditor1KeyPress
      ColWidths = (
        133
        344)
      RowHeights = (
        18
        18)
    end
    object DBGrid2: TDBGrid
      Left = 8
      Top = 70
      Width = 339
      Height = 402
      DataSource = DataSource2
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnCellClick = DBGrid2CellClick
      OnColumnMoved = DBGrid2ColumnMoved
      OnDrawColumnCell = DBGrid2DrawColumnCell
    end
    object ComboBox1: TComboBox
      Left = 529
      Top = 42
      Width = 309
      Height = 22
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      Text = 'ComboBox1'
      OnChange = ComboBox1Change
      OnKeyPress = ComboBox1KeyPress
      OnKeyUp = ComboBox1KeyUp
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 496
    Width = 860
    Height = 76
    Align = alBottom
    TabOrder = 1
    object Label3: TLabel
      Left = 11
      Top = 11
      Width = 96
      Height = 13
      Caption = #1041#1072#1079#1086#1074#1072#1103' '#1089#1090#1072#1074#1082#1072' '#1050#1057
    end
    object Label7: TLabel
      Left = 368
      Top = 11
      Width = 68
      Height = 13
      Caption = #1050#1086#1076' '#1088#1077#1075#1080#1086#1085#1072':'
    end
    object Label4: TLabel
      Left = 190
      Top = 11
      Width = 97
      Height = 13
      Caption = #1041#1072#1079#1086#1074#1072#1103' '#1089#1090#1072#1074#1082#1072' '#1044#1057
    end
    object Edit1: TEdit
      Left = 110
      Top = 8
      Width = 71
      Height = 21
      TabOrder = 0
      Text = '0.00'
      OnKeyPress = Edit1KeyPress
    end
    object Edit5: TEdit
      Left = 440
      Top = 8
      Width = 33
      Height = 22
      TabOrder = 1
      Text = '0'
      OnKeyPress = Edit5KeyPress
    end
    object Button3: TButton
      Left = 183
      Top = 36
      Width = 137
      Height = 25
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
      TabOrder = 2
      OnClick = Button3Click
    end
    object Button2: TButton
      Left = 15
      Top = 36
      Width = 137
      Height = 25
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1052#1054
      TabOrder = 3
      OnClick = Button2Click
    end
    object Button1: TButton
      Left = 734
      Top = 6
      Width = 106
      Height = 25
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      TabOrder = 4
      OnClick = Button1Click
    end
    object CheckBox1: TCheckBox
      Left = 480
      Top = 10
      Width = 121
      Height = 17
      Caption = #1048#1089#1087#1086#1083#1100#1079#1086#1074#1072#1085#1080#1077' '#1050#1057#1043
      TabOrder = 5
    end
    object CheckBox2: TCheckBox
      Left = 605
      Top = 10
      Width = 121
      Height = 17
      Caption = #1048#1089#1087#1086#1083#1100#1079#1086#1074#1072#1085#1080#1077' '#1050#1055#1043
      TabOrder = 6
    end
    object Edit2: TEdit
      Left = 293
      Top = 9
      Width = 67
      Height = 21
      TabOrder = 7
      Text = '0.00'
      OnKeyPress = Edit2KeyPress
    end
  end
  object DataSource2: TDataSource
    DataSet = ADOQuery2
    Left = 208
    Top = 49
  end
  object ADOQuery2: TADOQuery
    Connection = mo_main.ADOConnection1
    Parameters = <>
    Left = 216
    Top = 97
  end
end
