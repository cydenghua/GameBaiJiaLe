unit uGameConfigForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, Vcl.StdCtrls, cxGridLevel, cxClasses,
  cxGridCustomView, cxGrid, Vcl.ExtCtrls,
  uBaseForm;

type
  TfrmGameConfig = class(TBaseForm)
    Panel1: TPanel;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    DataSource1: TDataSource;
    Button1: TButton;
    Button2: TButton;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    cxGrid1DBTableView1Column2: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGameConfig: TfrmGameConfig;

implementation

{$R *.dfm}

procedure TfrmGameConfig.Button1Click(Sender: TObject);
begin
  if DataSource1.DataSet.State in [dsEdit] then
    FSysDataBase.SaveDataSet(DataSource1.DataSet);
  ShowMessage('保存成功， 重启程序后生效');
end;

procedure TfrmGameConfig.Button2Click(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmGameConfig.FormCreate(Sender: TObject);
begin
  inherited;
  DataSource1.DataSet := FSysDataBase.GetDataSetBySql(Self, 'select * from game_config order by orderNo');
end;

end.
