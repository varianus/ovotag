unit testmp3_v23;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpcunit, testutils, testregistry, testdecorator, testreader, basetag, file_mp3;

type

  { TMP3TestSetup }

  TMp3TestSetupv23 = class(TReaderTestSetup)
  protected
    function GetFileName: string; override;
    function GetClass: TTagReaderClass; override;
  end;

  TMp3Testv23 = class(TReaderTest)
  end;


implementation
{ TMP3TestSetup }

function TMp3TestSetupv23.GetFileName: string;
begin
  Result := '../examples/demosound/sample-mp3-v2.3.mp3';
end;

function TMp3TestSetupv23.GetClass: TTagReaderClass;
begin
  Result := TMP3Reader;
end;

initialization
  RegisterTestDecorator(TMp3TestSetupv23, TMp3Testv23);
end.
