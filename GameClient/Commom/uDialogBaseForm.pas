unit uDialogBaseForm;

interface

uses
  uBaseForm;

type
  TDialogBaseForm = class(TBaseForm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{ TDialogBaseForm }

procedure TDialogBaseForm.FormCreate(Sender: TObject);
begin
  inherited;
end;

end.
