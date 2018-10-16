unit uRegisterForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  uLicense;

type
  TfrmRegister = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label2: TLabel;
    Button1: TButton;
    Label3: TLabel;
    Label4: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    FLicense: TLicense;
  public
    { Public declarations }
  end;

var
  frmRegister: TfrmRegister;

implementation

{$R *.dfm}


procedure TfrmRegister.FormCreate(Sender: TObject);
begin
  FLicense := TLicense.Create();
  Edit1.Text := FLicense.GetEncLocalKey;

  if 1 = FLicense.CheckLicense then  begin
    Label3.Caption := '已注册';
    Label3.Visible := True;

    Label2.Visible := False;
    Edit2.Visible := False;
    Button1.Visible := False;
  end;
end;

procedure TfrmRegister.Button1Click(Sender: TObject);
begin
  if FLicense.RegLocaLic(Trim(Edit2.Text)) then  begin
    ShowMessage('注册成功，重启软件后生效');
  end else  begin
    ShowMessage('注册失败，请联系客服人员');
  end;
end;

end.
