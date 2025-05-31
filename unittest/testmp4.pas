unit testMp4;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpcunit, testutils, testregistry, testdecorator, testreader, basetag, file_Mp4;

type


  TMp4TestSetup = class(TReaderTestSetup)
  protected
    function GetFileName: string; override;
    function GetClass: TTagReaderClass; override;
  end;

  TMp4Test = class(TReaderTest)
  end;


implementation

function TMp4TestSetup.GetFileName: string;
begin
  Result := TEST_PATH+'sample-m4a.m4a';
end;

function TMp4TestSetup.GetClass: TTagReaderClass;
begin
  Result := TMp4Reader;
end;

initialization
  RegisterTestDecorator(TMp4TestSetup, TMp4Test);
end.
