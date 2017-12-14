unit uDrpForm;

interface

uses
  System.SysUtils, System.Classes, vcl.Forms, vcl.Controls, vcl.StdCtrls,
  System.Types;

type
  TDropDirection = (ddLeftToRight, ddRightToLeft);

  TasDropDownForm = class(TComponent)
  private
    FMyForm: TForm;
    FMyControl: TWinControl;
    FatoClose: Boolean;
    FSpaceTop: SmallInt;
    FSpaceSide: SmallInt;
    FDropDownDirection: TDropDirection;
    { Private declarations }
  protected
    { Protected declarations }
  public
    constructor Create(AOwner: TComponent); override;
    procedure FormDeactivate(Sender: Tobject);
    procedure DoDropDown;
    procedure DoDropDownEx(AControl: TWinControl; AForm: TForm ; ADropDownDirection: TDropDirection = ddLeftToRight);
  published
    property AutoCloseForm: Boolean Read FatoClose write FatoClose default True;
    property Control: TWinControl Read FMyControl write FMyControl;
    property DropDownForm: TForm Read FMyForm write FMyForm;
    property SpaceSide: SmallInt Read FSpaceSide write FSpaceSide default 0;
    property SpaceTop: SmallInt Read FSpaceTop write FSpaceTop default 0;
    property DropDownDirection: TDropDirection Read FDropDownDirection write FDropDownDirection
      default ddLeftToRight;

     { Published declarations }
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Anoirsoft', [TasDropDownForm]);
end;

{ TasDropDownForm }

constructor TasDropDownForm.Create(AOwner: TComponent);
begin

  inherited;
  AutoCloseForm := True;

end;

procedure TasDropDownForm.DoDropDown;
var
  pt: TPoint;
begin
  if Assigned(FMyForm) and Assigned(FMyControl)  then
  begin

    pt := FMyControl.ClientToScreen(Point(0, 0));

    if AutoCloseForm then
      FMyForm.OnDeactivate := FormDeactivate;

    if FMyForm.Visible then
    begin
      FMyForm.Visible := false;
    end;

    FMyForm.BorderStyle := bsNone;

    FMyForm.Top := pt.y + FMyControl.Height + FSpaceTop;

    case FDropDownDirection of
      ddLeftToRight:

        FMyForm.Left := pt.X + FSpaceSide;

      ddRightToLeft:

          FMyForm.Left := pt.X - FMyForm.Width + FMyControl.Width -
            FSpaceSide;
    end;

    FMyForm.Show;

  end;
end;

procedure TasDropDownForm.DoDropDownEx(AControl: TWinControl; AForm: TForm;
  ADropDownDirection: TDropDirection);
var
  pt: TPoint;
begin
  if Assigned(AControl) and Assigned(AForm)  then
  begin

    pt := AControl.ClientToScreen(Point(0, 0));

    if AutoCloseForm then
      AForm.OnDeactivate := FormDeactivate;

    if AForm.Visible then
    begin
      AForm.Visible := false;
    end;

    AForm.BorderStyle := bsNone;

    AForm.Top := pt.y + AControl.Height + FSpaceTop;

    case ADropDownDirection of
      ddLeftToRight:

        AForm.Left := pt.X + FSpaceSide;

      ddRightToLeft:

          AForm.Left := pt.X - AForm.Width + AControl.Width -
            FSpaceSide;
    end;

    AForm.Show;

  end;

end;

procedure TasDropDownForm.FormDeactivate(Sender: Tobject);
begin
  (Sender as TForm).Close;
end;

end.
