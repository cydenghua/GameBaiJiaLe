object frmGameConfig: TfrmGameConfig
  Left = 0
  Top = 0
  Caption = #21442#25968#35774#32622
  ClientHeight = 590
  ClientWidth = 746
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
    Top = 509
    Width = 746
    Height = 81
    Align = alBottom
    TabOrder = 0
    ExplicitTop = 292
    ExplicitWidth = 646
    object Button1: TButton
      Left = 368
      Top = 24
      Width = 95
      Height = 34
      Caption = #20445#23384
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 504
      Top = 24
      Width = 95
      Height = 34
      Caption = #36864#20986
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 0
    Width = 746
    Height = 509
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 646
    ExplicitHeight = 292
    object cxGrid1DBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = DataSource1
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Deleting = False
      OptionsView.DataRowHeight = 25
      OptionsView.GroupByBox = False
      OptionsView.HeaderHeight = 30
      object cxGrid1DBTableView1Column1: TcxGridDBColumn
        Caption = #21442#25968#21517
        DataBinding.FieldName = 'description'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Width = 192
      end
      object cxGrid1DBTableView1Column2: TcxGridDBColumn
        Caption = #21442#25968#20540
        DataBinding.FieldName = 'value'
        HeaderAlignmentHorz = taCenter
        Width = 132
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object DataSource1: TDataSource
    Left = 152
    Top = 96
  end
end
