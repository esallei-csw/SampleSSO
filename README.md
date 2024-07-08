# SAMPLE SSO

Sample code for Microsoft SSO-Login

HOW TO USE:

1. Create an object:

```
 SSO := TmicrosoftSSO.create(CLIENTID, TENANTID);
```

3. Assign a procedure to the property GoToAccessURL:

```
 SSO.GoToAccessURL := Proc;
```

Where Proc is: (for WebView login)

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

(For Browser login):

```
procedure TfrmLogInSSO.ViewGoToURL(AUrl: String);
begin
  ShellExecute(0, OPEN, PChar(AURL), nil, nil, SW_SHOWNORMAL);
  while SSO.GetAuthCode = EmptyStr do
    sleep(DEFAULT_SLEEP_TIME);
end;
```

3. Call LogIn function which returns an object(TSSOUserInformationModel) containing User Info:

```
UserInfo: TSSOUserInformationModel;
UserInfo := SSO.LogIn;
```
