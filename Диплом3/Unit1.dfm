object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 425
  ClientWidth = 803
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 248
    Top = 25
    Width = 41
    Height = 13
    Caption = 'email log'
  end
  object Label2: TLabel
    Left = 248
    Top = 59
    Width = 46
    Height = 13
    Caption = 'password'
  end
  object Label3: TLabel
    Left = 193
    Top = 109
    Width = 97
    Height = 13
    Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100' '#1087#1077#1088#1074#1099#1084
  end
  object Label4: TLabel
    Left = 8
    Top = 25
    Width = 173
    Height = 13
    Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1085#1091#1078#1085#1091#1102' '#1089#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1100
  end
  object ComboBox1: TComboBox
    Left = 8
    Top = 56
    Width = 193
    Height = 21
    TabOrder = 0
    Text = #1057#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1100
    OnChange = ComboBox1Change
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 160
    Width = 795
    Height = 257
    DataSource = DataSource1
    DrawingStyle = gdsGradient
    ImeMode = imOpen
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnTitleClick = DBGrid1TitleClick
  end
  object Button1: TButton
    Left = 682
    Top = 8
    Width = 105
    Height = 49
    Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100
    TabOrder = 2
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 435
    Top = 22
    Width = 241
    Height = 105
    Lines.Strings = (
      #1042#1074#1077#1076#1080#1090#1077' '#1089#1102#1076#1072' '#1090#1077#1082#1089#1090' '#1089#1086#1086#1073#1097#1077#1085#1080#1103)
    TabOrder = 3
  end
  object Edit1: TEdit
    Left = 296
    Top = 22
    Width = 121
    Height = 21
    TabOrder = 4
    Text = #1042#1074#1077#1076#1080#1090#1077' '#1083#1086#1075#1080#1085' '#1087#1086#1095#1090#1099
  end
  object Edit2: TEdit
    Left = 296
    Top = 56
    Width = 133
    Height = 21
    BevelInner = bvNone
    TabOrder = 5
    Text = #1042#1074#1077#1076#1080#1090#1077' '#1087#1072#1088#1086#1083#1100' '#1087#1086#1095#1090#1099
  end
  object Edit3: TEdit
    Left = 296
    Top = 106
    Width = 121
    Height = 21
    NumbersOnly = True
    TabOrder = 6
    Text = '0'
    OnKeyPress = Edit3KeyPress
  end
  object Button2: TButton
    Left = 8
    Top = 96
    Width = 97
    Height = 41
    Caption = #1055#1086#1080#1089#1082' '#1089#1090#1091#1076#1077#1085#1090#1072
    TabOrder = 7
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 601
    Top = 129
    Width = 75
    Height = 25
    Caption = 'no email'
    TabOrder = 8
    OnClick = Button3Click
  end
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Data Source='#1050#1091#1088#1089#1086 +
      #1074#1072#1103' '#1041#1044' (1).mdb;Mode=Share Deny None;Persist Security Info=False;' +
      'Jet OLEDB:System database="";Jet OLEDB:Registry Path="";Jet OLED' +
      'B:Database Password="";Jet OLEDB:Engine Type=5;Jet OLEDB:Databas' +
      'e Locking Mode=1;Jet OLEDB:Global Partial Bulk Ops=2;Jet OLEDB:G' +
      'lobal Bulk Transactions=1;Jet OLEDB:New Database Password="";Jet' +
      ' OLEDB:Create System Database=False;Jet OLEDB:Encrypt Database=F' +
      'alse;Jet OLEDB:Don'#39't Copy Locale on Compact=False;Jet OLEDB:Comp' +
      'act Without Replica Repair=False;Jet OLEDB:SFP=False'
    LoginPrompt = False
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 440
    Top = 200
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 368
    Top = 200
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 512
    Top = 200
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery2
    Left = 600
    Top = 200
  end
end
