object frmGetPlayer: TfrmGetPlayer
  AlignWithMargins = True
  Left = 0
  Top = 0
  Caption = #36873#25321#36873#25163
  ClientHeight = 520
  ClientWidth = 479
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
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 479
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 0
    ExplicitLeft = 1
    ExplicitTop = 1
    ExplicitWidth = 295
    object Button1: TButton
      Left = 168
      Top = 10
      Width = 75
      Height = 25
      Caption = #26597#25214
      TabOrder = 0
    end
    object cxTextEdit1: TcxTextEdit
      Left = 38
      Top = 12
      TabOrder = 1
      Width = 124
    end
  end
  object cxGrid3: TcxGrid
    Left = 0
    Top = 41
    Width = 479
    Height = 423
    Align = alClient
    TabOrder = 1
    ExplicitLeft = 1
    ExplicitTop = -2
    ExplicitWidth = 295
    ExplicitHeight = 530
    object cxGrid3DBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = DataSourcePlayer
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsSelection.CellSelect = False
      OptionsView.DataRowHeight = 25
      OptionsView.GroupByBox = False
      object cxGrid3DBTableView1Column2: TcxGridDBColumn
        DataBinding.FieldName = 'isVisible'
        HeaderAlignmentHorz = taCenter
        MinWidth = 10
        Width = 10
        IsCaptionAssigned = True
      end
      object cxGrid3DBTableView1Column1: TcxGridDBColumn
        Caption = #22995#21517
        DataBinding.FieldName = 'nickName'
        HeaderAlignmentHorz = taCenter
        Width = 182
      end
      object cxGrid3DBTableView1Column3: TcxGridDBColumn
        Caption = #20998#25968
        DataBinding.FieldName = 'score'
        HeaderAlignmentHorz = taCenter
      end
    end
    object cxGrid3Level1: TcxGridLevel
      GridView = cxGrid3DBTableView1
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 464
    Width = 479
    Height = 56
    Align = alBottom
    TabOrder = 2
    object Button2: TButton
      Left = 384
      Top = 16
      Width = 75
      Height = 25
      Caption = #21462#28040
      TabOrder = 0
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 152
      Top = 16
      Width = 75
      Height = 25
      Caption = #30830#23450#36873#25321
      TabOrder = 1
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 48
      Top = 16
      Width = 75
      Height = 25
      Caption = #36873#25321#31354
      TabOrder = 2
      OnClick = Button4Click
    end
  end
  object DataSourcePlayer: TDataSource
    Left = 48
    Top = 99
  end
end
