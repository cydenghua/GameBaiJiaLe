unit uWxWebForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  uBaseForm, Vcl.OleCtrls, SHDocVw, Vcl.StdCtrls, uConstants, Vcl.ExtCtrls;

type
  TfrmWxWeb = class(TBaseForm)
    WebBrowser1: TWebBrowser;
    Panel1: TPanel;
    Edit1: TEdit;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FIsLoad: Boolean;
  public
    { Public declarations }
    procedure SendMsgText(AStr: string);
    procedure WMNewMessage(var msg:TMessage);Message WM_MESSAGE_SEND_MESSAGE;
  end;

var
  frmWxWeb: TfrmWxWeb;

implementation

{$R *.dfm}

procedure TfrmWxWeb.FormCreate(Sender: TObject);
begin
  inherited;//
//  WebBrowser1.Navigate('https://wx.qq.com/');
end;

procedure TfrmWxWeb.FormShow(Sender: TObject);
begin
  if not FIsLoad then  begin
    FIsLoad := True;
    WebBrowser1.Navigate('https://wx.qq.com/');
  end;
end;

procedure TfrmWxWeb.Button1Click(Sender: TObject);
begin
  SendMsgText(Edit1.Text);
end;

procedure TfrmWxWeb.SendMsgText(AStr: string);
begin
//angular.element('pre:last').scope().editAreaCtn = "Hello£¬Î¢ÐÅ";
//angular.element('pre:last').scope().sendTextMessage();
//  WebBrowser1.OleObject.document.parentWindow.execScript('angular.element(''pre:last'').scope().editAreaCtn = "Hello£¬Î¢ÐÅ";','JavaScript');
  WebBrowser1.OleObject.document.parentWindow.execScript('angular.element(''pre:last'').scope().editAreaCtn = "'+ AStr + '";','JavaScript');
  WebBrowser1.OleObject.document.parentWindow.execScript('angular.element(''pre:last'').scope().sendTextMessage();','JavaScript');
end;

procedure TfrmWxWeb.WMNewMessage(var msg: TMessage);
begin
  SendMsgText(string(Pointer(msg.LParam)));
end;

end.
