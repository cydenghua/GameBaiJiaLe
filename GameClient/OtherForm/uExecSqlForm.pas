unit uExecSqlForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseForm, Vcl.StdCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid;

type
  TfrmExecSql = class(TBaseForm)
    Panel1: TPanel;
    Memo1: TMemo;
    DataSource1: TDataSource;
    Button1: TButton;
    Button2: TButton;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    Label1: TLabel;
    Button3: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmExecSql: TfrmExecSql;

implementation

{$R *.dfm}

procedure TfrmExecSql.FormCreate(Sender: TObject);
begin
  inherited;//
  Button1.Visible := False;
  Button2.Visible := False;
end;

procedure TfrmExecSql.Button1Click(Sender: TObject);
begin
  try
    DataSource1.DataSet := FSysDataBase.GetDataSetBySql(Self, Memo1.Text);
    (cxGrid1DBTableView1.DataController as IcxCustomGridDataController).DeleteAllItems;  //删除所有列
    (cxGrid1DBTableView1.DataController as IcxCustomGridDataController).CreateAllItems(false); //创建数据源中的所有列
    cxGrid1DBTableView1.ApplyBestFit; //让列宽自适应 .BestFitMaxWidth;
  except on E: Exception do
    Label1.Caption := '执行失败：' + E.Message;
  end;
end;

procedure TfrmExecSql.Button2Click(Sender: TObject);
var
  LInt: Integer;
begin
  try
    LInt := FSysDataBase.ExecSQL(Memo1.Text);
    Label1.Caption := '执行成功，受影响行数 ' + IntToStr(LInt);
  except on E: Exception do
    Label1.Caption := '执行失败：' + E.Message;
  end;
end;


procedure TfrmExecSql.Button3Click(Sender: TObject);
begin
  if InputBox('', '', '').Equals('sql') then  begin
    Button1.Visible := True;
    Button2.Visible := True;
    Button3.Visible := False;
  end;
end;

end.
