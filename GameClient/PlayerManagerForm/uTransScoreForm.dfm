object frmTransScore: TfrmTransScore
  Left = 0
  Top = 0
  Caption = #36716#31227#20998#25968
  ClientHeight = 498
  ClientWidth = 490
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 490
    Height = 121
    Align = alTop
    TabOrder = 0
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
      Left = 276
      Top = 85
      Width = 75
      Height = 25
      Caption = #30830#23450#36716#31227
      TabOrder = 0
      OnClick = Button1Click
    end
    object cxTextEdit1: TcxTextEdit
      Left = 26
      Top = 87
      TabOrder = 1
      Width = 124
    end
    object Button2: TButton
      Left = 156
      Top = 85
      Width = 75
      Height = 25
      Caption = #26597#25214
      TabOrder = 2
      OnClick = Button2Click
    end
  end
  object cxGrid3: TcxGrid
    Left = 0
    Top = 121
    Width = 490
    Height = 377
    Align = alClient
    TabOrder = 1
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
  object DataSourcePlayer: TDataSource
    Left = 112
    Top = 195
  end
end
