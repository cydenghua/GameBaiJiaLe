unit uSysDataBase;

interface

uses
  Classes, SysUtils, System.Variants,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, System.DateUtils,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Phys, FireDAC.Stan.Pool, FireDAC.Stan.Async, Data.DB,
  FireDAC.Comp.Client, FireDAC.Phys.MSSQLDef, FireDAC.Phys.ODBCBase,
  FireDAC.Phys.MSSQL, FireDAC.VCLUI.Wait, FireDAC.Comp.UI, FireDAC.DApt,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteDef, FireDAC.Phys.SQLite,
  FireDAC.Moni.Base, FireDAC.Moni.FlatFile,
  SyncObjs;

type
  TSysDataBase = class(TComponent)
  private
    { Private declarations }
    FDManager: TFDManager;
    FDConnection: TFDConnection;
    FDMoniFlatFileClientLink: TFDMoniFlatFileClientLink;

    FDPhysSQLiteDriverLink: TFDPhysSQLiteDriverLink;
    FDSQLiteBackup: TFDSQLiteBackup;

    FLock : TCriticalSection;
    constructor Create; virtual;
    destructor Destroy; override;
  public
    { Public declarations }

    procedure BackUpDatabase(AToFile: string);
    procedure AutoBackUpDatabase();
    function GetStrGUID():string;
    function ExecSQL(const ASql: string):Integer;
    function ExecSQLWithTrans(const ASql: string):Integer;
    function ExecSQLScalar(const ASQL: String): Variant;
    function GetDataSetBySql(const ASql: string): TDataSet; overload;
    function GetDataSetBySql(AOwner: TComponent; const ASql: string): TDataSet; overload;
    function GetMaxSysId(const ADefinition:string; const AStep: Integer = 1):Integer;
    function GetFieldMaxValue(const ATableName:string; const AFieldName: string):Integer;
    function GetSysDateTime:TDateTime;
    procedure SaveDataSet(ADataSet: TDataSet);
    procedure RefreshDataSet(ADataSet: TDataSet);
    procedure OpenDataSet(ADataSet: TDataSet);
  end;

var
  g_SysDataBase: TSysDataBase;
  function GetSysDataBase:TSysDataBase;

implementation

  function GetSysDataBase:TSysDataBase;
  begin
    if not Assigned(g_SysDataBase) then
      g_SysDataBase := TSysDataBase.Create;
    Result := g_SysDataBase;
  end;

{ TSysDataBase }


constructor TSysDataBase.Create;
var
  oParams: TStrings;
begin
  if not FileExists('ConnectionDefs.ini') then  begin
    raise Exception.Create('Err48: not found ConnectionDefs file.');
  end;

  FLock := TCriticalSection.Create;

  FDPhysSQLiteDriverLink := TFDPhysSQLiteDriverLink.Create(Self);
  FDSQLiteBackup := TFDSQLiteBackup.Create(Self);

  FDManager := TFDManager.Create(Self);
  FDManager.ConnectionDefFileAutoLoad := False;
//  FDManager.ConnectionDefFileName := 'ConnectionDefs.ini';
//  FDManager.LoadConnectionDefFile;

  FDMoniFlatFileClientLink := TFDMoniFlatFileClientLink.Create(Self);
  FDMoniFlatFileClientLink.FileName := ExtractFilePath(ParamStr(0)) + 'sqllog.txt';
//  FDMoniFlatFileClientLink.Tracing := True;

  oParams := TStringList.Create;
  oParams.Add('DriverID=SQLite');
  oParams.Add('Database=data.db');
  oParams.Add('LockingMode=Normal');
  oParams.Add('StringFormat=Unicode');
  oParams.Add('MonitorBy=FlatFile');
  oParams.Add('Pooled=True');
  oParams.Add('PoolMaximumItems=10');
  oParams.Add('Password=game1999');
  FDManager.AddConnectionDef('game_system_db', 'SQLite', oParams);

  FDConnection := TFDConnection.Create(Self);
  FDConnection.ConnectionDefName := 'game_system_db';
  FDConnection.Connected := True;

  FDConnection.ConnectionIntf.Tracing := False;
  FDConnection.ConnectionIntf.Tracing := True;
end;

destructor TSysDataBase.Destroy;
begin
//  FDConnection.Connected := True;
  inherited;
end;

function TSysDataBase.GetStrGUID: string;
var
  Guid: TGUID;
begin
  CreateGUID(Guid);
  Result := GUIDToString(Guid);
end;


function TSysDataBase.ExecSQL(const ASql: string): Integer;
begin
  FLock.Enter;
  try
    Result := FDConnection.ExecSQL(ASql);
  finally
    FLock.Leave;
  end;
end;

