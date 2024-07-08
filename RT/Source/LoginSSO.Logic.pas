unit LoginSSO.Logic;

interface

uses
  System.SysUtils, System.Classes, IdContext, IdHTTPServer,
  System.Net.HttpClient, System.Net.URLClient, System.Net.HttpClientComponent
 , LoginSSO.User.Information, System.JSON, LoginSSO.Utils, LoginSSO.ServerLogic, LoginSSO.HTTPRequests;

type
  TGoToAccessURL = procedure(AUrl: String) of Object;

  TMicrosoftSSO = class
  private
    { Private declarations }
    FClientID: string;
    FTenantID: string;

    FLoggedIn: boolean;

    FAuthURL: string;
    FGoToAccessURL: TGoToAccessURL;
    FSSOServer: TSSOServer;
    FSSOHTTPRequests: TSSOHTTPRequests;


    function GetSSOServer: TSSOServer;
    function GetSSOHTTPReq: TSSOHTTPRequests;
    function GetLogoutURL: string;

    property SSOServer: TSSOServer read GetSSOServer write FSSOServer;
    property SSOHTTPRequests: TSSOHTTPRequests read GetSSOHTTPReq write FSSOHTTPRequests;



  public
    { Public declarations }
    constructor Create(AClientID, ATenantID: string);
    destructor Destroy; override;
    function GetAccessToken: string;
    function GetAuthCode: string;
    procedure LogOut;
    function GetUserData: TSSOUserInformationModel;
    function GetAuthURL: string;
    procedure OpenBrowser(AURL: string);

    function LogIn: TSSOUserInformationModel;

    function GetRedirectURI: string;

    property LoggedIn : boolean read FLoggedIn write FLoggedIn;
    property GoToAccessURL: TGoToAccessURL read FGoToAccessURL write FGoToAccessURL;
  end;

implementation

uses
 System.NetEncoding, Winapi.Windows
 , System.IOUtils, LoginSSO.Constants, LoginSSO.Messages, System.Generics.Collections, IdGlobal, IdSocketHandle, IdException;

 { TMicrosoftSSO }

constructor TMicrosoftSSO.Create(AClientID, ATenantID: string);
begin
  FGoToAccessURL := nil;

  FClientID := AClientID;
  FTenantID := ATenantID;

  //creo e avvio il server
  SSOServer := TSSOServer.create;

  FAuthURL := Format(
    DEFAULT_MICROSOFTURL + AUTH_URL,
    [FTenantID, FClientID, TNetEncoding.URL.Encode(SSOServer.RedirectURI)]);

  LoggedIn := false;

end;

destructor TMicrosoftSSO.Destroy;
begin
  if Assigned(FSSOServer) then
    FSSOServer.Free;
  if Assigned(FSSOHTTPRequests) then
    FSSOHTTPRequests.Free;
  inherited;
end;

function TMicrosoftSSO.GetAuthCode: string;
begin
  Result := SSOServer.AuthCode;
end;

function TMicrosoftSSO.GetAuthURL: string;
begin
  Result := FAuthURL;
end;

function TMicrosoftSSO.GetLogoutURL: string;
begin
  Result := Format(DEFAULT_MICROSOFTURL + FTenantID + LOGOUT_URL + POST_REDIRECT_URL, [SSOServer.RedirectURI]);
end;

function TMicrosoftSSO.GetRedirectURI: string;
begin
  Result := SSOServer.RedirectURI;
end;

function TMicrosoftSSO.GetSSOHTTPReq: TSSOHTTPRequests;
begin
  if not Assigned(FSSOHTTPRequests) then
    FSSOHTTPRequests := TSSOHTTPRequests.Create(FClientID, FTenantID);
  Result := FSSOHTTPRequests;
end;

function TMicrosoftSSO.GetSSOServer: TSSOServer;
begin
  if not Assigned(FSSOServer) then
    FSSOServer := TSSOServer.Create;
  Result := FSSOServer;
end;

procedure TMicrosoftSSO.OpenBrowser(AURL: string);
begin
  if not Assigned(FGoToAccessURL) then
    raise Exception.Create(METHOD_NOT_IMPLEMENTED);

  FGoToAccessURL(AURL);
end;

function TMicrosoftSSO.GetAccessToken: string;
begin
  Result := SSOHTTPRequests.GetAccessToken(SSOServer.AuthCode, SSOServer.RedirectURI);
end;

function TMicrosoftSSO.GetUserData: TSSOUserInformationModel;
begin
  Result := SSOHTTPRequests.GetUserData(SSOHTTPRequests.GetAccessToken(SSOServer.AuthCode, SSOServer.RedirectURI));
end;

procedure TMicrosoftSSO.Logout;
begin
  if not LoggedIn then
    raise Exception.Create(NOT_LOGGED);

  // Redirect to Microsoft's logout URL
  OpenBrowser(GetLogoutURL);

  //invalidate the auth code and access token
  SSOHTTPRequests.InvalidateTokens;

  LoggedIn := False;
end;

function TMicrosoftSSO.LogIn: TSSOUserInformationModel;
var
LAccessToken: string;
begin
  if LoggedIn then
    raise Exception.Create(ALREADY_LOGGED);
  //apro la pagina di autorizzazione
  OpenBrowser(FAuthURL);
  //wait a little bit for the auth code to be received
  sleep(SMALL_SLEEP_TIME);
  //if WebModal is closed by user before authentication, code is not received so exception is raised
  if ( SSOServer.AuthCode = EmptyStr ) then
    raise Exception.Create(LOGIN_CANCEL);
  LAccessToken := SSOHTTPRequests.GetAccessToken(SSOServer.AuthCode, SSOServer.RedirectURI);
  //Ritorno i dati utente prendendoli tramite access token
  Result := SSOHTTPRequests.GetUserData(LAccessToken);

  LoggedIn := true;
end;

end.
