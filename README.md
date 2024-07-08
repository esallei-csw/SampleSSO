# SAMPLE SSO

Sample code for Microsoft SSO-Login

HOW TO USE:

1. Import the libraries(remember to import also the webview class in your project):

```
uses
  LoginSSO.Logic, LoginSSO.User.Information, LoginSSO.WebView, LoginSSO.Messages, LoginSSO.Constants;
```

2. Create an object:

```
 SSO := TmicrosoftSSO.create(CLIENTID, TENANTID);
```

3. Assign a procedure to the property GoToAccessURL:

```
 SSO.GoToAccessURL := Proc;
```

3.1. Where Proc is: (for WebView login, strongly suggested, remember to also import the webview class into your project)

```
procedure TfrmLogInSSO.ViewGoToWindow(AUrl: string);
begin
  WebForm.LoadURL(AUrl, SSO.GetRedirectURI);
  if AUrl.contains(LOGOUT_URL) then
    WebForm.OperationType := ovtLogOut
  else
    WebForm.OperationType := ovtLogIn;

  if ( WebForm.ShowModal <> mrOK ) then
    raise Exception.Create(LOGIN_CANCEL);

end;
```

3.2. (For Browser login, use only if needed):

```
procedure TfrmLogInSSO.ViewGoToURL(AUrl: String);
begin
  ShellExecute(0, OPEN, PChar(AURL), nil, nil, SW_SHOWNORMAL);
  while SSO.GetAuthCode = EmptyStr do
    sleep(DEFAULT_SLEEP_TIME);
end;
```

4. Call LogIn function which returns an object(TSSOUserInformationModel) containing User Info:

```
UserInfo: TSSOUserInformationModel;
UserInfo := SSO.LogIn;
```
