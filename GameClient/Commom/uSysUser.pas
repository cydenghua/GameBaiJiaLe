unit uSysUser;

interface

uses
  SysUtils, DB, ADODB, Classes,
  uSysDataBase;

type
  TSysUser = class(TPersistent)
  private
    { Private declarations }
    FUserSysId: string;
    FUserCode: string;
    FUserName: string;
    FUserLoginName: string;
    constructor Create; virtual;
    destructor Destroy; override;
    function GetUserCode:string;
    function GetUserName:string;
    function SetUserSysId(ASysId: string):Boolean;
    function CheckPassWord(AUserName, APassWord: string):Boolean;
    function SetUserInfo(AUserSysid: string):Boolean;
    function UpdateLoginInfo(AUserName: string):Boolean;
  public
    { Public declarations }
    function UserLogin(AUserName, APassWord: string):Boolean;
    function AlterUserPW(ANewPw: string):Boolean;
  public
    property UserCode: string read GetUserCode;
    property UserName: string read GetUserName;
  end;

var
  g_SysUser: TSysUser;
  function GetSysUser:TSysUser;

implementation

uses uEncrypt;
  function GetSysUser:TSysUser;
  begin
    if not Assigned(g_SysUser) then
      g_SysUser := TSysUser.Create;
    Result := g_SysUser;
  end;

{ TSysUser }

function TSysUser.AlterUserPW(ANewPw: string): Boolean;
var
  LSql: string;
begin
  Result := False;
  LSql := EncryptStr(ANewPw, EmptyStr);
  LSql := 'update sys_users set pass_word = ' + QuotedStr(LSql) + #10
        + 'where user_name = ' + QuotedStr(Self.FUserLoginName);
  Result := GetSysDataBase.ExecSQL(LSql) = 1;
end;

function TSysUser.CheckPassWord(AUserName, APassWord: string): Boolean;
var
  LSql: string;
begin
  Result := False;
  LSql := 'select * from sys_users where deleted <> ''1'' and  user_name = ' + QuotedStr(AUserName);
  with GetSysDataBase.GetDataSetBySql(LSql) do  begin
    if IsEmpty then    begin
      Result := False;
    end else    begin
      if (UncryptStr(FieldByName('pass_word').AsString, EmptyStr) = APassWord) then
        Result := True;
      FUserSysId := FieldByName('user_sysid').AsString;
    end;
    Free;
  end;
  FUserLoginName := AUserName;
end;

constructor TSysUser.Create;
begin
  FUserCode := EmptyStr;
  FUserName := EmptyStr;
  FUserLoginName := EmptyStr;
  FUserSysId := EmptyStr;
end;

destructor TSysUser.Destroy;
begin

  inherited;
end;

function TSysUser.GetUserCode: string;
begin
  Result := FUserCode;
end;

function TSysUser.GetUserName: string;
begin
  Result := FUserName;
end;

function TSysUser.SetUserInfo(AUserSysid: string): Boolean;
var
  LSql: string;
begin
//  LSql := 'select * from employee (nolock) where sys_id = ' + QuotedStr(AUserSysid);
//  with GetSysDataBase.GetDataSetBySql(LSql) do
//  begin
//    if IsEmpty then
//    begin
//      Result := False
//    end   else
//    begin
//      FUserCode := FieldByName('out_id').AsString;
//      FUserName := FieldByName('name').AsString;
      Result := True;
//    end;
//  end;
end;

function TSysUser.SetUserSysId(ASysId: string): Boolean;
begin
  FUserSysId := ASysId;
end;

function TSysUser.UpdateLoginInfo(AUserName: string): Boolean;
var
  LSql: string;
begin
  Result := False;
  LSql := 'update sys_users set last_time = getdate(), login_times = login_times + 1 ' + #10
         +'where user_name = ' + QuotedStr(AUserName);
  Result := GetSysDataBase.ExecSQL(LSql) = 1;
end;

function TSysUser.UserLogin(AUserName, APassWord: string): Boolean;
begin 
  //密码验证
  Result := CheckPassWord(AUserName, APassWord);

  //设置用户信息
  if Result then  begin
    Result := SetUserInfo(FUserSysId);
  end;

  //刷新登陆数据
  if Result then  begin
    Result := UpdateLoginInfo(FUserLoginName);
  end;
end;

initialization
  g_SysUser := nil;

end.
