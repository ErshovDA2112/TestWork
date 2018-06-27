object Form14: TForm14
  Left = 0
  Top = 0
  Caption = #1042#1077#1088#1080#1092#1080#1082#1072#1094#1080#1103
  ClientHeight = 194
  ClientWidth = 258
  Color = clBtnFace
  Constraints.MaxHeight = 274
  Constraints.MaxWidth = 274
  Constraints.MinHeight = 232
  Constraints.MinWidth = 232
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 258
    Height = 194
    Align = alClient
    TabOrder = 0
    object Label3: TLabel
      Left = 64
      Top = 41
      Width = 129
      Height = 19
      Caption = #1042#1074#1077#1076#1080#1090#1077' '#1083#1086#1075#1080#1085' '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 56
      Top = 93
      Width = 140
      Height = 19
      Caption = #1042#1074#1077#1076#1080#1090#1077' '#1087#1072#1088#1086#1083#1100' '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 10
      Top = 9
      Width = 236
      Height = 19
      Caption = #1042#1077#1088#1080#1092#1080#1082#1072#1094#1080#1103' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Edit3: TEdit
      Left = 8
      Top = 65
      Width = 238
      Height = 21
      TabOrder = 0
      OnKeyPress = Edit3KeyPress
    end
    object Edit4: TEdit
      Left = 8
      Top = 118
      Width = 238
      Height = 21
      TabOrder = 1
      OnKeyPress = Edit4KeyPress
    end
    object Button1: TButton
      Left = 162
      Top = 151
      Width = 84
      Height = 25
      Caption = #1054#1050
      TabOrder = 2
      OnClick = Button1Click
    end
  end
end
