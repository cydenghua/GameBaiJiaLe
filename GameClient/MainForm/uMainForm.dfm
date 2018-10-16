object frmMainForm: TfrmMainForm
  Left = 200
  Top = 249
  ClientHeight = 607
  ClientWidth = 1178
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 27
    Width = 223
    Height = 580
    Align = alLeft
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 0
    object cxGrid3: TcxGrid
      Left = 1
      Top = 1
      Width = 221
      Height = 391
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
        OptionsView.Header = False
        object cxGrid3DBTableView1Column2: TcxGridDBColumn
          DataBinding.FieldName = 'isVisible'
          OnCustomDrawCell = cxGrid3DBTableView1Column2CustomDrawCell
          OnGetDataText = cxGrid3DBTableView1Column2GetDataText
          MinWidth = 10
          Width = 10
        end
        object cxGrid3DBTableView1Column1: TcxGridDBColumn
          DataBinding.FieldName = 'nickName'
          Width = 200
        end
        object cxGrid3DBTableView1Column3: TcxGridDBColumn
          DataBinding.FieldName = 'score'
        end
      end
      object cxGrid3Level1: TcxGridLevel
        GridView = cxGrid3DBTableView1
      end
    end
    object Panel6: TPanel
      Left = 1
      Top = 504
      Width = 221
      Height = 75
      Align = alBottom
      TabOrder = 1
      object Label2: TLabel
        Left = 27
        Top = 14
        Width = 12
        Height = 13
        Caption = #31532
      end
      object Label3: TLabel
        Left = 90
        Top = 16
        Width = 36
        Height = 13
        Caption = #38772'    '#31532
      end
      object Label4: TLabel
        Left = 171
        Top = 16
        Width = 12
        Height = 13
        Caption = #23616
      end
      object Button8: TButton
        Left = 27
        Top = 40
        Width = 75
        Height = 25
        Caption = #36827#20837#19979#19968#38772
        TabOrder = 0
        OnClick = Button8Click
      end
      object Button9: TButton
        Left = 114
        Top = 40
        Width = 75
        Height = 25
        Caption = #20462#25913#38772#23616
        TabOrder = 1
        OnClick = Button9Click
      end
      object cxDBSpinEdit1: TcxDBSpinEdit
        Left = 45
        Top = 11
        DataBinding.DataField = 'currX'
        DataBinding.DataSource = DataSourceGameCurr
        Enabled = False
        Properties.OnChange = cxDBSpinEdit1PropertiesChange
        TabOrder = 2
        Width = 42
      end
      object cxDBSpinEdit2: TcxDBSpinEdit
        Left = 127
        Top = 11
        DataBinding.DataField = 'currJ'
        DataBinding.DataSource = DataSourceGameCurr
        Enabled = False
        Properties.OnChange = cxDBSpinEdit1PropertiesChange
        TabOrder = 3
        Width = 42
      end
    end
    object Panel7: TPanel
      Left = 1
      Top = 392
      Width = 221
      Height = 112
      Align = alBottom
      TabOrder = 2
      object Button1: TButton
        Left = 114
        Top = 6
        Width = 75
        Height = 25
        Caption = #26597#25214
        TabOrder = 0
        OnClick = Button1Click
      end
      object cxTextEdit1: TcxTextEdit
        Left = 18
        Top = 8
        TabOrder = 1
        Width = 91
      end
      object Button2: TButton
        Left = 16
        Top = 38
        Width = 75
        Height = 25
        Caption = #21047#26032#36873#25163
        TabOrder = 2
        OnClick = Button2Click
      end
      object Button4: TButton
        Left = 114
        Top = 39
        Width = 75
        Height = 25
        Caption = #32622#39030#36873#25163
        TabOrder = 3
        OnClick = Button4Click
      end
      object Button5: TButton
        Left = 16
        Top = 71
        Width = 75
        Height = 25
        Caption = #38544#34255#36873#25163
        TabOrder = 4
        OnClick = Button5Click
      end
      object Button6: TButton
        Left = 114
        Top = 72
        Width = 75
        Height = 25
        Caption = #19978#20998#19979#20998
        TabOrder = 5
        OnClick = Button6Click
      end
    end
  end
  object Panel2: TPanel
    Left = 223
    Top = 27
    Width = 298
    Height = 580
    Align = alLeft
    Caption = 'Panel2'
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 1
    object cxGrid1: TcxGrid
      Left = 1
      Top = 1
      Width = 296
      Height = 408
      Align = alClient
      BevelInner = bvNone
      BevelOuter = bvNone
      TabOrder = 0
      object cxGrid1DBTableView1: TcxGridDBTableView
        PopupMenu = PopupMenu1
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = DataSourceMessage
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsData.Deleting = False
        OptionsData.Editing = False
        OptionsSelection.CellSelect = False
        OptionsView.DataRowHeight = 25
        OptionsView.GroupByBox = False
        OptionsView.HeaderHeight = 30
        object cxGrid1DBTableView1Column1: TcxGridDBColumn
          Caption = #26102#38388
          DataBinding.FieldName = 'createTime'
          PropertiesClassName = 'TcxTimeEditProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
          Width = 80
        end
        object cxGrid1DBTableView1Column2: TcxGridDBColumn
          Caption = #36873#25163
          DataBinding.FieldName = 'nickName'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          HeaderAlignmentHorz = taCenter
        end
        object cxGrid1DBTableView1Column3: TcxGridDBColumn
          Caption = #28040#24687
          DataBinding.FieldName = 'content'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          HeaderAlignmentHorz = taCenter
          Width = 145
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = cxGrid1DBTableView1
      end
    end
    object TPanel
      Left = 1
      Top = 498
      Width = 296
      Height = 81
      Align = alBottom
      BevelOuter = bvNone
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
      object Button10: TButton
        Left = 112
        Top = 6
        Width = 75
        Height = 25
        Caption = #21047#26032#28040#24687
        TabOrder = 0
        OnClick = Button10Click
      end
      object CheckBox1: TCheckBox
        Left = 208
        Top = 8
        Width = 73
        Height = 17
        Caption = #26174#31034#25152#26377
        TabOrder = 1
        OnClick = CheckBox1Click
      end
      object Button3: TButton
        Left = 20
        Top = 6
        Width = 75
        Height = 25
        Caption = #32842#22825#35760#24405
        TabOrder = 2
        OnClick = Button3Click
      end
      object Button11: TButton
        Left = 20
        Top = 41
        Width = 75
        Height = 25
        Caption = #30331#24405#24494#20449
        TabOrder = 3
        OnClick = Button11Click
      end
      object Button15: TButton
        Left = 112
        Top = 41
        Width = 75
        Height = 25
        Caption = #40655#36148#28040#24687
        TabOrder = 4
        OnClick = Button15Click
      end
    end
    object MemoMsgLog: TMemo
      Left = 1
      Top = 409
      Width = 296
      Height = 89
      Align = alBottom
      TabOrder = 2
    end
  end
  object Panel3: TPanel
    Left = 521
    Top = 27
    Width = 352
    Height = 580
    Align = alLeft
    Caption = 'Panel3'
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 2
    object cxGrid2: TcxGrid
      Left = 1
      Top = 1
      Width = 350
      Height = 497
      Align = alClient
      TabOrder = 0
      object cxGrid2DBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = DataSourceBuyCurr
        DataController.DetailKeyFieldNames = 'playerId'
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            DisplayText = 'total'
          end
          item
            Format = '#'
            Kind = skSum
            Column = cxGrid2DBTableView1Column2
          end
          item
            Format = '#'
            Kind = skSum
            Column = cxGrid2DBTableView1Column3
          end
          item
            Format = '#'
            Kind = skSum
            Column = cxGrid2DBTableView1Column4
          end
          item
            Format = '#'
            Kind = skSum
            Column = cxGrid2DBTableView1Column5
          end
          item
            Format = '#'
            Kind = skSum
            Column = cxGrid2DBTableView1Column6
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsData.Deleting = False
        OptionsView.DataRowHeight = 25
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        OptionsView.HeaderHeight = 30
        object cxGrid2DBTableView1Column1: TcxGridDBColumn
          Caption = #38772#23616
          DataBinding.FieldName = 'nickName'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.ReadOnly = True
          HeaderAlignmentHorz = taCenter
          HeaderGlyphAlignmentHorz = taCenter
          Width = 90
        end
        object cxGrid2DBTableView1Column2: TcxGridDBColumn
          Caption = #38386
          DataBinding.FieldName = 'buyX'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          OnGetDataText = cxGrid2DBTableView1Column2GetDataText
          HeaderAlignmentHorz = taCenter
          Width = 50
        end
        object cxGrid2DBTableView1Column3: TcxGridDBColumn
          Caption = #24196
          DataBinding.FieldName = 'buyZ'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          OnGetDataText = cxGrid2DBTableView1Column2GetDataText
          HeaderAlignmentHorz = taCenter
          Width = 50
        end
        object cxGrid2DBTableView1Column4: TcxGridDBColumn
          Caption = #38386#23545
          DataBinding.FieldName = 'buyXD'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          OnGetDataText = cxGrid2DBTableView1Column2GetDataText
          HeaderAlignmentHorz = taCenter
          Width = 50
        end
        object cxGrid2DBTableView1Column5: TcxGridDBColumn
          Caption = #24196#23545
          DataBinding.FieldName = 'buyZD'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          OnGetDataText = cxGrid2DBTableView1Column2GetDataText
          HeaderAlignmentHorz = taCenter
          Width = 50
        end
        object cxGrid2DBTableView1Column6: TcxGridDBColumn
          Caption = #21644
          DataBinding.FieldName = 'buyH'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          OnGetDataText = cxGrid2DBTableView1Column2GetDataText
          HeaderAlignmentHorz = taCenter
          Width = 50
        end
      end
      object cxGrid2Level1: TcxGridLevel
        GridView = cxGrid2DBTableView1
      end
    end
    object Panel4: TPanel
      Left = 1
      Top = 498
      Width = 350
      Height = 81
      Align = alBottom
      BevelOuter = bvNone
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
      object cxGroupBox1: TcxGroupBox
        Left = 16
        Top = 6
        Caption = #25163#21160#24320#22870
        TabOrder = 0
        Height = 72
        Width = 202
        object cxRadioButton1: TcxRadioButton
          Left = 22
          Top = 20
          Width = 43
          Height = 17
          Caption = #24196
          TabOrder = 0
        end
        object cxRadioButton2: TcxRadioButton
          Left = 84
          Top = 21
          Width = 35
          Height = 17
          Caption = #38386
          TabOrder = 1
        end
        object cxRadioButton3: TcxRadioButton
          Left = 149
          Top = 20
          Width = 35
          Height = 17
          Caption = #21644
          TabOrder = 2
        end
        object cxCheckBox1: TcxCheckBox
          Left = 23
          Top = 43
          Caption = #24196#23545
          TabOrder = 3
          Width = 50
        end
        object cxCheckBox2: TcxCheckBox
          Left = 120
          Top = 43
          Caption = #38386#23545
          TabOrder = 4
          Width = 55
        end
      end
      object Button12: TButton
        Left = 256
        Top = 46
        Width = 75
        Height = 25
        Caption = #24320#22870#35745#31639
        TabOrder = 1
        OnClick = Button12Click
      end
      object Button13: TButton
        Left = 256
        Top = 6
        Width = 75
        Height = 25
        Caption = #25237#27880#25130#22270
        TabOrder = 2
        OnClick = Button13Click
      end
    end
  end
  object Panel5: TPanel
    Left = 873
    Top = 27
    Width = 304
    Height = 580
    Align = alLeft
    Caption = 'Panel5'
    TabOrder = 7
    object cxGrid4: TcxGrid
      Left = 1
      Top = 1
      Width = 302
      Height = 497
      Align = alClient
      TabOrder = 0
      object cxGrid4DBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = DataSourcePlayerScore
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
          end
          item
            Format = '#'
            Kind = skSum
            FieldName = 'currScore'
            Column = cxGrid4DBTableView1Column2
          end
          item
            Format = '#'
            Kind = skSum
            Column = cxGrid4DBTableView1Column3
          end
          item
            Format = '#'
            Kind = skSum
            Column = cxGrid4DBTableView1Column4
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsData.Deleting = False
        OptionsData.Editing = False
        OptionsSelection.CellSelect = False
        OptionsView.DataRowHeight = 25
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        OptionsView.HeaderHeight = 30
        object cxGrid4DBTableView1Column1: TcxGridDBColumn
          Caption = #38772#23616
          DataBinding.FieldName = 'nickName'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
        end
        object cxGrid4DBTableView1Column2: TcxGridDBColumn
          Caption = #26412#23616#24471#20998
          DataBinding.FieldName = 'currScore'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
        end
        object cxGrid4DBTableView1Column3: TcxGridDBColumn
          Caption = #21097#20313#20998
          DataBinding.FieldName = 'score'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
        end
        object cxGrid4DBTableView1Column4: TcxGridDBColumn
          Caption = #21021#22987#20998
          DataBinding.FieldName = 'beginScore'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
        end
      end
      object cxGrid4Level1: TcxGridLevel
        GridView = cxGrid4DBTableView1
      end
    end
    object TPanel
      Left = 1
      Top = 498
      Width = 302
      Height = 81
      Align = alBottom
      BevelOuter = bvNone
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
      object Button14: TButton
        Left = 208
        Top = 10
        Width = 75
        Height = 25
        Caption = #20998#25968#25130#22270
        TabOrder = 0
        OnClick = Button14Click
      end
      object Button7: TButton
        Left = 208
        Top = 41
        Width = 75
        Height = 25
        Caption = #36827#20837#19979#19968#23616
        TabOrder = 1
        OnClick = Button7Click
      end
      object Button16: TButton
        Left = 17
        Top = 46
        Width = 75
        Height = 25
        Caption = #30005#23376#36335#21333
        TabOrder = 2
        OnClick = Button16Click
      end
    end
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
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = ''
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 408
    Top = 96
    DockControlHeights = (
      0
      0
      27
      0)
    object dxBarManager1Bar1: TdxBar
      Caption = 'Main'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsTop
      FloatLeft = 671
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarSubItem10'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarSubItem14'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarSubItem11'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarSubItem13'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarButton9'
        end>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxBarSubItem5: TdxBarSubItem
      Caption = #30382#32932#31649#29702
      Category = 0
      Visible = ivAlways
      ItemLinks = <>
    end
    object dxBarButton9: TdxBarButton
      Action = actExit
      Category = 0
    end
    object cxBarEditItem1: TcxBarEditItem
      Caption = #29992#25143#65306'admin'
      Category = 0
      Hint = #29992#25143#65306'admin'
      Visible = ivAlways
      PropertiesClassName = 'TcxLabelProperties'
    end
    object dxBarButton24: TdxBarButton
      Category = 0
      Visible = ivAlways
    end
    object dxBarSubItem1: TdxBarSubItem
      Caption = #31995#32479#31649#29702
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarLargeButton1'
        end>
    end
    object dxBarSubItem2: TdxBarSubItem
      Caption = 'New SubItem'
      Category = 0
      Visible = ivAlways
      ItemLinks = <>
    end
    object dxBarSubItem3: TdxBarSubItem
      Caption = 'New SubItem'
      Category = 0
      Visible = ivAlways
      ItemLinks = <>
    end
    object dxBarLargeButton1: TdxBarLargeButton
      Category = 0
      Visible = ivAlways
    end
    object dxBarLargeButton2: TdxBarLargeButton
      Caption = #24178#37096#20449#24687
      Category = 0
      Hint = #24178#37096#20449#24687
      Visible = ivAlways
    end
    object dxBarLargeButton3: TdxBarLargeButton
      Caption = 'New Button'
      Category = 0
      Hint = 'New Button'
      Visible = ivAlways
    end
    object dxBarSubItem4: TdxBarSubItem
      Caption = 'New SubItem'
      Category = 0
      Visible = ivAlways
      ItemLinks = <>
    end
    object dxBarSubItem6: TdxBarSubItem
      Caption = #24178#37096#20449#24687
      Category = 0
      Visible = ivAlways
      ItemLinks = <>
    end
    object dxBarSubItem7: TdxBarSubItem
      Category = 0
      Visible = ivAlways
      ItemLinks = <>
    end
    object dxBarButton1: TdxBarButton
      Category = 0
      Visible = ivAlways
    end
    object dxBarSubItem8: TdxBarSubItem
      Caption = #25968#25454#23548#20837
      Category = 0
      Visible = ivAlways
      ItemLinks = <>
    end
    object dxBarButton2: TdxBarButton
      Category = 0
      Visible = ivAlways
    end
    object dxBarButton3: TdxBarButton
      Action = actConfig
      Category = 0
    end
    object dxBarButton4: TdxBarButton
      Action = actDisclaimer
      Category = 0
    end
    object dxBarButton5: TdxBarButton
      Action = actDailyReport
      Category = 0
    end
    object dxBarSubItem9: TdxBarSubItem
      Caption = 'New SubItem'
      Category = 0
      Visible = ivAlways
      ItemLinks = <>
    end
    object dxBarButton6: TdxBarButton
      Action = actReportShow
      Category = 0
    end
    object dxBarSubItem10: TdxBarSubItem
      Caption = #31995#32479#35774#32622
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarButton7'
        end
        item
          Visible = True
          ItemName = 'dxBarButton8'
        end
        item
          Visible = True
          ItemName = 'dxBarButton14'
        end
        item
          Visible = True
          ItemName = 'dxBarButton10'
        end>
    end
    object dxBarButton7: TdxBarButton
      Action = actConfig
      Category = 0
    end
    object dxBarButton8: TdxBarButton
      Action = actPlayerManager
      Category = 0
    end
    object dxBarButton10: TdxBarButton
      Action = actRegister
      Category = 0
    end
    object dxBarButton11: TdxBarButton
      Caption = #30382#32932#35774#32622
      Category = 0
      Visible = ivAlways
    end
    object dxBarButton12: TdxBarButton
      Caption = 'New Button'
      Category = 0
      Hint = 'New Button'
      Visible = ivAlways
    end
    object dxBarSubItem11: TdxBarSubItem
      Caption = #30382#32932#35774#32622
      Category = 0
      Visible = ivAlways
      ItemLinks = <>
    end
    object dxBarSubItem12: TdxBarSubItem
      Action = actHelp
      Category = 0
      ItemLinks = <>
    end
    object dxBarButton13: TdxBarButton
      Action = actHelp
      Category = 0
    end
    object dxBarButton14: TdxBarButton
      Action = actPlayerFromInfo
      Category = 0
    end
    object dxBarSubItem13: TdxBarSubItem
      Caption = #31995#32479#24110#21161
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarButton15'
        end
        item
          Visible = True
          ItemName = 'dxBarButton16'
        end
        item
          Visible = True
          ItemName = 'dxBarButton17'
        end
        item
          Visible = True
          ItemName = 'dxBarButton21'
        end>
    end
    object dxBarButton15: TdxBarButton
      Action = actDisclaimer
      Category = 0
    end
    object dxBarButton16: TdxBarButton
      Action = actHelp
      Category = 0
    end
    object dxBarButton17: TdxBarButton
      Action = actInitSystem
      Category = 0
    end
    object dxBarSubItem14: TdxBarSubItem
      Caption = #25968#25454#31649#29702
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarButton18'
        end
        item
          Visible = True
          ItemName = 'dxBarButton20'
        end
        item
          Visible = True
          ItemName = 'dxBarButton19'
        end>
    end
    object dxBarSubItem15: TdxBarSubItem
      Action = actDailyReport
      Category = 0
      ItemLinks = <>
    end
    object dxBarSubItem16: TdxBarSubItem
      Action = actReportShow
      Category = 0
      ItemLinks = <>
    end
    object dxBarSubItem17: TdxBarSubItem
      Action = actBackUpDatabase
      Category = 0
      ItemLinks = <>
    end
    object dxBarButton18: TdxBarButton
      Action = actDailyReport
      Category = 0
    end
    object dxBarSubItem18: TdxBarSubItem
      Caption = 'New SubItem'
      Category = 0
      Visible = ivAlways
      ItemLinks = <>
    end
    object dxBarButton19: TdxBarButton
      Action = actBackUpDatabase
      Category = 0
    end
    object dxBarButton20: TdxBarButton
      Action = actReportShow
      Category = 0
    end
    object dxBarButton21: TdxBarButton
      Action = actExecSql
      Category = 0
    end
  end
  object MainAction: TActionList
    Left = 304
    Top = 96
    object actExit: TAction
      Caption = #36864#20986#31995#32479
      OnExecute = actExitExecute
    end
    object actConfig: TAction
      Caption = #21442#25968#35774#32622
      OnExecute = actConfigExecute
    end
    object actReportShow: TAction
      Caption = #32479#35745#26597#35810
      OnExecute = actReportShowExecute
    end
    object actRegister: TAction
      Caption = #31995#32479#27880#20876
      OnExecute = actRegisterExecute
    end
    object actDailyReport: TAction
      Caption = #26085#32467#32479#35745
      OnExecute = actDailyReportExecute
    end
    object actDisclaimer: TAction
      Caption = #20813#36131#26465#27454
      OnExecute = actDisclaimerExecute
    end
    object actHelp: TAction
      Caption = #20351#29992#35828#26126
      OnExecute = actHelpExecute
    end
    object actPlayerManager: TAction
      Caption = #36873#25163#35774#32622
      OnExecute = actPlayerManagerExecute
    end
    object actPlayerFromInfo: TAction
      Caption = #36873#25163#20851#31995
      OnExecute = actPlayerFromInfoExecute
    end
    object actInitSystem: TAction
      Caption = #31995#32479#21021#22987#21270
      OnExecute = actInitSystemExecute
    end
    object actBackUpDatabase: TAction
      Caption = #25968#25454#22791#20221
      OnExecute = actBackUpDatabaseExecute
    end
    object actExecSql: TAction
      Caption = #25968#25454#26597#35810
      OnExecute = actExecSqlExecute
    end
  end
  object DataSourcePlayer: TDataSource
    Left = 48
    Top = 99
  end
  object DataSourceGameCurr: TDataSource
    Left = 96
    Top = 491
  end
  object DataSourceMessage: TDataSource
    Left = 295
    Top = 323
  end
  object DataSourceBuyCurr: TDataSource
    Left = 584
    Top = 200
  end
  object DataSourcePlayerScore: TDataSource
    Left = 929
    Top = 211
  end
  object frxReportBuyCurr: TfrxReport
    Version = '5.1.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42879.003354305600000000
    ReportOptions.LastChange = 42879.003354305600000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 577
    Top = 259
    Datasets = <
      item
        DataSet = frxDBDatasetBuyCurr
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 165.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 256
      Frame.Color = clRed
      EndlessHeight = True
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 37.795275590000000000
        Top = 18.897650000000000000
        Width = 623.622450000000000000
        object Memo8: TfrxMemoView
          Width = 151.181102360000000000
          Height = 37.795275590000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = clSilver
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset1."currX"]'#38772'[frxDBDataset1."currJ"]'#23616)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 151.181200000000000000
          Width = 94.488188980000000000
          Height = 37.795275590551200000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = clSilver
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = 13408512
          HAlign = haCenter
          Memo.UTF8W = (
            #38386)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 245.567100000000000000
          Width = 94.488188980000000000
          Height = 37.795275590551200000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = clSilver
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = 35071
          HAlign = haCenter
          Memo.UTF8W = (
            #24196)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 340.157480314961000000
          Width = 94.488188976378000000
          Height = 37.795275590551200000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = clSilver
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #38386#23545)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 434.645669291339000000
          Width = 94.488188976378000000
          Height = 37.795275590551200000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = clSilver
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #24196#23545)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 529.133858270000000000
          Width = 94.488188980000000000
          Height = 37.795275590551200000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = clSilver
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = 39270
          HAlign = haCenter
          Memo.UTF8W = (
            #21644)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 30.236220470000000000
        Top = 117.165430000000000000
        Width = 623.622450000000000000
        DataSet = frxDBDatasetBuyCurr
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object Memo2: TfrxMemoView
          Width = 151.181102360000000000
          Height = 30.236220470000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = 13421772
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset1."nickName"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Left = 151.181200000000000000
          Width = 94.488188980000000000
          Height = 30.236220470000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 13408512
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = 13421772
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8W = (
            '[frxDBDataset1."buyX"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 245.567100000000000000
          Width = 94.488188980000000000
          Height = 30.236220470000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 35071
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = 13421772
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8W = (
            '[frxDBDataset1."buyZ"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 340.157480310000000000
          Width = 94.488188980000000000
          Height = 30.236220470000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = 13421772
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8W = (
            '[frxDBDataset1."buyXD"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 434.645669291339000000
          Width = 94.488188976378000000
          Height = 30.236220472441000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = 13421772
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8W = (
            '[frxDBDataset1."buyZD"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 529.133858270000000000
          Width = 94.488188980000000000
          Height = 30.236220472441000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 39270
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = 13421772
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8W = (
            '[frxDBDataset1."buyH"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 37.795275590551200000
        Top = 207.874150000000000000
        Width = 623.622450000000000000
        object Memo1: TfrxMemoView
          Width = 151.181102360000000000
          Height = 37.795275590000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = 13421772
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #24635#35745)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 151.181200000000000000
          Width = 94.488188980000000000
          Height = 37.795275590000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 13408512
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = 13421772
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8W = (
            '[SUM(<frxDBDataset1."buyX">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 245.567100000000000000
          Width = 94.488188980000000000
          Height = 37.795275590000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 35071
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = 13421772
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8W = (
            '[SUM(<frxDBDataset1."buyZ">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 340.157480310000000000
          Width = 94.488188980000000000
          Height = 37.795275590000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = 13421772
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8W = (
            '[SUM(<frxDBDataset1."buyXD">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 434.645669290000000000
          Width = 94.488188980000000000
          Height = 37.795275590000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = 13421772
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8W = (
            '[SUM(<frxDBDataset1."buyZD">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 529.133858270000000000
          Width = 94.488188980000000000
          Height = 37.795275590000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 39270
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = 13421772
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8W = (
            '[SUM(<frxDBDataset1."buyH">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object frxDBDatasetBuyCurr: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSource = DataSourceBuyCurr
    BCDToCurrency = False
    Left = 577
    Top = 315
  end
  object frxJPEGExport1: TfrxJPEGExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    JPEGQuality = 100
    Left = 769
    Top = 219
  end
  object frxReportPlayerSocre: TfrxReport
    Version = '5.1.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42879.369987523150000000
    ReportOptions.LastChange = 42913.924260069440000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 929
    Top = 267
    Datasets = <
      item
        DataSet = frxDBDatasetPlayerScore
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 125.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 256
      EndlessHeight = True
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 37.795275590000000000
        Top = 18.897650000000000000
        Width = 472.441250000000000000
        object Memo8: TfrxMemoView
          Width = 151.181102360000000000
          Height = 37.795275590000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = clSilver
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset1."currX"]'#38772'[frxDBDataset1."currJ"]'#23616)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 151.181200000000000000
          Width = 113.385826771653500000
          Height = 37.795275590000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = clSilver
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = 13408512
          HAlign = haCenter
          Memo.UTF8W = (
            #26412#23616#24471#20998)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 264.566929133858300000
          Width = 113.385826771653500000
          Height = 37.795275590000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = clSilver
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = 35071
          HAlign = haCenter
          Memo.UTF8W = (
            #21097#20313#20998)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 377.952755905511800000
          Width = 113.385826771653500000
          Height = 37.795275590000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = clSilver
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = 39270
          HAlign = haCenter
          Memo.UTF8W = (
            #21021#22987#20998)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 30.236220470000000000
        Top = 117.165430000000000000
        Width = 472.441250000000000000
        DataSet = frxDBDatasetPlayerScore
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object Memo2: TfrxMemoView
          Width = 151.181102360000000000
          Height = 30.236220470000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = 13421772
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset1."nickName"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Left = 151.181200000000000000
          Width = 113.385826770000000000
          Height = 30.236220470000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 13408512
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = 13421772
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8W = (
            '[frxDBDataset1."currScore"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 264.566929130000000000
          Width = 113.385826770000000000
          Height = 30.236220470000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 35071
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = 13421772
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8W = (
            '[frxDBDataset1."score"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 377.952755910000000000
          Width = 113.385826770000000000
          Height = 30.236220470000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 39270
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = 13421772
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8W = (
            '[frxDBDataset1."beginScore"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 37.795275590000000000
        Top = 207.874150000000000000
        Width = 472.441250000000000000
        object Memo1: TfrxMemoView
          Width = 151.181102360000000000
          Height = 37.795275590000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = 13421772
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #24635#35745)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 151.181200000000000000
          Width = 113.385826770000000000
          Height = 37.795275590000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 13408512
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = 13421772
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8W = (
            '[SUM(<frxDBDataset1."currScore">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 264.566929130000000000
          Width = 113.385826770000000000
          Height = 37.795275590000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 35071
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = 13421772
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8W = (
            '[SUM(<frxDBDataset1."score">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 377.952755910000000000
          Width = 113.385826770000000000
          Height = 37.795275590000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 39270
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = 13421772
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.UTF8W = (
            '[SUM(<frxDBDataset1."beginScore">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object frxDBDatasetPlayerScore: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    BCDToCurrency = False
    Left = 929
    Top = 323
  end
  object PopupMenu1: TPopupMenu
    Left = 312
    Top = 208
    object popSetEnd: TMenuItem
      Caption = #35774#20026#32467#26463
      OnClick = popSetEndClick
    end
  end
  object SaveDialog1: TSaveDialog
    Left = 144
    Top = 131
  end
end
