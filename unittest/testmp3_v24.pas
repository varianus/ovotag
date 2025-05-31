unit testmp3_v24;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpcunit, testutils, testregistry, testdecorator, testreader, basetag, file_mp3;

type

  { TMP3TestSetup }

  TMp3TestSetupv24 = class(TReaderTestSetup)
  protected
    function GetFileName: string; override;
    function GetClass: TTagReaderClass; override;
  end;

  TMp3Testv24 = class(TReaderTest)
  end;


implementation
{ TMP3TestSetup }

function TMp3TestSetupv24.GetFileName: string;
begin
  Result := '../examples/demosound/sample-mp3-v2.4.mp3';
end;

function TMp3TestSetupv24.GetClass: TTagReaderClass;
begin
  Result := TMP3Reader;
end;

initialization
  RegisterTestDecorator(TMP3TestSetupv24, TMp3Testv24);
end.
