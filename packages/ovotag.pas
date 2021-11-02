{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit ovotag;

{$warn 5023 off : no warning about unused units}
interface

uses
  AudioTag, basetag, CommonFunctions, file_Dummy, file_flac, file_Monkey, 
  file_mp3, file_Mp4, file_ogg, file_opus, file_Wave, file_wma, ID3v1Genres, 
  song, tag_APE, tag_Dummy, tag_id3v2, tag_MP4, tag_vorbis, tag_wma, 
  LazarusPackageIntf;

implementation

procedure Register;
begin
end;

initialization
  RegisterPackage('ovotag', @Register);
end.
