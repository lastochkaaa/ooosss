object Form1: TForm1
  Left = 156
  Top = 144
  Width = 563
  Height = 287
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 16
    Top = 16
    Width = 121
    Height = 57
    Caption = 'rename'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 16
    Top = 88
    Width = 121
    Height = 57
    Caption = 'maxinfo'
    TabOrder = 1
    OnClick = Button2Click
  end
  object ListBox1: TListBox
    Left = 152
    Top = 16
    Width = 385
    Height = 217
    ItemHeight = 13
    TabOrder = 2
  end
  object Button3: TButton
    Left = 16
    Top = 160
    Width = 121
    Height = 65
    Caption = 'write'
    TabOrder = 3
    OnClick = Button3Click
  end
end
