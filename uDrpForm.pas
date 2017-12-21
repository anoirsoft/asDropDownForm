unit uDrpForm;

interface

uses
{$IF CompilerVersion > 18}
  System.SysUtils, System.Classes, vcl.Forms, vcl.Controls, vcl.StdCtrls,
  System.Types, Winapi.Windows;
{$ELSE}
  SysUtils, Classes, Forms, Controls, StdCtrls, Types, Windows;
{$IFEND}

type
  TAnimationStyle = (asSlide, asBlend);
  TSlideDirection = (sdTopBottom, sdLeftRight, sdRightLeft);
  TAsAnimation = class(TPersistent)
  private
    FAniActive: boolean;
    FAnimationStyle: TAnimationStyle;
    FAnimationDelay: Integer;
    FSlideDirection: TSlideDirection;
  protected

  public
    procedure Assign(Other: TPersistent); override;

  published
    property Active: boolean read FAniActive write FAniActive default true;
    property AnimationStyle: TAnimationStyle read FAnimationStyle
      write FAnimationStyle default asSlide;
    property AnimationDelay: Integer read FAnimationDelay write FAnimationDelay
      default 150;
    property SlideDirection : TSlideDirection read FSlideDirection write  FSlideDirection default sdTopBottom;
  end;

  TDropDirection = (ddLeftToRight, ddCenter, ddRightToLeft);

  TasDropDownForm = class(TComponent)
  private
    FMyForm: TForm;
    FMyControl: TWinControl;
    FatoClose: boolean;
    FSpaceTop: SmallInt;
    FSpaceSide: SmallInt;
    FDropDownDirection: TDropDirection;
    FAnimation: TAsAnimation;
    FShadow: boolean;
    procedure SetProps(const Value: TAsAnimation);
    { Private declarations }
  protected
    { Protected declarations }
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure FormDeactivate(Sender: Tobject);
    procedure DoDropDown;
    procedure DoDropDownEx(AControl: TWinControl; AForm: TForm;
      ADropDownDirection: TDropDirection = ddLeftToRight);
  published
    property AutoCloseForm: boolean Read FatoClose write FatoClose default true;
    property Control: TWinControl Read FMyControl write FMyControl;
    property DropDownForm: TForm Read FMyForm write FMyForm;
    property SpaceSide: SmallInt Read FSpaceSide write FSpaceSide default 0;
    property SpaceTop: SmallInt Read FSpaceTop write FSpaceTop default 0;
    property DropDownDirection: TDropDirection Read FDropDownDirection
      write FDropDownDirection default ddLeftToRight;
    property FormAnimation: TAsAnimation read FAnimation write SetProps;
    property Shadow: boolean read FShadow Write FShadow default true;
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

  // TasDropDownForm
  AutoCloseForm := true;
  Shadow := true;

  // FAnimation
  FAnimation := TAsAnimation.Create;
  FAnimation.FAniActive := true;
  FAnimation.FAnimationDelay := 150;
  FAnimation.FAnimationStyle := asSlide;
  FAnimation.SlideDirection := sdTopBottom;
end;

destructor TasDropDownForm.Destroy;
begin
  FAnimation.Free;
  inherited;
end;

procedure TasDropDownForm.DoDropDown;
var
  pt: TPoint;
