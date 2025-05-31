unit testreader;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpcunit, testutils, testregistry, testdecorator, basetag;

type

  { TMP3TestSetup }

  { TReaderTestSetup }

  TReaderTestSetup = class(TTestSetup)
  protected
    function GetFileName: string; virtual;
    function GetClass: TTagReaderClass; virtual;
    procedure OneTimeSetup; override;
    procedure OneTimeTearDown; override;
  end;

  TReaderTest = class(TTestCase)
  published
    procedure TestArtist;
  end;


implementation
var
  Tags: TTagReader;

{ TReaderTestSetup }

function TReaderTestSetup.GetFileName: string;
begin
  Result := '';
end;

function TReaderTestSetup.GetClass: TTagReaderClass;
begin
  Result := TTagReader;
end;

procedure TReaderTestSetup.OneTimeSetup;
begin
  Tags := GetClass.Create(GetFileName);
end;

procedure TReaderTestSetup.OneTimeTearDown;
begin
  Tags.Free;
end;

procedure TReaderTest.TestArtist;
begin
  AssertEquals(Tags.GetCommonTags.Artist, 'à Artist à');
end;


end.
