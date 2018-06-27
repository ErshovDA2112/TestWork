object mo_schet: Tmo_schet
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'mo_schet'
  ClientHeight = 252
  ClientWidth = 412
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
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 412
    Height = 252
    Align = alClient
    BorderStyle = bsSingle
    TabOrder = 0
    DesignSize = (
      408
      248)
    object Label2: TLabel
      Left = 11
      Top = 57
      Width = 130
      Height = 13
      Caption = #1059#1082#1072#1078#1080#1090#1077' '#1086#1090#1095#1077#1090#1085#1099#1081' '#1084#1077#1089#1103#1094
    end
    object Label1: TLabel
      Left = 11
      Top = 32
      Width = 119
      Height = 13
      Caption = #1059#1082#1072#1078#1080#1090#1077' '#1086#1090#1095#1077#1090#1085#1099#1081' '#1075#1086#1076
    end
    object Label7: TLabel
      Left = 11
      Top = 189
      Width = 70
      Height = 13
      Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081' '
    end
    object Label4: TLabel
      Left = 50
      Top = 4
      Width = 289
      Height = 19
      Caption = #1047#1072#1076#1072#1081#1090#1077' '#1087#1072#1088#1072#1084#1077#1090#1088#1099' '#1085#1086#1074#1086#1075#1086' '#1089#1095#1105#1090#1072' '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
    end
    object Edit1: TEdit
      Left = 137
      Top = 29
      Width = 65
      Height = 21
      TabOrder = 0
      OnKeyPress = Edit1KeyPress
      OnKeyUp = Edit1KeyUp
    end
    object Edit2: TEdit
      Left = 156
      Top = 54
      Width = 46
      Height = 21
      TabOrder = 1
      OnKeyPress = Edit2KeyPress
      OnKeyUp = Edit2KeyUp
    end
    object Edit3: TEdit
      Left = 95
      Top = 186
      Width = 259
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 6
      OnKeyPress = Edit3KeyPress
      OnKeyUp = Edit3KeyUp
    end
    object Button3: TButton
      Left = 280
      Top = 213
      Width = 117
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
      TabOrder = 7
      OnClick = Button3Click
    end
    object Panel3: TPanel
      Left = 208
      Top = 78
      Width = 189
      Height = 99
      TabOrder = 5
      object Label6: TLabel
        Left = 12
        Top = 60
        Width = 166
        Height = 26
        Caption = '**'#1055#1088#1080' '#1089#1086#1079#1076#1072#1085#1080#1080' '#1089#1095#1105#1090#1072' '#1076#1083#1103' '#1042#1052#1055', '#1087#1088#1086#1089#1090#1072#1074#1100#1090#1077' '#1086#1090#1084#1077#1090#1082#1091' '#1074#1099#1096#1077
        WordWrap = True
      end
      object CheckBox1: TCheckBox
        Left = 8
        Top = 6
        Width = 172
        Height = 33
        Caption = #1042#1099#1089#1086#1082#1086#1090#1077#1093#1085#1086#1083#1086#1075#1080#1095#1077#1089#1082#1072#1103' '#1052#1077#1076#1080#1094#1080#1085#1089#1082#1072#1103' '#1055#1086#1084#1086#1097#1100' ('#1042#1052#1055')**'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Font.Quality = fqDraft
        ParentFont = False
        TabOrder = 0
        WordWrap = True
        OnClick = CheckBox1Click
        OnKeyPress = CheckBox1KeyPress
        OnKeyUp = CheckBox1KeyUp
      end
    end
    object Panel2: TPanel
      Left = 11
      Top = 78
      Width = 191
      Height = 99
      TabOrder = 4
      object Label5: TLabel
        Left = 9
        Top = 60
        Width = 171
        Height = 26
        Caption = '*'#1055#1088#1080' '#1092#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1080' '#1089#1095#1105#1090#1072' '#1076#1080#1089#1087#1072#1085#1089#1077#1088#1080#1079#1072#1094#1080#1080' '#1091#1082#1072#1078#1080#1090#1077' '#1077#1105' '#1090#1080#1087' '
        WordWrap = True
      end
      object Label3: TLabel
        Left = 9
        Top = 9
        Width = 115
        Height = 13
        Caption = #1058#1080#1087' '#1076#1080#1089#1087#1072#1085#1089#1077#1088#1080#1079#1072#1094#1080#1080'*'
      end
      object ComboBox1: TComboBox
        Left = 9
        Top = 28
        Width = 121
        Height = 21
        Sorted = True
        TabOrder = 0
        OnKeyPress = ComboBox1KeyPress
        OnKeyUp = ComboBox1KeyUp
      end
    end
    object CheckBox2: TCheckBox
      Left = 216
      Top = 31
      Width = 163
      Height = 17
      Caption = #1042#1074#1077#1089#1090#1080' '#1085#1086#1084#1077#1088' '#1089#1095#1077#1090#1072' '#1074#1088#1091#1095#1085#1091#1102
      TabOrder = 2
      OnClick = CheckBox2Click
      OnKeyPress = CheckBox2KeyPress
    end
    object Edit4: TEdit
      Left = 214
      Top = 54
      Width = 183
      Height = 21
      TabOrder = 3
      OnKeyPress = Edit4KeyPress
    end
  end
end
