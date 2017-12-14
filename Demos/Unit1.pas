unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uDrpForm, Vcl.StdCtrls, Vcl.Samples.Spin;

type
  TForm1 = class(TForm)
    btndropdown: TButton;
    Edit1: TEdit;
    asDropDownForm: TasDropDownForm;
    btndropdownEX: TButton;
    rb_lefttoright: TRadioButton;
    rb_righttoleft: TRadioButton;
    Label1: TLabel;
    Label2: TLabel;
    sp_Topspace: TSpinEdit;
    Label3: TLabel;
    sp_SideSpace: TSpinEdit;
    Label4: TLabel;
    Label5: TLabel;
    rb_center: TRadioButton;
    procedure btndropdownClick(Sender: TObject);
    procedure btndropdownEXClick(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure sp_TopspaceChange(Sender: TObject);
    procedure sp_SideSpaceChange(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  Unit2, Unit3, Unit4;

{$R *.dfm}

procedure TForm1.btndropdownClick(Sender: TObject);
begin
 if rb_lefttoright.Checked then
    asDropDownForm.DropDownDirection := ddLeftToRight;
  if rb_righttoleft.Checked then
    asDropDownForm.DropDownDirection := ddRightToLeft;
  if rb_center.Checked then
    asDropDownForm.DropDownDirection := ddCenter ;



asDropDownForm.DoDropDown;
end;

procedure TForm1.btndropdownEXClick(Sender: TObject);
begin
 if rb_lefttoright.Checked then
   asDropDownForm.DoDropDownEx( btndropdownEX , Form4);
  if rb_righttoleft.Checked then
    asDropDownForm.DoDropDownEx( btndropdownEX , Form4, ddRightToLeft);
  if rb_center.Checked then
        asDropDownForm.DoDropDownEx( btndropdownEX , Form4, ddCenter);

end;

procedure TForm1.Edit1Click(Sender: TObject);
begin

 if rb_lefttoright.Checked then
   asDropDownForm.DoDropDownEx( Edit1 , Form3);
  if rb_righttoleft.Checked then
    asDropDownForm.DoDropDownEx( Edit1 , Form3, ddRightToLeft);
     if rb_center.Checked then
     asDropDownForm.DoDropDownEx( Edit1 , Form3, ddCenter);
end;

procedure TForm1.sp_SideSpaceChange(Sender: TObject);
begin
  asDropDownForm.SpaceSide := sp_SideSpace.Value;
end;

procedure TForm1.sp_TopspaceChange(Sender: TObject);
begin
  asDropDownForm.SpaceTop := sp_Topspace.Value;
end;

end.
