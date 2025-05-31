unit testreader;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpcunit, testutils, testregistry, testdecorator, basetag;


Const
  {$IFDEF UNIX}
  TEST_PATH = '../../examples/demosound/';
  {$ENDIF}
  {$IFDEF WINDOWS}
  TEST_PATH = '..\..\examples\demosound\';
  {$ENDIF}

type
  { TReaderTestSetup }

  TReaderTestSetup = class(TTestSetup)
  protected
    function GetFileName: string; virtual;
    function GetClass: TTagReaderClass; virtual;
    procedure OneTimeSetup; override;
    procedure OneTimeTearDown; override;
  end;

  { TAudioFileTest }

  TAudioFileTest = class(TTestCase)
    Published
      Procedure TestDuration;

  end;

  TReaderTest = class(TAudioFileTest)
  published
    procedure TestTitle;
    procedure TestArtist;
    Procedure TestAlbum;
    procedure TestYear;
    procedure TestGenre;
    Procedure TestComment;
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

{ TAudioFileTest }

procedure TAudioFileTest.TestDuration;
begin
  // need better handling, just to avoid really wrong calculation
  AssertEquals( trunc(Tags.Duration/1000), 4);
end;

procedure TReaderTest.TestTitle;
begin
  AssertEquals(Tags.GetCommonTags.Title, '° sample-track °');
end;

procedure TReaderTest.TestArtist;
begin
  AssertEquals(Tags.GetCommonTags.Artist, 'à Artist à');
end;

procedure TReaderTest.TestAlbum;
begin
  AssertEquals(Tags.GetCommonTags.Album, 'é Album è');
end;

procedure TReaderTest.TestYear;
begin
  AssertEquals(Tags.GetCommonTags.Year,'2025');
end;

procedure TReaderTest.TestGenre;
begin
  AssertEquals(tags.GetCommonTags.Genre, 'Classical');
end;

procedure TReaderTest.TestComment;
begin
  AssertEquals(Tags.GetCommonTags.Comment,'à Commento ò');
end;


end.
