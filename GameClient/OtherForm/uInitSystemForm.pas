unit uInitSystemForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseForm, Vcl.StdCtrls;

type
  TfrmInitSystem = class(TBaseForm)
    Edit1: TEdit;
    Label1: TLabel;
    Button1: TButton;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInitSystem: TfrmInitSystem;

implementation

{$R *.dfm}

procedure TfrmInitSystem.Button1Click(Sender: TObject);
var
  LStrPW: string;
begin
  LStrPW := 'gameinit110';
  if LStrPW.Equals(Edit1.Text)  then  begin
    if Application.MessageBox('确定初始化系统，删除所有数据？', '', MB_YESNO + MB_ICONWARNING) = IDYES
      then
    begin
      FSysDataBase.AutoBackUpDatabase;
      FSysDataBase.ExecSQL('delete from daily_count');
      FSysDataBase.ExecSQL('delete from game_buy');
      FSysDataBase.ExecSQL('delete from game_buy_curr');
      FSysDataBase.ExecSQL('delete from game_buy_detail');
      FSysDataBase.ExecSQL('delete from player_info');
      FSysDataBase.ExecSQL('delete from player_score_detail');
      FSysDataBase.ExecSQL('delete from wx_message');
      FSysDataBase.ExecSQL('update game_curr set currX = 1, currJ = 1, currTime = datetime(''now'', ''localtime''), beginId = 0, endId = 0');
    end;
  end else
  begin
    ShowMessage('密码错误');
  end;
end;

procedure TfrmInitSystem.FormCreate(Sender: TObject);
begin
  inherited;//
end;

end.
