unit testmp3_v23;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpcunit, testutils, testregistry, testdecorator, testreader, basetag, file_mp3, tag_id3v2;

type

  { TMP3TestSetup }

  TMp3TestSetupv23 = class(TReaderTestSetup)
  protected
    function GetFileName: string; override;
    function GetClass: TTagReaderClass; override;
  end;

  { TMp3Testv23 }

  TMp3Testv23 = class(TReaderTest)
  published
    procedure TestExtraComment;
  end;


implementation
{ TMP3TestSetup }

function TMp3TestSetupv23.GetFileName: string;
begin
  Result := TEST_PATH+'sample-mp3-v2.3.mp3';
end;

function TMp3TestSetupv23.GetClass: TTagReaderClass;
begin
  Result := TMP3Reader;
end;

procedure TMp3Testv23.TestExtraComment;
var
  i: integer;
  Comment: string;
  CommentNo:integer;
begin
  CommentNo:=0;
  for i := 0 to Tags.Tags.Count - 1 do
    if Tags.Tags.Frames[i] is TID3FrameComment then
      with Tags.Tags.Frames[i] as TID3FrameComment do
        begin
          Comment := AsString;
          if LanguageID = 'ita' then
             begin
               AssertEquals('ID3v1 Comment', Description);
               AssertEquals('à Commento ò', Comment);
               inc(CommentNo);
             end;
          if LanguageID = 'xxx' then
             begin
               AssertEquals(Description,'');
               AssertEquals('à Commento ò', Comment);
               inc(CommentNo);
             end;
          if LanguageID = 'eng' then
             begin
               AssertEquals('ç Description ç', Description);
               AssertEquals('@ Real Comment ì', Comment);
               inc(CommentNo);
             end;

        end;
  AssertEquals(CommentNo, 3);
end;

initialization
  RegisterTestDecorator(TMp3TestSetupv23, TMp3Testv23);
end.
