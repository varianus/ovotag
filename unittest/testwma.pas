unit testWma;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpcunit, testutils, testregistry, testdecorator, testreader, basetag, file_wma;

type


  TWmaTestSetup = class(TReaderTestSetup)
  protected
    function GetFileName: string; override;
    function GetClass: TTagReaderClass; override;
  end;

  TWmaTest = class(TReaderTest)
  end;


implementation

function TWmaTestSetup.GetFileName: string;
begin
  Result := TEST_PATH+'sample-wma.wma';
end;

function TWmaTestSetup.GetClass: TTagReaderClass;
begin
  Result := TwmaReader;
end;

initialization
  RegisterTestDecorator(TWmaTestSetup, TWmaTest);
end.
