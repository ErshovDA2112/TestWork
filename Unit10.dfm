object Form10: TForm10
  Left = 0
  Top = 0
  Caption = #1054#1050#1040#1058#1054
  ClientHeight = 546
  ClientWidth = 543
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  OnMouseWheel = FormMouseWheel
  PixelsPerInch = 96
  TextHeight = 13
  object TreeView1: TTreeView
    Left = 505
    Top = 49
    Width = 38
    Height = 448
    Align = alClient
    Indent = 19
    TabOrder = 0
    ExplicitLeft = 0
    ExplicitWidth = 428
    ExplicitHeight = 409
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 543
    Height = 49
    Align = alTop
    TabOrder = 1
    ExplicitWidth = 428
    object Button1: TButton
      Left = 0
      Top = 0
      Width = 75
      Height = 21
      Caption = #1057#1073#1088#1086#1089
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 497
    Width = 543
    Height = 49
    Align = alBottom
    TabOrder = 2
    ExplicitTop = 458
    ExplicitWidth = 428
  end
  object ScrollBox1: TScrollBox
    Left = 0
    Top = 49
    Width = 505
    Height = 448
    Align = alLeft
    TabOrder = 3
    ExplicitLeft = 1
  end
  object ADOQuery1: TADOQuery
    Connection = mo_main.ADOConnection1
    Parameters = <>
    Left = 144
    Top = 2
  end
end
