object mo_connect: Tmo_connect
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = #1057#1077#1088#1074#1077#1088
  ClientHeight = 250
  ClientWidth = 369
  Color = clBtnFace
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
  object Label1: TLabel
    Left = 0
    Top = 0
    Width = 369
    Height = 19
    Align = alTop
    Alignment = taCenter
    Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1103' '#1082' '#1089#1077#1088#1074#1077#1088#1091'.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ExplicitWidth = 261
  end
  object GroupBox1: TGroupBox
    Left = -1
    Top = 25
    Width = 362
    Height = 219
    Align = alCustom
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    DesignSize = (
      362
      219)
    object Label3: TLabel
      Left = 53
      Top = 14
      Width = 92
      Height = 16
      Caption = #1040#1076#1088#1077#1089' '#1089#1077#1088#1074#1077#1088#1072':'
    end
    object Label4: TLabel
      Left = 112
      Top = 44
      Width = 33
      Height = 16
      Caption = #1055#1086#1088#1090':'
    end
    object Label5: TLabel
      Left = 31
      Top = 74
      Width = 114
      Height = 16
      Caption = #1048#1084#1103' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103':'
    end
    object Label6: TLabel
      Left = 97
      Top = 104
      Width = 48
      Height = 16
      Caption = #1055#1072#1088#1086#1083#1100':'
    end
    object Label7: TLabel
      Left = 16
      Top = 158
      Width = 4
      Height = 16
    end
    object Label8: TLabel
      Left = 44
      Top = 135
      Width = 101
      Height = 16
      Caption = #1048#1084#1103' '#1073#1072#1079#1099' '#1076#1072#1085#1099#1093':'
    end
    object Edit2: TEdit
      Left = 151
      Top = 11
      Width = 203
      Height = 24
      TabOrder = 0
    end
    object Edit3: TEdit
      Left = 151
      Top = 41
      Width = 203
      Height = 24
      TabOrder = 1
      Text = '2866'
    end
    object Edit4: TEdit
      Left = 151
      Top = 71
      Width = 203
      Height = 24
      TabOrder = 2
    end
    object Edit5: TEdit
      Left = 151
      Top = 101
      Width = 203
      Height = 24
      TabOrder = 3
    end
    object Button1: TButton
      Left = 75
      Top = 183
      Width = 101
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = #1058#1077#1089#1090
      TabOrder = 5
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 180
      Top = 183
      Width = 100
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      TabOrder = 6
      OnClick = Button2Click
    end
    object Edit6: TEdit
      Left = 151
      Top = 131
      Width = 203
      Height = 24
      TabOrder = 4
    end
  end
  object IdIcmpClient1: TIdIcmpClient
    Protocol = 1
    ProtocolIPv6 = 58
    IPVersion = Id_IPv4
    Left = 15
    Top = 97
  end
end
