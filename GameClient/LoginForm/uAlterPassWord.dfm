object frmAlterPassWord: TfrmAlterPassWord
  Left = 0
  Top = 0
  Caption = #20462#25913#23494#30721
  ClientHeight = 192
  ClientWidth = 382
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
  object Label1: TLabel
    Left = 71
    Top = 46
    Width = 60
    Height = 13
    Caption = #36755#20837#23494#30721#65306
  end
  object Label2: TLabel
    Left = 71
    Top = 78
    Width = 60
    Height = 13
    Caption = #20877#27425#36755#20837#65306
  end
  object edtPw1: TEdit
    Left = 137
    Top = 43
    Width = 121
    Height = 21
    PasswordChar = '*'
    TabOrder = 0
    Text = 'edtPw1'
  end
  object edtPw2: TEdit
    Left = 136
    Top = 76
    Width = 121
    Height = 21
    PasswordChar = '*'
    TabOrder = 1
    Text = 'edtPw2'
  end
  object Button1: TButton
    Left = 136
    Top = 125
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 240
    Top = 125
    Width = 75
    Height = 25
    Cancel = True
    Caption = #21462#28040
    TabOrder = 3
    OnClick = Button2Click
  end
end
