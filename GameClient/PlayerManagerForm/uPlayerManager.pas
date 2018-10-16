unit uPlayerManager;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseForm, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, dxBar, cxContainer, cxTextEdit, Vcl.StdCtrls,
  Vcl.ExtCtrls, cxGroupBox;

type
  TfrmPlayerManger = class(TBaseForm)
    DataSourcePlayer: TDataSource;
    dxBarManager1: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    dxBarButton5: TdxBarButton;
    Panel1: TPanel;
    cxGrid3: TcxGrid;
    cxGrid3DBTableView1: TcxGridDBTableView;
    cxGrid3DBTableView1Column2: TcxGridDBColumn;
    cxGrid3DBTableView1Column1: TcxGridDBColumn;
    cxGrid3DBTableView1Column3: TcxGridDBColumn;
    cxGrid3Level1: TcxGridLevel;
    Panel2: TPanel;
    Button1: TButton;
    cxTextEdit1: TcxTextEdit;
    Panel3: TPanel;
    cxGroupBox1: TcxGroupBox;
    cxGroupBox2: TcxGroupBox;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    cxGrid1DBTableView1Column2: TcxGridDBColumn;
    cxGrid1DBTableView1Column3: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    DataSourceScore: TDataSource;
    dxBarButton6: TdxBarButton;
    DataSourceGame: TDataSource;
    dxBarButton7: TdxBarButton;
    cxGridDBTableView1Column1: TcxGridDBColumn;
    cxGridDBTableView1Column2: TcxGridDBColumn;
    cxGridDBTableView1Column3: TcxGridDBColumn;
    cxGridDBTableView1Column4: TcxGridDBColumn;
    cxGridDBTableView1Column5: TcxGridDBColumn;
    cxGridDBTableView1Column6: TcxGridDBColumn;
    cxGridDBTableView1Column7: TcxGridDBColumn;
    cxGridDBTableView1Column8: TcxGridDBColumn;
    cxGridDBTableView1Column9: TcxGridDBColumn;
    cxGridDBTableView1Column10: TcxGridDBColumn;
    cxGridDBTableView1Column11: TcxGridDBColumn;
    cxGridDBTableView1Column12: TcxGridDBColumn;
    cxGridDBTableView1Column13: TcxGridDBColumn;
    cxGridDBTableView1Column14: TcxGridDBColumn;
    dxBarSubItem1: TdxBarSubItem;
    dxBarButton8: TdxBarButton;
    procedure FormCreate(Sender: TObject);
    procedure cxGrid3DBTableView1Column2CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGrid3DBTableView1Column2GetDataText(
      Sender: TcxCustomGridTableItem; ARecordIndex: Integer; var AText: string);
    procedure dxBarButton1Click(Sender: TObject);
    procedure dxBarButton3Click(Sender: TObject);
    procedure dxBarButton2Click(Sender: TObject);
    procedure dxBarButton4Click(Sender: TObject);
    procedure dxBarButton5Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure cxGrid1DBTableView1Column2GetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: string);
    procedure dxBarButton7Click(Sender: TObject);
    procedure cxGridDBTableView1Column5GetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: string);
    procedure dxBarButton6Click(Sender: TObject);
  private
    { Private declarations }
    procedure PlayerDataSetAfterScroll(DataSet: TDataSet);
  public
    { Public declarations }
  end;

var
  frmPlayerManger: TfrmPlayerManger;

implementation

{$R *.dfm}

uses uScoreManagerForm, uTransScoreForm, uConstants;

procedure TfrmPlayerManger.FormCreate(Sender: TObject);
begin
  inherited;//
  dxBarButton3Click(dxBarButton3);
end;

procedure TfrmPlayerManger.PlayerDataSetAfterScroll(DataSet: TDataSet);
var
  LStr: string;
begin
  LStr := DataSet.FieldByName('playerId').AsString;
  DataSourceScore.DataSet := FSysDataBase.GetDataSetBySql(Self, 'select * from player_score_detail where playerId = ' + QuotedStr(LStr));
  DataSourceGame.DataSet := FSysDataBase.GetDataSetBySql(Self, 'select * from game_buy_detail where playerId = ' + QuotedStr(LStr) + ' order by gameId');
end;

procedure TfrmPlayerManger.Button1Click(Sender: TObject);
var
  LStr: string;
begin
  DataSourcePlayer.DataSet.Filtered := False;
  LStr := Trim(cxTextEdit1.Text);
  if LStr.IsEmpty then Exit;

  DataSourcePlayer.DataSet.Filter := 'nickName like ''%' + LStr + '%''';
  DataSourcePlayer.DataSet.Filtered := True;
