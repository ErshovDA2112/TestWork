object Form9: TForm9
  Left = 0
  Top = 0
  Caption = 'Form9'
  ClientHeight = 603
  ClientWidth = 1171
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnKeyPress = FormKeyPress
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object Panel3: TPanel
    Left = 50
    Top = 0
    Width = 1121
    Height = 603
    Align = alClient
    TabOrder = 0
    object Panel5: TPanel
      Left = 1
      Top = 1
      Width = 468
      Height = 420
      Align = alClient
      TabOrder = 0
      object Panel4: TPanel
        Left = 1
        Top = 1
        Width = 466
        Height = 41
        Align = alTop
        TabOrder = 0
        Visible = False
        object Label4: TLabel
          Left = 10
          Top = 11
          Width = 140
          Height = 19
          Caption = #1055#1086#1080#1089#1082' '#1087#1072#1094#1080#1077#1085#1090#1072' '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
        end
        object Edit12: TEdit
          Left = 158
          Top = 9
          Width = 302
          Height = 21
          TabOrder = 0
          OnChange = Edit12Change
          OnKeyPress = Edit12KeyPress
        end
      end
      object Panel1: TPanel
        Left = 1
        Top = 42
        Width = 487
        Height = 377
        Align = alLeft
        TabOrder = 1
        DesignSize = (
          487
          377)
        object Label2: TLabel
          Left = 10
          Top = 2
          Width = 164
          Height = 19
          Caption = #1057#1087#1080#1089#1086#1082' '#1087#1072#1094#1080#1077#1085#1090#1086#1074'  '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
        end
        object DBGrid1: TDBGrid
          Left = 8
          Top = 27
          Width = 454
          Height = 343
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
          OnDblClick = DBGrid1DblClick
          OnKeyUp = DBGrid1KeyUp
          OnTitleClick = DBGrid1TitleClick
        end
      end
    end
    object Panel6: TPanel
      Left = 469
      Top = 1
      Width = 651
      Height = 420
      Align = alRight
      TabOrder = 1
      object Panel2: TPanel
        Left = 1
        Top = 1
        Width = 649
        Height = 418
        Align = alRight
        TabOrder = 0
        object Label32: TLabel
          Left = 10
          Top = 399
          Width = 67
          Height = 13
          Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
        end
        object Label12: TLabel
          Left = 8
          Top = 422
          Width = 529
          Height = 26
          Caption = 
            '*'#1045#1089#1083#1080' '#1074#1099#1073#1088#1072#1085' '#1087#1088#1077#1076#1089#1090#1072#1074#1080#1090#1077#1083#1100' '#1087#1072#1094#1080#1077#1085#1090#1072' '#1090#1086#1075#1076#1072' '#1091#1082#1072#1079#1099#1074#1072#1077#1090#1089#1103'  '#1084#1077#1089#1090#1086' '#1088#1086#1078 +
            #1076#1077#1085#1080#1103' '#1087#1088#1077#1076#1089#1090#1072#1074#1080#1090#1077#1083#1103' '#1087#1072#1094#1080#1077#1085#1090#1072'. ** '#1042' '#1076#1086#1082#1091#1084#1077#1085#1090#1072#1093', '#1091#1076#1086#1089#1090#1086#1074#1077#1088#1103#1102#1097#1080#1093' '#1083#1080 +
            #1095#1085#1086#1089#1090#1100' '#1086#1090#1089#1091#1090#1089#1090#1074#1091#1077#1090' '#1086#1090#1095#1077#1089#1090#1074#1086'.'
          WordWrap = True
        end
        object Button3: TButton
          Left = 466
          Top = 394
          Width = 169
          Height = 25
          Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1085#1086#1074#1086#1075#1086' '#1087#1072#1094#1080#1077#1085#1090#1072
          TabOrder = 4
          OnClick = Button3Click
        end
        object Button4: TButton
          Left = 506
          Top = 394
          Width = 129
          Height = 25
          Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
          TabOrder = 5
          OnClick = Button4Click
        end
        object Edit24: TEdit
          Left = 104
          Top = 394
          Width = 293
          Height = 21
          TabOrder = 3
          OnChange = Edit24Change
          OnKeyPress = Edit24KeyPress
        end
        object GroupBox1: TGroupBox
          Left = 6
          Top = 3
          Width = 304
          Height = 235
          Caption = #1055#1072#1094#1080#1077#1085#1090
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          DesignSize = (
            304
            235)
          object Label13: TLabel
            Left = 42
            Top = 21
            Width = 53
            Height = 13
            Caption = #1060#1072#1084#1080#1083#1080#1103' '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold, fsItalic]
            ParentFont = False
          end
          object Label14: TLabel
            Left = 69
            Top = 51
            Width = 26
            Height = 13
            Caption = #1048#1084#1103' '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold, fsItalic]
            ParentFont = False
          end
          object Label15: TLabel
            Left = 36
            Top = 82
            Width = 59
            Height = 13
            Caption = #1054#1090#1095#1077#1089#1090#1074#1086' '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold, fsItalic]
            ParentFont = False
          end
          object Label16: TLabel
            Left = 67
            Top = 141
            Width = 25
            Height = 13
            Caption = #1055#1086#1083' '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold, fsItalic]
            ParentFont = False
          end
          object ComboBox1: TComboBox
            Left = 98
            Top = 137
            Width = 110
            Height = 21
            Style = csDropDownList
            Anchors = [akLeft, akTop, akRight]
            Ctl3D = False
            ParentCtl3D = False
            TabOrder = 4
            OnKeyPress = ComboBox1KeyPress
            OnKeyUp = ComboBox1KeyUp
          end
          object Edit1: TEdit
            Left = 98
            Top = 18
            Width = 167
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            OnChange = Edit1Change
            OnKeyPress = Edit1KeyPress
          end
          object Edit2: TEdit
            Left = 98
            Top = 49
            Width = 167
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
            OnChange = Edit2Change
            OnKeyPress = Edit2KeyPress
          end
          object Edit3: TEdit
            Left = 98
            Top = 80
            Width = 167
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            AutoSize = False
            TabOrder = 2
            OnChange = Edit3Change
            OnKeyPress = Edit3KeyPress
          end
          object GroupBox4: TGroupBox
            Left = 10
            Top = 159
            Width = 279
            Height = 61
            Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
            object Label17: TLabel
              Left = 7
              Top = 13
              Width = 26
              Height = 13
              Caption = #1044#1077#1085#1100
            end
            object Label3: TLabel
              Left = 98
              Top = 14
              Width = 31
              Height = 13
              Caption = #1052#1077#1089#1103#1094
            end
            object Label7: TLabel
              Left = 195
              Top = 14
              Width = 19
              Height = 13
              Caption = #1043#1086#1076
            end
            object ComboBox5: TComboBox
              Left = 3
              Top = 32
              Width = 73
              Height = 21
              TabOrder = 0
              OnChange = ComboBox5Change
              OnKeyPress = ComboBox5KeyPress
            end
            object ComboBox6: TComboBox
              Left = 101
              Top = 33
              Width = 88
              Height = 21
              TabOrder = 1
              OnChange = ComboBox6Change
              OnKeyPress = ComboBox6KeyPress
            end
            object ComboBox7: TComboBox
              Left = 203
              Top = 33
              Width = 73
              Height = 21
              TabOrder = 2
              OnChange = ComboBox7Change
              OnKeyPress = ComboBox7KeyPress
            end
          end
          object CheckBox2: TCheckBox
            Left = 80
            Top = 115
            Width = 173
            Height = 17
            Caption = #1054#1090#1095#1077#1089#1090#1074#1086' '#1086#1090#1089#1091#1090#1089#1090#1074#1091#1077#1090' ** '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold, fsItalic]
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 3
            OnClick = CheckBox2Click
            OnExit = CheckBox2Exit
            OnKeyPress = CheckBox2KeyPress
          end
        end
        object GroupBox5: TGroupBox
          Left = 5
          Top = 237
          Width = 630
          Height = 149
          Caption = #1044#1086#1082#1091#1084#1077#1085#1090
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          object Label25: TLabel
            Left = 9
            Top = 19
            Width = 22
            Height = 14
            Caption = #1058#1080#1087
          end
          object Label26: TLabel
            Left = 355
            Top = 19
            Width = 35
            Height = 14
            Caption = #1057#1077#1088#1080#1103
          end
          object Label27: TLabel
            Left = 455
            Top = 21
            Width = 37
            Height = 14
            Caption = #1053#1086#1084#1077#1088
          end
          object Label24: TLabel
            Left = 9
            Top = 46
            Width = 98
            Height = 14
            Caption = #1052#1077#1089#1090#1086' '#1088#1086#1078#1076#1077#1085#1080#1103
          end
          object Label28: TLabel
            Left = 306
            Top = 46
            Width = 38
            Height = 14
            Caption = #1057#1053#1048#1051#1057
          end
          object Label18: TLabel
            Left = 468
            Top = 46
            Width = 22
            Height = 14
            Caption = #1058#1077#1083
          end
          object Label30: TLabel
            Left = 7
            Top = 124
            Width = 194
            Height = 14
            Caption = #1050#1086#1076' '#1084#1077#1089#1090#1072' '#1087#1088#1077#1073#1099#1074#1072#1085#1080#1103' '#1087#1086' '#1054#1050#1040#1058#1054
          end
          object Label29: TLabel
            Left = 9
            Top = 97
            Width = 192
            Height = 14
            Caption = #1050#1086#1076' '#1084#1077#1089#1090#1072' '#1078#1080#1090#1077#1083#1100#1089#1090#1074#1072' '#1087#1086' '#1054#1050#1040#1058#1054
          end
          object Label34: TLabel
            Left = 9
            Top = 72
            Width = 110
            Height = 14
            Caption = #1040#1076#1088#1077#1089' '#1087#1088#1086#1078#1080#1074#1072#1085#1080#1103
          end
          object ComboBox3: TComboBox
            Left = 36
            Top = 16
            Width = 313
            Height = 22
            Style = csDropDownList
            TabOrder = 0
            OnChange = ComboBox3Change
            OnKeyPress = ComboBox3KeyPress
            OnKeyUp = ComboBox3KeyUp
          end
          object Edit10: TEdit
            Left = 498
            Top = 16
            Width = 117
            Height = 22
            TabOrder = 2
            OnChange = Edit10Change
            OnKeyPress = Edit10KeyPress
            OnKeyUp = Edit10KeyUp
          end
          object Edit9: TEdit
            Left = 394
            Top = 16
            Width = 56
            Height = 22
            TabOrder = 1
            OnChange = Edit9Change
            OnKeyPress = Edit9KeyPress
          end
          object Edit8: TEdit
            Left = 118
            Top = 43
            Width = 180
            Height = 22
            TabOrder = 3
            OnChange = Edit8Change
            OnKeyPress = Edit8KeyPress
          end
          object Edit11: TEdit
            Left = 350
            Top = 43
            Width = 99
            Height = 22
            TabOrder = 4
            OnChange = Edit11Change
            OnKeyPress = Edit11KeyPress
            OnKeyUp = Edit11KeyUp
          end
          object Edit4: TEdit
            Left = 499
            Top = 43
            Width = 116
            Height = 22
            TabOrder = 5
            OnChange = Edit4Change
            OnKeyPress = Edit4KeyPress
          end
          object Button1: TButton
            Left = 207
            Top = 120
            Width = 86
            Height = 25
            Caption = #1042#1099#1073#1088#1072#1090#1100
            TabOrder = 6
            OnClick = Button1Click
          end
          object Button2: TButton
            Left = 207
            Top = 93
            Width = 86
            Height = 25
            Caption = #1042#1099#1073#1088#1072#1090#1100
            TabOrder = 7
            OnClick = Button2Click
          end
          object CheckBox1: TCheckBox
            Left = 305
            Top = 97
            Width = 208
            Height = 17
            Caption = #1057#1086#1086#1090#1074#1077#1090#1089#1090#1074#1091#1077#1090' '#1084#1077#1089#1090#1091' '#1078#1080#1090#1077#1083#1100#1089#1090#1074#1072
            TabOrder = 8
            OnClick = CheckBox1Click
            OnKeyPress = CheckBox1KeyPress
          end
          object Edit15: TEdit
            Left = 127
            Top = 69
            Width = 488
            Height = 22
            TabOrder = 9
            OnKeyPress = Edit15KeyPress
          end
        end
        object GroupBox7: TGroupBox
          Left = 311
          Top = 9
          Width = 328
          Height = 228
          TabOrder = 1
          object GroupBox2: TGroupBox
            Left = 11
            Top = 27
            Width = 306
            Height = 194
            Caption = #1055#1088#1077#1076#1089#1090#1072#1074#1080#1090#1077#1083#1100' '#1087#1072#1094#1080#1077#1085#1090#1072
            TabOrder = 1
            Visible = False
            DesignSize = (
              306
              194)
            object Label19: TLabel
              Left = 41
              Top = 19
              Width = 53
              Height = 13
              Caption = #1060#1072#1084#1080#1083#1080#1103' '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold, fsItalic]
              ParentFont = False
            end
            object Label20: TLabel
              Left = 68
              Top = 43
              Width = 26
              Height = 13
              Caption = #1048#1084#1103' '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold, fsItalic]
              ParentFont = False
            end
            object Label21: TLabel
              Left = 35
              Top = 67
              Width = 59
              Height = 13
              Caption = #1054#1090#1095#1077#1089#1090#1074#1086' '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold, fsItalic]
              ParentFont = False
            end
            object Label22: TLabel
              Left = 69
              Top = 107
              Width = 25
              Height = 13
              Caption = #1055#1086#1083' '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold, fsItalic]
              ParentFont = False
            end
            object ComboBox2: TComboBox
              Left = 98
              Top = 104
              Width = 119
              Height = 21
              Style = csDropDownList
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 4
              OnKeyPress = ComboBox2KeyPress
              OnKeyUp = ComboBox2KeyUp
            end
            object Edit5: TEdit
              Left = 100
              Top = 16
              Width = 185
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 0
              OnChange = Edit5Change
              OnKeyPress = Edit5KeyPress
            end
            object Edit6: TEdit
              Left = 97
              Top = 39
              Width = 185
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 1
              OnChange = Edit6Change
              OnKeyPress = Edit6KeyPress
            end
            object Edit7: TEdit
              Left = 97
              Top = 62
              Width = 185
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
              OnChange = Edit7Change
              OnKeyPress = Edit7KeyPress
            end
            object GroupBox6: TGroupBox
              Left = 11
              Top = 126
              Width = 282
              Height = 61
              Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
              TabOrder = 5
              object Label8: TLabel
                Left = 12
                Top = 12
                Width = 26
                Height = 13
                Caption = #1044#1077#1085#1100
              end
              object Label9: TLabel
                Left = 93
                Top = 14
                Width = 31
                Height = 13
                Caption = #1052#1077#1089#1103#1094
              end
              object Label10: TLabel
                Left = 195
                Top = 13
                Width = 19
                Height = 13
                Caption = #1043#1086#1076
              end
              object ComboBox8: TComboBox
                Left = 9
                Top = 32
                Width = 73
                Height = 21
                TabOrder = 0
                OnChange = ComboBox8Change
                OnKeyPress = ComboBox8KeyPress
              end
              object ComboBox9: TComboBox
                Left = 100
                Top = 33
                Width = 88
                Height = 21
                TabOrder = 1
                OnChange = ComboBox9Change
                OnKeyPress = ComboBox9KeyPress
              end
              object ComboBox10: TComboBox
                Left = 194
                Top = 32
                Width = 73
                Height = 21
                TabOrder = 2
                OnChange = ComboBox10Change
                OnKeyPress = ComboBox10KeyPress
              end
            end
            object CheckBox3: TCheckBox
              Left = 82
              Top = 85
              Width = 173
              Height = 17
              Caption = #1054#1090#1095#1077#1089#1090#1074#1086' '#1086#1090#1089#1091#1090#1089#1090#1074#1091#1077#1090' ** '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold, fsItalic]
              ParentFont = False
              TabOrder = 3
              OnClick = CheckBox3Click
              OnKeyPress = CheckBox3KeyPress
            end
          end
          object CheckBox6: TCheckBox
            Left = 12
            Top = 4
            Width = 110
            Height = 17
            Caption = #1053#1086#1074#1086#1088#1086#1078#1076#1105#1085#1085#1099#1081' *'
            TabOrder = 0
            OnClick = CheckBox6Click
            OnKeyPress = CheckBox6KeyPress
          end
        end
      end
    end
    object Panel7: TPanel
      Left = 1
      Top = 421
      Width = 1119
      Height = 181
      Align = alBottom
      TabOrder = 2
      DesignSize = (
        1119
        181)
      object Label35: TLabel
        Left = 8
        Top = 2
        Width = 279
        Height = 19
        Caption = #1057#1087#1080#1089#1086#1082' '#1087#1086#1083#1080#1089#1086#1074' '#1080' '#1057#1052#1054' '#1087#1072#1094#1080#1077#1085#1090#1072' '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
      end
      object Label36: TLabel
        Left = 359
        Top = 155
        Width = 83
        Height = 13
        Caption = #1040#1082#1090#1080#1074#1085#1099#1081' '#1087#1086#1083#1080#1089
      end
      object GroupBox3: TGroupBox
        Left = 474
        Top = 5
        Width = 630
        Height = 135
        Anchors = [akRight]
        Caption = #1057#1074#1077#1076#1077#1085#1080#1103' '#1087#1086#1076#1090#1074#1077#1088#1078#1076#1072#1102#1097#1080#1077' '#1092#1072#1082#1090' '#1089#1090#1088#1072#1093#1086#1074#1072#1085#1080#1103
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        DesignSize = (
          630
          135)
        object Label1: TLabel
          Left = 314
          Top = 24
          Width = 35
          Height = 14
          Caption = #1057#1077#1088#1080#1103
        end
        object Label5: TLabel
          Left = 441
          Top = 24
          Width = 37
          Height = 14
          Caption = #1053#1086#1084#1077#1088
        end
        object Label6: TLabel
          Left = 9
          Top = 25
          Width = 66
          Height = 14
          Caption = #1058#1080#1087' '#1087#1086#1083#1080#1089#1072
        end
        object Label31: TLabel
          Left = 9
          Top = 92
          Width = 119
          Height = 14
          Caption = #1056#1077#1075#1080#1086#1085' '#1089#1090#1088#1072#1093#1086#1074#1072#1085#1080#1103':'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label33: TLabel
          Left = 10
          Top = 72
          Width = 33
          Height = 14
          Caption = #1057#1052#1054': '
        end
        object Label23: TLabel
          Left = 10
          Top = 50
          Width = 42
          Height = 14
          Caption = 'Label23'
        end
        object Label11: TLabel
          Left = 10
          Top = 110
          Width = 72
          Height = 14
          Caption = #1043#1088'. '#1080#1085#1074#1072#1083#1080#1076'.'
        end
        object ComboBox4: TComboBox
          Left = 81
          Top = 21
          Width = 222
          Height = 22
          Style = csDropDownList
          TabOrder = 0
          OnChange = ComboBox4Change
          OnKeyPress = ComboBox4KeyPress
          OnKeyUp = ComboBox4KeyUp
        end
        object Edit13: TEdit
          Left = 361
          Top = 22
          Width = 74
          Height = 22
          TabOrder = 1
          OnChange = Edit13Change
          OnKeyPress = Edit13KeyPress
        end
        object Edit14: TEdit
          Left = 484
          Top = 21
          Width = 129
          Height = 22
          TabOrder = 2
          OnChange = Edit14Change
          OnKeyPress = Edit14KeyPress
        end
        object Button6: TButton
          Left = 506
          Top = 46
          Width = 107
          Height = 25
          Caption = #1042#1099#1073#1088#1072#1090#1100' '#1057#1052#1054
          TabOrder = 3
          OnClick = Button6Click
        end
        object ComboBox11: TComboBox
          Left = 91
          Top = 108
          Width = 133
          Height = 22
          Style = csDropDownList
          Anchors = [akLeft, akTop, akRight]
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 4
          OnChange = ComboBox11Change
          OnKeyPress = ComboBox11KeyPress
          OnKeyUp = ComboBox11KeyUp
        end
      end
      object DBGrid4: TDBGrid
        Left = 9
        Top = 27
        Width = 454
        Height = 117
        Anchors = [akLeft, akTop, akBottom]
        DataSource = DataSource4
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ReadOnly = True
        TabOrder = 3
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnCellClick = DBGrid4CellClick
        OnColumnMoved = DBGrid4ColumnMoved
        OnDrawColumnCell = DBGrid4DrawColumnCell
      end
      object Button5: TButton
        Left = 875
        Top = 150
        Width = 117
        Height = 25
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
        TabOrder = 1
        OnClick = Button5Click
      end
      object Button7: TButton
        Left = 998
        Top = 150
        Width = 105
        Height = 25
        Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '
        TabOrder = 2
        OnClick = Button7Click
      end
      object Button8: TButton
        Left = 8
        Top = 150
        Width = 157
        Height = 25
        Caption = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100' '#1086' '#1087#1086#1083#1080#1089#1077
        TabOrder = 4
        OnClick = Button8Click
      end
      object Button9: TButton
        Left = 336
        Top = 150
        Width = 127
        Height = 25
        Anchors = [akLeft, akTop, akBottom]
        Caption = #1057#1076#1077#1083#1072#1090#1100' '#1072#1082#1090#1080#1074#1085#1099#1084
        TabOrder = 5
        OnClick = Button9Click
      end
    end
  end
  object SplitView1: TSplitView
    Left = 0
    Top = 0
    Width = 50
    Height = 603
    CloseStyle = svcCompact
    Color = clWindowFrame
    Opened = False
    OpenedWidth = 200
    Placement = svpLeft
    TabOrder = 1
    OnClosed = SplitView1Closed
    OnOpened = SplitView1Opened
    object CategoryButtons1: TCategoryButtons
      Left = -4
      Top = -26
      Width = 50
      Height = 637
      BackgroundGradientColor = 15717318
      BevelEdges = []
      BorderStyle = bsNone
      ButtonFlow = cbfVertical
      ButtonHeight = 45
      ButtonWidth = 190
      ButtonOptions = [boFullSize, boShowCaptions, boCaptionOnlyBorder]
      Categories = <
        item
          Color = cl3DLight
          Collapsed = False
          Items = <
            item
              Caption = #1057#1074#1077#1088#1085#1091#1090#1100
              ImageIndex = 0
              OnClick = CategoryButtons1Categories0Items0Click
            end
            item
              Caption = #1055#1086#1080#1089#1082' '#1087#1072#1094#1080#1077#1085#1090#1072
              ImageIndex = 1
              OnClick = CategoryButtons1Categories0Items1Click
            end
            item
              Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1072#1094#1080#1077#1085#1090#1072
              ImageIndex = 2
              OnClick = CategoryButtons1Categories0Items2Click
            end
            item
              Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1087#1072#1094#1080#1077#1085#1090#1072
              ImageIndex = 3
              OnClick = CategoryButtons1Categories0Items3Click
            end
            item
              Caption = #1059#1076#1072#1083#1080#1090#1100' '#1087#1072#1094#1080#1077#1085#1090#1072
              ImageIndex = 4
              OnClick = CategoryButtons1Categories0Items4Click
            end
            item
              Caption = #1069#1052#1050
              ImageIndex = 5
              OnClick = CategoryButtons1Categories0Items5Click
            end>
        end>
      DoubleBuffered = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      HotButtonColor = clGreen
      Images = ImageList1
      ParentDoubleBuffered = False
      RegularButtonColor = clNone
      SelectedButtonColor = clNone
      TabOrder = 0
      Touch.ParentTabletOptions = False
      Touch.TabletOptions = [toPressAndHold]
    end
  end
  object MainMenu1: TMainMenu
    Left = 235
    Top = 104
    object N1: TMenuItem
      Caption = #1055#1072#1094#1080#1077#1085#1090#1099
      object N2: TMenuItem
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1072#1094#1080#1077#1085#1090#1072
      end
      object N3: TMenuItem
        Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1087#1072#1094#1080#1077#1085#1090#1072
      end
      object N4: TMenuItem
        Caption = #1059#1076#1072#1083#1080#1090#1100' '#1087#1072#1094#1080#1077#1085#1090#1072
      end
    end
  end
  object ImageList1: TImageList
    ColorDepth = cd32Bit
    Height = 32
    Width = 32
    Left = 240
    Top = 153
    Bitmap = {
      494C010106004400440220002000FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000800000004000000001002000000000000080
      0000000000000000000000000000000000000000000000000002000000080000
      000F000000160000001A0000001A0000001A0000001A0000001A0000001E0907
      053F1F180D6C81653FCAC28A3DFFBF8539FFBB8035FFB77A30FFB3742BFFB174
      2DFF584029AF0B0805470000001F0000001A0000001A0000001A0000001A0000
      001A00000018000000130000000D000000060000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000090000001D0000
      00360000004D000000580000005800000058816138D6C79044FFC99346FFCA95
      48FFCA9447FFC99346FFC79044FFC38B3FFFC0873BFFBB8035FFB77930FFB273
      2AFFAC6B23FFA6641CFFA05C15FF9A550EFF2F1F0EA300000058000000580000
      005800000053000000410000002C000000170000000000000000000000010000
      0012000000200000002600000026000000260000002600000026000000260000
      0026000000260000002600000026000000260000002600000026000000260000
      0026000000260000002600000026000000260000002600000026000000260000
      00250000001C0000000C00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000002000000070000
      000E000000140000001800000022C08C4DFFCB984EFFCD984BFFCF9B4DFFD09C
      4FFFD09C4EFFCE9A4CFFCC974AFFC89245FFC38B3FFFBF853AFFBA7D33FFB576
      2DFFAE6F26FFA8671FFFA25F18FF9D5811FF97500AFF6E4B80FF000000180000
      001800000016000000110000000B000000060000000000000000000000141E14
      0276A87009F7AA7209F8AA7209F8AA7209F8AE740AFBAE730AFBAE730AFBAE73
      0AFBAE730AFBAE730AFBAE730AFBAE730AFBAE730AFBAE730AFBAE730AFBAE73
      0AFBAE730AFBAE730AFBAE730AFB2930C6FCAE730AFBAC740AFA936108F8A972
      09F8A97009F6000000250000000C000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000010000
      0003000000040000000F211CE3FFC99447FFD3A45EFFD29F51FFD5A254FFD6A4
      56FFD6A455FFD4A153FFD19D4FFFCD984BFFC79144FFC28A3EFFBD8337FFB77A
      30FFB17229FFAB6A22FFA5631BFF9F5B14FF99530DFF844424FF2722E1FF0000
      000500000004000000030000000200000001000000000000000000000000C49F
      43FFBD932BFFBD942CFFBE962DFFBE982EFFECD085FFE6BE54FFE6BE54FFE6BE
      54FFE6BE54FFE6BE54FFE6BE54FFE6BE54FFE6BE54FFE6BE54FFE6BE54FFE6BE
      54FFE6BE54FFE6BE54FFE6BE54FF2731D1FFE5BD53FFE6BE54FFB57C0FFFD8CC
      78FFA68D3EFFA46F0AF300000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000010000
      00030000000E1F1BDBFF1B17DAFFCC974AFFD7A862FFD7A556FFDBAA5BFFDDAC
      5DFFDDAC5DFFDAA95AFFD6A354FFD09C4FFFCB9649FFC68E42FFBF863AFFBA7D
      33FFB3752CFFAC6C23FFA7651DFFA15D16FF9A540EFF553894FF1B16DAFF2722
      DAFF00000004000000030000000200000001000000000000000000000000C19B
      3AFFBD952CFFBE972EFFBE982FFFBF9A30FFECD085FFE6BE54FFE6BE54FFE6BE
      54FFE6BE54FFE6BE54FFE6BE54FFE6BE54FFE6BE54FFE6BE54FFE6BE54FFE6BE
      54FFE6BE54FFE6BE54FFE6BE54FF2731D1FFE5BD53FFE6BE54FFB47E10FFDCD7
      8BFFDCDB95FFA4720BF400000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000010000
      000D201BD2FF1A15D0FF1B16D1FF896D98FFDAAC66FFDBA95AFFE0B061FFE3B4
      64FFE2B363FFDEAF60FFD9A95AFFD3A050FFCA923EFFC18832FFBC802DFFBB80
      35FFB5772DFFAE6E25FFA8661EFFA15D16FF9A550EFF1A16D1FF1B16D1FF1A16
      D1FF2621D1FF000000030000000200000001000000000000000000000000C29D
      3DFFBE972EFFBE9930FFBF9B31FFBF9C32FFECD085FFE6BE54FFE6BE54FFE6BE
      54FFE6BE54FFE6BE54FFE6BE54FFE6BE54FFE6BE54FFE6BE54FFE6BE54FFE6BE
      54FFE6BE54FFE6BE54FFE6BE54FF2731D1FFE5BD53FFE6BE54FFB48012FFDCDB
      95FFDCE3A6FFA3730DF400000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001F1B
      CAFF1A15C9FF1C17C9FF1B16C9FF1A15C8FFD8A658FFE0B268FFE4B565FFE8BB
      6BFFE7BA69FFE0B05FFFD4A251FFB77C38FFB47A37FFC08835FFBB7E26FFB172
      18FFAF6F1EFFAF7027FFA8661EFFA25E17FF8B553EFF1A15C8FF1A15C9FF1B16
      C9FF1A15C9FF2722CAFF0000000100000000000000000000000000000000C29F
      3FFFBE9930FFBF9B31FFBF9D33FFC09E34FFECD085FFE6BE54FFE6BE54FFE6BE
      54FFE6BE54FFE6BE54FFE6BE54FFE6BE54FFE6BE54FFE6BE54FFE6BE54FFE6BE
      54FFE6BE54FFE6BE54FFE6BE54FF2731D1FFE5BD53FFE6BE54FFB38114FFDCDC
      97FFDCE6ACFFA3740FF400000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000302B
      C4FF1B16C1FF1A15C1FF1C17C2FF1A15C1FF594AAAFFE1B267FFE5B767FFEBBE
      6EFFDBA958FFF8E1BCFFFAE7CCFFFCEFDDFFFAE9D2FFF9E3C2FFF7DCB1FFAF6F
      19FFA9660CFFAF6F26FFA9671FFFA25F17FF1A15C0FF1813C0FF1A16C1FF1A15
      C1FF1B16C1FF2621BEFF0000000000000000000000000000000000000000C3A1
      40FFBF9B31FFC09D33FFC09F34FFC0A136FFECD085FFE6BE54FFE6BE54FFE6BE
      54FFE6BE54FFE6BE54FFE6BF55FFE6BF55FFE6BF55FFE6BF55FFE6BF55FFE6BE
      54FFE6BE54FFE6BE54FFE6BE54FF2731D1FFE5BD53FFE6BE54FFB38215FFDCD9
      8FFFDCDE9CFFA27410F400000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004240
      B1FF302BC0FF1B16BBFF1A15BBFF1914BAFF1914BAFF886D97FFE3B467FFE6B8
      68FFF6D9AAFFB0B6BAFFC7E0F3FFD9E9F8FFD6E7F7FFC1DDF3FFABBBC6FFF5D5
      9FFFAA670CFFAE6E24FFA8651DFF1914BAFF1914BAFF1B15BCFF1A15BBFF1712
      B9FF2621BCFF302F8CFF0000000000000000000000000000000000000000C3A4
      43FFC09D33FFC09F35FFC1A136FFC1A338FFECD085FFE6BE54FFE6BE54FFE9C8
      6DFFE9C96EFFE9C96FFFE9C96FFFE9C96FFFE9C970FFE9C96FFFE9C96FFFE9C9
      6FFFE9C86EFFE6BE54FFE6BE54FF2731D1FFE5BD53FFE6BE54FFB28317FFDCD3
      82FFD6CF82FFA27512F400000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003534
      8EE04746BEFF302CBEFF1C17B7FF1A15B6FF1C17B7FF1B16B7FF372FB2FFE0AF
      5FFFF8DBACFFA0C8EBFFB4D4F0FFBDDAF1FFBCD9F1FFB0D1EFFF9BC5EBFFFAD4
      95FFAA660DFF7C5970FF1C17B7FF1A15B6FF1C17B7FF1B16B7FF1B16B7FF2622
      BAFF2F2E89FF0F0F2B900000000000000000000000000000000000000000C5A6
      44FFC09F35FFC1A136FFC1A338FFC2A539FFECD085FFE6BE54FFE6BF55FFC3AA
      40FFC3AA40FFC3AA40FFC3AA40FFC3AA40FFC3AA40FFC3AA40FFC3AA40FFC3AA
      40FFC3AA40FFE6C056FFE6BF55FF2731D1FFE5BD53FFE6BE54FFAE8216FF9178
      28FFAA8C2EFFA17714F400000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000101
      03224A49C3FF4D4BC9FF2F2ABBFF1B16B3FF1914B3FF1B15B3FF1B15B3FF1B16
      B3FF221BB0FF8EBFE9FF9AC6EAFFA4CBECFFA2CAECFF98C4EAFF89BCE8FF372A
      A6FF1B16B3FF1B15B3FF1913B3FF1B16B3FF1914B3FF1B15B3FF2521B9FF2F2E
      89FF2F2E89FF000000000000000000000000000000000000000000000000C5A7
      46FFC1A136FFC1A338FFC2A539FFC2A73BFFECD085FFE6BF55FFE6C057FFC3AA
      40FFC3AA40FFC3AA40FFC3AA40FFC3AA40FFC3AA40FFC3AA40FFC3AA40FFC3AA
      40FFC3AA40FFE6C158FFE6C056FF2731D1FFE5BD54FFE6BE54FFB0811CFFDD46
      CAFFE05BCDFFA07815F400000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000B0A1D61504ED0FF5251D5FF312DBBFF1B15B1FF1B16B1FF1A15B1FF1B16
      B1FF1D17B2FF78AEE1FF9CC7ECFFEAF2FAFFE8F1F9FFA7CDEDFF7AB4E7FF1B15
      B1FF1C17B2FF1D17B2FF1D17B2FF1D17B2FF1B15B1FF2621B8FF2F2E89FF2F2E
      89FF01010534000000000000000000000000000000000000000000000000C6A9
      47FFC1A338FFC2A539FFC2A73BFFC3A93DFFECD186FFE6C057FFE6C158FFC3AA
      40FFC3AA40FFC3AA40FFC3AA40FFC3AA40FFC3AA40FFC3AA40FFC3AA40FFC3AA
      40FFC3AA40FFE6C259FFE6C158FF2731D1FFE5BF55FFE6BE54FFAF821EFFDF59
      D1FFE378D7FF9F7916F400000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000B0B1E605453DAFF5452D7FF322EBCFF1D18B3FF1E17B4FF1E18
      B4FF1D17B4FFB4D1F0FFD8E8F7FFD9E9F7FFD8E9F7FFD2E5F6FFBFDBF3FF1C16
      B3FF1C16B3FF1C16B3FF1B16B2FF1D17B3FF2722B9FF2F2E89FF2F2E89FF0101
      053400000000000000000000000000000000000000000000000000000000C6AA
      48FFC1A539FFC2A73BFFC3A93DFFC3AC3EFFECD287FFE6C158FFE6C35AFFE4C2
      5AFFC3AA40FFC3AA40FFC3AA40FFC3AA40FFC3AA40FFC3AA40FFC3AA40FFC3AA
      40FFE3C25AFFE6C45BFFE6C259FF2731D1FFE5C056FFE6BE55FFAE8320FFE062
      D4FFE593E0FF9F7A18F400000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000C0C1F605250D2FF4746B6FF322DBDFF1E18B6FF201A
      B7FF656BD0FFD7E8F7FFC8DFF4FFCCE1F4FFCBE1F4FFC6DFF3FFBEDAF2FF899A
      DEFF1E18B6FF1D17B5FF1E18B6FF2722B9FF2B2A7DFF2F2E88FF010105340000
      000000000000000000000000000000000000000000000000000000000000C7AC
      4AFFC2A73AFFC3A93CFFC3AB3EFFC4AE40FFECD288FFE6C35AFFE6C45BFFE6C5
      5CFFE6C65EFFD3B850FFC3AA40FFC3AA40FFC3AA40FFC3AA40FFCDB34AFFE6C7
      5FFFE6C65EFFE6C55CFFE6C45BFF2731D1FFE5C158FFE6C056FFAD8421FFDF5C
      D2FFE37DD9FF9F7B1AF400000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000B0A1C604241AAFF343384FF342EBFFF221C
      BAFFC4DEF4FFB6D5F0FFBAD7F1FFBDD9F2FFBDD9F2FFB9D7F1FFB2D4F0FFAACE
      EEFF2C27BDFF1F19B9FF2722BAFF222163FF292876FF01010533000000000000
      000000000000000000000000000000000000000000000000000000000000C7AE
      4CFFC2A83CFFC3AB3EFFC4AD40FFC4B041FFECD389FFE6C45BFFE6C55DFFE6C6
      5EFFE6C75FFFE6C860FFDFC564FFC3AA40FFC3AA40FFD3BA57FFE6C961FFE6C8
      60FFE6C75FFFE6C65EFFE6C55CFF2731D1FFE5C259FFE6C157FFAC8523FFDE49
      CBFFE060CFFF9E7D1BF400000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000080815602D2C72FF1D1C4AFF8BAC
      E4FFC7DFF4FFA8CDEEFFADD0EFFFAFD2EFFFAFD2EFFFADCFEFFFA7CCEEFF9EC8
      ECFF98C5EBFF3A35BBFF161642FF1F1E59FF0101043300000000000000000000
      000000000000000000000000000000000000000000000000000000000000C7AF
      4DFFC3AA3DFFC3AD3FFFC4AF41FFC5B143FFECD58AFFE6C55CFFE6C65EFFE6C7
      60FFE6C861FFE6CA63FFC3AA40FFC3AA40FFC3AA40FFC3AA40FFE6CA65FFE6C9
      62FFE6C861FFE6C75FFFE6C65EFF2731D1FFE5C35AFFE6C158FFAA8920FF977E
      34FFAC9434FF9E7E1DF400000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000005050D602B27A6FFA9CF
      EFFFC2DCF3FF9CC7EBFFA0C9EBFFA2CBECFFA2CAECFF9FC9EBFF9BC5EBFF94C2
      EAFF8CBFEAFF3E39BEFF1B1973FF000003330000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C8B1
      4EFFC3AB3EFFC4AE40FFC4B142FFC5B344FFECD58BFFE6C65EFFE6C75FFFE6C9
      61FFE6CA62FFC4AB42FFC3AA40FFC3AA40FFC3AA40FFC3AA40FFC3AB41FFE6CB
      64FFE6CA62FFE6C861FFE6C75FFF2731D1FFE5C45BFFE6C259FFA48826FF1F39
      CBFF3444C4FF9D801EF400000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000002A27A3FC3A35C5FF9CC8
      EEFFADD1EFFF8EBFE9FF92C1EAFF94C2EAFF94C2EAFF92C1EAFF8DBFE8FF87BB
      E7FF81B7E6FF242737FF443ECAFF191767ED0000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C8B3
      50FFC3AD3FFFC4B041FFC5B244FFC6B546FFECD58CFFE6C75FFFE6C861FFE6CA
      62FFD4BB54FFC3AA40FFC3AA40FFC3AA40FFC3AA40FFC3AA40FFC3AA40FFD4BB
      54FFE6CB64FFE6CA62FFE6C861FF2731D1FFE5C55DFFE6C35BFFA38927FF273B
      D5FF3742DEFF9C811FF400000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002C29A4FC3932C9FF434A96FF465E
      80FF90C0E9FF81B8E6FF84B9E7FF86BAE7FF86BAE7FF7BACD7FF547496FF2A31
      42FF232433FF262A3AFF4B45CDFF4A44CDFF1B1867ED00000000000000000000
      000000000000000000000000000000000000000000000000000000000000C8B3
      51FFC4AE40FFC5B143FFC5B445FFC6B747FFECD68DFFE6C860FFE6C962FFE6CB
      64FFD4BB54FFC3AA40FFC3AA40FFC3AA40FFC3AA40FFC3AA40FFC3AA40FFD4BC
      55FFE6CC65FFE6CB64FFE6C962FF2731D1FFE5C65EFFE6C45BFFA38A29FF2C3D
      DAFF4245EBFF9B8221F400000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000002D29A6FC3D35CCFF443CCDFF33436BFF3648
      66FF354A6AFF7CB5E6FF7DB6E6FF79B0DFFF2C3851FF2A3145FF2A3144FF2A31
      44FF2A3144FF262A3AFF5751CFFF544DD1FF4F49D0FF1D1A68ED000000000000
      000000000000000000000000000000000000000000000000000000000000C9B4
      52FFC4AF41FFC5B244FFC6B546FFC6B848FFECD78DFFE6C961FFE6CA63FFE6CC
      65FFE6CD67FFC3AA40FFC3AA40FFC3AA40FFC3AA40FFC3AA40FFC3AA40FFE6CE
      68FFE6CD67FFE6CC65FFE6CA63FF2731D1FFE5C75FFFE6C55CFFA28B2BFF2C3D
      DAFF4045E9FF9A8322F400000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000002F2AA7FC3F38CEFF453ED0FF4741D0FF384973FF3144
      64FF364866FF324563FF7AB4E6FF2B344AFF2A3144FF2A3144FF2A3144FF282F
      41FF272C3CFF262A3AFF5E58D4FF5953D3FF5B54D3FF5952D3FF1D1B68ED0000
      000000000000000000000000000000000000000000000000000000000000C9B6
      53FFC4B042FFC5B344FFC6B647FFC7B949FFECD78EFFE6C962FFE6CB64FFE6CD
      66FFE6CE68FFC3AA40FFC3AA40FFC3AA40FFC3AA40FFC3AA40FFC3AA40FFE6D0
      6AFFE6CE68FFE6CD66FFE6CB64FF2731D1FFE5C760FFE6C65DFFA18D2CFF263B
      D3FF3642DCFF998524F400000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000002F2AA8FC463ED1FF4740D2FF4A43D2FF4F48D4FF4E52AAFF3145
      64FF314464FF364867FF415C7DFF2A3144FF2A3348FF2A3144FF2A3144FF2930
      43FF293043FF262B3CFF6760D7FF645ED7FF625CD6FF615BD6FF605AD6FF1E1C
      69ED00000000000000000000000000000000000000000000000000000000C9B7
      54FFC5B143FFC5B445FFC6B748FFC7BA4AFFECD88FFFE6CA63FFE6CC65FFE6CE
      68FFE6CF6AFFDEC862FFC3AA40FFC3AA40FFC3AA40FFC3AA40FFDDC862FFE6D1
      6BFFE6CF69FFE6CE67FFE6CC65FF2731D1FFE5C860FFE6C65EFFA08D2EFF1E39
      C9FF746E61FF988626F400000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00002F2AA8FC4940D4FF4A43D4FF4D45D5FF524AD5FF554ED6FF5A53D7FF3145
      65FF314564FF314463FF2A3144FF2C3850FF2D3C57FF2C3850FF2A3449FF282F
      42FF272C3DFF726DD2FF6F69DBFF6D67DAFF6C65DAFF6A62D9FF6861D9FF6660
      D9FF1E1C69ED000000000000000000000000000000000000000000000000C9B7
      55FFC5B243FFC6B546FFC6B848FFC7BB4BFFECD88FFFE6CB64FFE6CD66FFE6CF
      69FFE6D06BFFE6D26DFFE5D36EFFC8B046FFC9B148FFE5D46FFFE6D36EFFE6D2
      6CFFE6D06BFFE6CE68FFE6CD66FF2731D1FFE5C861FFE6C75FFF9F9330FF18C3
      DEFF739B68FF988727F400000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002F2A
      A9FC4840D6FF4A43D6FF5249D7FF544CD7FF5750D8FF5953D8FF625AD9FF6362
      C5FF314464FF314463FF2C3850FF2F405EFF2D3C57FF2C3850FF2A3448FF282F
      41FF595A8CFF7972DDFF7A74DEFF7771DDFF746EDCFF706ADCFF706ADCFF6E66
      DBFF6B64DBFF1F1D69ED0000000000000000000000000000000000000000CAB8
      55FFC5B344FFC6B646FFC7B949FFC7BC4BFFECD98FFFE6CB65FFE6CD67FFE6CF
      6AFFE6D16CFFE6D36EFFE6D470FFE6D671FFE6D672FFE6D671FFE6D470FFE6D3
      6EFFE6D16CFFE6CF69FFE6CD67FF2731D1FFE5C962FFE6C75FFF9E9432FF22CC
      EAFF3CD5ECFF978828F400000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000014A40
      D7FF4D46D8FF524BD9FF554DD9FF5851DAFF5D56DBFF665EDCFF6761DCFF6861
      DCFF4641C7FF324465FF2F4362FF2F405CFF2D3B55FF2C374FFF2A3348FF5F5E
      C7FF6965D4FF857DE0FF837BE0FF8079DFFF7E77DFFF7E77DFFF7A74DFFF726C
      DDFF736DDEFF746CDEFF0000000000000000000000000000000000000000CAB8
      56FFC5B344FFC6B647FFC7BA49FFC8BD4CFFECD990FFE6CC65FFE6CE68FFE6D0
      6AFFE6D26DFFE6D46FFFE6D671FFE6D773FFE6D773FFE6D773FFE6D571FFE6D4
      6FFFE6D26CFFE6D06AFFE6CE67FF2731D1FFE5C962FFE6C760FF9E9634FF2ED1
      EDFF51DEF1FF96892AF400000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003A38
      B3FE524BDAFF564DDBFF5E56DCFF6059DDFF6960DEFF6C65DEFF7169DEFF4640
      C8FF282773FF25246AFF010103320000000000000000000000000C0C1F605B59
      E2FF5E5CE7FF6E69D5FF8F88E2FF8B85E2FF8B85E2FF8881E2FF847CE1FF837A
      E1FF8079E1FF2F2E8FFE0000000000000000000000000000000000000000CBB9
      56FFC5B344FFC6B747FFC7BA49FFC8BD4CFFECD990FFE6CC66FFE6CE68FFE6D0
      6BFFE6D26DFFE6D570FFE6D672FFE6D874FFE6D975FFE6D874FFE6D672FFE6D4
      70FFE6D26DFFE6D06AFFE6CE68FF2731D1FFE5CA63FFE6C860FF9D9735FF31D2
      EDFF5EE3F5FF958A2CF400000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000F0F
      2977403EC4FF5C53DCFF5E57DDFF6960DEFF6B64DFFF716BE0FF4640C9FF2C2C
      81FF2A2979FF0101043200000000000000000000000000000000000000000D0D
      2060615FECFF6361F1FF726CD6FF958FE4FF918BE4FF9089E3FF8D86E3FF8C86
      E3FF2F2E91FF010105320000000000000000000000000000000000000000CBB9
      57FFC5B344FFC6B747FFC7BA4AFFC8BD4CFFECD990FFE6CC66FFE6CF68FFE6D1
      6BFFE6D36EFFE6D570FFE6D773FFE6D975FFE6DA77FFE6D975FFE6D773FFE6D5
      70FFE6D36DFFE6D16BFFE6CE68FF2731D1FFE5CA63FFE6C860FF9C9837FF2BD0
      ECFF4BDBF0FF938A2DF400000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00004B4AC4F84645D2FF6961DEFF6F67DFFF726BE1FF4741C9FF2F2E89FF2E2D
      85FF010104320000000000000000000000000000000000000000000000000000
      00000E0D22606563F5FF6B69FAFF7873D8FF9C95E6FF9992E5FF958FE5FF2F2E
      91FF262570E2000000000000000000000000000000000000000000000000CDBD
      61FFC5B344FFC6B747FFC7BA49FFC8BD4CFFECD990FFE6CC66FFE6CF69FFE6D1
      6BFFE6D36EFFE6D571FFE6D773FFE6D976FFE6DB78FFE6D976FFE6D773FFE6D5
      70FFE6D36EFFE6D16BFFE6CE68FF2833D6FFE5CA63FFE6C860FF9B9939FF1ECB
      E9FF3ECDDCFF928B2FF400000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000005351D5F84D4ADFFF7169E0FF4742C9FF2F2E89FF2F2E89FF0101
      0532000000000000000000000000000000000000000000000000000000000000
      0000000000000E0E2360716FFCFF807CFFFF7C77D9FFA59FE8FF2F2E91FF2625
      70E200000000000000000000000000000000000000000000000000000000A69F
      41FEDDD394FFDDD596FFDED797FFDFD998FFF0E1A7FFF0E2A7FFF0E3A9FFF0E4
      AAFFF0E5ACFFF0E7AEFFF0E8AFFFF0E9B0FFF0E9B1FFF0E9B0FFF0E8AFFFF0E7
      ADFFF0E5ACFFF0E4AAFFF0E3A9FF2E3FEEFFF0E0A6FFEFDEA3FF9C9337FFBEAE
      42FFC2AF41FF1212065800000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000005857E2F86C6BF4FF2F2E89FF2F2E89FF010105320000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000101024608582FFFF9592FFFF323190FF27256EE10000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000005F5DEDF82F2E89FF01010532000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000013132460A9A6FFFF27256EE1000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002020
      23F5323131FF0000000500000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000016110A549182
      42EEC89349FFC58D40FFC38B3FFFC1893DFFBE8438FFB97D33FFB5782EFFB172
      29FFAA681FFFA96822FF513211B3040402290000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000090B09063C382D1D84A77D
      47E8C1883DFFBE8438FFBA7C32FFB6782FFFB17229FF916534E32B20137B0202
      011E000000010000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000202023F56A65
      5FFF393937FF151517F500000000000000000000000000000000000000000000
      000000000000000000000000000000000000BC8943F9C89145FFCB9548FFCD98
      4BFFCD984BFFCB9649FFC99346FFC68F43FFC28A3EFFBE8438FFB97C32FFB476
      2CFFAF6F26FFA9671FFFA36019FF9D5811FF975009FF0503022D000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000004B88641F5C89245FFC99346FFCB9548FFCA9447FFC892
      45FFC68E42FFC28A3EFFBE8438FFB97D33FFB4762DFFAF7027FFAA6921FFA562
      1BFF9F5B14FF97520DFE01010116000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000030000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D8D3
      CBFFD8D3CBFFD9D4CDFFDAD5CEFFDBD6CFFFDBD6CFFFDBD6CFFFDBD6CFFFDBD6
      CFFFDAD5CEFFDAD5CEFFD9D4CCFFD8D3CBFFD8D3CBFFD7D1C9FFD6D0C8FFD4CE
      C5FFD3CDC4FFD2CBC2FFD0CAC0FFCFC8BFFFCEC7BEFF29292CFF6A655FFF3A3A
      38FF333231FE0000000000000000000000000000000000000000000000000000
      00000000000000000000000000005C472BAACE9C55FFCE994CFFD09C4EFFD39F
      52FFD3A052FFD29E50FFCF9B4DFFCB9548FFC79044FFC28A3EFFBD8337FFB87B
      31FFB2732AFFAC6B23FFA6641CFF9F5B14FF99540DFF934B06FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C79043FFCC984EFFCE984CFFD09B4DFFD19D4FFFD09C4EFFCE99
      4CFFCA9548FFC79044FFC28A3EFFBD8338FFB87B31FFB3742BFFAD6D24FFA765
      1DFFA15D16FF9A550EFF954E08FF000000020000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000015060057AC57
      35EBCE876AF90000000100000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DAD5
      CEFFDBD7D0FFDCD7D0FFDDD8D1FFDED9D2FFDED9D2FFDED9D2FFDED9D2FFDED9
      D2FFDDD8D1FFDDD8D1FFDCD7D0FFDBD6CFFFDAD5CEFFD9D4CDFFD8D3CBFFD7D2
      CAFFD6D0C8FFD4CEC5FFD3CDC4FFD1CBC1FF29292DFF6A655FFF3A3A38FF3332
      31FE000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000009D7338E2D3A35EFFD39F52FFD5A354FFD9A7
      59FFD9A759FFD7A656FFD4A153FFCF9B4DFFCA9447FFC58E42FFC0873BFFBB7E
      34FFB4752CFFAE6E25FFA7661EFFA15E16FF9B550FFF944D06FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000201011AD09E58FFD2A259FFD3A053FFD5A354FFD7A556FFD5A354FFD4A1
      53FFCF9B4DFFCB9548FFC68F43FFC0883CFFBC8035FFB6782EFFB07027FFAA67
      1FFFA36018FF9C5811FF97500AFF0000000F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000021106004EBE6132F4ECC2ADFFF0CD
      BAFFEAC2ADFE0100001900000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DDD8
      D2FFDED9D3FFDFDAD4FFDFDBD5FFE0DCD6FFE0DCD6FFE0DCD6FFE0DCD6FFE0DC
      D6FFDFDBD5FFDFDBD5FFDEDAD4FFDED9D3FFDDD8D1FFDCD7D0FFDBD6CFFFDAD5
      CDFFD8D3CBFFD7D2CAFFD5CFC7FF2A2A2DFF69655FFF3A3A38FF323131FE0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000017130C55D7A760FFD8A659FFDBAA5BFFDEAE
      5FFFDFAF60FFDDAC5DFFD9A759FFD3A052FFCE994CFFC89245FFC28A3EFFBD82
      37FFB6782FFFB07128FFA96820FFA36018FF9D5811FF8A4E11F1000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000002D19F55FFD9AB64FFD8A758FFDBAA5BFFDDAD5EFFDBAA5BFFD9A7
      59FFD4A153FFCF9A4DFFC99346FFC38B3FFFBE8438FFB87B31FFB17229FFAB6A
      22FFA5621BFF9F5A13FF98520BFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000190A005CC5723CF3ECC1A4FFF0C7ACFFF0C8ADFFF0C9
      AEFFEEC7ABFF1C0C016300000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DFDB
      D5FFE0DCD6FFE1DDD7FFE2DED8FFE2DED8FFE2DED8FFE2DFD9FFE2DED8FFE2DE
      D8FFE2DED8FFE1DDD7FFE1DDD7FFE0DCD6FFDFDBD5FFDEDAD4FFDED9D2FFDCD7
      D0FFDBD6CFFFD9D4CCFF2A2A2DFF69655FFF3A3A38FF333231FE000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D4A153FFDEB169FFE0B061FFE4B5
      66FFE5B767FFE1B262FFDCAB5CFFD39F4CFFCC9540FFC48B33FFBB7E27FFB375
      1DFFB77B31FFB17229FFAB6A22FFA4621AFF9E5912FF01000013000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000D19C4EFFDBAE68FFDCAC5DFFE1B161FFE3B565FFE1B262FFDDAC
      5DFFD8A658FFD09B4AFFC78F3AFFBF842FFF7A7D82FFB97C33FFB2732AFFAC6C
      23FFA6641CFF9F5B14FF99530CFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000210E0165CE7D41F6EDBC96FFF0C39FFFF0C49FFFF1C8A0FFF4CCA1FFF4CC
      A2FFF3CBA2FFB46A2DE6683C17AE693F1EAF7A4720BD7A4620BE78451FBE7643
      1FBD854821C93619088400000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E2DE
      D8FFE3E0DAFFE4E1DBFFE4E1DCFFE4E1DCFFE5E2DDFFE5E2DDFFE5E2DDFFE5E2
      DDFFE4E1DCFFE4E1DBFFE3E0DAFFE2DFD9FFE2DED8FFE0DCD6FFDFDBD5FFDEDA
      D4FFDDD8D1FF2A2A2EFF69655FFF3A3A38FF333231FFC9C5BCFB000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000059472CA2E0B36BFFE2B363FFE8BB
      6BFFEBBE6EFFE0AF5DFFCFA269FFF3DFC6FFFFF3DFFFECD2B0FFC18C47FFB778
      1FFFAB680EFFB2732AFFAB6A22FFA4621BFF9B5B19FA00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001A150E58DDAF66FFE0B061FFE6B868FFE9BC6BFFE6B868FFDAA7
      54FFCC984BFFB57B3AFFB47832FFC0862FFFB8BBBFFFB6D0EBFF90BCF3FFB0C5
      E1FFA7651DFFA05C15FF0202011E000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000322100267CE65
      11F8DC6F11FFEDB47EFFF0C091FFF3C592FFF9CF95FFFBD296FFFCD397FFFAD2
      97FFF9D097FFF3C795FFF3C696FFF2C596FFF1C497FFF1C297FFF0C197FFEFBF
      97FFEDBD97FFE1A67BFC0000000C000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E4E1
      DCFFE5E2DDFFE6E2DEFFE7E3DFFFE7E3DFFFE7E4DFFFE7E4DFFFE7E4DFFFE7E4
      DFFFE7E3DFFFE6E2DEFFE5E2DDFFE5E2DDFFE4E1DCFFE3E0DAFFE2DED8FFE0DC
      D6FF28282BFF69655FFF3A3A38FF333232FFD8D3CBFFCBC6BEFB000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DCAB5CFFE4B76CFFE8BA
      6AFFE0B060FFF8E0B7FFF4DDBCFFE4CFB6FFDDC5ABFFE6CDADFFF8DEB4FFF6D8
      A7FFAD6C12FFA7630CFFAB6A22FFA4621AFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C59A56F2E3B86FFFE7B969FFEDC170FFC49050FFF8E2
      C0FFFAEAD1FFFBF0DFFFFAE8CCFFF8E1BCFFF7DCADFFAECEF2FFB1CEECFF649E
      EDFF85ACDEFF4C3115AA00000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000001C57C3AEEE7964BFFE37B
      14FFE68014FFED8D19FFFCCB7DFFFED48CFFFFD58DFFFFD68DFFFFD78EFFFFD7
      8EFFFFD68FFFF9CD8DFFF6C68CFFF6C58CFFF5C48CFFF3C38DFFF2C18DFFF1BF
      8DFFEFBD8DFFEEB889FF13090151000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E6E3
      DEFFE7E4E0FFE8E6E1FFEAE7E3FFEAE7E3FFEBE8E4FFEBE8E4FFEBE8E4FFCEC9
      C1FFDAD6D1FFF4F3F2FFEBE9E7FFF3F2F0FFD0CCC5FFD7D3CCFFE4E1DBFFDEDA
      D4FF212122FF2E2E2EFF333232FFDCD7D0FFDAD5CEFFCDC8C1FB000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CEA259F5E3B5
      65FFF7D8A5FFB0C2CDFFBAD7F0FFCDE2F4FFD1E5F5FFC3DDF2FFADD0EFFFD6C3
      A0FFCB964BFFA86712FFA86822FD000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D8AA5EFBE4B566FFE0B05FFFF8DFBBFFB6CF
      E4FFCEE4F6FFDAEAF8FFD1E5F5FFB9D6EFFFCDB899FF90B5E4FF8BB7EDFF99C1
      EEFF649EEDFF87ADDEFF00000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000006E27D17FDED9C3FFFF7C3
      80FFFCCE86FFFFBF4DFFFFB323FFFFC652FFFFD783FFFFD883FFFFD884FFFFD8
      84FFFFD784FFFDD483FFFAC06BFFF9A933FFF69F23FFF4991CFFF2951BFFF094
      1EFFEC8D1AFFE98518FF7E420AC2000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000EAE7
      E3FFEBE8E4FFEBE8E5FFECEAE6FFECEAE7FFEDEBE8FFECEAE7FFE0DEDAFFAEA7
      9AFFEBE8E5FFF5F4F2FFF7F6F4FFF5F3F0FFE3E0DBFFB2ACA1FFCCC8C0FFCAC3
      B9FFF2F1EFFF242424FFDFDBD5FFDED9D3FFDCD7D0FFCEC9C3FB000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000044EC6
      89FFE1B368FF93BFE4FFA6CCEDFFB4D4F0FFB5D4F0FFACCFEEFF9BC6EAFF94BD
      DEFFAD6E19FF279E54FC00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000392F2080E1B162FFD9D1BAFFA8CD
      EDFFB8D6F0FFBFDAF1FFB9D7F0FFAACEEEFF93C2E9FFF5D095FF6EA2E6FF8BB7
      EDFF99C1EEFF649DEDFF89ADDDFF000000000000000000000000000000000000
      00000000000000000000000000000000000000000004E48616FBFAA21BFFFEAE
      1EFFFFB522FFFFC74CFFFFDB89FFFFDC89FFFFCE4EFFFFD561FFFFDC78FFFFDC
      7AFFFFDB79FFFED979FFFED387FFFFDB93FFFFDC93FFFFDD94FFFFDC95FFFFDC
      93FFFFD992FFFED692FFC17721E8000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000EBE9
      E5FFEDEBE8FFEEECE9FFEEECE9FFEFEDEAFFEFEEEBFFF1F0EEFFE0DDD8FFF9F8
      F7FFFBFBFAFFFBFBFAFFFBFBFAFFFBFBFAFFF9F8F7FFF6F5F3FFCBC5BDFFE1DF
      DAFFB6B0A4FFE3E0DAFFE2DED8FFE0DCD6FFDED9D3FFD0CBC5FB000000000000
      000000000000000000000000000000000000000000000225117C067839DF0677
      38DF067738DF067738DF067738DF067738DF067738DF067738DF067738DF46CA
      8CFF09C977FF4FC8B0FF90C0E9FF98C4EAFF97C3E9FF94C2EAFF87BBE7FF1FC9
      88FF2DD089FF079A48FE067738DF067738DF067738DF067738DF067738DF0677
      38DF067739DF067739DF066F34D70000000E0000000000000000000000000000
      00000000000000000000000000000000000000000000000000000807063192C1
      EAFF9FC8EBFFA4CBECFFA0C8EBFF93C2EAFF81B8E8FF0000000D000000006CA1
      E7FF8BB8EDFF98C0EEFF639DEDFF8FB2DFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000006020052693708C5F39C
      1BFFFFBE25FFFFC427FFFFC829FFFFCD2EFFFFD952FFFFE68EFFFFE690FFFFDC
      5FFFFFD955FFFFDB65FFFFC53BFFFFC327FFFFC729FFFFC92AFFFFC829FFFFC6
      28FFFFC026FFFFBB24FFCC8616EA000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000EEEC
      E9FFEFEEEBFFF0EFECFFF1F0EEFFF2F0EEFFC7C2BAFFD8D4CCFFF9F8F6FFF8F7
      F6FFF9F8F6FFFAF9F7FFFAF9F7FFF9F8F6FFF7F6F5FFF3F1EFFFF5F4F2FFBEB8
      ADFFB6AFA4FFE5E2DDFFE3E0DAFFE1DDD7FFDFDBD5FFD1CCC6FB000000000000
      0000000000000000000000000000000000000114095D1DB263FF1CB86AFF19B8
      69FF18BA69FF18BC6CFF19C070FF1CC274FF21C679FF29C881FF33CD88FF1DC9
      7BFF0DC673FF32BF8DFFABCFEFFFE1EDF8FFE1EEF8FFDEEBF8FF87BBE8FF0DC6
      73FF0CC471FF37CE8BFF2CCA82FF23C67BFF1CC273FF18C06FFF16BB6BFF15B8
      69FF13B766FF13B462FF16B463FF0A9F4DFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007BB4
      E6FFC4DDF3FFE9F2FAFFE8F2FAFF84B9E7FF405A70B100000000000000000000
      00006BA0E7FF8CB8EDFF98C0EEFF639DEDFF90B2DEFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000030000
      0022160B0175986010D9F9BE26FFFFD62FFFFFDB30FFFFDC30FFFFDD37FFFFE4
      5FFFFFEC91FFFFE784FFFFCD46FFD59C1EF0CF981DEECF981DEECF971DEECF96
      1CEECF961CEECB911BEC23180378000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F0EF
      ECFFF2F1EFFFF3F2F0FFF4F2F0FFEBE9E6FFC3BEB5FFF5F4F1FFF4F3F0FFF8F7
      F6FFFAF9F9FFFBFBFBFFFBFBFBFFFAF9F8FFF8F7F6FFF3F2EFFFEDEAE6FFEFED
      EAFFDFDCD8FFE6E3DEFFE5E2DDFFE3E0DAFFE1DDD7FFD2CEC8FB000000000000
      000000000000000000000000000000000000055D2CC52ABA6FFF0DB15CFF0DB3
      5EFF0DB462FF0DB664FF0EB968FF0EBB69FF0EBE6AFF0FC06DFF0FC170FF10C2
      71FF10C373FF8ED6CBFFD5E7F6FFD4E6F6FFD5E7F6FFD1E4F5FFC8E0F3FF42CB
      96FF0FC271FF0EC16FFF0EBE6CFF0DBD6AFF0DBB68FF0DB965FF0CB762FF0DB5
      60FF0CB35FFF0CB15DFF0CAF59FF1AAE5EFF0000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D2E5
      F6FFD6E8F6FFD9E9F7FFD7E8F7FFCFE3F5FF556B7EBA00000000000000000000
      0000000000006AA0E7FF8CB9EDFF97BFEEFF639CEDFF93B3DCFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000070000002E2C1A038EBF8819E8FDD930FFFFE836FFFFE8
      36FFFFE534FFFFE337FFFFE261FF2319036C0000000E0000000F0000000F0000
      000F0000000F0000000D00000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F3F1
      EFFFF5F3F1FFF5F4F3FFF6F5F4FFBDB7ADFFCEC9C1FFEEECE8FFF5F3F1FFF9F8
      F6FFFAFAF9FFFCFCFCFFFCFCFCFFFAF9F9FFF8F7F6FFF4F2F0FFEDEBE7FFE8E4
      DFFFB6AFA3FFC2BDB3FFE6E2DEFFE4E1DCFFE2DFD9FFD3CEC8FB000000000000
      000000000000000000000000000000000000055D2CC539BD78FF0DAF5DFF0EB1
      5FFF0FB563FF0FB664FF10B866FF10B968FF12BC6BFF13BD6EFF13C06FFF14C1
      71FF3BC78FFFD6E7F7FFC1DCF2FFC6DEF4FFC7DFF4FFC4DDF3FFBDD9F2FFB4D5
      F0FF13C070FF11BF6FFF11BD6DFF0FBB6AFF10B967FF0FB866FF0EB664FF0DB2
      5FFF0DB15DFF0DB05BFF0CAD59FF23B166FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BCD9F2FFC9E0
      F4FFC9E0F4FFCCE2F4FFCAE0F4FFC4DDF3FFBBD7F1FF0000000A000000000000
      00000000000000000000699FE7FF8DB9EDFF97BFEEFF629CEDFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000D0201003F412B06A3E9B1
      23F9FDE937FEFEED38FFFFE836FF3F2F08880000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F5F4
      F3FFF6F6F5FFF8F7F6FFF9F8F7FFCAC6BEFFE7E3DEFFEDEAE6FFF3F2EFFFF8F7
      F6FFFAF9F8FFFCFBFBFFFCFBFBFFFBFAF8FFF8F7F6FFF3F1EEFFECE9E5FFE6E2
      DDFFD3CDC6FFB8B2A8FFE8E5E0FFE6E2DEFFE4E1DBFFD4D0C9FB000000000000
      000000000000000000000000000000000000055D2CC550C388FF0FB05EFF10B1
      5FFF11B361FF12B565FF14B767FF14B969FF14BB6DFF15BC6EFF17BE70FF17C0
      72FFB0D2F0FFBBD8F1FFB4D5F0FFB8D6F1FFB9D7F1FFB6D6F1FFB1D3EFFFAACE
      EEFF9ACAE5FF15BD6FFF14BC6EFF13BA6AFF12B968FF11B565FF11B462FF0FB3
      61FF0EB15FFF0EAD5BFF0DAC56FF32B66EFF0000000000000000000000000000
      000000000000000000000000000000000000000000001F232766CFE4F6FFB7D5
      F0FFBCD9F1FFBED9F2FFBDD9F1FFB7D5F0FFB0D2EFFFA6CCEEFF000000000000
      0000000000000000000000000000689EE7FF8DB9EDFF97BFEEFF629CEDFFA0BE
      E7FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00130804005569460BBCE3B425F72318036E000000000100002C010000370000
      0009000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F7F6
      F5FFF9F8F7FFFAFAF9FFFBFBFBFFD2CFC9FFE3DFDAFFEBE8E4FFF1EFECFFF9F8
      F7FFFBFAF9FFFBFAFAFFFBFAFAFFFAFAF9FFF8F7F7FFF5F4F2FFEBE7E3FFE3DE
      D8FFD3CEC6FFBFB9B0FFEAE7E3FFE7E4DFFFE5E2DDFFD5D2CBFB000000000000
      000000000000000000000000000000000000035D2BC569CC9AFF11AF5FFF13B1
      60FF14B364FF15B566FF16B868FF17B96BFF19BA6EFF1BBC70FF1BBE72FF37C1
      8DFFC3DEF3FFA1C9ECFFA7CCEEFFACCFEEFFACCFEEFFAACEEEFFA5CBEDFF9EC8
      EBFF96C3EAFF19BD70FF18BB6FFF16B96BFF16B769FF15B567FF13B465FF11B1
      61FF10B05FFF10AF5DFF0EAB59FF43BB7AFF0000000000000000000000000000
      00000000000000000000000000000000000000000000A6CCEDFFC1DBF3FFAACF
      EEFFAED1EFFFB0D2EFFFAED1EFFFABCFEEFFA4CBECFF9DC7EBFF080909330000
      000000000000000000000000000000000000679EE7FF8EBAEDFF96BEEEFF619C
      EDFFA3C1E8FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000010000001600000005000000009A7B19CEFDDC31FFB17E
      17E31E13027F0000002900000005000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F9F9
      F8FFFBFBFAFFFDFDFDFFFDFDFDFFB1ABA0FFE0DBD5FFE7E3DEFFF5F3F1FFF8F7
      F6FFFAF9F8FFFBFAFAFFFBFAFAFFFAF9F8FFF8F7F6FFF6F4F2FFF2F0EDFFE0DC
      D6FFC6BFB5FFAFA89CFFEBE8E4FFE8E6E1FFE6E2DEFFD6D2CDFB000000000000
      000000000000000000000000000000000000035D2BC584D6ADFF13B060FF15B1
      62FF17B466FF19B569FF1BB86CFF1CB96EFF1CBC71FF1EBD73FF20BE75FF8BC0
      E3FFBBD9F2FF95C2EAFF9AC5EBFF9DC7EBFF9DC7EBFF9CC6EBFF97C4EBFF91C1
      E9FF8ABDE8FF37445AFF1CBC71FF1BBA6EFF1AB96CFF18B669FF16B465FF14B2
      63FF13B161FF12AF5DFF0FAC5BFF59C28BFF0000000000000000000000000000
      00000000000000000000000000000000000000000005BCD9F2FF9CC6EBFF9EC8
      EBFFA1CAEDFFA2CBECFFA1CAECFF9EC8EBFF98C4EBFF91C1E9FF7AA6CEFC0000
      00000000000000000000000000000000000000000000679EE7FF8EBAEDFF95BE
      EEFF619BEDFFA7C3E8FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A07D19D0FFE735FFFFEC
      37FFFFED38FFF2CE2DFB946411D30F0800680000001C00000001000000000000
      000000000000000000000000000000000000000000000000000000000000FBFB
      FBFFFDFDFDFFFDFDFDFFFDFDFDFFE0DEDAFFA59D90FFE2DDD7FFF7F6F4FFF9F8
      F6FFFAF9F8FFFAFAF9FFFAFAF9FFFAF9F8FFF9F8F6FFF7F6F4FFF5F4F2FFDCD6
      CFFFAFA89DFFEBE9E6FFECEAE6FFEAE7E3FFE7E4DFFFD6D3CDFB000000000000
      000000000000000000000000000000000000035D2BC59DDDBDFF16B163FF18B2
      66FF1BB568FF1CB76CFF1EB96FFF21BC72FF22BD75FF25BE78FF27C07BFF435F
      83FFB6D5F0FF88BBE7FF8DBEE8FF8FC0E9FF8FC0E9FF8EBFE8FF8ABDE8FF85B9
      E7FF81B9E8FF3C4D66FF2FB278FF1FBB72FF1DB96FFF1CB86BFF1BB569FF17B3
      65FF16B162FF14AF60FF11AC5BFF6FCA9BFF0000000000000000000000000000
      0000000000000000000000000000000000002B3544B8B5D5F1FF8ABDE8FF90C0
      E9FF93C2EAFF94C2EAFF94C2EAFF91C0E9FF8BBDE8FF85B9E7FF7CB2E0FF1D1E
      24A9000000000000000000000000000000000000000000000000669DE7FF8FBA
      EDFF95BDEEFF619BEDFFAFC3DDFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000130000
      002F000000300000003000000030000000300000002F7B5F20BEFFE980FFFFE4
      4AFFFFE333FFFFE535FFFFE635FFFFE032FFE7B123F866410BBC070400550000
      001200000000000000000000000000000000000000000000000000000000FCFC
      FCFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFF7F6F5FFDCD7D0FFFAFAF9FFFBFA
      FAFFFCFBFAFFFCFBFBFFFCFBFAFFFCFBFAFFFBFAFAFFFAFAF9FFFAF9F8FFD2CC
      C3FFE4E2DEFFEFEEEBFFEDEBE8FFEBE8E4FFE8E5E0FFD7D3CEFB000000000000
      000000000000000000000000000000000000035D2BC5B1E4CBFF1AB265FF1CB5
      69FF1DB66DFF21B970FF24BC74FF27BE77FF2ABF7BFF2CC180FF31C182FF3346
      65FF78AEDCFF7EB6E6FF80B7E6FF81B7E6FF85BCEBFF4F6B8CFF293246FF272C
      3DFF282E3FFF292E41FF3C7062FF26BD76FF23BC73FF20B96EFF1CB76CFF1BB4
      69FF19B165FF16B061FF12AD5EFF84D1A8FF0000000000000000000000000000
      000000000000000000000000000000000000314463FF72A7D4FF7EB7E6FF82B8
      E6FF85B9E7FF86BAE7FF86BBE9FF6D99C0FF435873FF212433FF242635FF2629
      39FF00000000000000000000000000000000000000000000000000000000659E
      E7FF8FBAEDFFADC2DBFFCFC3B2FFC5CACFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000005D3951BEDFFBC
      24FFFFBF26FFFFC126FFFFC226FFFFC226FFFFC126FFFFBF25FFFFCF30FFFFE2
      6FFFFFEC9AFFFFE678FFFFDD40FFFFD931FFFFD72FFFFFD32EFFFDCA2AFFDF93
      1BF83B2105A20100003D0000000C00000000000000000000000000000000FCFC
      FCFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFE3E1DDFFCDC9C2FFDED9D3FFFEFE
      FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE1DDD7FFE9E7
      E4FFEEECE9FFF1EFEDFFEEECE9FFEBE9E5FFE9E6E2FFD8D3CFFB000000000000
      00000000000000000000000000000000000003572AC0CCEEDDFF1AB468FF1FB6
      6CFF21B970FF26BC75FF29BD79FF2CC07EFF30C282FF35C487FF3FC08BFF3144
      63FF51617BFF446085FF7CB5E6FF74A8D6FF2B3850FF2A3144FF2A3144FF2A31
      44FF2A3144FF272C3EFF3F6860FF2BC07DFF28BD78FF24BA73FF21B86FFF1DB5
      6CFF1AB467FF18B164FF12AE5EFF82D0A6FF0000000000000000000000000000
      000000000000000000000000000000000000314463FF52627CFF5A83ABFF7DB6
      E6FF7DB6E6FF4C6B8FFF2B374EFF2A3144FF2A3144FF2A3144FF2A3144FF262A
      3AFF000000000000000000000000000000000000000000000000000000000000
      00008EA2BCFFEEEAE4FFD6CBBCFFCBBEAAFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000008F19E1DFCFFBA
      27FFFFC029FFFFC32BFFFFC62CFFFFC62CFFFFC42BFFFFBF28FFFFCD58FFFFDC
      70FFFFDC6BFFFFDB61FFFFDE70FFFFE596FFFFDE74FFFFCD39FFFFC427FFFFBF
      26FFFFBA23FFF6A61EFEAF6110E61509016C000000000000000000000000FCFC
      FCFFFDFDFDFFFDFDFDFFFDFDFDFFFEFEFEFFFEFEFEFFD0CCC5FFDAD7D1FFD8D3
      CBFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFD1CBC3FFEEEDEAFFE1DE
      DAFFF4F3F1FFF2F0EEFFEFEDEAFFECEAE6FFEAE7E3FFD8D4CFFB000000000000
      0000000000000000000000000000000000000000001220A55DFEBCE7D1FFC5EA
      D7FFCBECDCFFCBEDDCFFC1EAD6FFACE4C9FF8DDAB7FF6CD1A5FF57C899FF3145
      64FF314464FF4A5B76FF557CA6FF2A3348FF2A3144FF2A3347FF2A3449FF2930
      44FF272C3DFF272B3BFF6FB398FF94DCBBFFB2E6CDFFC6EBD8FFCEEDDDFFCBEC
      DCFFC5EAD7FFBBE7D1FF98D8B6FF079546F90000000000000000000000000000
      000000000000000000000000000000000000314464FF314464FF50617AFF364D
      6DFF608CB7FF2A3144FF2A3144FF2A3144FF293144FF282D3EFF272B3CFF262A
      3AFF000000000000000000000000000000000000000000000000000000000000
      000000000000B2A38CFFEAE4DCFF262D9DFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000007E99F43FCFDC9
      75FFFFCD76FFFFD077FFFFD178FFFFD178FFFFD077FFFFCE76FFFDC56AFFFFD9
      7CFFFFDA7CFFFFDB7CFFFFDB7CFFFFD56AFFFFC942FFFFD26CFFFFDC92FFFFCD
      6AFFFFB630FFFCA61AFFF19419FFB86710E6000000000000000000000000FCFC
      FCFFFDFDFDFFFDFDFDFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFF3F2F0FFD3CF
      C9FFD6D2CCFFA1998BFFABA395FFA39A8DFFE0DDD9FFC2BDB3FFF6F5F3FFF7F6
      F5FFF5F3F2FFF2F1EFFFEFEEEBFFEDEBE8FFEBE8E4FFD8D5D0FB000000000000
      0000000000000000000000000000000000000000000000000001000100180001
      00180001001800010018000100180001001800010018000100180001001C3145
      65FF314564FF314463FF374D6EFF2A3244FF2A3144FF2B344AFF2A3449FF2931
      45FF282D3EFF272A3BFF00010018000100180001001800010018000100180001
      0018000100180001001800010016000000000000000000000000000000000000
      000000000000000000000000000000000000324666FE314564FF314464FF4456
      71FF293043FF2B354CFF2A3245FF2A3144FF293144FF293043FF292F43FF1819
      1D93000000000000000000000000000000000000000000000000000000000000
      00000000000000000000292EA9FF1B22A4FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C26918EDE88E
      31FFEC9637FFEE9934FFF19B33FFF29F35FFF5A842FFF8BA64FFFAC984FFFED6
      87FFFFD787FFFFD886FFFFD886FFFFD786FFFFD686FFFFC85EFFFFAE1EFFFDB0
      2FFFF5BC71FFF4C590FFEDA558FFC96C13F1000000000000000000000000FCFC
      FCFFFDFDFDFFFDFDFDFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFE
      FEFFFCFCFCFFE9E7E4FFE0DEDAFFEAE8E6FFFCFCFCFFFDFDFDFFFAFAF9FFF8F7
      F6FFF5F4F3FFF2F1EFFFEFEEEBFFEDEBE8FFEBE8E4FFD8D5D0FB000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000004558D
      87FF314564FF314464FF2C374FFF2D3B55FF2E3D59FF2C3952FF2B354CFF2931
      45FF282D3EFF217A4EFD00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000007080A42314564FF314464FF3245
      64FF2B3449FF2D3D59FF2D3B55FF2B364EFF293246FF282E40FF272C3CFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000060300AADEEBB
      90FFEFBD8FFFF0BF8EFFF2C28FFFF3C38EFFF4C48FFFF5C68DFFF5C68DFFFCD1
      8FFFFED590FFFED68FFFFED68FFFFED58FFFFED48EFFFDD28EFFF6C27EFFE680
      14FFE37A14FFE07514FFE07B26FF2B160474000000000000000000000000FCFC
      FCFFFDFDFDFFFDFDFDFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFE
      FEFFFEFEFEFFFEFEFEFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFAFAF9FFF8F7
      F6FFF5F4F3FFF2F1EFFFEFEEEBFFEDEBE8FFEBE8E4FFD8D5D0FB000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000454C4
      90FF4D6B7DFF314463FF2B344AFF2F415FFF2E3D58FF2C3851FF2A344BFF2931
      45FF5D9086FF039642FC00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000324157E1314464FF3042
      60FF304261FF2E3F5BFF2D3B55FF2B364EFF293246FF282E3FFF000000040000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000003010025EBB7
      92FFEEC19FFFEFC39EFFF0C49FFFF1C69EFFF2C79EFFF2C79EFFF3C89EFFF4CA
      9CFFF8CF9AFFF9D09AFFFAD099FFF8CF99FFF5C997FFF0C295FFEFC095FFECB1
      7CFFDA6A10FF462105920000000900000000000000000000000000000000FCFC
      FCFFFDFDFDFFFDFDFDFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFE
      FEFFFEFEFEFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFAFAF9FFF8F7
      F6FFF5F4F3FFF2F1EFFFEFEEEBFFEDEBE8FFE0DCD7FF41403D90000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000461C6
      97FF83DBBCFF8ADDC0FF507181FF2D3E5BFF2D3C57FF2B374FFF3D4D5EFF82DA
      BCFF85DCBEFF029642FC00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000121418683142
      5FFC304260FF2E3D59FF2D3A53FF2B364CFF2A3143F200000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001909
      005B271001711F0D0164200E0165200E0165200F01631409014E1409004FD182
      43F6F2CAA5FFF3CBA5FFF2CAA4FFF0C5A3FFF0C4A3FFEEC1A0FFD9915CFA4921
      049700000000000000000000000000000000000000000000000000000000FCFC
      FCFFFDFDFDFFFDFDFDFFFDFDFDFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFE
      FEFFFEFEFEFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFAF9F8FFF7F6
      F5FFF4F3F1FFF6F5F4FFF8F7F6FFFDFDFDFF8B8986C700000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000046DCA
      9DFF92E0C4FF97E1C7FF98E1C8FF99E1C8FF97E1C8FF95E0C6FF92DFC5FF8CDE
      C1FF96E1C7FF019541FC00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0001000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006C30
      0ABBF0CBB5FFF0C9B0FFF0C9AFFFEFC7AEFFDC8C5AFF3A190489000000060000
      000000000000000000000000000000000000000000000000000000000000FCFC
      FCFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFEFEFEFFFEFEFEFFFEFEFEFFFEFE
      FEFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFBFBFBFFF9F8F7FFF6F5
      F4FFFEFEFEFFFFFFFFFFFFFFFFFFB1B1B0DC0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000477CD
      A3FFA1E3CBFFA4E4CDFFA7E5CEFFA7E5D0FFA6E5CDFFA4E4CCFFA0E3CCFF9AE1
      C8FFA5E5CFFF019541FC00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000F04
      004EF0D1C1FFEFCCBAFFD7845BFF311202810000000200000000000000000000
      000000000000000000000000000000000000000000000000000000000000FCFC
      FCFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFD
      FDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFAFAF9FFF8F7F6FFF5F4
      F3FFFEFEFEFFFFFFFFFFDDDDDCF2000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000482CF
      A8FFADE6D1FFB1E7D3FFB3E7D5FFB3E8D5FFB3E8D5FFB0E7D3FFACE6D1FFA7E4
      CEFFB4E8D6FF019540FC00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0003C06443F62E0D008000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FCFC
      FCFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFD
      FDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFBFBFAFFF9F8F7FFF6F6F5FFF4F3
      F1FFFEFEFEFFF5F5F4FD00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000488D1
      ABFFB7E9D7FFBBEAD9FFBDEADAFFBEEADAFFBCEAD9FFBBE9D8FFB6E8D7FFB1E7
      D3FFC0ECDBFF019440FC00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FBFB
      FAFFFCFCFCFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFD
      FDFFFDFDFDFFFDFDFDFFFDFDFDFFFBFBFBFFF9F9F8FFF7F7F6FFF5F4F3FFEBE9
      E6FFFBFBFAFE0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000048DD3
      ADFFC1ECDCFFC3EDDEFFC6EDDFFFC7EDDFFFC5EDDEFFC3ECDDFFC0EBDBFFBCEA
      D9FFCDEFE3FF01943FFC00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F9F8
      F7FFFAFAF9FFFCFCFCFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFD
      FDFFFDFDFDFFFCFCFCFFFBFBFAFFF9F8F7FFF7F7F6FFF5F4F3FFF4F2F0FFC5C0
      B9FE000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000016A1
      55FEF5FCF9FFEFFAF6FFF2FAF7FFF2FBF8FFF2FBF8FFF1FAF7FFEFF9F6FFECF9
      F4FFF4FCFAFF067136D800000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004E4B
      499F4E4B499F4E4C499F4E4C499F4E4C499F4E4C499F4E4C499F4E4C499F4E4C
      499F4E4C499F4E4C499F4E4C499F4E4B499F4D4B499F4D4B499F4D4B489F0000
      0004000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000F047C39E3058E42F3058E42F3058E42F3058E42F3058E42F3058E42F3058E
      42F303431FA70000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000080000000400000000100010000000000000400000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
  end
  object ADOQuery1: TADOQuery
    Connection = mo_main.ADOConnection1
    Parameters = <>
    Left = 120
    Top = 130
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 200
    Top = 106
  end
  object ADOQuery2: TADOQuery
    Connection = mo_main.ADOConnection1
    Parameters = <>
    Left = 421
    Top = 282
  end
  object ADOQuery3: TADOQuery
    Connection = mo_main.ADOConnection1
    Parameters = <>
    Left = 365
    Top = 282
  end
  object DataSource4: TDataSource
    DataSet = ADOQuery4
    Left = 248
    Top = 418
  end
  object ADOQuery4: TADOQuery
    Connection = mo_main.ADOConnection1
    Parameters = <>
    Left = 381
    Top = 554
  end
end