begin
  if Assigned(FMyForm) and Assigned(FMyControl) then
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

        FMyForm.Left := pt.X - FMyForm.Width + FMyControl.Width - FSpaceSide;

      ddCenter:
        FMyForm.Left := pt.X - (FMyForm.Width - FMyControl.Width) div 2;

    end;

    FMyForm.FormStyle := fsStayOnTop;

    if not(FShadow) then
      SetClassLong(FMyForm.Handle, GCL_STYLE, GetClassLong(FMyForm.Handle,
        GCL_STYLE) and not CS_DROPSHADOW)
    else
      SetClassLong(FMyForm.Handle, GCL_STYLE, GetClassLong(FMyForm.Handle,
        GCL_STYLE) or CS_DROPSHADOW);

    with FAnimation do
    begin
      if Active = true then
      begin
        case FAnimationStyle of
          asSlide:  begin
                case FSlideDirection of
                  sdTopBottom : AnimateWindow(FMyForm.Handle, FAnimationDelay, AW_VER_POSITIVE or AW_SLIDE);
                  sdLeftRight : AnimateWindow(FMyForm.Handle, FAnimationDelay, AW_HOR_POSITIVE or AW_SLIDE);
                  sdRightLeft : AnimateWindow(FMyForm.Handle, FAnimationDelay, AW_HOR_NEGATIVE or AW_SLIDE);
                end;
           end;
          asBlend:
            AnimateWindow(FMyForm.Handle, FAnimationDelay,
              AW_BLEND or AW_SLIDE);
        end;
      end;
    end;

    FMyForm.Show;
  end;
end;

procedure TasDropDownForm.DoDropDownEx(AControl: TWinControl; AForm: TForm;
  ADropDownDirection: TDropDirection);
var
  pt: TPoint;
begin
  if Assigned(AControl) and Assigned(AForm) then
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

        AForm.Left := pt.X - AForm.Width + AControl.Width - FSpaceSide;

      ddCenter:
        AForm.Left := pt.X - (AForm.Width - AControl.Width) div 2;

    end;

    AForm.FormStyle := fsStayOnTop;
    if not(FShadow) then
      SetClassLong(AForm.Handle, GCL_STYLE, GetClassLong(AForm.Handle,
        GCL_STYLE) and not CS_DROPSHADOW)
    else
      SetClassLong(AForm.Handle, GCL_STYLE, GetClassLong(AForm.Handle,
        GCL_STYLE) or CS_DROPSHADOW);

    with FAnimation do
    begin
      if Active then
      begin
        case FAnimationStyle of
          asSlide:  begin
                case FSlideDirection of
                  sdTopBottom : AnimateWindow(AForm.Handle, FAnimationDelay, AW_VER_POSITIVE or AW_SLIDE);
                  sdLeftRight : AnimateWindow(AForm.Handle, FAnimationDelay, AW_HOR_POSITIVE or AW_SLIDE);
                  sdRightLeft : AnimateWindow(AForm.Handle, FAnimationDelay, AW_HOR_NEGATIVE or AW_SLIDE);
                end;
           end;
          asBlend:
            AnimateWindow(AForm.Handle, FAnimationDelay, AW_BLEND or AW_SLIDE);
        end;
      end;
    end;
    AForm.Show;



  end;

end;

procedure TasDropDownForm.FormDeactivate(Sender: Tobject);
begin

  with FAnimation do
  begin
    if Active then
    begin
      case FAnimationStyle of
          asSlide:  begin
                case FSlideDirection of
                  sdTopBottom : AnimateWindow((Sender as TForm).Handle, FAnimationDelay, AW_VER_NEGATIVE or AW_HIDE);
                  sdLeftRight : AnimateWindow((Sender as TForm).Handle, FAnimationDelay, AW_HOR_NEGATIVE or AW_HIDE);
                  sdRightLeft : AnimateWindow((Sender as TForm).Handle, FAnimationDelay, AW_HOR_POSITIVE or AW_HIDE);
                end;

           end;
        asBlend:
          AnimateWindow((Sender as TForm).Handle, FAnimationDelay,
            AW_BLEND or AW_HIDE);
      end;
    end;
  end;

  (Sender as TForm).Close;
end;

procedure TasDropDownForm.SetProps(const Value: TAsAnimation);
begin
  FAnimation.Assign(Value);
end;

{ TAsAnimation }

procedure TAsAnimation.Assign(Other: TPersistent);
begin
  if Other is TAsAnimation then
  begin
    FAniActive := TAsAnimation(Other).FAniActive;
    FAnimationStyle := TAsAnimation(Other).FAnimationStyle;
    FAnimationDelay :=   TAsAnimation(Other).FAnimationDelay;
    FSlideDirection :=   TAsAnimation(Other).FSlideDirection;
  end
  else
    inherited
end;

end.
