unit uMainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.DateUtils,
  cxGraphics, cxControls, cxLookAndFeels, dxSkinsdxBarPainter,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData, cxLabel, dxPSGlbl,
  dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider,
  dxPSFillPatterns, dxPSEdgePatterns, dxPSPDFExportCore, dxPSPDFExport,
  cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxPageControlProducer, dxPScxEditorProducers, dxPScxExtEditorProducers,
  dxPSCore, System.Actions, Vcl.ActnList, dxBar, cxBarEditItem, cxClasses,
  cxGridLevel, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, Vcl.StdCtrls, cxGroupBox, Vcl.ExtCtrls,
  uHttpServer, uBaseForm, cxListBox, cxDBEdit, cxTextEdit, cxMaskEdit,
  cxSpinEdit, cxRadioGroup, cxCheckBox, Vcl.DBCtrls, cxTimeEdit, frxClass,
  frxDBSet, frxExportImage, Vcl.Clipbrd, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uConstants, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter, Vcl.Menus;

type
  TfrmMainForm = class(TBaseForm)
    dxBarManager1: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    dxBarSubItem5: TdxBarSubItem;
    dxBarButton9: TdxBarButton;
    cxBarEditItem1: TcxBarEditItem;
    dxBarButton24: TdxBarButton;
    dxBarSubItem1: TdxBarSubItem;
    dxBarSubItem2: TdxBarSubItem;
    dxBarSubItem3: TdxBarSubItem;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarSubItem4: TdxBarSubItem;
    dxBarSubItem6: TdxBarSubItem;
    dxBarSubItem7: TdxBarSubItem;
    dxBarButton1: TdxBarButton;
    dxBarSubItem8: TdxBarSubItem;
    dxBarButton2: TdxBarButton;
    MainAction: TActionList;
    actExit: TAction;
    Panel1: TPanel;
    DataSourcePlayer: TDataSource;
    cxGrid3DBTableView1: TcxGridDBTableView;
    cxGrid3Level1: TcxGridLevel;
    cxGrid3: TcxGrid;
    cxGrid3DBTableView1Column1: TcxGridDBColumn;
    DataSourceGameCurr: TDataSource;
    Panel2: TPanel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    Button10: TButton;
    DataSourceMessage: TDataSource;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    cxGrid1DBTableView1Column2: TcxGridDBColumn;
    cxGrid1DBTableView1Column3: TcxGridDBColumn;
    CheckBox1: TCheckBox;
    DataSourceBuyCurr: TDataSource;
    cxGrid3DBTableView1Column2: TcxGridDBColumn;
    Panel3: TPanel;
    cxGrid2: TcxGrid;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2DBTableView1Column1: TcxGridDBColumn;
    cxGrid2DBTableView1Column2: TcxGridDBColumn;
    cxGrid2DBTableView1Column3: TcxGridDBColumn;
    cxGrid2Level1: TcxGridLevel;
    Panel4: TPanel;
    cxGroupBox1: TcxGroupBox;
    cxRadioButton1: TcxRadioButton;
    cxRadioButton2: TcxRadioButton;
    cxRadioButton3: TcxRadioButton;
    cxCheckBox1: TcxCheckBox;
    cxCheckBox2: TcxCheckBox;
    cxGrid2DBTableView1Column4: TcxGridDBColumn;
    cxGrid2DBTableView1Column5: TcxGridDBColumn;
    cxGrid2DBTableView1Column6: TcxGridDBColumn;
    Panel5: TPanel;
    cxGrid4DBTableView1: TcxGridDBTableView;
    cxGrid4Level1: TcxGridLevel;
    cxGrid4: TcxGrid;
    Button12: TButton;
    actConfig: TAction;
    DataSourcePlayerScore: TDataSource;
    cxGrid4DBTableView1Column1: TcxGridDBColumn;
    cxGrid4DBTableView1Column2: TcxGridDBColumn;
    cxGrid4DBTableView1Column3: TcxGridDBColumn;
    cxGrid4DBTableView1Column4: TcxGridDBColumn;
    Button13: TButton;
    Button14: TButton;
    frxReportBuyCurr: TfrxReport;
    frxDBDatasetBuyCurr: TfrxDBDataset;
    frxJPEGExport1: TfrxJPEGExport;
    frxReportPlayerSocre: TfrxReport;
    frxDBDatasetPlayerScore: TfrxDBDataset;
    dxBarButton5: TdxBarButton;
    Button7: TButton;
    Button3: TButton;
    dxBarSubItem9: TdxBarSubItem;
    dxBarButton6: TdxBarButton;
    dxBarSubItem10: TdxBarSubItem;
    dxBarButton7: TdxBarButton;
    dxBarButton8: TdxBarButton;
    Panel6: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Button8: TButton;
    Button9: TButton;
    cxDBSpinEdit1: TcxDBSpinEdit;
    cxDBSpinEdit2: TcxDBSpinEdit;
    actReportShow: TAction;
    dxBarButton10: TdxBarButton;
    actRegister: TAction;
    dxBarButton11: TdxBarButton;
    dxBarButton12: TdxBarButton;
    dxBarSubItem11: TdxBarSubItem;
    actDailyReport: TAction;
    actDisclaimer: TAction;
    dxBarSubItem12: TdxBarSubItem;
    actHelp: TAction;
    dxBarButton13: TdxBarButton;
    actPlayerManager: TAction;
    PopupMenu1: TPopupMenu;
    popSetEnd: TMenuItem;
    Button11: TButton;
    MemoMsgLog: TMemo;
    dxBarButton14: TdxBarButton;
    actPlayerFromInfo: TAction;
    Panel7: TPanel;
    Button1: TButton;
    cxTextEdit1: TcxTextEdit;
    Button2: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    cxGrid3DBTableView1Column3: TcxGridDBColumn;
    dxBarSubItem13: TdxBarSubItem;
    dxBarButton15: TdxBarButton;
    dxBarButton16: TdxBarButton;
    dxBarButton17: TdxBarButton;
    actInitSystem: TAction;
    dxBarSubItem14: TdxBarSubItem;
    dxBarSubItem15: TdxBarSubItem;
    dxBarSubItem16: TdxBarSubItem;
    dxBarSubItem17: TdxBarSubItem;
    actBackUpDatabase: TAction;
    dxBarButton18: TdxBarButton;
    dxBarSubItem18: TdxBarSubItem;
    dxBarButton19: TdxBarButton;
    dxBarButton20: TdxBarButton;
    SaveDialog1: TSaveDialog;
    actExecSql: TAction;
    dxBarButton21: TdxBarButton;
    Button15: TButton;
    Button16: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure actExitExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure cxDBSpinEdit1PropertiesChange(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure cxGrid3DBTableView1Column2GetDataText(
      Sender: TcxCustomGridTableItem; ARecordIndex: Integer; var AText: string);
    procedure cxGrid3DBTableView1Column2CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGrid2DBTableView1Column2GetDataText(
      Sender: TcxCustomGridTableItem; ARecordIndex: Integer; var AText: string);
    procedure actConfigExecute(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure actReportShowExecute(Sender: TObject);
    procedure actRegisterExecute(Sender: TObject);
    procedure actDailyReportExecute(Sender: TObject);
    procedure actDisclaimerExecute(Sender: TObject);
    procedure actHelpExecute(Sender: TObject);
    procedure actPlayerManagerExecute(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure popSetEndClick(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure actPlayerFromInfoExecute(Sender: TObject);
    procedure actInitSystemExecute(Sender: TObject);
    procedure actBackUpDatabaseExecute(Sender: TObject);
    procedure actExecSqlExecute(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);

  private
    { Private declarations }
    FHttpServer: THttpServer;
    FBuyMaxScore: Integer;
    FBuyMinScore: Integer;
    FZXAbs: Integer;
    FZXAbsWarn: Integer;
    FMaxSBScore: Integer;
    FMaxPlayer: Integer;
    FMsgIdList: TStringList;
    FPlayerList: TStringList;

    FIsSendMsg: Boolean; //开奖后不再发生提示消息 ， 进入下一局才开始发生消息

    procedure CreateBuyFromMessage2();     //覆盖模式
    procedure CreateBuyFromMessageAdd();   //累加模式
    procedure LoadSkin();
    procedure dxBarButtonSkinClick(Sender: TObject);
    procedure LogInfo(AStr: string);
    procedure LogInfoAndSend(AStr: string; AMsgId: string);
    procedure AutoBackupDatabase();
    procedure SendWxMessage(AStr, AMsgId: string);
  public
    { Public declarations }
    Procedure WMNewMessage(var msg:TMessage);Message WM_MESSAGE_NEW_MESSAGE;
  end;

var
  frmMainForm: TfrmMainForm;

implementation

{$R *.dfm}

uses uScoreManagerForm, uWxMessageForm, uGameConfigForm, uReportShowForm,
  uRegisterForm, uLicense, uDailyReportForm, uDisclaimerForm, uHelpForm,
  uPlayerManager, uWxWebForm, uPlayerFromInfo, uInitSystemForm, uExecSqlForm,
  uClipWxMessageForm, uFrmRoad, uRes;


procedure TfrmMainForm.FormCreate(Sender: TObject);
begin
  inherited;
  LoadSkin;
  FIsSendMsg := True;
  FMsgIdList := TStringList.Create;
  FPlayerList := TStringList.Create;
  FHttpServer := THttpServer.Create(Self);
  Self.Caption := '微信统计截图系统(本软件仅供娱乐研究，禁止用于赌博)';
  Button2Click(Button2);

  DataSourceGameCurr.DataSet := FSysDataBase.GetDataSetBySql('select * from game_curr');
  with DataSourceGameCurr.DataSet do  begin
    if IsEmpty then    begin
      Append;
      FieldByName('currX').AsInteger := 1;
      FieldByName('currJ').AsInteger := 1;
      FSysDataBase.SaveDataSet(DataSourceGameCurr.DataSet);
    end;
  end;

  FBuyMaxScore := FSysDataBase.ExecSQLScalar('select value from game_config where name = ''buyMax''');
  FBuyMinScore := FSysDataBase.ExecSQLScalar('select value from game_config where name = ''buyMin''');
  FZXAbs := FSysDataBase.ExecSQLScalar('select value from game_config where name = ''zxAbs''');
  FZXAbsWarn := FSysDataBase.ExecSQLScalar('select value from game_config where name = ''zxAbsWarn''');
  FMaxSBScore := FSysDataBase.ExecSQLScalar('select value from game_config where name = ''maxSB''');
  FMaxPlayer := FSysDataBase.ExecSQLScalar('select value from game_config where name = ''maxPlayer''');

  Button10.Click;
  DataSourcePlayerScore.DataSet := FSysDataBase.GetDataSetBySql(Self,
            'Select * From player_info left join game_curr where isvisible = 1 order by orderNo');

  AutoBackupDatabase;//数据备份
end;

procedure TfrmMainForm.FormDestroy(Sender: TObject);
begin
  FHttpServer.Destroy;
  FSysDataBase.Free;
end;

procedure TfrmMainForm.FormShow(Sender: TObject);
var
  LLicense: TLicense;
begin
  dxBarManager1.LookAndFeel.NativeStyle := False;
  dxBarManager1.LookAndFeel.SkinName := FSysConfig.SkinName;

  LLicense := TLicense.Create;//检查系统是否注册
  if LLicense.CheckLicense <> 1 then  begin
    Button12.Enabled := False;
    actRegister.Execute;
  end;
end;

procedure TfrmMainForm.LoadSkin;
var
  aItemLink: TdxBarItemLink;
  aBarButton: TdxBarButton;
  i: Integer;
  LSkinList: TStringList;
begin
  LSkinList := TStringList.Create;
  LSkinList.Add('Black');
  LSkinList.Add('Blue');
  LSkinList.Add('GlassOceans');
  LSkinList.Add('LiquidSky');
  LSkinList.Add('MoneyTwins');
  LSkinList.Add('Pumpkin');
  LSkinList.Add('Seven');
  LSkinList.Add('Sharp');
  LSkinList.Add('Silver');
  LSkinList.Add('Springtime');
  LSkinList.Add('Stardust');
  LSkinList.Add('Summer2008');
  LSkinList.Add('Valentine');
  LSkinList.Add('Xmas2008Blue');
  LSkinList.Add('DevExpressDarkStyle');
  LSkinList.Add('DevExpressStyle');
  LSkinList.Add('SevenClassic');
  LSkinList.Add('SharpPlus');
  LSkinList.Add('TheAsphaltWorld');
  LSkinList.Add('VS2010');
  LSkinList.Add('Whiteprint');
  LSkinList.Add('Office2013White');
  LSkinList.Add('Office2013LightGray');
  LSkinList.Add('Office2013DarkGray');
  LSkinList.Add('MetropolisDark');

  dxBarSubItem11.ItemLinks.Clear;
  for i := 1 to LSkinList.Count-1 do  begin
    aBarButton := TdxBarButton.Create(Self);//内存资源由Self负责管理
    aBarButton.Caption := LSkinList.Strings[i];// Format('菜单项%d',[i]);
    aBarButton.OnClick:= dxBarButtonSkinClick; //mi_ItemOnClick; //动态添加Button的Onclick单击事件
    aItemLink := dxBarSubItem11.ItemLinks.Add;
    aItemLink.Item := aBarButton;
  end;
end;

procedure TfrmMainForm.popSetEndClick(Sender: TObject);
begin
  FSysDataBase.ExecSQL('update game_curr set endId = ' + DataSourceMessage.DataSet.FieldByName('sysId').AsString);
  FSysDataBase.RefreshDataSet(DataSourceGameCurr.DataSet);
  Button10.Click;
end;

procedure TfrmMainForm.dxBarButtonSkinClick(Sender: TObject);
begin
  Self.FSkin.SkinName := (Sender as TdxBarButton).Caption;
  Self.FSysConfig.SkinName := Self.FSkin.SkinName;
  Self.FSysConfig.SaveToFile;
end;

procedure TfrmMainForm.WMNewMessage(var msg: TMessage);
begin
  Button10.Click;
end;

procedure TfrmMainForm.actBackUpDatabaseExecute(Sender: TObject);
var
  LStr: string;
begin
  LStr := 'GBackUp_%d%.2d%.2d_%.2d%.2d%.2d.bak';
  LStr := Format(LStr, [YearOf(Now), MonthOf(Now), DayOf(Now), HourOf(Now),MinuteOf(Now), SecondOf(Now)]);
  SaveDialog1.FileName := LStr;
  if SaveDialog1.Execute then  begin
    FSysDataBase.BackUpDatabase(SaveDialog1.FileName);
  end;
end;

procedure TfrmMainForm.actConfigExecute(Sender: TObject);
begin
  if not Assigned(frmGameConfig) then  begin
    frmGameConfig := TfrmGameConfig.Create(Self);
  end;
  frmGameConfig.ShowModal;
end;

procedure TfrmMainForm.actDailyReportExecute(Sender: TObject);
begin
  if Assigned(frmDailyReport) then  begin
    FreeAndNil(frmDailyReport);
  end;
  frmDailyReport := TfrmDailyReport.Create(Self);
  frmDailyReport.ShowModal;
end;

procedure TfrmMainForm.actDisclaimerExecute(Sender: TObject);
begin
  if not Assigned(frmDisclaimer) then  begin
    frmDisclaimer := TfrmDisclaimer.Create(Self);
  end;
  frmDisclaimer.ShowModal;
end;

procedure TfrmMainForm.actExecSqlExecute(Sender: TObject);
begin
  if not Assigned(frmExecSql) then  begin
    frmExecSql := TfrmExecSql.Create(Self);
  end;
  frmExecSql.ShowModal;
end;

procedure TfrmMainForm.actExitExecute(Sender: TObject);
begin
  self.Close;
end;

procedure TfrmMainForm.actHelpExecute(Sender: TObject);
begin
  if not Assigned(frmHelp) then  begin
    frmHelp := TfrmHelp.Create(Self);
  end;
  frmHelp.ShowModal;
end;

procedure TfrmMainForm.actInitSystemExecute(Sender: TObject);
begin
  if Assigned(frmInitSystem) then  begin
    frmInitSystem.Free;
  end;
  frmInitSystem := TfrmInitSystem.Create(Self);
  frmInitSystem.ShowModal;
end;

procedure TfrmMainForm.actPlayerFromInfoExecute(Sender: TObject);
begin
  if Assigned(frmPlayerFormInfo) then  begin
    frmPlayerFormInfo.Free;
  end;
  frmPlayerFormInfo := TfrmPlayerFormInfo.Create(Self);
  frmPlayerFormInfo.ShowModal;
end;

procedure TfrmMainForm.actPlayerManagerExecute(Sender: TObject);
begin
  if Assigned(frmPlayerManger) then  begin
    frmPlayerManger.Free;
  end;
  frmPlayerManger := TfrmPlayerManger.Create(Self);
  frmPlayerManger.ShowModal;
end;

procedure TfrmMainForm.actRegisterExecute(Sender: TObject);
begin
  if not Assigned(frmRegister) then  begin
    frmRegister := TfrmRegister.Create(Self);
  end;
  frmRegister.ShowModal;
end;

procedure TfrmMainForm.actReportShowExecute(Sender: TObject);
begin
  if not Assigned(frmReportShow) then  begin
    frmReportShow := TfrmReportShow.Create(Self);
  end;
  frmReportShow.Show;
end;

//上分下分
procedure TfrmMainForm.Button6Click(Sender: TObject);
begin     //
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

//进入下一局
procedure TfrmMainForm.Button7Click(Sender: TObject);
begin
  if MessageBox(Handle, '确定进入下一局？', '', MB_YESNO + MB_ICONQUESTION) = IDYES then begin
    DataSourceGameCurr.DataSet.Edit;
    DataSourceGameCurr.DataSet.FieldByName('beginId').AsString := FSysDataBase.ExecSQLScalar('select max(sysId) from wx_message');
    DataSourceGameCurr.DataSet.FieldByName('endId').AsString := '0';
    DataSourceGameCurr.DataSet.FieldByName('currTime').AsString := FSysDataBase.ExecSQLScalar('select max(createTime) from wx_message');
    DataSourceGameCurr.DataSet.FieldByName('currJ').AsInteger := DataSourceGameCurr.DataSet.FieldByName('currJ').AsInteger+1;
    Button10.Click;
    FIsSendMsg := True;
    LogInfoAndSend('【进入，' + DataSourceGameCurr.DataSet.FieldByName('currX').AsString + '靴 ' + DataSourceGameCurr.DataSet.FieldByName('currJ').AsString + '局,请开始投注】', DataSourceGameCurr.DataSet.FieldByName('currX').AsString+DataSourceGameCurr.DataSet.FieldByName('currJ').AsString);
  end;
end;

procedure TfrmMainForm.cxDBSpinEdit1PropertiesChange(Sender: TObject);
begin
  if DataSourceGameCurr.DataSet.State in [dsEdit] then
    FSysDataBase.SaveDataSet(DataSourceGameCurr.DataSet);
end;

procedure TfrmMainForm.cxGrid2DBTableView1Column2GetDataText(
  Sender: TcxCustomGridTableItem; ARecordIndex: Integer; var AText: string);
begin
  if AText = '0' then AText := '';
end;

procedure TfrmMainForm.cxGrid3DBTableView1Column2CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if 0 = AViewInfo.GridRecord.Values[(Sender as TcxGridDBTableView).GetColumnByFieldName('isVisible').Index] then
  ACanvas.Canvas.Brush.Color := clRed;
end;

procedure TfrmMainForm.cxGrid3DBTableView1Column2GetDataText(
  Sender: TcxCustomGridTableItem; ARecordIndex: Integer; var AText: string);
begin
  AText := '';
end;

//刷新选手
procedure TfrmMainForm.Button2Click(Sender: TObject);
begin
  if Assigned(DataSourcePlayer.DataSet) then  DataSourcePlayer.DataSet.Free;
  DataSourcePlayer.DataSet := FSysDataBase.GetDataSetBySql('select * from player_info where isDel <> 1 order by isVisible desc, orderNo');
end;


//置顶选手
procedure TfrmMainForm.Button4Click(Sender: TObject);
var
  LStr: string;
begin
  LStr := 'update player_info set orderNo = orderNo+1 where orderNo < ' + DataSourcePlayer.DataSet.FieldByName('orderNo').AsString + ';';
  LStr := LStr + #10 + ' update player_info set orderNo = 1 where playerid = '+ QuotedStr(DataSourcePlayer.DataSet.FieldByName('playerId').AsString) +';';
  FSysDataBase.ExecSQL(LStr);
end;

//隐藏选手
procedure TfrmMainForm.Button5Click(Sender: TObject);
var
  i:Integer;
  LStr: string;
begin     //
  i := DataSourcePlayer.DataSet.FieldByName('isVisible').AsInteger;
  LStr := DataSourcePlayer.DataSet.FieldByName('playerId').AsString;
  if i>0 then i := 0  else i := 1;
//  DataSourcePlayer.DataSet.Edit;
//  DataSourcePlayer.DataSet.FieldByName('isVisible').AsInteger := i;
  FSysDataBase.ExecSQL('update player_info set isVisible = ' + IntToStr(i) + ' where playerId = ' + QuotedStr(LStr));
  Button2Click(Button2);
end;

//查找选手
procedure TfrmMainForm.Button1Click(Sender: TObject);
var
  LStr: string;
  LBK: TBookmark;
begin
  LStr := Trim(cxTextEdit1.Text);
  LBK := DataSourcePlayer.DataSet.GetBookmark;
  with DataSourcePlayer.DataSet do  begin
    DisableControls;
    try
      First;
      while not Eof do    begin
        if FieldByName('nickName').AsString.Contains(LStr) then     begin
          Exit;
        end;
        Next;
      end;
    finally
      EnableControls;
    end;
  end;
  DataSourcePlayer.DataSet.GotoBookmark(LBK);
end;

//进入下一靴
procedure TfrmMainForm.Button8Click(Sender: TObject);
begin
  DataSourceGameCurr.DataSet.Edit;
  DataSourceGameCurr.DataSet.FieldByName('currX').AsInteger := DataSourceGameCurr.DataSet.FieldByName('currX').AsInteger+1;
  DataSourceGameCurr.DataSet.Edit;
  DataSourceGameCurr.DataSet.FieldByName('currJ').AsInteger := 1;
end;

//进入下一局
procedure TfrmMainForm.Button9Click(Sender: TObject);
begin
//  DataSourceGameCurr.DataSet.Edit;
//  DataSourceGameCurr.DataSet.FieldByName('currJ').AsInteger := DataSourceGameCurr.DataSet.FieldByName('currJ').AsInteger+1;
  cxDBSpinEdit1.Enabled := not cxDBSpinEdit1.Enabled;
  cxDBSpinEdit2.Enabled := cxDBSpinEdit1.Enabled;
end;

//微信聊天记录
procedure TfrmMainForm.Button3Click(Sender: TObject);
begin
  FSysDataBase.BackUpDatabase('d:\aa.data');

  if Assigned(frmWxMessage) then  begin
    frmWxMessage.Free;
  end;
  frmWxMessage := TfrmWxMessage.Create(Self);
  frmWxMessage.ShowModal;
end;

//刷新消息
procedure TfrmMainForm.Button10Click(Sender: TObject);
var
  LStr: string;
  LMsgIdBegin, LMsgIdEnd: Integer;
begin
  Button10.Enabled := False;
  try
    LMsgIdBegin := DataSourceGameCurr.DataSet.FieldByName('beginId').AsInteger;
//    LMsgIdEnd := DataSourceGameCurr.DataSet.FieldByName('endId').AsInteger;
    if Assigned(DataSourceMessage.DataSet) then DataSourceMessage.DataSet.Free;
    if CheckBox1.Checked then  begin
      LStr := 'select * from wx_message where length(nickName)>1 and sysId > ' + IntToStr(LMsgIdBegin);
//      if LMsgIdEnd > 0 then LStr := LStr + ' and sysId <=' + IntToStr(LMsgIdEnd);
      LStr := LStr + ' order by createTime';
    end else  begin
      LStr := 'select * from wx_message where length(nickName)>1 and sysId > ' + IntToStr(LMsgIdBegin)
            + ' and (buyZ<>0 or buyX<>0 or buyH<>0 or buyZD<>0 or buyXD<>0)';
//      if LMsgIdEnd > 0 then LStr := LStr + ' and sysId <=' + IntToStr(LMsgIdEnd);
      LStr := LStr + ' order by createTime';
    end;
    DataSourceMessage.DataSet := FSysDataBase.GetDataSetBySql(Self, LStr);
    DataSourceMessage.DataSet.Last;
    CreateBuyFromMessageAdd;
  finally
    Button10.Enabled := True;
  end;
end;

procedure TfrmMainForm.CheckBox1Click(Sender: TObject);
begin
  Button10.Click;
end;

//生成表单
procedure TfrmMainForm.CreateBuyFromMessageAdd;
var
  LStr, LSql, LMsgId: string;
  LInt, LEndId, LPlayerScore, LCurBuyTotal, LBuyZ, LBuyX, LTotalCurrZ, LTotalCurrX, LTotalCurrH, LTotalCurrZD, LTotalCurrXD: Integer;
begin
  if not Assigned(DataSourceMessage.DataSet) then Exit;

  MemoMsgLog.Lines.Clear;
  FPlayerList.Clear;
  LEndId := DataSourceGameCurr.DataSet.FieldByName('endId').AsInteger;
  FSysDataBase.ExecSQL('delete from game_buy_curr');
  LSql := ' insert into game_buy_curr(playerid, orderNo, nickName) ' +
          ' select playerid, orderNo, nickName from player_info where isVisible = 1 and isDel <> 1';
  FSysDataBase.ExecSQL(LSql);
  FSysDataBase.ExecSQL('update game_buy_curr set currX = ' + IntToStr(cxDBSpinEdit1.DataBinding.Field.AsInteger));
  FSysDataBase.ExecSQL('update game_buy_curr set currJ = ' + IntToStr(cxDBSpinEdit2.DataBinding.Field.AsInteger));
  FSysDataBase.ExecSQL('update game_buy_curr set buyZ = 0, buyX = 0, buyH = 0, buyZD = 0, buyXD = 0');

  DataSourceMessage.DataSet.DisableControls;
  with DataSourceMessage.DataSet do  begin
    First;
    while not Eof do    begin
      //存在结束位置， 且超过结束位置
      if (LEndId > 0) and (LEndId < FieldByName('sysId').AsInteger) then      begin
        Next;
        Continue
      end;

      LMsgId := FieldByName('msgId').AsString;
      LSql := 'select score from player_info where playerId = ' + QuotedStr(FieldByName('userName').AsString);
      LPlayerScore := FSysDataBase.ExecSQLScalar(LSql);
      LCurBuyTotal := FieldByName('buyZ').AsInteger+FieldByName('buyX').AsInteger+FieldByName('buyH').AsInteger+FieldByName('buyZD').AsInteger+FieldByName('buyXD').AsInteger;

      // 下注数量为0， 不下单
      if (LCurBuyTotal = 0) then      begin
        Next;
        Continue;
      end;
      // 账户分数为0 不下单
      if (LPlayerScore < 1) then      begin
        LogInfoAndSend('【无效, 余分不足】->(' +  FieldByName('nickName').AsString + '):' + FieldByName('content').AsString, LMsgId);
        FSysDataBase.ExecSQL('update wx_message set buyZ=0, buyX=0, buyH=0, buyZD=0, buyXD=0 where msgId = ' + QuotedStr(LMsgId));
        Next;
        Continue;
      end;

      //限红判断
      begin
        LBuyZ := FieldByName('buyZ').AsInteger;
        LBuyX := FieldByName('buyX').AsInteger;
        if LBuyZ = -1 then LBuyZ := LPlayerScore;  //梭哈庄
        if LBuyX = -1 then LBuyX := LPlayerScore;  //梭哈闲
        if Abs(LTotalCurrZ + LBuyZ - LTotalCurrX - LBuyX) > FZXAbs then        begin
          LogInfoAndSend('【无效, 超过当前限红】->(' +  FieldByName('nickName').AsString + '):' + FieldByName('content').AsString, LMsgId);
          Next;
          Continue;
        end;
      end;

      if not FPlayerList.Find(FieldByName('userName').AsString, LInt) then      begin
        if (FPlayerList.Count+1) > FMaxPlayer then      begin
          LogInfoAndSend('【无效,超过最大玩家数】->(' +  FieldByName('nickName').AsString + '):' + FieldByName('content').AsString, LMsgId);
          Next;
          Continue;
        end;
        FPlayerList.Add(FieldByName('userName').AsString);
      end;

      //本次下单前的总下分数；
      LInt := FSysDataBase.ExecSQLScalar('select buyZ+buyX+buyH+buyZD+buyXD from game_buy_curr where playerId=' + QuotedStr(FieldByName('userName').AsString));


      //庄梭哈
      if FieldByName('buyZ').AsInteger = -1 then      begin
        LStr := 'update game_buy_curr set buyTime=%s, buyZ=buyZ+%d where playerId=%s';
        LStr := Format(LStr, [QuotedStr(DateTimeToStr(FieldByName('createTime').AsDateTime)),
                              LPlayerScore-LInt, QuotedStr(FieldByName('userName').AsString)]);
        FSysDataBase.ExecSQL(LStr);
        LTotalCurrZ := LTotalCurrZ + LBuyZ;
        LTotalCurrX := LTotalCurrX + LBuyX;
        Next;
        Continue;
      end;
      //闲梭哈
      if FieldByName('buyX').AsInteger = -1 then      begin
        LStr := 'update game_buy_curr set buyTime=%s, buyX=buyX+%d where playerId=%s';
        LStr := Format(LStr, [QuotedStr(DateTimeToStr(FieldByName('createTime').AsDateTime)),
                              LPlayerScore-LInt, QuotedStr(FieldByName('userName').AsString)]);
        FSysDataBase.ExecSQL(LStr);
        LTotalCurrZ := LTotalCurrZ + LBuyZ;
        LTotalCurrX := LTotalCurrX + LBuyX;
        Next;
        Continue;
      end;


      //剩余分 < 前下分 + 本次下分     余额不够
      if LPlayerScore < (LInt+LCurBuyTotal) then      begin
        LogInfoAndSend('【无效,余分不足】->(' +  FieldByName('nickName').AsString + '):' + FieldByName('content').AsString, LMsgId);
        Next;
        FSysDataBase.ExecSQL('update wx_message set buyZ=0, buyX=0, buyH=0, buyZD=0, buyXD=0 where msgId = ' + QuotedStr(LMsgId));
        Continue;
      end;

      //下分　＞　下分上限   超过上限
      if (LInt+LCurBuyTotal) > FBuyMaxScore then      begin
        LogInfoAndSend('【无效,超过下分上限' + IntToStr(FBuyMaxScore) +'分】->(' +  FieldByName('nickName').AsString + '):' + FieldByName('content').AsString, LMsgId);
        Next;
        Continue;
      end;
      //下分　＞　下分上限   低于下限
      if (LInt+LCurBuyTotal) < FBuyMinScore then      begin
        LogInfoAndSend('【无效,最少必须' + IntToStr(FBuyMinScore) +'分】->(' +  FieldByName('nickName').AsString + '):' + FieldByName('content').AsString, LMsgId);
        Next;
        Continue;
      end;

      //和、庄对， 闲对，不能超过上限
      if (LTotalCurrH + FieldByName('buyH').AsInteger > FMaxSBScore)  then    begin
        LogInfoAndSend('【无效, 当前和累计下分不能超过' + IntToStr(FMaxSBScore) + '】->(' +  FieldByName('nickName').AsString + '):' + FieldByName('content').AsString, LMsgId);
        Next;
        Continue;
      end;
      if LTotalCurrZD + FieldByName('buyZD').AsInteger > FMaxSBScore  then    begin
        LogInfoAndSend('【无效, 当前庄对累计下分不能超过' + IntToStr(FMaxSBScore) + '】->(' +  FieldByName('nickName').AsString + '):' + FieldByName('content').AsString, LMsgId);
        Next;
        Continue;
      end;
      if LTotalCurrXD + FieldByName('buyXD').AsInteger > FMaxSBScore  then    begin
        LogInfoAndSend('【无效, 当前闲对累计下分不能超过' + IntToStr(FMaxSBScore) + '】->(' +  FieldByName('nickName').AsString + '):' + FieldByName('content').AsString, LMsgId);
        Next;
        Continue;
      end;

      //update
      LStr := 'update game_buy_curr set buyTime=%s, buyZ=buyZ+%d, buyX=buyX+%d, buyH=buyH+%d, buyZD=+buyZD+%d, buyXD=buyXD+%d where playerId=%s';
      LStr := Format(LStr, [QuotedStr(DateTimeToStr(FieldByName('createTime').AsDateTime)),
                            FieldByName('buyZ').AsInteger,
                            FieldByName('buyX').AsInteger,
                            FieldByName('buyH').AsInteger,
                            FieldByName('buyZD').AsInteger,
                            FieldByName('buyXD').AsInteger,
                            QuotedStr(FieldByName('userName').AsString)]);
      FSysDataBase.ExecSQL(LStr);

      LTotalCurrZ := LTotalCurrZ + LBuyZ;
      LTotalCurrX := LTotalCurrX + LBuyX;
      LTotalCurrH := LTotalCurrH + FieldByName('buyH').AsInteger;
      LTotalCurrZD := LTotalCurrZD + FieldByName('buyZD').AsInteger;
      LTotalCurrXD := LTotalCurrXD + FieldByName('buyXD').AsInteger;

      if (FieldByName('buyZ').AsInteger<>0) or (FieldByName('buyX').AsInteger<>0) then      begin
        if Abs(LTotalCurrZ  - LTotalCurrX) > (FZXAbs-FZXAbsWarn) then        begin
          LStr := '【提示，当前可下最大分数: 庄：%d     闲：%d  】';
          LStr := Format(LStr, [LTotalCurrX+FZXAbs-LTotalCurrZ, LTotalCurrZ+FZXAbs-LTotalCurrX]);
          LogInfoAndSend(LStr, LMsgId+'a');
        end;
      end;

      Next;
    end;
  end;
  DataSourceMessage.DataSet.EnableControls;

  LStr := 'select * from game_buy_curr order by orderNo';
  if Assigned(DataSourceBuyCurr.DataSet) then DataSourceBuyCurr.DataSet.Free;
  DataSourceBuyCurr.DataSet := FSysDataBase.GetDataSetBySql(Self, LStr);
  cxGrid2DBTableView1Column1.Caption := IntToStr(cxDBSpinEdit1.DataBinding.Field.AsInteger) + '靴'
                                       +IntToStr(cxDBSpinEdit2.DataBinding.Field.AsInteger) + '局';
  (DataSourceBuyCurr.DataSet as TFDQuery).CachedUpdates := True;
end;

procedure TfrmMainForm.CreateBuyFromMessage2;//bak
var
  LStr, LMsgId: string;
  LScore, LInt, LIntTmp, LEndId, LTotalCurrZ, LTotalCurrX, LBuyZ, LBuyX, LIndex: Integer;
begin
  if not Assigned(DataSourceMessage.DataSet) then Exit;
  LEndId := DataSourceGameCurr.DataSet.FieldByName('endId').AsInteger;

  FPlayerList.Clear;
  LTotalCurrZ := 0;
  LTotalCurrX := 0;
  MemoMsgLog.Lines.Clear;
  DataSourceMessage.DataSet.DisableControls;

  FSysDataBase.ExecSQL('delete from game_buy_curr');
  LStr := ' insert into game_buy_curr(playerid, orderNo, nickName) ' +
          ' select playerid, orderNo, nickName from player_info where isVisible = 1 and isDel <> 1';
  FSysDataBase.ExecSQL(LStr);
  FSysDataBase.ExecSQL('update game_buy_curr set currX = ' + IntToStr(cxDBSpinEdit1.DataBinding.Field.AsInteger));
  FSysDataBase.ExecSQL('update game_buy_curr set currJ = ' + IntToStr(cxDBSpinEdit2.DataBinding.Field.AsInteger));
  FSysDataBase.ExecSQL('update game_buy_curr set buyZ = 0, buyX = 0, buyH = 0, buyZD = 0, buyXD = 0');

  with DataSourceMessage.DataSet do  begin
    First;
    while not Eof do    begin
      //存在结束位置， 且超过结束位置
      if (LEndId > 0) and (LEndId < FieldByName('sysId').AsInteger) then      begin
        Next;
        Continue
      end;

      LMsgId := FieldByName('msgId').AsString;
      LStr := 'select score from player_info where playerId = ' + QuotedStr(FieldByName('userName').AsString);
      LScore := FSysDataBase.ExecSQLScalar(LStr);
      LInt := FieldByName('buyZ').AsInteger+FieldByName('buyX').AsInteger+FieldByName('buyH').AsInteger+FieldByName('buyZD').AsInteger+FieldByName('buyXD').AsInteger;
      // 下注数量为0， 不下单
      if (LInt = 0) then      begin
        Next;
        Continue;
      end;
      // 账户分数为0 不下单
      if (LScore < 1) then      begin
        LogInfoAndSend('【无效, 余分不足】->(' +  FieldByName('nickName').AsString + '):' + FieldByName('content').AsString, LMsgId);
        Next;
        Continue;
      end;

      //限红判断
      begin
        LBuyZ := FieldByName('buyZ').AsInteger;
        LBuyX := FieldByName('buyX').AsInteger;
        if LBuyZ = -1 then LBuyZ := LScore;  //梭哈庄
        if LBuyX = -1 then LBuyX := LScore;  //梭哈闲

        if Abs(LTotalCurrZ + LBuyZ - LTotalCurrX - LBuyX) > FZXAbs then        begin
          LogInfoAndSend('【无效, 超过当前限红】->(' +  FieldByName('nickName').AsString + '):' + FieldByName('content').AsString, LMsgId);
          Next;
          Continue;
        end;
      end;

      //撤销: clear数据
      if FieldByName('buyH').AsInteger = -1 then      begin
        LStr := 'update game_buy_curr set buyTime=%s, buyZ=%d, buyX=%d, buyH=%d, buyZD=%d, buyXD=%d where playerId=%s';
        LStr := Format(LStr, [QuotedStr(DateTimeToStr(FieldByName('createTime').AsDateTime)),
                              0,0,0,0,0,
                              QuotedStr(FieldByName('userName').AsString)]);
        FSysDataBase.ExecSQL(LStr);
        FPlayerList.Find(FieldByName('userName').AsString, LIndex);
        FPlayerList.Delete(LIndex);
        Next;
        Continue;
      end;

      if not FPlayerList.Find(FieldByName('userName').AsString, LIndex) then      begin
        if (FPlayerList.Count+1) > FMaxPlayer then      begin
          LogInfoAndSend('【无效,超过最大玩家数】->(' +  FieldByName('nickName').AsString + '):' + FieldByName('content').AsString, LMsgId);
          Next;
          Continue;
        end;
        FPlayerList.Add(FieldByName('userName').AsString);
      end;

      //庄梭哈
      if FieldByName('buyZ').AsInteger = -1 then      begin
        LStr := 'update game_buy_curr set buyTime=%s, buyZ=%d, buyX=0, buyH=0, buyZD=0, buyXD=0 where playerId=%s';
        LStr := Format(LStr, [QuotedStr(DateTimeToStr(FieldByName('createTime').AsDateTime)),
                              LScore, QuotedStr(FieldByName('userName').AsString)]);
        FSysDataBase.ExecSQL(LStr);
        LTotalCurrZ := LTotalCurrZ + LBuyZ;
        LTotalCurrX := LTotalCurrX + LBuyX;
        Next;
        Continue;
      end;
      //闲梭哈
      if FieldByName('buyX').AsInteger = -1 then      begin
        LStr := 'update game_buy_curr set buyTime=%s, buyZ=0, buyX=%d, buyH=0, buyZD=0, buyXD=0 where playerId=%s';
        LStr := Format(LStr, [QuotedStr(DateTimeToStr(FieldByName('createTime').AsDateTime)),
                              LScore, QuotedStr(FieldByName('userName').AsString)]);
        FSysDataBase.ExecSQL(LStr);
        LTotalCurrZ := LTotalCurrZ + LBuyZ;
        LTotalCurrX := LTotalCurrX + LBuyX;
        Next;
        Continue;
      end;

      //本次下单后的总下分数；
      LIntTmp := 0;
      if FieldByName('buyZ').AsInteger>0 then LIntTmp := LIntTmp + FieldByName('buyZ').AsInteger else LIntTmp := LIntTmp + FSysDataBase.ExecSQLScalar('select buyZ from game_buy_curr where playerId=' + QuotedStr(FieldByName('userName').AsString));
      if FieldByName('buyX').AsInteger>0 then LIntTmp := LIntTmp + FieldByName('buyX').AsInteger else LIntTmp := LIntTmp + FSysDataBase.ExecSQLScalar('select buyX from game_buy_curr where playerId=' + QuotedStr(FieldByName('userName').AsString));
      if FieldByName('buyH').AsInteger>0 then LIntTmp := LIntTmp + FieldByName('buyH').AsInteger else LIntTmp := LIntTmp + FSysDataBase.ExecSQLScalar('select buyH from game_buy_curr where playerId=' + QuotedStr(FieldByName('userName').AsString));
      if FieldByName('buyZD').AsInteger>0 then LIntTmp := LIntTmp + FieldByName('buyZD').AsInteger else LIntTmp := LIntTmp + FSysDataBase.ExecSQLScalar('select buyZD from game_buy_curr where playerId=' + QuotedStr(FieldByName('userName').AsString));
      if FieldByName('buyXD').AsInteger>0 then LIntTmp := LIntTmp + FieldByName('buyXD').AsInteger else LIntTmp := LIntTmp + FSysDataBase.ExecSQLScalar('select buyXD from game_buy_curr where playerId=' + QuotedStr(FieldByName('userName').AsString));

      //剩余分 < 下分     余额不够
      if LScore < LIntTmp then      begin
        LogInfoAndSend('【无效,余分不足】->(' +  FieldByName('nickName').AsString + '):' + FieldByName('content').AsString, LMsgId);
        Next;
        Continue;
      end;
      //下分　＞　下分上限   超过上限
      if LIntTmp > FBuyMaxScore then      begin
        LogInfoAndSend('【无效,超过单次下分上限】->(' +  FieldByName('nickName').AsString + '):' + FieldByName('content').AsString, LMsgId);
        Next;
        Continue;
      end;
      //同时下庄闲
      if ((FieldByName('buyZ').AsInteger>0) and (FieldByName('buyX').AsInteger>0)) then      begin
        LogInfoAndSend('【无效,不能同时押庄和闲】->(' +  FieldByName('nickName').AsString + '):' + FieldByName('content').AsString, LMsgId);
        Next;
        Continue;
      end;
      //同时下庄闲
      LStr := 'select buyZ from game_buy_curr where playerId=' + QuotedStr(FieldByName('userName').AsString);
      LIntTmp := FSysDataBase.ExecSQLScalar(LStr);
      if ((LIntTmp>0) and (FieldByName('buyX').AsInteger>0)) then      begin
        LogInfoAndSend('【无效,已押庄不能再押闲】->(' +  FieldByName('nickName').AsString + '):' + FieldByName('content').AsString, LMsgId);
        Next;
        Continue;
      end;
      //同时下庄闲
      LStr := 'select buyX from game_buy_curr where playerId=' + QuotedStr(FieldByName('userName').AsString);
      LIntTmp := FSysDataBase.ExecSQLScalar(LStr);
      if ((LIntTmp>0) and (FieldByName('buyZ').AsInteger>0)) then      begin
        LogInfoAndSend('【无效,已押闲不能再押庄】->(' +  FieldByName('nickName').AsString + '):' + FieldByName('content').AsString, LMsgId);
        Next;
        Continue;
      end;

      //update
      LStr := 'update game_buy_curr set buyTime=' + QuotedStr(FieldByName('createTime').AsString);
      if FieldByName('buyZ').AsInteger>0 then LStr := LStr + ', buyZ=' + IntToStr(FieldByName('buyZ').AsInteger);
      if FieldByName('buyX').AsInteger>0 then LStr := LStr + ', buyX=' + IntToStr(FieldByName('buyX').AsInteger);
      if FieldByName('buyH').AsInteger>0 then LStr := LStr + ', buyH=' + IntToStr(FieldByName('buyH').AsInteger);
      if FieldByName('buyZD').AsInteger>0 then LStr := LStr + ', buyZD=' + IntToStr(FieldByName('buyZD').AsInteger);
      if FieldByName('buyXD').AsInteger>0 then LStr := LStr + ', buyXD=' + IntToStr(FieldByName('buyXD').AsInteger);
      LStr := LStr + ' where playerId=' + QuotedStr(FieldByName('userName').AsString);

      FSysDataBase.ExecSQL(LStr);

      LTotalCurrZ := LTotalCurrZ + LBuyZ;
      LTotalCurrX := LTotalCurrX + LBuyX;

      if (FieldByName('buyZ').AsInteger>0) or (FieldByName('buyX').AsInteger>0) then      begin
        LStr := '【提示，当前可下最大分数: 庄：%d     闲：%d  】';
        LStr := Format(LStr, [LTotalCurrX+FZXAbs-LTotalCurrZ, LTotalCurrZ+FZXAbs-LTotalCurrX]);
        LogInfoAndSend(LStr, LMsgId+'a');
      end;

      Next;
    end;
  end;


  DataSourceMessage.DataSet.EnableControls;

  LStr := 'select * from game_buy_curr order by orderNo';
  if Assigned(DataSourceBuyCurr.DataSet) then DataSourceBuyCurr.DataSet.Free;
  DataSourceBuyCurr.DataSet := FSysDataBase.GetDataSetBySql(Self, LStr);
  cxGrid2DBTableView1Column1.Caption := IntToStr(cxDBSpinEdit1.DataBinding.Field.AsInteger) + '靴'
                                       +IntToStr(cxDBSpinEdit2.DataBinding.Field.AsInteger) + '局';
  (DataSourceBuyCurr.DataSet as TFDQuery).CachedUpdates := True;
end;

procedure TfrmMainForm.Button12Click(Sender: TObject);
var
  LStr, LStr2 :string;
  LGameId, LResZ, LResX, LResH, LResZD, LResXD, LInt: Integer;
  LWonZ, LWonX, LWonH, LWonD, LWonZS: Double;
  LDataSet: TDataSet;
begin
  if cxRadioButton1.Checked or cxRadioButton2.Checked or cxRadioButton3.Checked  then  begin
  end else  begin
    ShowMessage('请设置开奖结果');
    Exit;
  end;

  LResZ := 0;  if cxRadioButton1.Checked then LResZ := 1;
  LResX := 0;  if cxRadioButton2.Checked then LResX := 1;
  LResH := 0;  if cxRadioButton3.Checked then LResH := 1;
  LResZD := 0; if cxCheckBox1.Checked then LResZD := 1;
  LResXD := 0; if cxCheckBox2.Checked then LResXD := 1;

  LWonZ := FSysDataBase.ExecSQLScalar('select value from game_config where name = ' + QuotedStr('wonZ'));
  LWonX := FSysDataBase.ExecSQLScalar('select value from game_config where name = ' + QuotedStr('wonX'));
  LWonH := FSysDataBase.ExecSQLScalar('select value from game_config where name = ' + QuotedStr('wonH'));
  LWonD := FSysDataBase.ExecSQLScalar('select value from game_config where name = ' + QuotedStr('wonD'));
  LWonZS := FSysDataBase.ExecSQLScalar('select value from game_config where name = ' + QuotedStr('wonZS'));

  //插入开奖结果主表
  LStr := ' select * from game_buy where currX = ' + QuotedStr(cxDBSpinEdit1.DataBinding.Field.AsString)
         +' and currJ = ' + QuotedStr(cxDBSpinEdit2.DataBinding.Field.AsString)
         +' and currTime > ' + QuotedStr(DateTimeToStr(Now-1/24));
  LDataSet := FSysDataBase.GetDataSetBySql(LStr);
  with LDataSet do  begin
    if IsEmpty then    begin
      Append;
      FieldByName('currX').Value := cxDBSpinEdit1.DataBinding.Field.Value;
      FieldByName('currJ').Value := cxDBSpinEdit2.DataBinding.Field.Value;
    end;
    Edit;
    FieldByName('currTime').AsDateTime := Now;
    FieldByName('resZ').AsInteger := LResZ;
    FieldByName('resX').AsInteger := LResX;
    FieldByName('resH').AsInteger := LResH;
    FieldByName('resZD').AsInteger := LResZD;
    FieldByName('resXD').AsInteger := LResXD;
    FSysDataBase.SaveDataSet(LDataSet);
    FSysDataBase.RefreshDataSet(LDataSet);
    LGameId := FieldByName('gameId').AsInteger;
    Free;
  end;

  //删除， 并回退
  LStr := '';
  with FSysDataBase.GetDataSetBySql(Self, 'select * from game_buy_detail where gameId = ' + IntToStr(LGameId)) do  begin
    if not IsEmpty then    begin
      First;
      while not Eof do      begin
        LInt := FieldByName('resZ').AsInteger
               +FieldByName('resX').AsInteger
               +FieldByName('resH').AsInteger
               +FieldByName('resZD').AsInteger
               +FieldByName('resXD').AsInteger;
        if LInt <> 0 then        begin
          LStr := LStr + 'update player_info set score = score-(' + IntToStr(LInt)
                  + ') where playerId = ' + QuotedStr(FieldByName('playerId').AsString) + ';';
        end;
        Next;
      end;
    end;
  end;
  LStr := LStr + 'delete from game_buy_detail where gameId = ' + IntToStr(LGameId) + ';';
  LStr := LStr + 'update player_info set currScore = 0;';
  FSysDataBase.ExecSQLWithTrans(LStr);

  LStr := '';
  //插入开奖结果明细
  with DataSourceBuyCurr.DataSet do  begin
    First;
    while not Eof do    begin
      LInt := FieldByName('buyZ').AsInteger + FieldByName('buyX').AsInteger
              +FieldByName('buyH').AsInteger + FieldByName('buyZD').AsInteger
              + FieldByName('buyXD').AsInteger;
      if LInt > 0 then      begin
        LStr2 := 'insert into game_buy_detail(gameId, playerId, orderNo, nickName, currX, currJ, buyZ, buyX, buyH, buyZD, buyXD, buyTime, resZ, resX, resH, resZD, resXD, dailyFlag)';
        LStr2 := LStr2 + 'values(%d, %s, %d, %s, %d, %d, %d, %d, %d, %d, %d, %s, %d, %d, %d, %d, %d, 0);';
        LStr2 := Format(LStr2, [LGameId,
                                QuotedStr(FieldByName('playerId').AsString),
                                FieldByName('orderNo').AsInteger,
                                QuotedStr(FieldByName('nickName').AsString),
                                cxDBSpinEdit1.DataBinding.Field.AsInteger,
                                cxDBSpinEdit2.DataBinding.Field.AsInteger,
                                FieldByName('buyZ').AsInteger,
                                FieldByName('buyX').AsInteger,
                                FieldByName('buyH').AsInteger,
                                FieldByName('buyZD').AsInteger,
                                FieldByName('buyXD').AsInteger,
                                QuotedStr(FieldByName('buyTime').AsString),
                                (Round(FieldByName('buyZ').AsInteger * LResZ * (LWonZ-LWonZS+1)) - FieldByName('buyZ').AsInteger)*(1-LResH),
                                (Round(FieldByName('buyX').AsInteger * LResX * (LWonX+1)) - FieldByName('buyX').AsInteger)*(1-LResH),
                                Round(FieldByName('buyH').AsInteger * LResH * (LWonH+1)) - FieldByName('buyH').AsInteger,
                                Round(FieldByName('buyZD').AsInteger * LResZD * (LWonD+1)) - FieldByName('buyZD').AsInteger,
                                Round(FieldByName('buyXD').AsInteger * LResXD * (LWonD+1)) - FieldByName('buyXD').AsInteger
                                ]);
        LInt := (Round(FieldByName('buyZ').AsInteger * LResZ * (LWonZ-LWonZS+1)) - FieldByName('buyZ').AsInteger)*(1-LResH)
              + (Round(FieldByName('buyX').AsInteger * LResX * (LWonX+1)) - FieldByName('buyX').AsInteger)*(1-LResH)
              + Round(FieldByName('buyH').AsInteger * LResH * (LWonH+1)) - FieldByName('buyH').AsInteger
              + Round(FieldByName('buyZD').AsInteger * LResZD * (LWonD+1)) - FieldByName('buyZD').AsInteger
              + Round(FieldByName('buyXD').AsInteger * LResXD * (LWonD+1)) - FieldByName('buyXD').AsInteger;
        LStr2 := LStr2 + 'update player_info set score = score+' + IntToStr(LInt) + ', currScore = ' + QuotedStr(IntToStr(LInt))
                + ' where playerId = ' + QuotedStr(FieldByName('playerId').AsString) + ';';
        LStr := LStr + LStr2;

      end;
      Next;
    end;
  end;
  FSysDataBase.ExecSQLWithTrans(LStr);

  LStr := 'Select * From player_info left join game_curr where isvisible = 1 and isDel <> 1 order by orderNo';
  if Assigned(DataSourcePlayerScore.DataSet) then DataSourcePlayerScore.DataSet.Free;
  DataSourcePlayerScore.DataSet := FSysDataBase.GetDataSetBySql(Self, LStr);

  LStr := '';
  if cxRadioButton1.Checked then LStr := '【庄赢】';
  if cxRadioButton2.Checked then LStr := LStr + '【闲赢】';
  if cxRadioButton3.Checked then LStr := LStr + '【和】';
  if cxCheckBox1.Checked then LStr := LStr + '【庄对】';
  if cxCheckBox2.Checked then LStr := LStr + '【闲对】';

  LStr := '开奖结果-->'+IntToStr(cxDBSpinEdit1.DataBinding.Field.AsInteger) + '靴'
          +IntToStr(cxDBSpinEdit2.DataBinding.Field.AsInteger) + '局:' + LStr;
  LogInfoAndSend(LStr, 'resxj' + IntToStr(cxDBSpinEdit1.DataBinding.Field.AsInteger) + IntToStr(cxDBSpinEdit2.DataBinding.Field.AsInteger));
  FIsSendMsg := False;

  cxGrid4DBTableView1Column1.Caption := IntToStr(cxDBSpinEdit1.DataBinding.Field.AsInteger) + '靴'
                                       +IntToStr(cxDBSpinEdit2.DataBinding.Field.AsInteger) + '局';

  //清空开奖结果
  cxRadioButton1.Checked := False;
  cxRadioButton2.Checked := False;
  cxRadioButton3.Checked := False;
  cxCheckBox1.Checked := False;
  cxCheckBox2.Checked := False;
end;

procedure TfrmMainForm.Button13Click(Sender: TObject);
var
  LImage: TImage;
begin
  frxDBDatasetBuyCurr.DataSet := DataSourceBuyCurr.DataSet;
  if frxReportBuyCurr.PrepareReport(True) then  begin
//    frxReportBuyCurr.ShowPreparedReport;
    frxJPEGExport1.FileName := ExtractFilePath(Application.ExeName) + 'tmp.jpg';
    frxJPEGExport1.ShowDialog := False;
    frxJPEGExport1.ShowProgress := False;
    frxReportBuyCurr.Export(frxJPEGExport1);
    LImage := TImage.Create(Self);
    try
      LImage.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'tmp.1.jpg');
      Clipboard.Assign(LImage.Picture);
    finally
      LImage.Free;
    end;
  end;
end;

procedure TfrmMainForm.Button14Click(Sender: TObject);
var
  LImage: TImage;
begin
  frxDBDatasetPlayerScore.DataSet := DataSourcePlayerScore.DataSet;
  if frxReportPlayerSocre.PrepareReport(True) then  begin
//    frxReportPlayerSocre.ShowPreparedReport;
    frxJPEGExport1.FileName := ExtractFilePath(Application.ExeName) + 'tmp.jpg';
    frxJPEGExport1.ShowDialog := False;
    frxJPEGExport1.ShowProgress := False;
    frxReportPlayerSocre.Export(frxJPEGExport1);
    LImage := TImage.Create(Self);
    try
      LImage.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'tmp.1.jpg');
      Clipboard.Assign(LImage.Picture);
    finally
      LImage.Picture.Bitmap.FreeImage;
      LImage.Free;
    end;
  end;
end;

procedure TfrmMainForm.Button11Click(Sender: TObject);
begin
  if not Assigned(frmWxWeb) then
    frmWxWeb := TfrmWxWeb.Create(Self);
  frmWxWeb.Show;
end;

procedure TfrmMainForm.LogInfo(AStr: string);
begin
  MemoMsgLog.Lines.Add(AStr);
end;

procedure TfrmMainForm.LogInfoAndSend(AStr, AMsgId: string);
begin
  LogInfo(astr);
  SendWxMessage(AStr, AMsgId);
end;

procedure TfrmMainForm.SendWxMessage(AStr, AMsgId: string);
begin
  if FMsgIdList.IndexOf(AMsgId) >=  0 then Exit;

  if Assigned(frmWxWeb) and FIsSendMsg then  begin
    if frmWxWeb.Handle <> 0 then  begin
      SendMessage(frmWxWeb.Handle, WM_MESSAGE_SEND_MESSAGE, 0, Integer(PChar(AStr)));
      FMsgIdList.Add(AMsgId);
    end;
  end;
end;

procedure TfrmMainForm.AutoBackupDatabase;
begin
  if DaysBetween(Now, FSysConfig.SystemBackupTime) > 0 then  begin
    FSysDataBase.AutoBackUpDatabase;
    FSysConfig.SystemBackupTime := Now;
    FSysConfig.SaveToFile;
  end;
end;

//黏贴微信消息
procedure TfrmMainForm.Button15Click(Sender: TObject);
begin
  if Assigned(frmClipWxMessage) then  begin
    FreeAndNil(frmClipWxMessage);
  end;
  frmClipWxMessage := TfrmClipWxMessage.Create(Self);
  frmClipWxMessage.ShowModal;

  if frmClipWxMessage.ModalResult = mrOk then  begin
    Button10Click(Button10);
  end;
end;

procedure TfrmMainForm.Button16Click(Sender: TObject);
var
  LDataSet: TDataSet;
  LStr: string;
  LResValue: TResValue;
  LResPair: TResPair;
begin
  if Assigned(frmRoad) then  begin
    FreeAndNil(frmRoad);
  end;
  frmRoad := TfrmRoad.Create(Self);

  //结果主表
  LStr := 'select * from game_buy order by currTime desc limit 100';
  LDataSet := FSysDataBase.GetDataSetBySql(LStr);
  LDataSet.First;
  while LDataSet.FieldByName('currJ').AsInteger > 1 do  begin
    if LDataSet.Eof then Break;
    LDataSet.Next;
  end;

  while not LDataSet.Bof do  begin
    if LDataSet.FieldByName('resZ').AsInteger > 0 then LResValue := Bank;
    if LDataSet.FieldByName('resX').AsInteger > 0 then LResValue := Play;
    if LDataSet.FieldByName('resH').AsInteger > 0 then LResValue := Tie;

    LResPair := NoPair;
    if LDataSet.FieldByName('resZD').AsInteger > 0 then LResPair := BankPair;
    if LDataSet.FieldByName('resXD').AsInteger > 0 then LResPair := PlayPair;

    frmRoad.putRes(LDataSet.FieldByName('currJ').AsInteger, LResValue, 0, LResPair);

    LDataSet.Prior;
  end;

  frmRoad.Show;

end;

end.


//<color name="holo_orange_dark">#ffff8800</color>   庄     rgb：255-136-0
//<color name="holo_blue_dark">#ff0099cc</color>   闲            0-153-204
//<color name="holo_green_dark">#ff669900</color>  和            102-153-0

