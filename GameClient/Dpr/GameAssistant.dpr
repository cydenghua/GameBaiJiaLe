program GameAssistant;

uses
  Vcl.Forms,
  uMainForm in '..\MainForm\uMainForm.pas' {frmMainForm},
  uBaseForm in '..\Commom\uBaseForm.pas',
  uCommonBaseForm in '..\Commom\uCommonBaseForm.pas',
  uDialogBaseForm in '..\Commom\uDialogBaseForm.pas',
  uEncrypt in '..\Commom\uEncrypt.pas',
  uFProgress in '..\Commom\uFProgress.pas' {FProgress},
  uSysConfig in '..\Commom\uSysConfig.pas',
  uSysDataBase in '..\Commom\uSysDataBase.pas',
  uSysUser in '..\Commom\uSysUser.pas',
  uAlterPassWord in '..\LoginForm\uAlterPassWord.pas' {frmAlterPassWord},
  uLoginDialog in '..\LoginForm\uLoginDialog.pas' {frmLoginDialog},
  uHttpServer in '..\MainForm\uHttpServer.pas',
  uScoreManagerForm in '..\PlayerManagerForm\uScoreManagerForm.pas' {frmScoreManager},
  uWxMessageForm in '..\WxMessageForm\uWxMessageForm.pas' {frmWxMessage},
  uConstants in '..\Commom\uConstants.pas',
  uGameConfigForm in '..\GameConfigForm\uGameConfigForm.pas' {frmGameConfig},
  uReportShowForm in '..\ReportShowForm\uReportShowForm.pas' {frmReportShow},
  uReportParamForm in '..\ReportShowForm\uReportParamForm.pas' {frmReportParam},
  uLicense in '..\RegisterLicense\uLicense.pas',
  uRegisterForm in '..\RegisterLicense\uRegisterForm.pas' {frmRegister},
  uDailyReportForm in '..\DailyReportForm\uDailyReportForm.pas' {frmDailyReport},
  uDisclaimerForm in '..\OtherForm\uDisclaimerForm.pas' {frmDisclaimer},
  uHelpForm in '..\OtherForm\uHelpForm.pas' {frmHelp},
  uPlayerManager in '..\PlayerManagerForm\uPlayerManager.pas' {frmPlayerManger},
  uTransScoreForm in '..\PlayerManagerForm\uTransScoreForm.pas' {frmTransScore},
  uWxWebForm in '..\WxMessageForm\uWxWebForm.pas' {frmWxWeb},
  uGetPlayer in '..\PlayerManagerForm\uGetPlayer.pas' {frmGetPlayer},
  uPlayerFromInfo in '..\PlayerManagerForm\uPlayerFromInfo.pas' {frmPlayerFormInfo},
  uInitSystemForm in '..\OtherForm\uInitSystemForm.pas' {frmInitSystem},
  uExecSqlForm in '..\OtherForm\uExecSqlForm.pas' {frmExecSql},
  uClipWxMessageForm in '..\WxMessageForm\uClipWxMessageForm.pas' {frmClipWxMessage},
  uFrmRoad in '..\ErDraw\uFrmRoad.pas' {frmRoad},
  uRes in '..\ErDraw\uRes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := '微信统计截图系统';

  //begin longin
  frmLoginDialog := TfrmLoginDialog.Create(Application);
  frmLoginDialog.ShowModal;
  if frmLoginDialog.ModalResult <> 1 then  begin
    uSysDataBase.GetSysDataBase.Free;
  end else begin
    Application.CreateForm(TfrmMainForm, frmMainForm);
  end;

//    Application.CreateForm(TfrmMainForm, frmMainForm);
  Application.Run;
end.