function TSysDataBase.ExecSQLScalar(const ASQL: String): Variant;
begin
  FLock.Enter;
  try
    Result := FDConnection.ExecSQLScalar(ASQL);
  finally
    FLock.Leave;
  end;
end;

function TSysDataBase.ExecSQLWithTrans(const ASql: string): Integer;
begin
  Result := 0;
  FLock.Enter;
  try
    FDConnection.StartTransaction;
    try
      Result := FDConnection.ExecSQL(ASql);
      FDConnection.Commit;
    except on E: Exception do
      FDConnection.Rollback;
    end;
  finally
    FLock.Leave;
  end;
end;

function TSysDataBase.GetDataSetBySql(AOwner: TComponent; const ASql: string): TDataSet;
var
  LQuery: TFDQuery;
begin
  FLock.Enter;
  try
    LQuery := TFDQuery.Create(AOwner);
    try
      LQuery.Connection := FDConnection;
      LQuery.Open(ASql);
      Result := LQuery;
    except
    end;
  finally
    FLock.Leave;
  end;
end;

function TSysDataBase.GetDataSetBySql(const ASql: string): TDataSet;
begin
  Result := GetDataSetBySql(nil, ASql);
end;

function TSysDataBase.GetFieldMaxValue(const ATableName: string; const AFieldName: string): Integer;
var
  LSql: string;
  LVar: Variant;
begin
  LSql := 'select max(' + AFieldName + ') from ' + ATableName;
  LVar := ExecSQLScalar(LSql);

  if LVar = Null then  begin //如果不存在记录
    Result := 0;
  end else  begin
    Result := LVar;
  end;
end;

function TSysDataBase.GetMaxSysId(const ADefinition: string;
  const AStep: Integer): Integer;
var
  LSql: string;
  LVar: Variant;
begin
  LSql := 'select curr_id from sys_id_generator ' + #10
        + 'where definition = ''%s''';
  LVar := ExecSQLScalar(LSql);

  if LVar = Null then  begin //如果不存在记录
    LSql := 'insert into sys_id_generator(definition, curr_id, description) ' + #10
          + 'values(''%s'', 1000, ''%s_sysid'')';  //id全部从1000开始
    LSql := Format(LSql, [ADefinition, ADefinition]);
    ExecSQL(LSql);
  end;

  LSql := 'update sys_id_generator set curr_id = curr_id + %d' + #10
        + 'where definition = ''%s''';
  LSql := Format(LSql, [AStep, ADefinition]);
  if ExecSQL(LSql) = 1 then   begin       //更新成功， 获取数据
    LSql := 'select curr_id from sys_id_generator ' + #10
          + 'where definition = ''%s''';
    LSql := Format(LSql, [ADefinition]);
    Result := ExecSQLScalar(LSql);
  end;
end;

function TSysDataBase.GetSysDateTime: TDateTime;
begin
  FLock.Enter;
  try
    Result := FDConnection.ExecSQLScalar('select getdate() as res');//Self.GetDataSetBySql('select getdate() as res').Fields[0].AsDateTime;
  finally
    FLock.Leave;
  end;
end;

procedure TSysDataBase.SaveDataSet(ADataSet: TDataSet);
begin
  FLock.Enter;
  try
    ADataSet.Post;
  finally
    FLock.Leave;
  end;
end;

procedure TSysDataBase.RefreshDataSet(ADataSet: TDataSet);
begin
  FLock.Enter;
  try
    ADataSet.Refresh;
  finally
    FLock.Leave;
  end;
end;

procedure TSysDataBase.OpenDataSet(ADataSet: TDataSet);
begin
  FLock.Enter;
  try
    ADataSet.Open;
  finally
    FLock.Leave;
  end;
end;


procedure TSysDataBase.AutoBackUpDatabase;
var
  LStr: string;
begin
  LStr := 'backup\GBackUp_%d%.2d%.2d_%.2d%.2d%.2d.bak';
  LStr := Format(LStr, [YearOf(Now), MonthOf(Now), DayOf(Now), HourOf(Now),MinuteOf(Now), SecondOf(Now)]);
  LStr := ExtractFilePath(ParamStr(0)) + LStr;
  BackUpDatabase(LStr);
end;

procedure TSysDataBase.BackUpDatabase(AToFile: string);
var
  LFDConnection: TFDConnection;
begin
  FLock.Enter;
  try
    FDSQLiteBackup.DriverLink := FDPhysSQLiteDriverLink;
    FDSQLiteBackup.Database := 'data.db';
    FDSQLiteBackup.DestDatabase := AToFile;
    FDSQLiteBackup.Password := 'game1999';
    FDSQLiteBackup.DestPassword := 'game1999';
    FDSQLiteBackup.Backup;
  finally
    FLock.Leave;
  end;
end;

initialization
  g_SysDataBase := nil;
end.
