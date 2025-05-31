unit testAAc;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpcunit, testutils, testregistry, testdecorator, testreader, basetag, file_Mp4;

type


  TAAcTestSetup = class(TReaderTestSetup)
  protected
    function GetFileName: string; override;
    function GetClass: TTagReaderClass; override;
  end;

  TAAcTest = class(TAudioFileTest)
  end;


implementation

function TAAcTestSetup.GetFileName: string;
begin
  Result := TEST_PATH+'sample-aac.aac';
end;

function TAAcTestSetup.GetClass: TTagReaderClass;
begin
  Result := TMp4Reader;
end;

initialization
  RegisterTestDecorator(TAAcTestSetup, TAAcTest);
end.
