unit uLoginDialog;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.jpeg,
  Vcl.ExtCtrls,
  uDialogBaseForm;

type
  TfrmLoginDialog = class(TDialogBaseForm)
    Image1: TImage;
    cxLabel1: TLabel;
    cxLabel2: TLabel;
    btnLogin: TButton;
    btnCancel: TButton;
    edUserName: TEdit;
    edPassWord: TEdit;
    btnAlterPW: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnAlterPWClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edUserNameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edPassWordKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  procedure CreateParams(var Params: TCreateParams);override;
  public
    { Public declarations }
  end;

var
  frmLoginDialog: TfrmLoginDialog;

implementation

{$R *.dfm}

uses uAlterPassWord;

procedure TfrmLoginDialog.FormCreate(Sender: TObject);
begin
  inherited;  // add
  Self.Caption := '系统登录【' + Application.Title + '】';
end;

procedure TfrmLoginDialog.FormShow(Sender: TObject);
begin
    if edUserName.CanFocus then
      edUserName.SetFocus;
end;

procedure TfrmLoginDialog.btnAlterPWClick(Sender: TObject);
var
  LUserName, LPassWord: string;
  LAlterPWForm: TfrmAlterPassWord;
begin
  LUserName := Trim(edUserName.Text);
  LPassWord := Trim(edPassWord.Text);

  if (LUserName = EmptyStr) then
    ShowMessage('请输入用户名.');

  if FSysUser.UserLogin(LUserName, LPassWord) then  begin
    LAlterPWForm := TfrmAlterPassWord.Create(Self);
    try
        LAlterPWForm.ShowModal;
    finally
      LAlterPWForm.Free;
    end;
  end
  else ShowMessage('用户名或密码不正确.');
end;

procedure TfrmLoginDialog.btnCancelClick(Sender: TObject);
begin
//
end;

procedure TfrmLoginDialog.btnLoginClick(Sender: TObject);
var
  LUserName, LPassWord: string;
begin
  LUserName := Trim(edUserName.Text);
  LPassWord := Trim(edPassWord.Text);

  if (LUserName = EmptyStr) then
    ShowMessage('请输入用户名.');

  try
    btnLogin.Enabled := False;
    if FSysUser.UserLogin(LUserName, LPassWord) then
      Self.ModalResult := mrOk
    else ShowMessage('用户名或密码不正确.');
  finally
    btnLogin.Enabled := True;
  end;
end;

procedure TfrmLoginDialog.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.WndParent := 0;
end;

procedure TfrmLoginDialog.edPassWordKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    if btnLogin.CanFocus then
      btnLogin.SetFocus;
end;

procedure TfrmLoginDialog.edUserNameKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    if edPassWord.CanFocus then
      edPassWord.SetFocus;
end;

end.


