unit uScoreManagerForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  uBaseForm, Vcl.StdCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, Vcl.ExtCtrls,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxTextEdit;

type
  TfrmScoreManager = class(TBaseForm)
    DataSource1: TDataSource;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Panel2: TPanel;
    Button4: TButton;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    cxGrid1DBTableView1Column2: TcxGridDBColumn;
    cxGrid1DBTableView1Column3: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure cxGrid1DBTableView1Column2GetDataText(
      Sender: TcxCustomGridTableItem; ARecordIndex: Integer; var AText: string);
  private
    { Private declarations }

    FPlayerId: string;
    FPlayerScore: Integer;
    procedure AddScore(AScore, AType: Integer);

  public
    { Public declarations }
    procedure SetPlayer(APlayer: string);
  end;

var
  frmScoreManager: TfrmScoreManager;

implementation

{$R *.dfm}

uses uConstants;

procedure TfrmScoreManager.FormCreate(Sender: TObject);
begin
  inherited;//
end;

procedure TfrmScoreManager.SetPlayer(APlayer: string);
begin
  FPlayerId := APlayer;
  with FSysDataBase.GetDataSetBySql(Self, 'select * from player_info where playerId = ' + QuotedStr(APlayer)) do  begin
    Label2.Caption := FieldByName('nickName').AsString;
    Label4.Caption := FieldByName('score').AsString;
    FPlayerScore := FieldByName('score').AsInteger;
  end;

  DataSource1.DataSet := FSysDataBase.GetDataSetBySql(Self, 'select * from player_score_detail where playerId = ' + QuotedStr(FPlayerId));
end;

procedure TfrmScoreManager.AddScore(AScore, AType: Integer);
var
  LStr: string;
begin
  if AScore < 1 then  begin
    ShowMessage('分数输入无效');
    Exit;
  end;
  if AType < 0 then AScore := AScore*-1;
  LStr := 'insert into player_score_detail(playerId, scoreType, score, happenTime) values(''%s'', %d, %d, ''%s'');';
  LStr := Format(LStr, [FPlayerId, AType, AScore, DateTimeToStr(Now)]);
  LStr := LStr + ' update player_info set score = score + ' + IntToStr(AScore)
          + ' where playerId = ' + QuotedStr(FPlayerId) ;
  FSysDataBase.ExecSQL(LStr);
  SetPlayer(FPlayerId);
end;

procedure TfrmScoreManager.Button1Click(Sender: TObject);
var
  LStr: string;
begin
  LStr := InputBox('分数设置', '请输入上分数：', '');
  AddScore(StrToIntDef(LStr, 0), SCORE_ADD);
end;

procedure TfrmScoreManager.Button2Click(Sender: TObject);
var
  LStr: string;
begin
  LStr := InputBox('分数设置', '请输入下分数：', '');
  if FPlayerScore < StrToIntDef(LStr, 0) then  begin
    Application.MessageBox('分数不足！', '', MB_OK + MB_ICONSTOP);
    Exit;
  end;

  AddScore(StrToIntDef(LStr, 0), SCORE_DEC);
end;

procedure TfrmScoreManager.Button3Click(Sender: TObject);
var
  LStr: string;
begin
  LStr := InputBox('分数设置', '请输入送分数：', '');
  AddScore(StrToIntDef(LStr, 0), SCORE_GIVE);
end;

procedure TfrmScoreManager.Button4Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmScoreManager.cxGrid1DBTableView1Column2GetDataText(
  Sender: TcxCustomGridTableItem; ARecordIndex: Integer; var AText: string);
begin
  if AText = IntToStr(SCORE_ADD) then AText := '上分';
  if AText = IntToStr(SCORE_DEC) then AText := '下分';
  if AText = IntToStr(SCORE_GIVE) then AText := '送分';
  if AText = IntToStr(SCORE_TRANS_IN) then AText := '转入';
  if AText = IntToStr(SCORE_TRANS_OUT) then AText := '转出';
end;

end.
