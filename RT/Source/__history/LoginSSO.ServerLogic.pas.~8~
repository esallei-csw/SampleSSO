unit LoginSSO.ServerLogic;

interface

uses
  IdHTTPServer, IdCustomHTTPServer, IdContext;

type
  TSSOServer = class

  private
  { Private declarations }
  FAuthorizationCode: string;
  FRedirectURI: string;
  FHTTPServer: TIdHTTPServer;


  procedure ConfigureHTTPServer;
  procedure HTTPServerCommandGet(AContext: TIdContext; ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
  function GetAvailablePort: integer;
  function isPortAvailable(APort: integer): boolean;
  function GetAuthCode: string;
  function GetRedirectURI: string;

  procedure OnExecute(AContext: TIdContext);

  public
  { Public declarations }
  constructor Create;
  destructor Destroy; override;
  procedure StopServer;

  property AuthCode: string read GetAuthCode;
  property RedirectURI: string read GetRedirectURI;

  end;

implementation

uses
  IdGlobal, SysUtils, LoginSSO.Constants, LoginSSO.Messages, IdTCPClient, IdSocketHandle, IdStack, WinSock2, IdException, IdTCPServer;

  { TSSOServer }

procedure TSSOServer.ConfigureHTTPServer;
var
  LAvailablePort: Integer;
begin
  // Trova una porta disponibile tra quelle predefinite
  LAvailablePort := GetAvailablePort;
  // Configura il server HTTP
  FHTTPServer := TIdHTTPServer.Create(nil);
  FHTTPServer.DefaultPort := LAvailablePort;
  FRedirectURI := Format(STD_REDIRECTURI, [LAvailablePort]);
  FHTTPServer.OnCommandGet := HTTPServerCommandGet;
  FHTTPServer.ReuseSocket := TIdReuseSocket.rsTrue;
  FHTTPServer.Active := True;
end;

constructor TSSOServer.Create;
begin
  inherited;
  FAuthorizationCode := EmptyStr;

  ConfigureHTTPServer;
end;

destructor TSSOServer.Destroy;
begin
  FHTTPServer.Free;
  inherited;
end;

function TSSOServer.GetAuthCode: string;
begin
  Result := FAuthorizationCode;
end;

function TSSOServer.GetAvailablePort: integer;
var
  LPort: Integer;
  I: Integer;
begin
  Result := -1;
  for I := Low(PREDEFINED_PORTS) to High(PREDEFINED_PORTS) do
  begin
    LPort := PREDEFINED_PORTS[I];
    if IsPortAvailable(LPort) then
    begin
      Result := LPort;
      break;
    end;
  end;
  if Result = -1 then
    raise Exception.Create(PORTS_NOT_AVAILABLE);
end;

function TSSOServer.GetRedirectURI: string;
begin
  Result := FRedirectURI;
end;

procedure TSSOServer.HTTPServerCommandGet(AContext: TIdContext; ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
begin
  if ARequestInfo.Document = CALLBACK then
  begin
    FAuthorizationCode := ARequestInfo.Params.Values[CODE];
    AResponseInfo.ContentText := CALLBACK_HTML_PAGE;
  end
  else
  begin
    AResponseInfo.ResponseNo := HTTP_STATUS_NOT_FOUND;
    AResponseInfo.ContentText := NOT_FOUND;
  end;
end;

function TSSOServer.isPortAvailable(APort: integer): boolean;
var
  TCPServer: TIdTCPServer;
begin
  Result := False;
  TCPServer := TIdTCPServer.Create(nil);
  try
    try
      TCPServer.DefaultPort := APort;
      TCPServer.OnExecute := OnExecute;
      TCPServer.Active := True;
      Result := True; // Se arriva qui, la porta è disponibile
      TCPServer.Active := False;
    except
      on E: EIdCouldNotBindSocket do
        Result := False; // Porta già in uso
      on E: Exception do
        raise; // Gestione di altre eccezioni
    end;
  finally
    TCPServer.Free;
  end;
end;

procedure TSSOServer.OnExecute(AContext: TIdContext);
begin
end;

procedure TSSOServer.StopServer;
begin
  FHTTPServer.Active := False;
end;

end.
