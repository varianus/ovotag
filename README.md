
# Ovotag

Ovotag is a library, written in FreePascal/Lazarus to read and modify meta-data ("tag") of audio files.

### Supported file format 
|File Format|Notes|  
|-----|-----|
|mp3 | read of ID3V1 and ID3V2 (any versions), save on ID3V2 2.3 |
|flac | read and save Vorbis tag|
|mp4 (m4a,aac) | Read and save ATOM tags for m4a, only durations for aac|
|wma | read and save ASF tags|
|ogg | read and save Vorbis tag|
|opus | read and save Vorbis tag|
|ape (monkey audio) | Read APE, ID3V1 or ID3V2 tags, save APE tags|


### License
This library is licensed under a modified LGPL license which allow linking on executables, see  [this link](https://wiki.freepascal.org/FPC_modified_LGPL) for details. 

