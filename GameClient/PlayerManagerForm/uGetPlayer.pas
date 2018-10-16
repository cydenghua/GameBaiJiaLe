unit uGetPlayer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseForm, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, cxTextEdit, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmGetPlayer = class(TBaseForm)
    DataSourcePlayer: TDataSource;
    Panel2: TPanel;
    Button1: TButton;
    cxTextEdit1: TcxTextEdit;
    cxGrid3: TcxGrid;
    cxGrid3DBTableView1: TcxGridDBTableView;
    cxGrid3DBTableView1Column2: TcxGridDBColumn;
    cxGrid3DBTableView1Column1: TcxGridDBColumn;
    cxGrid3DBTableView1Column3: TcxGridDBColumn;
    cxGrid3Level1: TcxGridLevel;
    Panel1: TPanel;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
    FChoosePlayerId:string;
  public
    { Public declarations }
    property ChoosePlayerId:string  read FChoosePlayerId;
  end;

var
  frmGetPlayer: TfrmGetPlayer;

implementation

{$R *.dfm}

procedure TfrmGetPlayer.FormCreate(Sender: TObject);
begin
  inherited;//
  DataSourcePlayer.DataSet := FSysDataBase.GetDataSetBySql(Self,'select * from player_info where isDel <> 1 order by isVisible desc, orderNo');
end;

procedure TfrmGetPlayer.Button2Click(Sender: TObject);
begin
  Self.ModalResult := mrCancel;
end;

procedure TfrmGetPlayer.Button3Click(Sender: TObject);
begin
  FChoosePlayerId := DataSourcePlayer.DataSet.FieldByName('playerId').AsString;
  Self.ModalResult := mrOk;
end;

procedure TfrmGetPlayer.Button4Click(Sender: TObject);
begin
  FChoosePlayerId := '';
  Self.ModalResult := mrOk;
end;


end.
