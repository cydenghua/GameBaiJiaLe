object frmWxMessage: TfrmWxMessage
  Left = 0
  Top = 0
  Caption = #24494#20449#32842#22825#35760#24405
  ClientHeight = 569
  ClientWidth = 870
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
  object cxGrid1: TcxGrid
    Left = 0
    Top = 0
    Width = 870
    Height = 569
    Align = alClient
    TabOrder = 0
    object cxGrid1DBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = DataSource1
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsView.DataRowHeight = 25
      OptionsView.GroupByBox = False
      OptionsView.HeaderHeight = 30
      object cxGrid1DBTableView1Column1: TcxGridDBColumn
        Caption = #21457#36865#20154
        DataBinding.FieldName = 'nickName'
        HeaderAlignmentHorz = taCenter
        Width = 122
      end
      object cxGrid1DBTableView1Column2: TcxGridDBColumn
        Caption = #26102#38388
        DataBinding.FieldName = 'createTime'
        HeaderAlignmentHorz = taCenter
        Width = 157
      end
      object cxGrid1DBTableView1Column3: TcxGridDBColumn
        Caption = #20869#23481
        DataBinding.FieldName = 'content'
        HeaderAlignmentHorz = taCenter
        Width = 571
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object DataSource1: TDataSource
    Left = 280
    Top = 256
  end
end
