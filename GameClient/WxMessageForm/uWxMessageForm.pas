unit uWxMessageForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  uBaseForm, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  Data.DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxCalendar,
  Vcl.Grids, Vcl.DBGrids;

type
  TfrmWxMessage = class(TBaseForm)
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    DataSource1: TDataSource;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    cxGrid1DBTableView1Column2: TcxGridDBColumn;
    cxGrid1DBTableView1Column3: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmWxMessage: TfrmWxMessage;

implementation

{$R *.dfm}

procedure TfrmWxMessage.FormCreate(Sender: TObject);
begin
  inherited;//
  DataSource1.DataSet := FSysDataBase.GetDataSetBySql(Self, 'Select * From wx_message order by sysId');
  DataSource1.DataSet.Last;
//  (cxGrid1DBTableView1.DataController as IcxCustomGridDataController).DeleteAllItems;  //删除所有列
//  (cxGrid1DBTableView1.DataController as IcxCustomGridDataController).CreateAllItems(false); //创建数据源中的所有列
//  cxGrid1DBTableView1.ApplyBestFit; //让列宽自适应 .BestFitMaxWidth;
end;

end.
