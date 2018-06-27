object mo_podr: Tmo_podr
  Left = 0
  Top = 0
  Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103' / '#1054#1090#1076#1077#1083#1077#1085#1080#1103
  ClientHeight = 496
  ClientWidth = 1102
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnMouseWheel = FormMouseWheel
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1102
    Height = 496
    Align = alClient
    TabOrder = 0
    object Panel2: TPanel
      Left = 551
      Top = 1
      Width = 550
      Height = 494
      Align = alClient
      TabOrder = 0
      DesignSize = (
        550
        494)
      object Label2: TLabel
        Left = 16
        Top = 8
        Width = 159
        Height = 19
        Caption = #1057#1087#1080#1089#1086#1082' '#1086#1090#1076#1077#1083#1077#1085#1080#1081' '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
      end
      object Label10: TLabel
        Left = 54
        Top = 176
        Width = 336
        Height = 33
        Caption = #1054#1090#1076#1077#1083#1077#1085#1080#1103' '#1086#1090#1089#1091#1090#1089#1090#1074#1091#1102#1090
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Tahoma'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
      end
      object DBGrid2: TDBGrid
        Left = 10
        Top = 40
        Width = 530
        Height = 289
        Anchors = [akLeft, akTop, akBottom]
        DataSource = DataSource2
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnCellClick = DBGrid2CellClick
        OnColumnMoved = DBGrid2ColumnMoved
        OnDrawColumnCell = DBGrid2DrawColumnCell
        OnKeyUp = DBGrid2KeyUp
        OnTitleClick = DBGrid2TitleClick
      end
      object Button4: TButton
        Left = 457
        Top = 336
        Width = 83
        Height = 25
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100
        TabOrder = 1
        OnClick = Button4Click
      end
      object Button5: TButton
        Left = 225
        Top = 336
        Width = 109
        Height = 25
        Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
        TabOrder = 2
        OnClick = Button5Click
      end
      object Button6: TButton
        Left = 10
        Top = 336
        Width = 97
        Height = 25
        Caption = #1059#1076#1072#1083#1080#1090#1100
        TabOrder = 3
        OnClick = Button6Click
      end
      object Panel5: TPanel
        Left = 10
        Top = 368
        Width = 530
        Height = 116
        TabOrder = 4
        object Label6: TLabel
          Left = 6
          Top = 3
          Width = 106
          Height = 13
          Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1086#1090#1076#1077#1083#1077#1085#1080#1103
        end
        object Label7: TLabel
          Left = 6
          Top = 41
          Width = 78
          Height = 13
          Caption = #1050#1086#1076' '#1086#1090#1076#1077#1083#1077#1085#1080#1103
        end
        object Label8: TLabel
          Left = 271
          Top = 3
          Width = 131
          Height = 13
          Caption = #1047#1072#1074#1077#1076#1091#1102#1097#1080#1081' '#1086#1090#1076#1077#1083#1077#1085#1080#1077#1084
        end
        object CheckBox2: TCheckBox
          Left = 271
          Top = 51
          Width = 104
          Height = 36
          Caption = #1040#1082#1090#1080#1074#1080#1088#1086#1074#1072#1090#1100' '#1086#1090#1076#1077#1083#1077#1085#1080#1077
          TabOrder = 0
          WordWrap = True
        end
        object Edit2: TEdit
          Left = 6
          Top = 20
          Width = 250
          Height = 21
          TabOrder = 1
          OnChange = Edit2Change
        end
        object Edit4: TEdit
          Left = 6
          Top = 58
          Width = 250
          Height = 21
          TabOrder = 2
          OnChange = Edit4Change
        end
        object Button8: TButton
          Left = 400
          Top = 81
          Width = 121
          Height = 25
          Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
          TabOrder = 3
          OnClick = Button8Click
        end
        object ComboBox2: TComboBox
          Left = 271
          Top = 20
          Width = 250
          Height = 21
          TabOrder = 4
          OnChange = ComboBox2Change
        end
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 550
      Height = 494
      Align = alLeft
      TabOrder = 1
      DesignSize = (
        550
        494)
      object Label1: TLabel
        Left = 16
        Top = 8
        Width = 199
        Height = 19
        Caption = #1057#1087#1080#1089#1086#1082' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1081' '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 20
        Top = 168
        Width = 403
        Height = 33
        Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103' '#1086#1090#1089#1091#1090#1089#1090#1074#1091#1102#1090
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Tahoma'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
      end
      object DBGrid1: TDBGrid
        Left = 10
        Top = 40
        Width = 530
        Height = 289
        Anchors = [akLeft, akTop, akBottom]
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
        OnKeyUp = DBGrid1KeyUp
        OnTitleClick = DBGrid1TitleClick
      end
      object Button1: TButton
        Left = 10
        Top = 336
        Width = 97
        Height = 25
        Caption = #1059#1076#1072#1083#1080#1090#1100
        TabOrder = 1
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 225
        Top = 336
        Width = 109
        Height = 25
        Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
        TabOrder = 2
        OnClick = Button2Click
      end
      object Button3: TButton
        Left = 457
        Top = 336
        Width = 83
        Height = 25
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100
        TabOrder = 3
        OnClick = Button3Click
      end
      object Panel4: TPanel
        Left = 10
        Top = 368
        Width = 530
        Height = 116
        TabOrder = 4
        object Label3: TLabel
          Left = 6
          Top = 3
          Width = 130
          Height = 13
          Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
        end
        object Label4: TLabel
          Left = 6
          Top = 41
          Width = 102
          Height = 13
          Caption = #1050#1086#1076' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
        end
        object Label5: TLabel
          Left = 218
          Top = 3
          Width = 155
          Height = 13
          Caption = #1047#1072#1074#1077#1076#1091#1102#1097#1080#1081' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077#1084
        end
        object CheckBox1: TCheckBox
          Left = 271
          Top = 51
          Width = 104
          Height = 36
          Caption = #1040#1082#1090#1080#1074#1080#1088#1086#1074#1072#1090#1100' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
          TabOrder = 0
          WordWrap = True
        end
        object Edit1: TEdit
          Left = 6
          Top = 20
          Width = 250
          Height = 21
          TabOrder = 1
          OnChange = Edit1Change
        end
        object Edit3: TEdit
          Left = 6
          Top = 58
          Width = 250
          Height = 21
          TabOrder = 2
          OnChange = Edit3Change
        end
        object Button7: TButton
          Left = 400
          Top = 81
          Width = 121
          Height = 25
          Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
          TabOrder = 3
          OnClick = Button7Click
        end
        object ComboBox1: TComboBox
          Left = 271
          Top = 20
          Width = 250
          Height = 21
          TabOrder = 4
          OnChange = ComboBox1Change
        end
      end
    end
  end
  object DataSource2: TDataSource
    DataSet = ADOQuery2
    Left = 608
    Top = 169
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 264
    Top = 146
  end
  object ADOQuery1: TADOQuery
    Connection = mo_main.ADOConnection1
    Parameters = <>
    Left = 264
    Top = 210
  end
  object ADOQuery2: TADOQuery
    Connection = mo_main.ADOConnection1
    Parameters = <>
    Left = 616
    Top = 217
  end
  object ADOQuery3: TADOQuery
    Connection = mo_main.ADOConnection1
    Parameters = <>
    Left = 344
    Top = 226
  end
end
