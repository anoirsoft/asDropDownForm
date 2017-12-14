object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'Form3'
  ClientHeight = 304
  ClientWidth = 295
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    295
    304)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 48
    Width = 40
    Height = 13
    Caption = 'Search :'
  end
  object Label2: TLabel
    Left = 16
    Top = 9
    Width = 85
    Height = 33
    Caption = 'Form 3'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 16
    Top = 67
    Width = 265
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
  end
  object ListBox1: TListBox
    Left = 16
    Top = 94
    Width = 265
    Height = 187
    ItemHeight = 13
    Items.Strings = (
      'Example 1'
      'Example 2'
      'Example 3'
      'Example 4'
      'Example 5'
      'Example 6'
      'Example 7'
      'Example 8'
      'Example 9')
    TabOrder = 1
  end
end
