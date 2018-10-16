object frmPlayerManger: TfrmPlayerManger
  Left = 0
  Top = 0
  Caption = #36873#25163#31649#29702
  ClientHeight = 601
  ClientWidth = 1105
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
    Top = 28
    Width = 297
    Height = 573
    Align = alLeft
    Caption = 'Panel1'
    TabOrder = 1
    object cxGrid3: TcxGrid
      Left = 1
      Top = 42
      Width = 295
      Height = 530
      Align = alClient
      TabOrder = 0
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
          OnCustomDrawCell = cxGrid3DBTableView1Column2CustomDrawCell
          OnGetDataText = cxGrid3DBTableView1Column2GetDataText
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
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 295
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
      object Button1: TButton
        Left = 168
        Top = 10
        Width = 75
        Height = 25
        Caption = #26597#25214
        TabOrder = 0
        OnClick = Button1Click
      end
      object cxTextEdit1: TcxTextEdit
        Left = 38
        Top = 12
        TabOrder = 1
        Width = 124
      end
    end
  end
  object Panel3: TPanel
    Left = 297
    Top = 28
    Width = 808
    Height = 573
    Align = alClient
    Caption = 'Panel3'
    TabOrder = 5
    object cxGroupBox1: TcxGroupBox
      Left = 1
      Top = 1
      Align = alTop
      Caption = #20998#25968#26126#32454
      TabOrder = 0
      Height = 248
      Width = 806
      object cxGrid1: TcxGrid
        Left = 2
        Top = 18
        Width = 802
        Height = 228
        Align = alClient
        TabOrder = 0
        object cxGrid1DBTableView1: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = DataSourceScore
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.Deleting = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.GroupByBox = False
          object cxGrid1DBTableView1Column1: TcxGridDBColumn
            Caption = #20998#25968
            DataBinding.FieldName = 'score'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            HeaderAlignmentHorz = taCenter
            Width = 84
          end
          object cxGrid1DBTableView1Column2: TcxGridDBColumn
            Caption = #31867#22411
            DataBinding.FieldName = 'scoreType'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            OnGetDisplayText = cxGrid1DBTableView1Column2GetDisplayText
            HeaderAlignmentHorz = taCenter
            Width = 97
          end
          object cxGrid1DBTableView1Column3: TcxGridDBColumn
            Caption = #26102#38388
            DataBinding.FieldName = 'happenTime'
            HeaderAlignmentHorz = taCenter
            Width = 121
          end
        end
        object cxGrid1Level1: TcxGridLevel
          GridView = cxGrid1DBTableView1
        end
      end
    end
    object cxGroupBox2: TcxGroupBox
      Left = 1
      Top = 249
      Align = alClient
      Caption = #28216#25103#26126#32454
      TabOrder = 1
      Height = 323
      Width = 806
      object cxGrid2: TcxGrid
        Left = 2
        Top = 18
        Width = 802
        Height = 303
        Align = alClient
        TabOrder = 0
        object cxGridDBTableView1: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = DataSourceGame
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.Deleting = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.GroupByBox = False
          object cxGridDBTableView1Column1: TcxGridDBColumn
            Caption = #36873#25163
            DataBinding.FieldName = 'nickName'
            HeaderAlignmentHorz = taCenter
          end
          object cxGridDBTableView1Column2: TcxGridDBColumn
            Caption = #26102#38388
            DataBinding.FieldName = 'buyTime'
            HeaderAlignmentHorz = taCenter
          end
          object cxGridDBTableView1Column3: TcxGridDBColumn
            Caption = #38772
            DataBinding.FieldName = 'currX'
            HeaderAlignmentHorz = taCenter
            Width = 50
          end
          object cxGridDBTableView1Column4: TcxGridDBColumn
            Caption = #23616
            DataBinding.FieldName = 'currJ'
            HeaderAlignmentHorz = taCenter
            Width = 50
          end
          object cxGridDBTableView1Column5: TcxGridDBColumn
            Caption = #24196
            DataBinding.FieldName = 'buyZ'
            OnGetDisplayText = cxGridDBTableView1Column5GetDisplayText
            HeaderAlignmentHorz = taCenter
            Width = 50
          end
          object cxGridDBTableView1Column6: TcxGridDBColumn
            Caption = #38386
            DataBinding.FieldName = 'buyX'
            OnGetDisplayText = cxGridDBTableView1Column5GetDisplayText
            HeaderAlignmentHorz = taCenter
            Width = 50
          end
          object cxGridDBTableView1Column7: TcxGridDBColumn
            Caption = #21644
            DataBinding.FieldName = 'buyH'
            OnGetDisplayText = cxGridDBTableView1Column5GetDisplayText
            HeaderAlignmentHorz = taCenter
            Width = 50
          end
          object cxGridDBTableView1Column8: TcxGridDBColumn
            Caption = #24196#23545
            DataBinding.FieldName = 'buyZD'
            OnGetDisplayText = cxGridDBTableView1Column5GetDisplayText
            HeaderAlignmentHorz = taCenter
            Width = 50
          end
          object cxGridDBTableView1Column9: TcxGridDBColumn
            Caption = #38386#23545
            DataBinding.FieldName = 'buyXD'
            OnGetDisplayText = cxGridDBTableView1Column5GetDisplayText
            HeaderAlignmentHorz = taCenter
            Width = 50
          end
          object cxGridDBTableView1Column10: TcxGridDBColumn
            Caption = #20013#24196
            DataBinding.FieldName = 'resZ'
            OnGetDisplayText = cxGridDBTableView1Column5GetDisplayText
            HeaderAlignmentHorz = taCenter
            Width = 50
          end
          object cxGridDBTableView1Column11: TcxGridDBColumn
            Caption = #20013#38386
            DataBinding.FieldName = 'resX'
            OnGetDisplayText = cxGridDBTableView1Column5GetDisplayText
            HeaderAlignmentHorz = taCenter
            Width = 50
          end
          object cxGridDBTableView1Column12: TcxGridDBColumn
            Caption = #20013#21644
            DataBinding.FieldName = 'resH'
            OnGetDisplayText = cxGridDBTableView1Column5GetDisplayText
            HeaderAlignmentHorz = taCenter
            Width = 50
          end
          object cxGridDBTableView1Column13: TcxGridDBColumn
            Caption = #20013#24196#23545
            DataBinding.FieldName = 'resZD'
            OnGetDisplayText = cxGridDBTableView1Column5GetDisplayText
            HeaderAlignmentHorz = taCenter
            Width = 50
          end
          object cxGridDBTableView1Column14: TcxGridDBColumn
            Caption = #20013#38386#23545
            DataBinding.FieldName = 'resXD'
            OnGetDisplayText = cxGridDBTableView1Column5GetDisplayText
            HeaderAlignmentHorz = taCenter
            Width = 50
          end
        end
        object cxGridLevel1: TcxGridLevel
          GridView = cxGridDBTableView1
        end
      end
    end
  end
  object DataSourcePlayer: TDataSource
    Left = 48
    Top = 99
  end
  object dxBarManager1: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Microsoft YaHei UI'
    Font.Style = []
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 344
    Top = 104
    DockControlHeights = (
      0
      0
      28
      0)
    object dxBarManager1Bar1: TdxBar
      Caption = 'Custom 1'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsTop
      FloatLeft = 1007
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarButton3'
        end
        item
          Visible = True
          ItemName = 'dxBarButton5'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarButton7'
        end
        item
          Visible = True
          ItemName = 'dxBarButton6'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarButton1'
        end
        item
          Visible = True
          ItemName = 'dxBarButton2'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarButton4'
        end>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxBarButton1: TdxBarButton
      Caption = #38544#34255#36873#25163
      Category = 0
      Hint = #38544#34255#36873#25163
      Visible = ivAlways
      OnClick = dxBarButton1Click
    end
    object dxBarButton2: TdxBarButton
      Caption = #21024#38500#36873#25163
      Category = 0
      Hint = #21024#38500#36873#25163
      Visible = ivAlways
      OnClick = dxBarButton2Click
    end
    object dxBarButton3: TdxBarButton
      Caption = #21047#26032#36873#25163
      Category = 0
      Hint = #21047#26032#36873#25163
      Visible = ivAlways
      OnClick = dxBarButton3Click
    end
    object dxBarButton4: TdxBarButton
      Caption = #36864#20986
      Category = 0
      Hint = #36864#20986
      Visible = ivAlways
      OnClick = dxBarButton4Click
    end
    object dxBarButton5: TdxBarButton
      Caption = #26377#20998#36873#25163
      Category = 0
      Hint = #26377#20998#36873#25163
      Visible = ivAlways
      OnClick = dxBarButton5Click
    end
    object dxBarButton6: TdxBarButton
      Caption = #20998#25968#36716#31227
      Category = 0
      Hint = #20998#25968#36716#31227
      Visible = ivAlways
      OnClick = dxBarButton6Click
    end
    object dxBarButton7: TdxBarButton
      Caption = #19978#20998#19979#20998
      Category = 0
      Hint = #19978#20998#19979#20998
      Visible = ivAlways
      OnClick = dxBarButton7Click
    end
    object dxBarSubItem1: TdxBarSubItem
      Caption = 'New SubItem'
      Category = 0
      Visible = ivAlways
      ItemLinks = <>
    end
    object dxBarButton8: TdxBarButton
      Caption = #25512#33616#20851#31995
      Category = 0
      Hint = #25512#33616#35774#32622
      Visible = ivAlways
    end
  end
  object DataSourceScore: TDataSource
    Left = 624
    Top = 120
  end
  object DataSourceGame: TDataSource
    Left = 562
    Top = 381
  end
end
