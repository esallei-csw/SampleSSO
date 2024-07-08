program SampleSSO;

uses
  Vcl.Forms,
  LoginSSO.main in 'LoginSSO.main.pas' {frmLogInSSO},
  Vcl.Themes,
  Vcl.Styles,
  LoginSSO.WebView in 'LoginSSO.WebView.pas' {frmWebViewLogin};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Windows10 Dark');
  Application.CreateForm(TfrmLogInSSO, frmLogInSSO);
  Application.Run;
end.


