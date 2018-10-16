unit uFProgress;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFProgress = class(TForm)
    lbl1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FProgress: TFProgress;
  procedure ShowProgress(Owner: TComponent; const Title: string);
  procedure HideProgress;
  procedure UpdateProgress(const Title: string);

implementation

{$R *.dfm}

{ TFProgress }

procedure ShowProgress(Owner: TComponent; const Title: string);
begin
  if not Assigned(FProgress) then
    FProgress := TFProgress.Create(Owner);
  FProgress.lbl1.Caption := Title;
  FProgress.Show;
  FProgress.Update;
end;


procedure HideProgress;
begin
  if not Assigned(FProgress) then Exit;
  FProgress.Hide;
  Application.ProcessMessages;
  FProgress.Free;
  FProgress := nil;

end;


procedure UpdateProgress(const Title: string);
begin
  if Assigned(FProgress) then
  begin
    FProgress.lbl1.Caption := Title;
    FProgress.Update;
    Application.ProcessMessages;
  end;
end;

end.
