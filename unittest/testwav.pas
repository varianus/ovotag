unit testWav;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpcunit, testutils, testregistry, testdecorator, testreader, basetag, file_wave;

type


  TWavTestSetup = class(TReaderTestSetup)
  protected
    function GetFileName: string; override;
    function GetClass: TTagReaderClass; override;
  end;

  TWavTest = class(TAudioFileTest)
  end;


implementation

function TWavTestSetup.GetFileName: string;
begin
  Result := TEST_PATH+'sample-wav.wav';
end;

function TWavTestSetup.GetClass: TTagReaderClass;
begin
  Result := TWaveReader;
end;

initialization
  RegisterTestDecorator(TWavTestSetup, TWavTest);
end.
