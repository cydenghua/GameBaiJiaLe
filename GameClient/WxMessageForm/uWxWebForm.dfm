object frmWxWeb: TfrmWxWeb
  Left = 0
  Top = 0
  Caption = #24494#20449'web'
  ClientHeight = 810
  ClientWidth = 969
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object WebBrowser1: TWebBrowser
    Left = 0
    Top = 0
    Width = 969
    Height = 752
    Align = alClient
    TabOrder = 0
    ExplicitTop = -6
    ControlData = {
      4C00000026640000B94D00000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126208000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
  object Panel1: TPanel
    Left = 0
    Top = 752
    Width = 969
    Height = 58
    Align = alBottom
    Caption = 'Panel1'
    TabOrder = 1
    object Edit1: TEdit
      Left = 120
      Top = 18
      Width = 585
      Height = 21
      TabOrder = 0
      Text = 'Edit1'
    end
    object Button1: TButton
      Left = 29
      Top = 16
      Width = 75
      Height = 25
      Caption = #21457#36865
      TabOrder = 1
      OnClick = Button1Click
    end
  end
end
