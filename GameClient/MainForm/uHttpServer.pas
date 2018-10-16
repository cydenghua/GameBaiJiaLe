unit uHttpServer;

interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IdContext, IdCustomHTTPServer,
  IdComponent, IdScheduler, IdSchedulerOfThread, IdSchedulerOfThreadDefault,
  IdAntiFreezeBase, Vcl.IdAntiFreeze, IdBaseComponent, IdCustomTCPServer,
  IdHTTPServer, IdSocketHandle, IdStack, IdStackWindows, IniFiles, SyncObjs,
  System.StrUtils, System.RegularExpressions, Data.DB,
  Web.HTTPApp, uSysDataBase;

type
  THttpServer = class(TComponent)
  private
    { Private declarations }
    FIdHttpServer: TIdHTTPServer;
    FIdSchedulerofThreadDefault: TIdSchedulerOfThreadDefault;
    FServerPort: Word;
    FServerIpList: TStrings;
    FSysDataBase: TSysDataBase;

    FLock : TCriticalSection;
    function GetServerOnline: Boolean;

    function StartServer : Boolean;
    function StopServer  : Boolean;
    procedure ServerCommandGet(AContext: TIdContext;
      ARequestInfo: TIdHTTPRequestInfo;
      AResponseInfo: TIdHTTPResponseInfo);
    procedure ServerException(AContext: TIdContext; AException: Exception);

    procedure SaveMessageAdd(ARequestInfo: TIdHTTPRequestInfo);//�ۼ�ģʽ��������
    procedure SaveMessage(ARequestInfo: TIdHTTPRequestInfo);//����ģʽ�� ������Ǿ�����ķ���
    function GetBuyStr(AInStr: string): string;
    function GetBuy(AType: string; AInStr: string): Integer;
    function IsBuyType(AType: string; AInStr: string):Boolean;


  public
    { Public declarations }
    constructor Create(AOwner: TComponent); virtual;
    destructor Destroy; override;
    property ServerOnline : Boolean read GetServerOnline;

  end;


implementation

{ THttpServer }

uses uMainForm, uConstants;


constructor THttpServer.Create(AOwner: TComponent);
begin
  FSysDataBase := uSysDataBase.GetSysDataBase;
  FLock := TCriticalSection.Create;

  FIdSchedulerofThreadDefault := TIdSchedulerOfThreadDefault.Create(Self);
  FIdSchedulerofThreadDefault.MaxThreads := 100;

  FIdHttpServer := TIdHTTPServer.Create(Self);
  FIdHttpServer.OnCommandGet := ServerCommandGet;
  FIdHttpServer.Scheduler := FIdSchedulerofThreadDefault;
  FIdHttpServer.OnException := ServerException;

  FServerIpList := GStack.LocalAddresses;
  FServerIpList.Add('127.0.0.1');
  FServerPort := 9897;

  StartServer;
end;

destructor THttpServer.Destroy;
begin
  StopServer;
  inherited;
end;


function THttpServer.GetServerOnline: Boolean;
begin
  Result := FIdHttpServer.Active;
end;

procedure THttpServer.ServerException(AContext: TIdContext;
  AException: Exception);
begin
//  ShowMessage(AException.Message);
end;

function THttpServer.StartServer: Boolean;
var
  Binding : TIdSocketHandle;
  i : integer;
begin
// This code starts the server up and posts back information about
// the server starting up.
// You should place your pre and post startup code in InternalServerBeforeStart
// and InternalServerAfterStart accordingly.
  Result := false;

  if not StopServer then    begin
    Result := false;
    exit;
  end;

  FIdHttpServer.Bindings.Clear; // bindings cannot be cleared until TServer is inactive
  try
    FIdHttpServer.DefaultPort := FServerPort;
    for i := 0 to FServerIpList.Count - 1 do begin
      Binding := FIdHttpServer.Bindings.Add;
      Binding.IP := FServerIpList.Strings[i];
      Binding.Port := FServerPort;
    end;

    FIdHttpServer.Active := True;
    Result := FIdHttpServer.Active;
  except
    on E : Exception do
      begin
        Result := false;
      end;
  end;
end;

