unit testMonkey;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpcunit, testutils, testregistry, testdecorator, testreader, basetag, file_Monkey;

type


  TMonkeyTestSetup = class(TReaderTestSetup)
  protected
    function GetFileName: string; override;
    function GetClass: TTagReaderClass; override;
  end;

  TMonkeyTest = class(TReaderTest)
  end;


implementation

function TMonkeyTestSetup.GetFileName: string;
begin
  Result := TEST_PATH+'sample-ape.ape';
end;

function TMonkeyTestSetup.GetClass: TTagReaderClass;
begin
  Result := TMonkeyReader;
end;

initialization
  RegisterTestDecorator(TMonkeyTestSetup, TMonkeyTest);
end.
