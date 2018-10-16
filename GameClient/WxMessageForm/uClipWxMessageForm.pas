unit uClipWxMessageForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  uBaseForm, System.RegularExpressions, System.StrUtils,
  Data.DB,  Vcl.Clipbrd, System.DateUtils;

type
  TfrmClipWxMessage = class(TBaseForm)
    Memo1: TMemo;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
    procedure InsertMessage();
    procedure InsertMsgTable(AName, AMsg: string);


    function GetBuyStr(AInStr: string): string;
    function GetBuy(AType: string; AInStr: string): Integer;
  public
    { Public declarations }
  end;

var
  frmClipWxMessage: TfrmClipWxMessage;

implementation

{$R *.dfm}


procedure TfrmClipWxMessage.FormCreate(Sender: TObject);
begin
  inherited;//
  Button3Click(Button3);
end;

procedure TfrmClipWxMessage.Button1Click(Sender: TObject);
begin
  try
    InsertMessage;
    Self.ModalResult := mrOk;
  except on E: Exception do
  end;
end;

procedure TfrmClipWxMessage.Button2Click(Sender: TObject);
begin
  Self.ModalResult := mrCancel;
end;

procedure TfrmClipWxMessage.Button3Click(Sender: TObject);
var
  s: string;
begin
  Memo1.Clear;
  if Clipboard.HasFormat(CF_TEXT) then begin
    s:= Clipboard.AsText;
  end;

  Memo1.Lines.CommaText := s;
end;


procedure TfrmClipWxMessage.InsertMessage;
var
  I: Integer;
  LTmpStr, LName, LMsg: string;
begin
  if Memo1.Lines.Count < 1 then Exit;

  for I := 0 to Memo1.Lines.Count-1 do begin
    LTmpStr := Memo1.Lines.Strings[I];
    if Pos(':', LTmpStr) > 0 then    begin
//      ShowMessage('this is name ' + LTmpStr);
      LName := Memo1.Lines.Strings[I];
      LMsg := Memo1.Lines.Strings[I+1];

      LName := ReplaceStr(LName, ':', '');
      InsertMsgTable(LName, LMsg);
    end;
    Sleep(2);
  end;
end;


procedure TfrmClipWxMessage.InsertMsgTable(AName, AMsg: string);
var
  LDataSet: TDataSet;
  LVar: Variant;
  LInt: Integer;
  LPlayId, LStr: string;
begin
  if AName.IsEmpty then Exit;
  if AMsg.IsEmpty then Exit;

  LDataSet := FSysDataBase.GetDataSetBySql('select * from player_info where isDel = 0 and nickName = ' + QuotedStr(AName));
  with LDataSet do  begin
    if IsEmpty then    begin
      LInt := FSysDataBase.GetFieldMaxValue('player_info', 'orderNo') + 1;

      Append;
      FieldByName('playerId').AsInteger := LInt;
      FieldByName('nickName').AsString := AName;
      FieldByName('score').AsString := '0';
      FieldByName('isVisible').AsString := '1';
      FieldByName('isDel').AsString := '0';
      FieldByName('extend1').AsString := '0';
      FieldByName('orderNo').AsInteger := LInt;
      FSysDataBase.SaveDataSet(LDataSet);
    end;
  end;
  LPlayId := LDataSet.FieldByName('playerId').AsString;
  LDataSet.Free;

  ////累加模式，不覆盖
  LDataSet := FSysDataBase.GetDataSetBySql('select * from wx_message where 1=2');
  with LDataSet do  begin
    Append;
    FieldByName('msgId').AsInteger := FSysDataBase.GetFieldMaxValue('wx_message', 'msgId')+1; //IntToStr(FSysDataBase.GetMaxSysId('ClipMsgId'));
    FieldByName('type').AsString := '9';
    FieldByName('status').AsString := '1';
    FieldByName('isSend').AsString := '0';
    FieldByName('createtime').AsDateTime := Now;
    FieldByName('createtimeL').AsString := IntToStr(DateTimeToUnix(Now));
    FieldByName('talker').AsString := AName;
    FieldByName('content').AsString := AMsg;
    FieldByName('flag').AsString := '9';
    FieldByName('userName').AsString := LPlayId;
    FieldByName('nickName').AsString := AName;


    if Length(FieldByName('content').AsString) < 50 then    begin
      LStr := GetBuyStr(FieldByName('content').AsString);
      FieldByName('buyZ').AsInteger := GetBuy('Z', LStr);
      FieldByName('buyX').AsInteger := GetBuy('X', LStr);
      FieldByName('buyH').AsInteger := GetBuy('H', LStr);
      FieldByName('buyZD').AsInteger := GetBuy('ZD_', LStr);
      FieldByName('buyXD').AsInteger := GetBuy('XD_', LStr);

      LInt := GetBuy('SB', LStr);
      if LInt > 0 then    begin  //双保， 包含 和、 庄对、 闲对
        FieldByName('buyH').AsInteger := FieldByName('buyH').AsInteger + LInt;
        FieldByName('buyZD').AsInteger := FieldByName('buyZD').AsInteger + LInt;
        FieldByName('buyXD').AsInteger := FieldByName('buyXD').AsInteger + LInt;
      end;

      LInt := GetBuy('D', LStr);
      if LInt > 0 then    begin  //对
        FieldByName('buyZD').AsInteger := FieldByName('buyZD').AsInteger + LInt;
        FieldByName('buyXD').AsInteger := FieldByName('buyXD').AsInteger + LInt;
      end;

//      LInt := GetBuy('C', LStr);
//      if UpperCase(LStr).Trim.Equals('C') then begin//撤销
//        FieldByName('buyH').AsInteger := -1;
//      end;

      if LStr.Equals('ZS') then    begin  //庄梭哈
        FieldByName('buyZ').AsInteger := -1;
      end;

      if LStr.Equals('XS') then    begin  //闲梭哈
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

  FSysDataBase.ExecSQL('update player_info set isVisible = ''1'', isDel = ''0'' where playerId = ' + QuotedStr(LPlayId));

end;


function TfrmClipWxMessage.GetBuy(AType, AInStr: string): Integer;
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

function TfrmClipWxMessage.GetBuyStr(AInStr: string): string;
begin
  Result := UpperCase(AInStr);
  Result := ReplaceStr(Result, '庄', 'Z');
  Result := ReplaceStr(Result, '闲', 'X');
  Result := ReplaceStr(Result, '和', 'H');
  Result := ReplaceStr(Result, '庄对', 'ZD');
  Result := ReplaceStr(Result, '闲对', 'XD');
  Result := ReplaceStr(Result, '双保', 'SB');
  Result := ReplaceStr(Result, '对', 'D');
  Result := ReplaceStr(Result, '庄梭哈', 'ZS');
  Result := ReplaceStr(Result, '梭哈庄', 'ZS');
  Result := ReplaceStr(Result, 'SZ', 'ZS');
  Result := ReplaceStr(Result, '闲梭哈', 'XS');
  Result := ReplaceStr(Result, '梭哈闲', 'XS');
  Result := ReplaceStr(Result, 'SX', 'XS');
  Result := ReplaceStr(Result, '撤销', 'C');

  //ZD100   D100有冲突， 加下划线
  Result := ReplaceStr(Result, 'ZD', 'ZD_');
  Result := ReplaceStr(Result, 'XD', 'XD_');
end;


end.
