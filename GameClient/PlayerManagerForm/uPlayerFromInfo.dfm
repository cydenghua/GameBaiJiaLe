object frmPlayerFormInfo: TfrmPlayerFormInfo
  Left = 0
  Top = 0
  Caption = #36873#25163#25512#33616#20851#31995
  ClientHeight = 544
  ClientWidth = 883
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
  object cxGrid3: TcxGrid
    Left = 0
    Top = 41
    Width = 883
    Height = 503
    Align = alClient
    TabOrder = 0
    ExplicitTop = 40
    object cxGrid3DBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      OnCellDblClick = cxGrid3DBTableView1CellDblClick
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
        OnCustomDrawCell = cxGrid3DBTableView1Column2CustomDrawCell
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
        Width = 111
      end
      object cxGrid3DBTableView1Column4: TcxGridDBColumn
        Caption = #25512#33616#20154
        DataBinding.FieldName = 'fromNickName'
        HeaderAlignmentHorz = taCenter
        Width = 170
      end
      object cxGrid3DBTableView1Column5: TcxGridDBColumn
        Caption = #36820#28857
        DataBinding.FieldName = 'fromBack'
        HeaderAlignmentHorz = taCenter
        Width = 162
      end
    end
    object cxGrid3Level1: TcxGridLevel
      GridView = cxGrid3DBTableView1
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 883
    Height = 41
    Align = alTop
    TabOrder = 1
    ExplicitLeft = 328
    ExplicitTop = 224
    ExplicitWidth = 185
    object 双击表格设置: TLabel
      Left = 32
      Top = 14
      Width = 160
      Height = 13
      Caption = #21452#20987#34920#26684#35774#32622','#28857#20987#34920#22836#21487#25490#24207
    end
    object Button1: TButton
      Left = 248
      Top = 9
      Width = 153
      Height = 25
      Caption = #36864#20986
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object DataSourcePlayer: TDataSource
    Left = 56
    Top = 107
  end
end
