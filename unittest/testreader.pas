unit testreader;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpcunit, testutils, testregistry, testdecorator, basetag;


Const
  {$IFDEF UNIX}
  TEST_PATH = '../../../examples/demosound/';
  {$ENDIF}
  {$IFDEF WINDOWS}
  TEST_PATH = '..\..\..\examples\demosound\';
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
  AssertEquals(4, trunc(Tags.Duration/1000));
end;

procedure TReaderTest.TestTitle;
begin
  AssertEquals('° sample-track °',Tags.GetCommonTags.Title);
end;

procedure TReaderTest.TestArtist;
begin
  AssertEquals('à Artist à',Tags.GetCommonTags.Artist);
end;

procedure TReaderTest.TestAlbum;
begin
  AssertEquals('é Album è',Tags.GetCommonTags.Album);
end;

procedure TReaderTest.TestYear;
begin
  AssertEquals('2025',Tags.GetCommonTags.Year);
end;

procedure TReaderTest.TestGenre;
begin
  AssertEquals('Classical',tags.GetCommonTags.Genre);
end;

procedure TReaderTest.TestComment;
begin
  AssertEquals('à Commento ò',Tags.GetCommonTags.Comment);
end;


end.
