unit uCommonBaseForm;

interface

uses
  uBaseForm;//, uSysDicData;

type
  TCommonBaseForm = class(TBaseForm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
//    FSysDicData: TdmSysDicData;
  end;

implementation


procedure TCommonBaseForm.FormCreate(Sender: TObject);
begin
  inherited;
//  FSysDicData := uSysDicData.GetSysDicDataModule(FSysDataBase.FMainDbConn);
end;

end.
