object frmExecSql: TfrmExecSql
  Left = 0
  Top = 0
  Caption = #25968#25454#26597#35810
  ClientHeight = 645
  ClientWidth = 1009
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1009
    Height = 41
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 264
      Top = 13
      Width = 3
      Height = 13
    end
    object Button1: TButton
      Left = 1
      Top = 1
      Width = 120
      Height = 39
      Align = alLeft
      Caption = #26597#35810
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 121
      Top = 1
      Width = 120
      Height = 39
      Align = alLeft
      Caption = #25191#34892
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 241
      Top = 1
      Width = 120
      Height = 39
      Align = alLeft
      Caption = 'pw'
      TabOrder = 2
      OnClick = Button3Click
      ExplicitLeft = 289
      ExplicitTop = -4
    end
  end
  object Memo1: TMemo
    Left = 0
    Top = 41
    Width = 1009
    Height = 168
    Align = alTop
    Lines.Strings = (
      ''
      ''
      'select * from sqlite_master order by type desc  ')
    TabOrder = 1
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 209
    Width = 1009
    Height = 436
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    TabOrder = 2
    object cxGrid1DBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = DataSource1
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsSelection.InvertSelect = False
      OptionsSelection.MultiSelect = True
      OptionsSelection.CellMultiSelect = True
      OptionsView.DataRowHeight = 25
      OptionsView.GroupByBox = False
      OptionsView.HeaderHeight = 30
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object DataSource1: TDataSource
    Left = 280
    Top = 296
  end
end
