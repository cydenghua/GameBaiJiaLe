unit uReportShowForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  uBaseForm, dxBar, cxClasses, System.Actions, Vcl.ActnList, frxClass,
  frxPreview, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  Data.DB, cxDBData, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridCustomView, cxGrid, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, frxDBSet, frxExportPDF,
  frxExportImage, frxExportRTF;

type
  TfrmReportShow = class(TBaseForm)
    frxPreview1: TfrxPreview;
    ActionList1: TActionList;
    actRefresh: TAction;
    actSearch: TAction;
    actExport: TAction;
    dxBarManager1: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    dxBarButton1: TdxBarButton;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1rpName: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    DataSource1: TDataSource;
    actExit: TAction;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    dxBarLargeButton4: TdxBarLargeButton;
    actPrint: TAction;
    frxPDFExport1: TfrxPDFExport;
    frxJPEGExport1: TfrxJPEGExport;
    frxRTFExport1: TfrxRTFExport;
    procedure FormCreate(Sender: TObject);
    procedure actSearchExecute(Sender: TObject);
    procedure actExitExecute(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure actExportExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReportShow: TfrmReportShow;

implementation

{$R *.dfm}

uses uReportParamForm;


procedure TfrmReportShow.FormCreate(Sender: TObject);
begin
  inherited;//
  DataSource1.DataSet := FSysDataBase.GetDataSetBySql('select * from sys_rp order by sysId');
end;

procedure TfrmReportShow.actExitExecute(Sender: TObject);
begin
  Close;
end;


procedure TfrmReportShow.actSearchExecute(Sender: TObject);
var
  LParamSet: TfrmReportParam;
  LQueryData: TFDQuery;
  LStr: string;
begin
  LStr := DataSource1.DataSet.FieldByName('rpSql').AsString;
  LQueryData := (FSysDataBase.GetDataSetBySql('select * from sys_rp where 1=2') as TFDQuery);
  LQueryData.Close;
  LQueryData.SQL.Clear;
  LQueryData.SQL.Add(LStr);

  if LQueryData.Params.Count > 0 then  begin
    LParamSet := TfrmReportParam.Create(Self);
    LParamSet.AddParam(LQueryData.Params);
    LParamSet.ShowModal;
    if LParamSet.ModalResult <> mrOk then Exit;
  end;

  FSysDataBase.OpenDataSet(LQueryData);
  frxDBDataset1.DataSet := LQueryData;
  LStr := DataSource1.DataSet.FieldByName('rpFile').AsString;
  frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName) + 'frx/' + LStr);

  if frxReport1.PrepareReport() then
    frxReport1.ShowPreparedReport;
end;

procedure TfrmReportShow.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
  actSearch.Execute;
end;

procedure TfrmReportShow.actExportExecute(Sender: TObject);
begin
//  frxPreview1.Export(frxPDFExport1);
//  frxPreview1.Export(frxJPEGExport1);
  frxPreview1.Export(frxRTFExport1);
end;

procedure TfrmReportShow.actPrintExecute(Sender: TObject);
begin
  frxPreview1.Print;
end;
end.
