unit testflac;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpcunit, testutils, testregistry, testdecorator, testreader, basetag, file_flac;

type

  { TMP3TestSetup }

  TFlacTestSetup = class(TReaderTestSetup)
  protected
    function GetFileName: string; override;
    function GetClass: TTagReaderClass; override;
  end;

  TFlacTest = class(TReaderTest)
  end;


implementation

function TFlacTestSetup.GetFileName: string;
begin
  Result := '../examples/demosound/sample-flac.flac';
end;

function TFlacTestSetup.GetClass: TTagReaderClass;
begin
  Result := TFlacReader;
end;

initialization
  RegisterTestDecorator(TFlacTestSetup, TFlacTest);
end.
