unit uReportParamForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  FireDAC.Stan.Param, Vcl.StdCtrls, Data.DB, Datasnap.DBClient, Vcl.Grids,
  Vcl.DBGrids, Vcl.Mask, Vcl.DBCtrls, Vcl.ExtCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxDropDownEdit,
  cxCalendar, cxDBEdit, cxTextEdit, cxMaskEdit, cxSpinEdit, cxTimeEdit,
  Vcl.ComCtrls, dxCore, cxDateUtils, MidasLib;

type
  TfrmReportParam = class(TForm)
    DataSource1: TDataSource;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    FLeft :Integer;
    FTop: Integer;
    FCds: TClientDataSet;
    FParams: TFDParams;

    function GetParamCaption(AField: string):string;
  public
    { Public declarations }
    procedure AddParam(AParams: TFDParams);

  end;

var
  frmReportParam: TfrmReportParam;

implementation

{$R *.dfm}

procedure TfrmReportParam.FormCreate(Sender: TObject);
begin
  FLeft := 5;
  FTop := 20;
end;

procedure TfrmReportParam.AddParam(AParams: TFDParams);
var
  LInt:Integer;
  LLabel: TLabel;
  LDBEdit: TDBEdit;
  LDBDateEdit: TcxDBDateEdit;
  LStr: string;
begin
  FParams := AParams;
  FCds := TClientDataSet.Create(Self);
  DataSource1.DataSet := FCds;
  for LInt := 0 to FParams.Count-1 do  begin
    LLabel := TLabel.Create(Self);
    LLabel.Parent := Self;
    LLabel.Left := FLeft;
    LLabel.Top := FTop;
    LLabel.Width := 60;
    LLabel.AutoSize := False;
    LLabel.Alignment := taRightJustify;
    LLabel.Caption := GetParamCaption(FParams.Items[LInt].Name) + ':';// FadoDicData.Fields[i].DisplayLabel + ':';

//    FCds.FieldDefs.Add(FParams.Items[LInt].Name, ftString, 50, False);

    LStr := FParams.Items[LInt].Name;
    if UpperCase(LStr).Contains('DATE') then    begin
      FCds.FieldDefs.Add(FParams.Items[LInt].Name, ftDateTime, 0, False);
      LDBDateEdit := TcxDBDateEdit.Create(Self);
      LDBDateEdit.Parent := Self;
      LDBDateEdit.Left := LLabel.Left + LLabel.Width + 2;
      LDBDateEdit.Top := LLabel.Top - 5;
      LDBDateEdit.DataBinding.DataSource := DataSource1;
      LDBDateEdit.DataBinding.DataField := FParams.Items[LInt].Name;
    end else begin
      FCds.FieldDefs.Add(FParams.Items[LInt].Name, ftString, 50, False);
      LDBEdit := TDBEdit.Create(Self);
      LDBEdit.Parent := Self;
      LDBEdit.Left := LLabel.Left + LLabel.Width + 2;
      LDBEdit.Top := LLabel.Top - 5;
      LDBEdit.DataSource := DataSource1;
      LDBEdit.DataField := FParams.Items[LInt].Name;
    end;

    FTop := FTop + 30;
  end;

  self.Height := FTop + 100;

  FCds.CreateDataSet;
  DataSource1.DataSet := FCds;


  FCds.Edit;
  if FCds.FindField('begindate') <> nil then  begin
    FCds.FindField('begindate').AsString := DateToStr(Now);
  end;
  if FCds.FindField('enddate') <> nil then  begin
    FCds.FindField('enddate').AsString := DateToStr(Now);
  end;
end;

procedure TfrmReportParam.Button1Click(Sender: TObject);
var
  LInt:Integer;
begin
  if FCds.FindField('begindate') <> nil then  begin
    FCds.FindField('begindate').AsDateTime := StrToDateTime(DateToStr(FCds.FindField('begindate').AsDateTime) + ' 00:00:00');
  end;
  if FCds.FindField('enddate') <> nil then  begin
    FCds.FindField('enddate').AsDateTime := StrToDateTime(DateToStr(FCds.FindField('enddate').AsDateTime) + ' 23:59:59');
  end;

  for LInt := 0 to FParams.Count-1 do  begin
    FParams.Items[LInt].Value := FCds.FieldByName(FParams.Items[LInt].Name).Value;
  end;
  ModalResult := mrOk;
end;

procedure TfrmReportParam.Button2Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

function TfrmReportParam.GetParamCaption(AField: string): string;
begin
  Result := AField;
  if UpperCase(AField).Equals('BEGINDATE') then  Result := '开始日期';
  if UpperCase(AField).Equals('ENDDATE') then  Result := '结束日期';
end;

end.
