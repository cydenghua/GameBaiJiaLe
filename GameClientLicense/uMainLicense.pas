unit uMainLicense;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls,
  uLicense
  ;

type
  TfrmMainLicense = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    DateTimePicker1: TDateTimePicker;
    Button1: TButton;
    Edit2: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FLicense: TLicense;
  public
    { Public declarations }
  end;

var
  frmMainLicense: TfrmMainLicense;

implementation

{$R *.dfm}

procedure TfrmMainLicense.Button1Click(Sender: TObject);
begin
  Edit2.Text :=   FLicense.GetLicenseKey(DateTimePicker1.Date, Edit1.Text);
end;

procedure TfrmMainLicense.FormCreate(Sender: TObject);
begin
  FLicense := TLicense.Create();
end;

end.
