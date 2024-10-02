object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object PaintBox1: TPaintBox
    Left = 0
    Top = 8
    Width = 425
    Height = 433
  end
  object Edit1: TEdit
    Left = 456
    Top = 56
    Width = 121
    Height = 23
    TabOrder = 0
    Text = 'Edit1'
  end
  object Edit2: TEdit
    Left = 456
    Top = 85
    Width = 121
    Height = 23
    TabOrder = 1
    Text = 'Edit2'
  end
  object Edit3: TEdit
    Left = 456
    Top = 114
    Width = 121
    Height = 23
    TabOrder = 2
    Text = 'Edit3'
  end
  object Button1: TButton
    Left = 456
    Top = 304
    Width = 75
    Height = 25
    Caption = 'Los'
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 456
    Top = 335
    Width = 75
    Height = 25
    Caption = 'Stop'
    TabOrder = 4
    OnClick = Button2Click
  end
  object StaticText1: TStaticText
    Left = 456
    Top = 8
    Width = 121
    Height = 25
    Caption = 'Mandel Brot App'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
  end
  object RadioButton1: TRadioButton
    Left = 456
    Top = 152
    Width = 57
    Height = 17
    Caption = 'Hinweis'
    TabOrder = 6
    OnClick = RadioButton1Click
  end
end
