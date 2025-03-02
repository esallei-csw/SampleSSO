unit LoginSSO.Constants;

interface

const
  //Http request URL Constants
  DEFAULT_MICROSOFTURL = 'https://login.microsoftonline.com/';
  TOKEN_URL = '/oauth2/v2.0/token';
  LOGOUT_URL = '/oauth2/v2.0/logout';
  POST_REDIRECT_URL = '?post_logout_redirect_uri=%s';
  TOKEN_BODY_URL = 'client_id=%s&redirect_uri=%s&grant_type=authorization_code&code=%s&scope=%s';
  SCOPE = 'resource offline_access';
  AUTH_URL = '%s/oauth2/v2.0/authorize?client_id=%s&response_type=code&redirect_uri=%s&response_mode=query&scope=https://graph.microsoft.com/.default';
  MICROSOFT_GRAPH_URL = 'https://graph.microsoft.com/v1.0/me';
  DEFAULT_PORT = 8081;
  DEFAULT_SLEEP_TIME = 500;
  SMALL_SLEEP_TIME = 50;
  HTTP_STATUS_OK = 200;
  HTTP_STATUS_NOT_FOUND = 404;

  DEFAULT_TENANTID = '118d45a5-45c3-4f98-b3e1-5a7b1447c019';
  DEFAULT_CLIENTID = '63816ab1-5e2c-475a-81c4-833249fa7e63';
  DEFAULT_REDIRECTURI = 'http://localhost:8080/callback';
  STD_REDIRECTURI = 'http://localhost:%d/callback';
  CALLBACK = '/callback';

  ACCESS_TOKEN = 'access_token';
  REFRESH_TOKEN = 'refresh_token';
  ID_TOKEN = 'id_token';
  GET = 'GET';
  POST ='POST';
  CODE = 'code';
  OPEN = 'open';
  ERROR ='error';
  ERROR_DESCRIPTION = 'error_description';
  MESSAGE = 'message';

  PREDEFINED_PORTS: array[0..4] of Integer = (8080, 8081, 8082, 8083, 8084);

  //Header constants
  AUTHORIZATION_NUM = 0;
  ACCEPT_NUM = 1;
  USER_AGENT_NUM = 2;

  AUTHORIZATION = 'Authorization';
  BEARER = 'Bearer ';
  ACCEPT_NAME = 'Accept';
  USER_AGENT = 'User_Agent';
  APPLICATION_JSON = 'application/json';
  MOZILLA_CONST = 'Mozilla/5.0 (compatible; DelphiClient/1.0)';

  //User Data Model Constants
  BUSINESSPHONES = 'businessPhones';
  DISPLAYNAME = 'displayName';
  GIVENNAME = 'givenName';
  EMAIL = 'mail';
  JOBTITLE = 'jobTitle';
  MOBILEPHONE = 'mobilePhone';
  OFFICELOCATION = 'officeLocation';
  SURNAME = 'surname';
  PREFERREDLANGUAGE = 'preferredLanguage';
  USERPRINCIPALNAME = 'userPrincipalName';
  ID = 'id';

  CALLBACK_HTML_PAGE = '<!DOCTYPE html>' +
            '<html>' +
            '<head>' +
            '    <title>Authorization</title>' +
            '    <style>' +
            '        body {' +
            '            display: flex;' +
            '            justify-content: center;' +
            '            align-items: center;' +
            '            height: 100vh;' +
            '            margin: 0;' +
            '            font-family: Arial, sans-serif;' +
            '            background-color: #f5f5f5;' +
            '        }' +
            '        .message {' +
            '            text-align: center;' +
            '            font-size: 24px;' +
            '            color: #333;' +
            '            background-color: #fff;' +
            '            padding: 20px;' +
            '            border: 2px solid #ccc;' +
            '            border-radius: 4px;' +
            '            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);' +
            '            display: flex;' +
            '            flex-direction: column;' +
            '            align-items: center;' +
            '        }' +
            '        .logo {' +
            '            width: 100px;' +
            '            margin-bottom: 20px;' +
            '        }' +
            '    </style>' +
            '</head>' +
            '<body>' +
            '    <div class="message">' +
            '        <img src="https://upload.wikimedia.org/wikipedia/commons/4/44/Microsoft_logo.svg" class="logo" alt="Microsoft Logo">' +
            '        Redirect page. You can close this window.' +
            '    </div>' +
            '</body>' +
            '</html>';
  JAVASCRIPT = 'setTimeout(function() {' +
       '  var accountElement = document.querySelector("#tilesHolder > div > div > div");' +
       '  if (accountElement) {' +
       '    accountElement.click();' +
       '  }' +
       '}, 50);';


implementation



end.
