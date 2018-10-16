unit uBaseForm;

interface

uses
  Forms, SysUtils, System.Classes, Winapi.Windows,

  dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinGlassOceans, dxSkinLiquidSky, dxSkinMoneyTwins, dxSkinPumpkin,dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinSevenClassic,
  dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinMetropolisDark,

  dxSkinsDefaultPainters,
  cxClasses, cxLookAndFeels, dxSkinsForm, cxGridCustomTableView,
  cxGridDBTableView, cxGridCustomView, cxGridTableView, cxDBEdit, cxDropDownEdit,

  uSysDataBase, uSysUser, uSysConfig;

type
  TStrObj = class(TObject)
  public
    FStr: string;
  end;

  TBaseForm = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure SetSysDateFormat;
    procedure GridViewDisplay();
    procedure GridViewDisplayDo(GridView: TcxGridDBTableView);
    procedure GridViewAddOrderColumn(GridView: TcxGridDBTableView);
    procedure OrderColumnGetDataText(Sender: TcxCustomGridTableItem; ARecordIndex: Integer; var AText: string);

  protected
    procedure InitCxComboBoxWithDicType(cxDBComboBox: TcxCustomComboBox; AType: string);
    procedure InitCxComboBoxWithSql(cxDBComboBox: TcxCustomComboBox; ASql: string; AField: string);
  public
    { Public declarations }
    FSysDataBase: TSysDataBase;
    FSysUser: TSysUser;
    FSysConfig: TSysConfig;
    FSkin: TdxSkinController;
  end;

implementation

procedure TBaseForm.FormCreate(Sender: TObject);
begin
  inherited;
  SetSysDateFormat;
  FSysDataBase := uSysDataBase.GetSysDataBase;
  FSysUser := uSysUser.GetSysUser;

  FSysConfig := uSysConfig.SysConfig;
//  if not Self.SetQueryDataBase then
//    raise Exception.Create('Err25: SetQueryConnErr.');
//
  FSkin := TdxSkinController.Create(Self);
  FSkin.NativeStyle := False;
  FSkin.Kind := lfFlat;
  FSkin.SkinName := FSysConfig.SkinName;
  FSkin.UseSkins := True;
end;

procedure TBaseForm.FormShow(Sender: TObject);
begin
  GridViewDisplay;
end;

procedure TBaseForm.GridViewDisplay;
var
  i: Integer;
begin
  for i := 0 to Self.ComponentCount - 1 do  begin
    if Self.Components[i] is TcxGridDBTableView then   begin
      GridViewDisplayDo(Self.Components[i] as TcxGridDBTableView);
    end;
  end;
end;

procedure TBaseForm.GridViewDisplayDo(GridView: TcxGridDBTableView);
var
  iIndex: Integer;
  LSql: string;
  LColumn: TcxGridDBColumn;
begin
  LSql := 'select * from grid_view_config where form = ' + QuotedStr(Self.Name)
       + ' and grid = ' + QuotedStr(GridView.Name)
       + ' order by order_no asc';

  with FSysDataBase.GetDataSetBySql(LSql) do    begin
    GridView.ClearItems; //清空数据
    if IsEmpty then   begin
      (GridView.DataController as IcxCustomGridDataController).DeleteAllItems;  //删除所有列
      (GridView.DataController as IcxCustomGridDataController).CreateAllItems(false); //创建数据源中的所有列
      GridView.ApplyBestFit; //让列宽自适应 .BestFitMaxWidth;

      for iIndex := 0 to GridView.ColumnCount-1 do  begin
        LSql := 'insert into grid_view_config(form, grid, field, order_no, value_type, caption, caption_align, width, visible) '
            + 'values(''%s'', ''%s'', ''%s'', %d, ''%s'', ''%s'', %d, %d, ''%s'')';
        LSql := LSql.Format(LSql, [Self.Name, GridView.Name,
        GridView.Columns[iIndex].DataBinding.FieldName,
        iIndex,
        GridView.Columns[iIndex].DataBinding.ValueType,
        GridView.Columns[iIndex].Caption,
        Ord(GridView.Columns[iIndex].HeaderAlignmentHorz),
        GridView.Columns[iIndex].Width, '1']);
        FSysDataBase.ExecSQL(LSql);
      end;
    end else    begin
      if GridView.Tag = 9 then GridViewAddOrderColumn(GridView);      
      First;
      while not Eof do      begin
        LColumn := GridView.CreateColumn;
        LColumn.DataBinding.FieldName := FieldByName('field').AsString;
        LColumn.DataBinding.ValueType := FieldByName('value_type').AsString;
        LColumn.Caption := FieldByName('caption').AsString;
        LColumn.Width := FieldByName('width').AsInteger;
        LColumn.HeaderAlignmentHorz := TAlignment(FieldByName('caption_align').AsInteger);
        Next;
      end;
    end;
  end;
end;

procedure TBaseForm.GridViewAddOrderColumn(GridView: TcxGridDBTableView);
var
  LColumn: TcxGridDBColumn;
begin
  LColumn := GridView.CreateColumn;
  LColumn.Caption := '序号';
  LColumn.Width := 50;
  LColumn.HeaderAlignmentHorz := taCenter;
  LColumn.OnGetDataText := OrderColumnGetDataText;
end;

procedure TBaseForm.OrderColumnGetDataText(Sender: TcxCustomGridTableItem;
  ARecordIndex: Integer; var AText: string);
begin
  AText := IntToStr(ARecordIndex+1);
end;

procedure TBaseForm.SetSysDateFormat;
var
  fs: TFormatSettings;
begin
  // 设置WINDOWS系统的短日期的格式
  SetLocaleInfo(LOCALE_SYSTEM_DEFAULT, LOCALE_SSHORTDATE, 'yyyy-MM-dd');
  Application.UpdateFormatSettings := False;
  // 设定程序本身所使用的日期时间格式
  fs.LongDateFormat := 'yyyy-MM-dd';
  fs.ShortDateFormat := 'yyyy-MM-dd';
  fs.LongTimeFormat := 'hh:nn:ss';
  fs.ShortTimeFormat := 'hh:nn:ss';
  fs.DateSeparator := '-';
  fs.timeSeparator := ':';
end;

procedure TBaseForm.InitCxComboBoxWithDicType(cxDBComboBox: TcxCustomComboBox; AType: string);
begin
  InitCxComboBoxWithSql(cxDBComboBox,
    'select * from system_dic where type = ' + QuotedStr(AType) + ' order by order_no asc', 'name');
end;

procedure TBaseForm.InitCxComboBoxWithSql(cxDBComboBox: TcxCustomComboBox; ASql: string; AField: string);
var
  LStrObj: TStrObj;
begin
  cxDBComboBox.Properties.Items.Clear;
  with FSysDataBase.GetDataSetBySql(ASql) do  begin
    First;
    while not Eof do    begin
//      cxDBComboBox.Properties.Items.Add(FieldByName(AField).AsString);
      LStrObj := TStrObj.Create;
      LStrObj.FStr := FieldByName('sys_id').AsString;
      cxDBComboBox.Properties.Items.AddObject(FieldByName(AField).AsString, LStrObj);
      Next;
    end;
  end;
end;

end.