end;

procedure TfrmPlayerManger.cxGrid1DBTableView1Column2GetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: string);
begin
  if AText = IntToStr(SCORE_ADD) then AText := '上分';
  if AText = IntToStr(SCORE_DEC) then AText := '下分';
  if AText = IntToStr(SCORE_GIVE) then AText := '送分';
  if AText = IntToStr(SCORE_TRANS_IN) then AText := '转入';
  if AText = IntToStr(SCORE_TRANS_OUT) then AText := '转出';
end;

procedure TfrmPlayerManger.cxGrid3DBTableView1Column2CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if 0 = AViewInfo.GridRecord.Values[(Sender as TcxGridDBTableView).GetColumnByFieldName('isVisible').Index] then
  ACanvas.Canvas.Brush.Color := clRed;
end;

procedure TfrmPlayerManger.cxGrid3DBTableView1Column2GetDataText(
  Sender: TcxCustomGridTableItem; ARecordIndex: Integer; var AText: string);
begin
  AText := '';
end;

procedure TfrmPlayerManger.cxGridDBTableView1Column5GetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: string);
begin
  if AText = '0' then AText := '';
end;

procedure TfrmPlayerManger.dxBarButton3Click(Sender: TObject);
begin
  DataSourcePlayer.DataSet := FSysDataBase.GetDataSetBySql(Self,'select * from player_info where isDel <> 1 order by isVisible desc, orderNo');
  DataSourcePlayer.DataSet.AfterScroll := PlayerDataSetAfterScroll;
end;

procedure TfrmPlayerManger.dxBarButton4Click(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmPlayerManger.dxBarButton5Click(Sender: TObject);
begin
  DataSourcePlayer.DataSet := FSysDataBase.GetDataSetBySql(Self,'select * from player_info where isDel <> 1 and score>0 order by orderNo');
end;

procedure TfrmPlayerManger.dxBarButton6Click(Sender: TObject);
begin
  if DataSourcePlayer.DataSet.IsEmpty then  begin
    ShowMessage('请选择选手');
    Exit;
  end;

  if DataSourcePlayer.DataSet.FieldByName('score').AsInteger < 1 then  begin
    ShowMessage('选手没有分数可转移');
    Exit;
  end;

  if not Assigned(frmTransScore) then  begin
    frmTransScore := TfrmTransScore.Create(Self);
  end;
  frmTransScore.SetPlayer(DataSourcePlayer.DataSet.FieldByName('playerId').AsString);
  frmTransScore.ShowModal;
end;

procedure TfrmPlayerManger.dxBarButton7Click(Sender: TObject);
begin
  if DataSourcePlayer.DataSet.IsEmpty then  begin
    ShowMessage('请选择选手');
    Exit;
  end;
  if not Assigned(frmScoreManager) then  begin
    frmScoreManager := TfrmScoreManager.Create(Self);
  end;
  frmScoreManager.SetPlayer(DataSourcePlayer.DataSet.FieldByName('playerId').AsString);
  frmScoreManager.ShowModal;
end;

//隐藏选手
procedure TfrmPlayerManger.dxBarButton1Click(Sender: TObject);
var
  i:integer;
begin
  i := DataSourcePlayer.DataSet.FieldByName('isVisible').AsInteger;
  if i>0 then i := 0  else i := 1;
  DataSourcePlayer.DataSet.Edit;
  DataSourcePlayer.DataSet.FieldByName('isVisible').AsInteger := i;
  FSysDataBase.SaveDataSet(DataSourcePlayer.DataSet);
end;

//删除选手
procedure TfrmPlayerManger.dxBarButton2Click(Sender: TObject);
begin
  if DataSourcePlayer.DataSet.FieldByName('score').AsInteger > 0 then  begin
    Application.MessageBox('有分选手不能删除！', '', MB_OK + MB_ICONSTOP);
    Exit;
  end;

  case Application.MessageBox('确定删除选手？！', '', MB_OKCANCEL + MB_ICONWARNING) of
    IDOK:
      begin
        DataSourcePlayer.DataSet.Edit;
        DataSourcePlayer.DataSet.FieldByName('isDel').AsInteger := 1;
        FSysDataBase.SaveDataSet(DataSourcePlayer.DataSet);
        dxBarButton3Click(dxBarButton3);
      end;
    IDCANCEL:
      begin
      end;
  end;
end;

end.

