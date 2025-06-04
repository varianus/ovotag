unit testOpus;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpcunit, testutils, testregistry, testdecorator, testreader, basetag, file_Opus;

type


  TOpusTestSetup = class(TReaderTestSetup)
  protected
    function GetFileName: string; override;
    function GetClass: TTagReaderClass; override;
  end;

  TOpusTest = class(TReaderTest)
  end;


implementation

function TOpusTestSetup.GetFileName: string;
begin
  Result := TEST_PATH+'sample-opus.opus';
end;

function TOpusTestSetup.GetClass: TTagReaderClass;
begin
  Result := TOpusReader;
end;

initialization
  RegisterTestDecorator(TOpusTestSetup, TOpusTest);
end.
