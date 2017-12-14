object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'DropDownForm'
  ClientHeight = 466
  ClientWidth = 814
  Color = 16119285
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 72
    Top = 17
    Width = 52
    Height = 13
    Caption = 'Direction : '
  end
  object Label2: TLabel
    Left = 72
    Top = 102
    Width = 31
    Height = 13
    Caption = 'Test : '
  end
  object Label3: TLabel
    Left = 312
    Top = 17
    Width = 44
    Height = 13
    Caption = 'Spaces : '
  end
  object Label4: TLabel
    Left = 414
    Top = 17
    Width = 28
    Height = 13
    Caption = 'Top : '
  end
  object Label5: TLabel
    Left = 415
    Top = 48
    Width = 27
    Height = 13
    Caption = 'Side :'
  end
  object btndropdown: TButton
    Left = 331
    Top = 99
    Width = 129
    Height = 22
    Caption = 'Dropdown'
    TabOrder = 0
    OnClick = btndropdownClick
  end
  object Edit1: TEdit
    Left = 144
    Top = 99
    Width = 176
    Height = 21
    TabOrder = 1
    Text = 'Click me '
    OnClick = Edit1Click
  end
  object btndropdownEX: TButton
    Left = 470
    Top = 99
    Width = 97
    Height = 22
    Caption = 'DropdownEx'
    TabOrder = 2
    OnClick = btndropdownEXClick
  end
  object rb_lefttoright: TRadioButton
    Left = 144
    Top = 16
    Width = 113
    Height = 17
    Caption = 'Left to Right '
    Checked = True
    TabOrder = 3
    TabStop = True
  end
  object rb_righttoleft: TRadioButton
    Left = 144
    Top = 56
    Width = 113
    Height = 17
    Caption = 'Right to Left'
    TabOrder = 4
  end
  object sp_Topspace: TSpinEdit
    Left = 448
    Top = 14
    Width = 121
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 5
    Value = 0
    OnChange = sp_TopspaceChange
  end
  object sp_SideSpace: TSpinEdit
    Left = 448
    Top = 45
    Width = 121
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 6
    Value = 0
    OnChange = sp_SideSpaceChange
  end
  object rb_center: TRadioButton
    Left = 144
    Top = 36
    Width = 113
    Height = 17
    Caption = 'Center'
    TabOrder = 7
  end
  object asDropDownForm: TasDropDownForm
    Control = btndropdown
    DropDownForm = Form2.Owner
    Left = 16
    Top = 16
  end
end
