unit uDailyReportForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  uBaseForm, System.Actions, Vcl.ActnList, dxBar, cxClasses, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  cxTimeEdit, cxTextEdit, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridCustomView, cxGrid, frxClass, frxPreview, cxLabel,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  frxDBSet;

type
  TfrmDailyReport = class(TBaseForm)
    dxBarManager1: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    dxBarButton1: TdxBarButton;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    ActionList1: TActionList;
    actExit: TAction;
    DataSource1: TDataSource;
    actCurrDailyCount: TAction;
    actDoDailyCount: TAction;
    frxReport1: TfrxReport;
    frxPreview1: TfrxPreview;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    cxGrid1DBTableView1Column2: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    frxDBDataset1: TfrxDBDataset;
    procedure FormCreate(Sender: TObject);
    procedure actExitExecute(Sender: TObject);
    procedure actCurrDailyCountExecute(Sender: TObject);
    procedure actDoDailyCountExecute(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
  private
    { Private declarations }
    procedure RefreshDailyCountList();
    procedure ShowDialyReport(ASysId:string);
    procedure ShowDialyDataReport(ADataSet: TDataSet);
  public
    { Public declarations }
  end;

var
  frmDailyReport: TfrmDailyReport;

implementation

{$R *.dfm}

procedure TfrmDailyReport.FormCreate(Sender: TObject);
begin
  inherited;//
  RefreshDailyCountList;
//  (cxGrid1DBTableView1.DataController as IcxCustomGridDataController).DeleteAllItems;  //删除所有列
//  (cxGrid1DBTableView1.DataController as IcxCustomGridDataController).CreateAllItems(false); //创建数据源中的所有列
//  cxGrid1DBTableView1.ApplyBestFit; //让列宽自适应 .BestFitMaxWidth;
end;

procedure TfrmDailyReport.RefreshDailyCountList;
begin
  DataSource1.DataSet := FSysDataBase.GetDataSetBySql('select * from daily_count where sysId >0 order by sysId desc');
  DataSource1.DataSet.First;
end;

procedure TfrmDailyReport.actExitExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmDailyReport.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
  if DataSource1.DataSet.IsEmpty then Exit;
  ShowDialyReport(DataSource1.DataSet.FieldByName('sysId').AsString);
end;

procedure TfrmDailyReport.actCurrDailyCountExecute(Sender: TObject);
var
  LStr: string;
  LBuyCount, LResCount, LScoreCount: Integer;
  LDataSet: TFDQuery;
begin//
  LStr := 'select * from game_buy_detail where dailyFlag < 1';
  LDataSet := FSysDataBase.GetDataSetBySql(Self, LStr) as TFDQuery;
  if LDataSet.IsEmpty then  begin
    ShowMessage('没有需要日结的数据。');
    Exit;
  end;

  LBuyCount := 0;
  LResCount := 0;
  LDataSet.First;
  while not LDataSet.Eof do  begin
    LBuyCount := LBuyCount
                +LDataSet.FieldByName('buyZ').AsInteger
                +LDataSet.FieldByName('buyX').AsInteger
                +LDataSet.FieldByName('buyZD').AsInteger
                +LDataSet.FieldByName('buyXD').AsInteger
                +LDataSet.FieldByName('buyH').AsInteger;
    LResCount := LResCount
                +LDataSet.FieldByName('resZ').AsInteger
                +LDataSet.FieldByName('resX').AsInteger
                +LDataSet.FieldByName('resZD').AsInteger
                +LDataSet.FieldByName('resXD').AsInteger
                +LDataSet.FieldByName('resH').AsInteger;
    LDataSet.Next;
  end;
  LScoreCount := FSysDataBase.ExecSQLScalar('Select sum(score) From player_info');

  LDataSet := FSysDataBase.GetDataSetBySql(Self, 'select * from daily_count where sysId=-1') as TFDQuery;
  if LDataSet.IsEmpty then  begin
    LDataSet.Append;
  end else begin
    LDataSet.Edit;
  end;
  LDataSet.FieldByName('sysId').AsString := '-1';
  LDataSet.FieldByName('buyCount').AsInteger := LBuyCount;
  LDataSet.FieldByName('resCount').AsInteger := LResCount;
  LDataSet.FieldByName('scoreCount').AsInteger := LScoreCount;

  ShowDialyDataReport(LDataSet);
end;

procedure TfrmDailyReport.actDoDailyCountExecute(Sender: TObject);
var
  LStr, LStr2, LDailyId: string;
  LBuyCount, LResCount, LScoreCount: Integer;
  LDataSet: TFDQuery;
begin
  LStr := 'select * from game_buy_detail where dailyFlag < 1';
  LDataSet := FSysDataBase.GetDataSetBySql(Self, LStr) as TFDQuery;
  if LDataSet.IsEmpty then  begin
    ShowMessage('没有需要日结的数据。');
    Exit;
  end;

  LStr := EmptyStr;
  LBuyCount := 0;
  LResCount := 0;
  LDataSet.First;
  while not LDataSet.Eof do  begin
    LBuyCount := LBuyCount
                +LDataSet.FieldByName('buyZ').AsInteger
                +LDataSet.FieldByName('buyX').AsInteger
                +LDataSet.FieldByName('buyZD').AsInteger
                +LDataSet.FieldByName('buyXD').AsInteger
                +LDataSet.FieldByName('buyH').AsInteger;
    LResCount := LResCount
                +LDataSet.FieldByName('resZ').AsInteger
                +LDataSet.FieldByName('resX').AsInteger
                +LDataSet.FieldByName('resZD').AsInteger
                +LDataSet.FieldByName('resXD').AsInteger
                +LDataSet.FieldByName('resH').AsInteger;
    LStr := LStr + ' update game_buy_detail set dailyFlag = *dailyid* where gameId = '
                 + LDataSet.FieldByName('gameId').AsString
                 + ' and playerId = ' + QuotedStr(LDataSet.FieldByName('playerId').AsString) + ';';
    LDataSet.Next;
  end;
  LScoreCount := FSysDataBase.ExecSQLScalar('Select sum(score) From player_info');
  LStr2 := 'insert into daily_count (buyCount, resCount, scoreCount)'
         +'values(%d, %d, %d)';
  LStr2 := Format(LStr2, [LBuyCount, LResCount, LScoreCount]);
  LStr2 := LStr2 + '; update player_info set beginScore = score; ' ;
  FSysDataBase.ExecSQLWithTrans(LStr2);
  LDailyId := FSysDataBase.ExecSQLScalar('select max(sysId) from daily_count');

  LStr := LStr.Replace('*dailyid*', LDailyId);
  FSysDataBase.ExecSQL(LStr);

  RefreshDailyCountList;
  if DataSource1.DataSet.IsEmpty then Exit;
  ShowDialyReport(DataSource1.DataSet.FieldByName('sysId').AsString);
end;

procedure TfrmDailyReport.ShowDialyReport(ASysId: string);
begin
  ShowDialyDataReport(FSysDataBase.GetDataSetBySql(Self, 'select * from daily_count where sysId = ' + QuotedStr(ASysId)));
end;

procedure TfrmDailyReport.ShowDialyDataReport(ADataSet: TDataSet);
begin
  frxDBDataset1.DataSet := ADataSet;
  frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName) + '\frx\rpDaily.fr3');
  if frxReport1.PrepareReport then
    frxReport1.ShowPreparedReport;
end;

end.
