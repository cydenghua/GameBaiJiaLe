program GameLicense;

uses
  Vcl.Forms,
  uMainLicense in 'uMainLicense.pas' {frmMainLicense},
  uLicense in '..\GameClient\RegisterLicense\uLicense.pas',
  uEncrypt in '..\GameClient\Commom\uEncrypt.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMainLicense, frmMainLicense);
  Application.Run;
end.
