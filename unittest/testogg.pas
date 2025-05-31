unit testogg;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpcunit, testutils, testregistry, testdecorator, testreader, basetag, file_ogg;

type


  ToggTestSetup = class(TReaderTestSetup)
  protected
    function GetFileName: string; override;
    function GetClass: TTagReaderClass; override;
  end;

  ToggTest = class(TReaderTest)
  end;


implementation

function ToggTestSetup.GetFileName: string;
begin
  Result := TEST_PATH+'sample-ogg.ogg';
end;

function ToggTestSetup.GetClass: TTagReaderClass;
begin
  Result := ToggReader;
end;

initialization
  RegisterTestDecorator(ToggTestSetup, ToggTest);
end.
