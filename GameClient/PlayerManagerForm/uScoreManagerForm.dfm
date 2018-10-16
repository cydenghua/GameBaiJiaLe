object frmScoreManager: TfrmScoreManager
  Left = 0
  Top = 0
  Caption = #31215#20998#35774#32622
  ClientHeight = 397
  ClientWidth = 429
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object cxGrid1: TcxGrid
    Left = 0
    Top = 142
    Width = 429
    Height = 214
    Align = alClient
    TabOrder = 0
    ExplicitTop = 113
    ExplicitHeight = 219
    object cxGrid1DBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = DataSource1
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
        OnGetDataText = cxGrid1DBTableView1Column2GetDataText
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 429
    Height = 142
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 52
      Top = 26
      Width = 60
      Height = 13
      Caption = #24403#21069#36873#25163#65306
    end
    object Label2: TLabel
      Left = 116
      Top = 19
      Width = 88
      Height = 25
      Caption = #36229#32423#36873#25163
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 52
      Top = 57
      Width = 60
      Height = 13
      Caption = #24403#21069#20998#25968#65306
    end
    object Label4: TLabel
      Left = 116
      Top = 50
      Width = 78
      Height = 25
      Caption = '000000'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Button1: TButton
      Left = 48
      Top = 98
      Width = 75
      Height = 25
      Caption = #19978#20998
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 160
      Top = 98
      Width = 75
      Height = 25
      Caption = #19979#20998
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 284
      Top = 98
      Width = 75
      Height = 25
      Caption = #36865#20998
      TabOrder = 2
      Visible = False
      OnClick = Button3Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 356
    Width = 429
    Height = 41
    Align = alBottom
    TabOrder = 2
    ExplicitTop = 332
    object Button4: TButton
      Left = 284
      Top = 8
      Width = 75
      Height = 25
      Caption = #36864#20986
      TabOrder = 0
      OnClick = Button4Click
    end
  end
  object DataSource1: TDataSource
    Left = 72
    Top = 240
  end
end
