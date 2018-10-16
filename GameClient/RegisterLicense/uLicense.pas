unit uLicense;

interface


uses
  Windows, SysUtils, Vcl.Dialogs, Classes, System.StrUtils, uEncrypt;

type
  TLicense = class(TObject)
  private
  public
    constructor Create;
    destructor Destroy; override;
    function GetHDNumber(Drv : string): DWORD; //得到硬盘序列号 C:\
    function GetEncLocalKey: string;
    function GetLocalKey: string;
    function RegLocaLic(ARegCode: string): Boolean;
    function CheckLicense: Word;
    function GenerateLicnseKey(_exp_date: TDate; _localkey: string): string;
    function GetLicenseKey(_exp_date: TDate; _enlocalkey: string):string;
  end;

implementation

{ TLicense }


constructor TLicense.Create;
begin

end;

destructor TLicense.Destroy;
begin

  inherited;
end;

function TLicense.GetEncLocalKey: string;
begin
  Result := GetLocalKey;
  Result := Format('%.2x'+'%s', [8, EncryptStrDe(Result)]);
end;

function TLicense.GetLocalKey: string;
begin
  Result := IntToStr(GetHDNumber('C:\'));
end;

function TLicense.GetHDNumber(Drv: string): DWORD;
var
  VolumeSerialNumber : DWORD;
  MaximumComponentLength : DWORD;
  FileSystemFlags : DWORD;
begin
  if Drv[Length(Drv)] =':' then
    Drv := Drv + '\';
  GetVolumeInformation(pChar(Drv),
    nil,
    0,
    @VolumeSerialNumber,
    MaximumComponentLength,
    FileSystemFlags,
    nil,
    0);
  Result:= (VolumeSerialNumber);
end;

function TLicense.RegLocaLic(ARegCode: string): Boolean;
var
  licbody : string;
  tmp_str : string;
  tmp_data : string;
  yyyy, mm, dd : Word;
  exp_date : TDate;
  lic_List: TStringList;
    FExpDate        : TDate;          // 到期日期
begin
  Result := False;
  try
    lic_List:= TStringList.Create;
    try
      tmp_str := Trim(ARegCode);
      if tmp_str = '' then
        Exit;
      if Length(tmp_str) < 10 then
        Exit;
      tmp_str := UncryptStrDe(tmp_str);
      if '08' <> LeftStr(tmp_str, 2) then
        Exit;
      licbody := RightStr(tmp_str, Length(tmp_str)- 2);

      tmp_data := LeftStr(licbody, 8);
      yyyy := StrToIntDef(LeftStr(tmp_data, 4), 0);
      mm := StrToIntDef(MidStr(tmp_data, 5, 2), 0);
      dd := StrToIntDef(RightStr(tmp_data, 2), 0);
      exp_date  := EncodeDate(yyyy, mm, dd);
      FExpDate  := exp_date;

      if (exp_date = 0) then
        Exit;


      if RightStr(tmp_str, Length(tmp_str)-10) <> GetLocalKey then
        Exit;

      Result := True;
      lic_List.Text := Trim(ARegCode);
      lic_List.SaveToFile('.\license.lic');
    except

    end;
  finally
    lic_List.Free;
  end;

end;

function TLicense.CheckLicense: Word;
var
  lic_file: string;
  lic_List: TStringList;
  licbody : string;
  tmp_str : string;
  tmp_data : string;
  yyyy, mm, dd : Word;
  exp_date : TDate;
    FExpDate        : TDate;          // 到期日期
    FLastDate       : TDate;          // 当前数据的最大日期
begin
  FLastDate := Now;
// Result 0: 未注册   1：已注册   2：有效期错误  3：已超过有效期  4：校验码错误  5：机器码错误
  Result := 0;
//  lic_file := ChangeFileExt(ParamStr(0), '.lic');
  lic_file := ExtractFilePath(ParamStr(0)) +'license.lic';
  if not FileExists(lic_file) then
    Exit;
  try
    try
      lic_List:= TStringList.Create;
      lic_List.LoadFromFile(lic_file);
      tmp_str := Trim(lic_List.Text);
      if tmp_str = '' then
        Exit;
      tmp_str := UncryptStrDe(tmp_str);
      licbody := RightStr(tmp_str, Length(tmp_str)- 2);

      tmp_data := LeftStr(licbody, 8);
      yyyy := StrToIntDef(LeftStr(tmp_data, 4), 0);
      mm := StrToIntDef(MidStr(tmp_data, 5, 2), 0);
      dd := StrToIntDef(RightStr(tmp_data, 2), 0);

      exp_date  := EncodeDate(yyyy, mm, dd);
      FExpDate  := exp_date;
      if FExpDate = 0 then     begin
        Result := 2;
        Exit;
      end;
      if FExpDate < FLastDate then      begin
        Result := 3;
        Exit;
      end;

      if (FExpDate - FLastDate) < 5 then      begin
        MessageDlg('系统注册有效期不足三天！',  mtWarning, [mbOK], 0);
      end;

      if RightStr(tmp_str, Length(tmp_str)-10) <> GetLocalKey then begin
        Result := 5;
        Exit;
      end;

      Result := 1;
    except
      Result := 0;
    end;
  finally
    lic_List.Free;
  end;
end;

function TLicense.GenerateLicnseKey(_exp_date: TDate;
  _localkey: string): string;
var
  tmp_data : string;
  crc : string;
  yyyy, mm, dd : Word;
  data : string;
begin
  {/** YYYYMMDD Type Key Crc **/}
  Result := '';
  DecodeDate(_exp_date, yyyy, mm, dd);
  tmp_data := FormatDateTime('YYYYMMDD', _exp_date); // Format('%.4x'+'%.2x'+'%.2x', [yyyy, mm, dd]);
  data := Format('%s' +'%s', [tmp_data, _localkey]);  //tmp_data + _localkey;
  data := '08' + data;
  Result := EncryptStrDe(data);
end;

function TLicense.GetLicenseKey(_exp_date: TDate; _enlocalkey: string): string;
var
  localKey:string;
begin
  localKey := RightStr(_enlocalkey, Length(_enlocalkey)-2);
  localKey := UncryptStrDe(localKey);
  Result := GenerateLicnseKey(_exp_date, localKey);
end;

end.
