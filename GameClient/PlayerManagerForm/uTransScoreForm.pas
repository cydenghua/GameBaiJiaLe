unit uTransScoreForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseForm, Vcl.StdCtrls, Vcl.ExtCtrls,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator,
  Data.DB, cxDBData, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, cxTextEdit;

type
  TfrmTransScore = class(TBaseForm)
    Panel1: TPanel;
    Button1: TButton;
    cxTextEdit1: TcxTextEdit;
    Button2: TButton;
    cxGrid3: TcxGrid;
    cxGrid3DBTableView1: TcxGridDBTableView;
    cxGrid3DBTableView1Column2: TcxGridDBColumn;
    cxGrid3DBTableView1Column1: TcxGridDBColumn;
    cxGrid3DBTableView1Column3: TcxGridDBColumn;
    cxGrid3Level1: TcxGridLevel;
    DataSourcePlayer: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    FPlayerId: string;
    FPlayerScore: Integer;
  public
    { Public declarations }
    procedure SetPlayer(APlayer: string);
  end;

var
  frmTransScore: TfrmTransScore;

implementation

{$R *.dfm}

uses uConstants;


procedure TfrmTransScore.Button2Click(Sender: TObject);
var
  LStr: string;
begin
  DataSourcePlayer.DataSet.Filtered := False;
  LStr := Trim(cxTextEdit1.Text);
  if LStr.IsEmpty then Exit;

  DataSourcePlayer.DataSet.Filter := 'nickName like ''%' + LStr + '%''';
  DataSourcePlayer.DataSet.Filtered := True;
end;

procedure TfrmTransScore.FormCreate(Sender: TObject);
begin
  inherited;//
  DataSourcePlayer.DataSet := FSysDataBase.GetDataSetBySql(Self,'select * from player_info where isDel <> 1 order by isVisible desc, orderNo');
end;

procedure TfrmTransScore.SetPlayer(APlayer: string);
begin
  FPlayerId := APlayer;
  with FSysDataBase.GetDataSetBySql(Self, 'select * from player_info where playerId = ' + QuotedStr(APlayer)) do  begin
    Label2.Caption := FieldByName('nickName').AsString;
    Label4.Caption := FieldByName('score').AsString;
    FPlayerScore := FieldByName('score').AsInteger;
  end;
end;

procedure TfrmTransScore.Button1Click(Sender: TObject);
var
  LStr, LSql: string;
begin//
  LStr := DataSourcePlayer.DataSet.FieldByName('nickName').AsString;
  if Application.MessageBox(PWideChar('您确定要把所有分数转移到<<' + LStr + '>> ?'), '', MB_OKCANCEL + MB_ICONQUESTION) = IDOK
    then
  begin
    LStr := FSysDataBase.ExecSQLScalar('select score from player_info where playerId = ' + QuotedStr(FPlayerId));

    LSql := 'update player_info set score = 0 where playerId = ' + QuotedStr(FPlayerId) + ';';
    LSql := LSql + ' update player_info set score = score + ' + LStr + ' where playerId = ' + QuotedStr(DataSourcePlayer.DataSet.FieldByName('playerId').AsString) + ';';

    LSql := LSql + ' insert into player_score_detail(playerId, scoreType, score, happenTime) values(''%s'', %d, %s, ''%s'');';
    LSql := Format(LSql, [DataSourcePlayer.DataSet.FieldByName('playerId').AsString, SCORE_TRANS_IN, LStr, DateTimeToStr(Now)]);

    LSql := LSql + ' insert into player_score_detail(playerId, scoreType, score, happenTime) values(''%s'', %d, %s, ''%s'');';
    LSql := Format(LSql, [FPlayerId, SCORE_TRANS_OUT, LStr, DateTimeToStr(Now)]);

    FSysDataBase.ExecSQLWithTrans(LSql);
    Self.Close;
  end;
end;

end.
