program ovotagdemo;

{$mode objfpc}{$H+}

uses {$IFDEF UNIX}
  cthreads, {$ENDIF}
  Classes,
  SysUtils,
  CustApp { you can add units after this },
  RegisterAllReader,
  AudioTag,
  BaseTag,
  file_Dummy;

type

  { TOvoTagDemo }

  TOvoTagDemo = class(TCustomApplication)
  protected
    procedure DoRun; override;
  public
    constructor Create(TheOwner: TComponent); override;
    destructor Destroy; override;
    procedure WriteHelp; virtual;
  end;

  { TOvoTagDemo }

  procedure TOvoTagDemo.DoRun;
  var
    ErrorMsg, tmpsr: string;
    Files: TStringArray;
    i, j: integer;
    tagClass: TTagReaderClass;
    TagReader: TTagReader;
    CommonTags: TCommonTags;
  begin
    // quick check parameters
    ErrorMsg := CheckOptions('hcf', '');
    if ErrorMsg <> '' then
    begin
      ShowException(Exception.Create(ErrorMsg));
      Terminate;
      Exit;
    end;

    // parse parameters
    if HasOption('h', 'help') then
    begin
      WriteHelp;
      Terminate;
      Exit;
    end;

    { add your program here }
    Files := GetNonOptions('hcf', ['help']);
    if Length(Files) = 0 then
    begin
      WriteHelp;
      Terminate;
      Exit;
    end;

    for i := 0 to Length(Files) - 1 do
    begin
      Writeln('File Name  : ', Files[i]);
      tagClass := IdentifyKind(Files[i]);
      if tagClass = TDummyReader then
      begin
        WriteLn('Unsupported file type (extension)');
        Continue;
      end;
      TagReader := tagClass.Create;
      TagReader.LoadFromFile(Files[i]);
      CommonTags := TagReader.GetCommonTags;
      WriteLn('Audio Property : ');
      WriteLn('   Duration        : ', TimeToStr(CommonTags.Duration / MSecsPerDay));
      WriteLn('   Bit Rate        : ', format('%d Kbps', [TagReader.MediaProperty.BitRate]));
      WriteLn('   BPM             : ', TagReader.MediaProperty.BPM);
      WriteLn('   Channels        : ', TagReader.MediaProperty.ChannelMode);
      WriteLn('   Sampling        : ', format('%d Hz', [TagReader.MediaProperty.Sampling]));
      WriteLn('Common Tags        : ');
      WriteLn('   Title           : ', CommonTags.Title);
      WriteLn('   Artist          : ', CommonTags.Artist);
      WriteLn('   Album           : ', CommonTags.Album);
      WriteLn('   Genre           : ', CommonTags.Genre);
      WriteLn('   AlbumArtist     : ', CommonTags.AlbumArtist);
      WriteLn('   Comment         : ', CommonTags.Comment);
      WriteLn('   Track           : ', CommonTags.Track);
      WriteLn('   Year            : ', CommonTags.Year);
      WriteLn('   Embedded images : ', TagReader.Tags.ImageCount);

      if HasOption('f', 'full') then
      begin
        WriteLn('Full Dump      : ');
        for j := 0 to TagReader.Tags.Count - 1 do
        begin
          tmpsr := TagReader.Tags.Frames[j].ID + ' ---> ' + TagReader.Tags.Frames[j].AsString;
          Writeln('   ',tmpsr);
        end;

      end;
      WriteLn('----------------------');
      WriteLn();

      TagReader.Free;
    end;

    // stop program loop
    Terminate;
  end;

  constructor TOvoTagDemo.Create(TheOwner: TComponent);
  begin
    inherited Create(TheOwner);
    StopOnException := True;
  end;

  destructor TOvoTagDemo.Destroy;
  begin
    inherited Destroy;
  end;

  procedure TOvoTagDemo.WriteHelp;
  begin
    { add your help code here }
    writeln('ovotagdemo : extract audio metadata (tags) from audio files');
    writeln('Usage: ', ExeName, ' [OPTIONS] [FILES]');
    writeln('Options:');
    writeln('    -h, --help ');
    writeln('        Show usage info ');
    writeln('    -c, --common ');
    writeln('        Show only most common tags (Default) ');
    writeln('    -f, --full ');
    writeln('        Dump every available tags ');

  end;

var
  Application: TOvoTagDemo;
begin
  Application := TOvoTagDemo.Create(nil);
  Application.Title := 'OvoTag Demo';
  Application.Run;
  Application.Free;
end.
