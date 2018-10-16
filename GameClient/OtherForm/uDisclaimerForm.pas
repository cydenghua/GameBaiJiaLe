unit uDisclaimerForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  uBaseForm;

type
  TfrmDisclaimer = class(TBaseForm)
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDisclaimer: TfrmDisclaimer;

implementation

{$R *.dfm}

procedure TfrmDisclaimer.FormCreate(Sender: TObject);
begin
//  Label1.Caption := '';
end;

end.
