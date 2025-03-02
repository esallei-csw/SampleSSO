unit LoginSSO.User.Information;

interface

uses
  System.Classes, System.Generics.Collections;

type
  TSSOUserInformationModel = class
  private
    FBusinessPhones: TList<string>;
    FDisplayName: string;
    FGivenName: string;
    FEmail: string;
    FJobTitle: string;
    FMobilePhone: string;
    FOfficeLocation: string;
    FSurname: string;
    FPreferredLanguage: string;
    FUserPrincipalName: string;
    FId: string;


  public
    constructor Create;
    destructor Destroy; override;
    property EMail: string read FEmail write FEmail;
    property DisplayName: string read FDisplayName write FDisplayName;
    property GivenName: string read FGivenName write FGivenName;
    property BusinessPhones: TList<string> read FBusinessPhones write FBusinessPhones;
    property JobTitle: string read FJobTitle write FJobTitle;
    property MobilePhone: string read FMobilePhone write FMobilePhone;
    property OfficeLocation: string read FOfficeLocation write FOfficeLocation;
    property Surname: string read FSurname write FSurname;
    property PreferredLanguage: string read FPreferredLanguage write FPreferredLanguage;
    property UserPrincipalName: string read FUserPrincipalName write FUserPrincipalName;
    property Id: string read FId write FId;

  end;

implementation

{ TSSOUserInformationModel }
uses
  System.SysUtils;

constructor TSSOUserInformationModel.Create;
begin
  inherited;

  BusinessPhones := TList<string>.Create;
  DisplayName := EmptyStr;
  GivenName := EmptyStr;
  Email := EmptyStr;
  JobTitle := EmptyStr;
  MobilePhone := EmptyStr;
  OfficeLocation := EmptyStr;
  Surname := EmptyStr;
  PreferredLanguage := EmptyStr;
  UserPrincipalName := EmptyStr;
  Id := EmptyStr;
end;

destructor TSSOUserInformationModel.Destroy;
begin
  BusinessPhones.Free;

  inherited;
end;


end.
