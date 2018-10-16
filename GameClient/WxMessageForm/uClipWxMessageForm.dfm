object frmClipWxMessage: TfrmClipWxMessage
  Left = 0
  Top = 0
  Caption = #24494#20449#28040#24687
  ClientHeight = 606
  ClientWidth = 609
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 0
    Top = 0
    Width = 609
    Height = 553
    Align = alClient
    Lines.Strings = (
      'Memo1')
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 553
    Width = 609
    Height = 53
    Align = alBottom
    BevelOuter = bvNone
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 1
    object Button1: TButton
      Left = 272
      Top = 6
      Width = 113
      Height = 43
      Caption = #30830#23450
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 424
      Top = 6
      Width = 113
      Height = 43
      Caption = #21462#28040
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 24
      Top = 6
      Width = 113
      Height = 43
      Caption = #21047#26032
      TabOrder = 2
      OnClick = Button3Click
    end
  end
end
