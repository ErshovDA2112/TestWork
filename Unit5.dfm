object Form5: TForm5
  Left = 0
  Top = 0
  Caption = #1042#1099#1073#1086#1088' '#1089#1090#1088#1072#1093#1086#1074#1086#1081' '#1084#1077#1076#1080#1094#1080#1085#1089#1082#1086#1081' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1080
  ClientHeight = 586
  ClientWidth = 765
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 765
    Height = 586
    Align = alClient
    TabOrder = 0
    DesignSize = (
      765
      586)
    object Label1: TLabel
      Left = 16
      Top = 27
      Width = 56
      Height = 13
      Caption = #1055#1086#1080#1089#1082' '#1057#1052#1054
    end
    object Edit1: TEdit
      Left = 88
      Top = 24
      Width = 537
      Height = 21
      TabOrder = 0
      OnChange = Edit1Change
      OnKeyPress = Edit1KeyPress
      OnKeyUp = Edit1KeyUp
    end
    object Button1: TButton
      Left = 672
      Top = 22
      Width = 75
      Height = 25
      Caption = #1042#1099#1073#1088#1072#1090#1100
      TabOrder = 1
      OnClick = Button1Click
    end
    object DBGrid1: TDBGrid
      Left = 16
      Top = 72
      Width = 731
      Height = 502
      Anchors = [akLeft, akTop, akBottom]
      DataSource = DataSource1
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ReadOnly = True
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnCellClick = DBGrid1CellClick
      OnDrawColumnCell = DBGrid1DrawColumnCell
      OnDblClick = DBGrid1DblClick
      OnKeyUp = DBGrid1KeyUp
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 200
    Top = 106
  end
  object ADOQuery1: TADOQuery
    Connection = mo_main.ADOConnection1
    Parameters = <>
    Left = 200
    Top = 170
  end
end
