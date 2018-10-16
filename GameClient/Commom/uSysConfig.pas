unit uSysConfig;

interface

uses
  Classes, SysUtils, IniFiles, Forms, Windows;

const
  csSystemSection = 'system';
  csSkinSection = 'skin';

  {Section: system}
  csSystemName = 'sys_name';
  csSystemTime = 'sys_time';
  csSystemBackupTime = 'sys_backup_time';

  {Section: skin}
  csSkinName = 'skin_name';

type
  TSysConfig = class(TObject)
  private
    {Section: system}
    FSystemName: string;
    FSystemTime: Integer;
    FSystemBackupTime: TDateTime;

    {Section: skin}
    FSkinName: string;

    FConfigFilePath: string;
    constructor Create;
    destructor Destroy; override;
  public
    procedure LoadSettings(Ini: TIniFile);
    procedure SaveSettings(Ini: TIniFile);

    procedure LoadFromFile;
    procedure SaveToFile;

    {Section: system}
    property SystemName: string read FSystemName write FSystemName;
    property SystemTime: Integer read FSystemTime write FSystemTime;
    property SystemBackupTime: TDateTime read FSystemBackupTime write FSystemBackupTime;

    {Section: skin}
    property SkinName: string read FSkinName write FSkinName;
  end;

var
  SysConfig: TSysConfig = nil;

implementation

procedure TSysConfig.LoadSettings(Ini: TIniFile);
begin
  if Ini <> nil then  begin
    {Section: system}
    FSystemName := Ini.ReadString(csSystemSection, csSystemName, '管理系统');
    FSystemTime := Ini.ReadInteger(csSystemSection, csSystemTime, 3);
    FSystemTime := Ini.ReadInteger(csSystemSection, csSystemTime, 3);
    FSystemBackupTime := Ini.ReadDateTime(csSystemSection, csSystemBackupTime, Now-3);

    {Section: skin}
    FSkinName := Ini.ReadString(csSkinSection, csSkinName, 'Springtime');
  end;
end;

procedure TSysConfig.SaveSettings(Ini: TIniFile);
begin
  if Ini <> nil then  begin
    {Section: system}
    Ini.WriteString(csSystemSection, csSystemName, FSystemName);
    Ini.WriteInteger(csSystemSection, csSystemTime, FSystemTime);
    Ini.WriteDateTime(csSystemSection, csSystemBackupTime, FSystemBackupTime);

    {Section: skin}
    Ini.WriteString(csSkinSection, csSkinName, FSkinName);
  end;
end;

constructor TSysConfig.Create;
begin
  {system}
  FSystemName := '管理系统';
  FSystemTime := 0;
  FSystemBackupTime := Now-3;

  {skin}
  FSkinName := 'Valentine';

//////////////////////////////////////////////////////
  FConfigFilePath := GetCurrentDir + '\Config.ini';
  if FileExists(FConfigFilePath) then  begin
    LoadFromFile;
  end  else  begin
    SaveToFile;
  end;
end;

destructor TSysConfig.Destroy;
begin

  inherited;
end;

procedure TSysConfig.LoadFromFile;
var
  Ini: TIniFile;
begin
  if FileExists(FConfigFilePath) then  begin
    Ini := TIniFile.Create(FConfigFilePath);
    try
      LoadSettings(Ini);
    finally
      Ini.Free;
    end;
  end;
end;

procedure TSysConfig.SaveToFile;
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(FConfigFilePath);
  try
    SaveSettings(Ini);
  finally
    Ini.Free;
  end;
end;

initialization
  SysConfig := TSysConfig.Create;

finalization
  SysConfig.Free;

end.


