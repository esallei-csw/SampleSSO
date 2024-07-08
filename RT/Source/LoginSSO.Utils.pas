unit LoginSSO.Utils;

interface

uses
  System.SysUtils;

type
  TSSOUtils = class

  private

  public
    function GetEncoding: TEncoding;
  end;

implementation

function TSSOUtils.GetEncoding: TEncoding;
begin
  Result := TEncoding.UTF8;
end;

end.
