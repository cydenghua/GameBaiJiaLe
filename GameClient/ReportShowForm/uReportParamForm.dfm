object frmReportParam: TfrmReportParam
  Left = 0
  Top = 0
  Caption = #21442#25968#35774#32622
  ClientHeight = 379
  ClientWidth = 401
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
    Top = 329
    Width = 401
    Height = 50
    Align = alBottom
    TabOrder = 0
    object Button1: TButton
      Left = 46
      Top = 7
      Width = 96
      Height = 35
      Caption = #30830#23450
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 214
      Top = 7
      Width = 96
      Height = 35
      Caption = #21462#28040
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object DataSource1: TDataSource
    Left = 216
    Top = 32
  end
end