function THttpServer.StopServer: Boolean;
begin
// This code stops the server and posts back information about
// the server shutting down.
// You should place your pre and post shutdown code in InternalServerBeforeStop
// and InternalServerAfterStop accordingly.
  Result := false;
  FIdHttpServer.Active := false;
  FIdHttpServer.Bindings.Clear;
  Result := not FIdHttpServer.Active;
end;

procedure THttpServer.ServerCommandGet(AContext: TIdContext;
  ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
var
  LStrCommand : String;
begin
  FLock.Enter;
  try
    if (ARequestInfo.Document <> '') and
       (ARequestInfo.Document <> '/') and
       (ARequestInfo.Document <> '\') then
      LStrCommand := Copy(ARequestInfo.Document, 2, Length(ARequestInfo.Document))
    else begin
      LStrCommand := 'Index.htm';
    end;
//    AResponseInfo.ContentType := 'text/html';
//    AResponseInfo.CharSet := 'UTF-8';
    if LStrCommand.Contains('uploadMsg') then  begin
        SaveMessageAdd(ARequestInfo);
    end;
    if LStrCommand.Contains('refreshMsg') then  begin
      if frmMainForm.Handle <> 0 then  begin
        PostMessage(frmMainForm.Handle, WM_MESSAGE_NEW_MESSAGE, 0, 0);
      end;
    end;
  finally
    FLock.Leave;
  end;
end;

procedure THttpServer.SaveMessageAdd(ARequestInfo: TIdHTTPRequestInfo);
var
  LStr: string;
  LInt: Integer;
  LVar: Variant;
  LDataSet: TDataSet;
  function GetContentStr(AStr: string):string;
  begin
    Result := HTTPDecode(AStr);
    LStr := UpperCase(Result);
  end;
begin
  LInt := Trunc(StrToDateTime(ARequestInfo.Params.Values['createtime']) - Now);
  LInt := Abs(LInt);
  if LInt > 2 then  begin  //ϵͳʱ����΢��ʱ����̫��
    ShowMessage('ϵͳʱ�䲻׼ȷ');
    Exit;
  end;

  LStr := 'select * from wx_message where msgId = ' + ARequestInfo.Params.Values['msgId']
        + ' and createTimeL = ' + ARequestInfo.Params.Values['createtimeL'];

  LDataSet := FSysDataBase.GetDataSetBySql(LStr);
  with LDataSet do  begin
    if not IsEmpty then Exit; //�������˳�
    Append;
    FieldByName('msgId').AsString := ARequestInfo.Params.Values['msgId'];
//    FieldByName('msgSvrId').AsString := ARequestInfo.Params.Values['msgSvrId'];
    FieldByName('type').AsString := ARequestInfo.Params.Values['type'];
    FieldByName('status').AsString := ARequestInfo.Params.Values['status'];
    FieldByName('isSend').AsString := ARequestInfo.Params.Values['isSend'];
//    FieldByName('isShowTimer').AsString := ARequestInfo.Params.Values['isShowTimer'];
//      StrToInt64()
    FieldByName('createtime').AsDateTime := StrToDateTime(ARequestInfo.Params.Values['createtime']);
    FieldByName('createtimeL').AsString := ARequestInfo.Params.Values['createtimeL'];
    FieldByName('talker').AsString := ARequestInfo.Params.Values['talker'];
    FieldByName('content').AsString := GetContentStr(ARequestInfo.Params.Values['content']);
//    FieldByName('imgPath').AsString := ARequestInfo.Params.Values['imgPath'];
    FieldByName('reserved').AsString := ARequestInfo.Params.Values['reserved'];
    FieldByName('transContent').AsString := ARequestInfo.Params.Values['transContent'];
    FieldByName('transBrandWording').AsString := ARequestInfo.Params.Values['transBrandWording'];
    FieldByName('talkerId').AsString := ARequestInfo.Params.Values['talkerId'];
    FieldByName('bizClientMsgId').AsString := ARequestInfo.Params.Values['bizClientMsgId'];
//    FieldByName('bizChatId').AsString := ARequestInfo.Params.Values['bizChatId'];
    FieldByName('bizChatUserId').AsString := ARequestInfo.Params.Values['bizChatUserId'];
//    FieldByName('msgSeq').AsString := ARequestInfo.Params.Values['msgSeq'];
    FieldByName('flag').AsString := ARequestInfo.Params.Values['flag'];
    FieldByName('userName').AsString := ARequestInfo.Params.Values['userName'];
    FieldByName('nickName').AsString := GetContentStr(ARequestInfo.Params.Values['nickName']);

    if Length(FieldByName('content').AsString) < 50 then    begin
      LStr := GetBuyStr(FieldByName('content').AsString);
      FieldByName('buyZ').AsInteger := GetBuy('Z', LStr);
      FieldByName('buyX').AsInteger := GetBuy('X', LStr);
      FieldByName('buyH').AsInteger := GetBuy('H', LStr);
      FieldByName('buyZD').AsInteger := GetBuy('ZD_', LStr);
      FieldByName('buyXD').AsInteger := GetBuy('XD_', LStr);

      LInt := GetBuy('SB', LStr);
      if LInt > 0 then    begin  //˫���� ���� �͡� ׯ�ԡ� �ж�
        FieldByName('buyH').AsInteger := FieldByName('buyH').AsInteger + LInt;
        FieldByName('buyZD').AsInteger := FieldByName('buyZD').AsInteger + LInt;
        FieldByName('buyXD').AsInteger := FieldByName('buyXD').AsInteger + LInt;
      end;

      LInt := GetBuy('D', LStr);
      if LInt > 0 then    begin  //��
        FieldByName('buyZD').AsInteger := FieldByName('buyZD').AsInteger + LInt;
        FieldByName('buyXD').AsInteger := FieldByName('buyXD').AsInteger + LInt;
      end;

//      LInt := GetBuy('C', LStr);
//      if UpperCase(LStr).Trim.Equals('C') then begin//����
//        FieldByName('buyH').AsInteger := -1;
//      end;

      if LStr.Equals('ZS') then    begin  //ׯ���
        FieldByName('buyZ').AsInteger := -1;
      end;

      if LStr.Equals('XS') then    begin  //�����
        FieldByName('buyX').AsInteger := -1;
      end;

//      LInt := FieldByName('buyZ').AsInteger
//              +FieldByName('buyX').AsInteger
//              +FieldByName('buyH').AsInteger
//              +FieldByName('buyZD').AsInteger
//              +FieldByName('buyXD').AsInteger;
    end;
    FSysDataBase.SaveDataSet(LDataSet);
    Free;
  end;

  LStr := ARequestInfo.Params.Values['userName'];
  if LStr.IsEmpty then Exit;
  FSysDataBase.ExecSQL('update player_info set isVisible = ''1'', isDel = ''0'' where playerId = ' + QuotedStr(LStr));

  LStr := 'select * from player_info where playerId = ' + QuotedStr(LStr);
  LDataSet := FSysDataBase.GetDataSetBySql(LStr);
  with LDataSet do  begin
    if IsEmpty and (not ARequestInfo.Params.Values['nickName'].IsEmpty) then    begin
      LVar :=FSysDataBase.ExecSQLScalar('select max(orderNo) from player_info');
      if LVar <> null then LInt := LVar
      else LInt := 0;

      Append;
      FieldByName('playerId').AsString := ARequestInfo.Params.Values['userName'];
      FieldByName('nickName').AsString := GetContentStr(ARequestInfo.Params.Values['nickName']);
      FieldByName('score').AsString := '0';
      FieldByName('isVisible').AsString := '1';
      FieldByName('isDel').AsString := '0';
      FieldByName('extend1').AsString := '0';
      FieldByName('orderNo').AsInteger := LInt+1;
      FSysDataBase.SaveDataSet(LDataSet);
      Free;
    end;
  end;

end;

procedure THttpServer.SaveMessage(ARequestInfo: TIdHTTPRequestInfo);
var
  LStr, LStrType: string;
  LInt: Integer;
  LVar: Variant;
  LReg: TRegEx;
  LMatch: TMatch;
  LDataSet: TDataSet;
  function GetContentStr(AStr: string):string;
  begin
    Result := HTTPDecode(AStr);
    LStr := UpperCase(Result);
  end;
begin
  LInt := Trunc(StrToDateTime(ARequestInfo.Params.Values['createtime']) - Now);
  LInt := Abs(LInt);
  if LInt > 2 then  begin  //ϵͳʱ����΢��ʱ����̫��
    ShowMessage('ϵͳʱ�䲻׼ȷ');
    Exit;
  end;

  LStr := 'select * from wx_message where msgId = ' + ARequestInfo.Params.Values['msgId']
        + ' and createTimeL = ' + ARequestInfo.Params.Values['createtimeL'];

  LDataSet := FSysDataBase.GetDataSetBySql(LStr);
  with LDataSet do  begin
    if not IsEmpty then Exit; //�������˳�
    Append;
    FieldByName('msgId').AsString := ARequestInfo.Params.Values['msgId'];
//    FieldByName('msgSvrId').AsString := ARequestInfo.Params.Values['msgSvrId'];
    FieldByName('type').AsString := ARequestInfo.Params.Values['type'];
    FieldByName('status').AsString := ARequestInfo.Params.Values['status'];
    FieldByName('isSend').AsString := ARequestInfo.Params.Values['isSend'];
//    FieldByName('isShowTimer').AsString := ARequestInfo.Params.Values['isShowTimer'];
//      StrToInt64()
    FieldByName('createtime').AsDateTime := StrToDateTime(ARequestInfo.Params.Values['createtime']);
    FieldByName('createtimeL').AsString := ARequestInfo.Params.Values['createtimeL'];
    FieldByName('talker').AsString := ARequestInfo.Params.Values['talker'];
    FieldByName('content').AsString := GetContentStr(ARequestInfo.Params.Values['content']);
//    FieldByName('imgPath').AsString := ARequestInfo.Params.Values['imgPath'];
    FieldByName('reserved').AsString := ARequestInfo.Params.Values['reserved'];
    FieldByName('transContent').AsString := ARequestInfo.Params.Values['transContent'];
    FieldByName('transBrandWording').AsString := ARequestInfo.Params.Values['transBrandWording'];
    FieldByName('talkerId').AsString := ARequestInfo.Params.Values['talkerId'];
    FieldByName('bizClientMsgId').AsString := ARequestInfo.Params.Values['bizClientMsgId'];
//    FieldByName('bizChatId').AsString := ARequestInfo.Params.Values['bizChatId'];
    FieldByName('bizChatUserId').AsString := ARequestInfo.Params.Values['bizChatUserId'];
//    FieldByName('msgSeq').AsString := ARequestInfo.Params.Values['msgSeq'];
    FieldByName('flag').AsString := ARequestInfo.Params.Values['flag'];
    FieldByName('userName').AsString := ARequestInfo.Params.Values['userName'];
    FieldByName('nickName').AsString := GetContentStr(ARequestInfo.Params.Values['nickName']);

    if Length(FieldByName('content').AsString) < 50 then    begin
      LStr := GetBuyStr(FieldByName('content').AsString);

      LReg := TRegEx.Create('\d{1,10}');
      LMatch := LReg.Match(LStr);
      while LMatch.Success do  begin
//        ShowMessage('data is ' + LMatch.Value + ' index is ' + IntToStr(LMatch.Index));
        LStrType := LStr.Substring(LMatch.Index-3, 3);
        if IsBuyType('Z', LStrType) then        begin
          FieldByName('buyZ').AsString := LMatch.Value;
        end;
        if IsBuyType('X', LStrType) then        begin
          FieldByName('buyX').AsString := LMatch.Value;
        end;
        if IsBuyType('H', LStrType) then        begin
          FieldByName('buyH').AsString := LMatch.Value;
        end;
        if IsBuyType('ZD_', LStrType) then        begin
          FieldByName('buyZD').AsString := LMatch.Value;
        end;
        if IsBuyType('XD_', LStrType) then        begin
          FieldByName('buyXD').AsString := LMatch.Value;
        end;
        if IsBuyType('D', LStrType) then        begin     //��
          FieldByName('buyZD').AsString := LMatch.Value;
          FieldByName('buyXD').AsString := LMatch.Value;
        end;
        if IsBuyType('SB', LStrType) then        begin   //˫���� ���� �͡� ׯ�ԡ� �ж�
          FieldByName('buyH').AsString := LMatch.Value;
          FieldByName('buyZD').AsString := LMatch.Value;
          FieldByName('buyXD').AsString := LMatch.Value;
        end;

        if UpperCase(LStr).Trim.Equals('C') then begin//����
          FieldByName('buyH').AsInteger := -1;
        end;

        if LStr.Equals('ZS') then    begin  //ׯ���
          FieldByName('buyZ').AsInteger := -1;
        end;

        if LStr.Equals('XS') then    begin  //�����
          FieldByName('buyX').AsInteger := -1;
        end;

        LMatch := LMatch.NextMatch;
      end;

    end;
    FSysDataBase.SaveDataSet(LDataSet);
    Free;
  end;

  LStr := ARequestInfo.Params.Values['userName'];
  if LStr.IsEmpty then Exit;
  FSysDataBase.ExecSQL('update player_info set isVisible = ''1'', isDel = ''0'' where playerId = ' + QuotedStr(LStr));

  LStr := 'select * from player_info where playerId = ' + QuotedStr(LStr);
  LDataSet := FSysDataBase.GetDataSetBySql(LStr);
  with LDataSet do  begin
    if IsEmpty and (not ARequestInfo.Params.Values['nickName'].IsEmpty) then    begin
      LVar :=FSysDataBase.ExecSQLScalar('select max(orderNo) from player_info');
      if LVar <> null then LInt := LVar
      else LInt := 0;

      Append;
      FieldByName('playerId').AsString := ARequestInfo.Params.Values['userName'];
      FieldByName('nickName').AsString := GetContentStr(ARequestInfo.Params.Values['nickName']);
      FieldByName('score').AsString := '0';
      FieldByName('isVisible').AsString := '1';
      FieldByName('isDel').AsString := '0';
      FieldByName('extend1').AsString := '0';
      FieldByName('orderNo').AsInteger := LInt+1;
      FSysDataBase.SaveDataSet(LDataSet);
      Free;
    end;
  end;

end;

function THttpServer.IsBuyType(AType, AInStr: string): Boolean;
var
  LReg: TRegEx;
  LMatch: TMatch;
begin
  LReg := TRegEx.Create(AType + '\d{1,10}');
  LMatch := LReg.Match(AInStr);
  Result := LMatch.Success;
end;

function THttpServer.GetBuy(AType, AInStr: string): Integer;
var
  LReg: TRegEx;
  LMatch: TMatch;
  LStr: string;
begin
  Result := 0;
  LReg := TRegEx.Create(AType + '\d{1,10}');
  LMatch := LReg.Match(AInStr);
  if LMatch.Success then  begin
    LStr := LMatch.Value;
    LStr := LStr.Substring(AType.Length);
    Result := StrToInt(LStr);
  end;
end;

function THttpServer.GetBuyStr(AInStr: string): string;
begin
  Result := UpperCase(AInStr);
  Result := ReplaceStr(Result, 'ׯ', 'Z');
  Result := ReplaceStr(Result, '��', 'X');
  Result := ReplaceStr(Result, '��', 'H');
  Result := ReplaceStr(Result, 'ׯ��', 'ZD');
  Result := ReplaceStr(Result, '�ж�', 'XD');
  Result := ReplaceStr(Result, '˫��', 'SB');
  Result := ReplaceStr(Result, '��', 'D');
  Result := ReplaceStr(Result, 'ׯ���', 'ZS');
  Result := ReplaceStr(Result, '���ׯ', 'ZS');
  Result := ReplaceStr(Result, 'SZ', 'ZS');
  Result := ReplaceStr(Result, '�����', 'XS');
  Result := ReplaceStr(Result, '�����', 'XS');
  Result := ReplaceStr(Result, 'SX', 'XS');
  Result := ReplaceStr(Result, '����', 'C');

  //ZD100   D100�г�ͻ�� ���»���
  Result := ReplaceStr(Result, 'ZD', 'ZD_');
  Result := ReplaceStr(Result, 'XD', 'XD_');
end;


end.
