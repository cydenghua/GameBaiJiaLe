unit uAlterPassWord;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  uCommonBaseForm;

type
  TfrmAlterPassWord = class(TCommonBaseForm)
    Label1: TLabel;
    Label2: TLabel;
    edtPw1: TEdit;
    edtPw2: TEdit;
    Button1: TButton;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAlterPassWord: TfrmAlterPassWord;

implementation

{$R *.dfm}

procedure TfrmAlterPassWord.Button1Click(Sender: TObject);
var
  s1, s2: string;
begin
  s1 := edtPw1.Text;
  s2 := edtPw2.Text;
  if s1 <> s2 then
  begin
    ShowMessage('两次密码输入不一致，重新输入.');
    Exit;
  end else
  begin
    if not FSysUser.AlterUserPW(s1) then
      ShowMessage('修改密码错误！');
  end;
  ModalResult := mrOk;
end;

procedure TfrmAlterPassWord.Button2Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmAlterPassWord.FormCreate(Sender: TObject);
begin
  inherited;
  edtPw1.Text := EmptyStr;
  edtPw2.Text := EmptyStr;
end;


end.
