unit testreader;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpcunit, testutils, testregistry, testdecorator, basetag, file_mp3;

type

  { TMP3TestSetup }

  { TReaderTestSetup }

  TReaderTestSetup = class(TTestSetup)
  protected
    function GetFileName: string; virtual;
    procedure OneTimeSetup; override;
    procedure OneTimeTearDown; override;
  end;

  TMp3Test = class(TTestCase)
  published
    procedure TestArtist;
  end;


implementation
var
  Tags: TTagReader;


{ TMP3TestSetup }

procedure TMP3TestSetup.OneTimeSetup;
begin
  Tags := TMP3Reader.Create('../examples/demosound/sample-mp3-v2.4.mp3');
end;

procedure TMP3TestSetup.OneTimeTearDown;
begin
  Tags.Free;
end;

{ TReaderTestSetup }

function TReaderTestSetup.GetFileName: string;
begin
  Result := '';
end;

procedure TReaderTestSetup.OneTimeSetup;
begin

end;

procedure TReaderTestSetup.OneTimeTearDown;
begin

end;

procedure TMp3Test.TestArtist;
begin
  AssertEquals(Tags.GetCommonTags.Artist, 'à Artist à');
end;


initialization
  RegisterTestDecorator(TMP3TestSetup, TMp3Test);
end.
