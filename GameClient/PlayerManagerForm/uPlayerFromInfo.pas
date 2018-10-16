unit uPlayerFromInfo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  uBaseForm, cxClasses, dxBar, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridCustomView,
  cxGrid, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmPlayerFormInfo = class(TBaseForm)
    DataSourcePlayer: TDataSource;
    cxGrid3: TcxGrid;
    cxGrid3DBTableView1: TcxGridDBTableView;
    cxGrid3DBTableView1Column2: TcxGridDBColumn;
    cxGrid3DBTableView1Column1: TcxGridDBColumn;
    cxGrid3DBTableView1Column3: TcxGridDBColumn;
    cxGrid3Level1: TcxGridLevel;
    Panel1: TPanel;
    双击表格设置: TLabel;
    cxGrid3DBTableView1Column4: TcxGridDBColumn;
    cxGrid3DBTableView1Column5: TcxGridDBColumn;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure cxGrid3DBTableView1Column2CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGrid3DBTableView1CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private
    { Private declarations }
    procedure RefreshInfo();
  public
    { Public declarations }
  end;

var
  frmPlayerFormInfo: TfrmPlayerFormInfo;

implementation

{$R *.dfm}

uses uGetPlayer;

procedure TfrmPlayerFormInfo.Button1Click(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmPlayerFormInfo.cxGrid3DBTableView1CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
var
  LStr: string;
begin
  if ACellViewInfo.Item.Index = 3 then  begin
    if Assigned(frmGetPlayer) then
      FreeAndNil(frmGetPlayer);
    frmGetPlayer := TfrmGetPlayer.Create(Self);
    frmGetPlayer.ShowModal;

    if frmGetPlayer.ModalResult = mrOk then  begin
      DataSourcePlayer.DataSet.Edit;
      DataSourcePlayer.DataSet.FieldByName('fromPlayerId').AsString := frmGetPlayer.ChoosePlayerId;
      FSysDataBase.SaveDataSet(DataSourcePlayer.DataSet);
      RefreshInfo;
    end;
  end;
  if ACellViewInfo.Item.Index = 4 then  begin
    LStr := InputBox('返点设置', '请输入返点数：(如：20， 表示20%)', '0');
    if (StrToIntDef(LStr, -1) < 0) or (StrToIntDef(LStr, -1) > 101) then    begin
      ShowMessage('请输入0-100的整数');
      Exit;
    end;
    FSysDataBase.ExecSQL('update player_info set fromBack = ' + LStr + ' where playerId = ' + QuotedStr(DataSourcePlayer.DataSet.FieldByName('playerId').AsString));
    RefreshInfo;
  end;

end;

procedure TfrmPlayerFormInfo.cxGrid3DBTableView1Column2CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if 0 = AViewInfo.GridRecord.Values[(Sender as TcxGridDBTableView).GetColumnByFieldName('isVisible').Index] then
  ACanvas.Canvas.Brush.Color := clRed;
end;

procedure TfrmPlayerFormInfo.FormCreate(Sender: TObject);
begin
  inherited;//
  RefreshInfo;
end;

procedure TfrmPlayerFormInfo.RefreshInfo;
var
  LStr: string;
begin
  LStr := 'select a.*, b.nickName as fromNickName from player_info a left join player_info b on a.fromPlayerId = b.playerId order by a.isVisible desc, a.orderNo';
  DataSourcePlayer.DataSet := FSysDataBase.GetDataSetBySql(Self, LStr);
end;

end.
