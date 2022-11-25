![](https://i.imgur.com/Y80SpfK.jpg)

SongTube is a new beautiful and fast application made in flutter, it supports YouTube audio and video downloading at any quality, In-App YouTube Browser, audio conversion, Playlists and an Audio tags editor.

---

## Features

+ Video Download at any available Quality
+ Download HDR and 60fps Videos
+ Audio Download at best available Quality
+ Audio Tags & Artwork Editor
+ Audio Filters (Volume, Bass, Treble)
+ Audio Conversion (AAC, OGG and MP3) (optional)
+ Full Playlist Downloads (Only Audio)
+ Set custom path for Audio/Video download
+ Music Player built-in
+ Video Player built-in
+ Music Equalizer
+ Music Playlists
+ Youtube Videos Playlists
+ In-App Youtube Browser
+ Light/Dark/Black Themes
+ Accent Color Picker
+ UI Customizations

---

## Download SongTube

You can get this application from the Official SongTube Channel on **Telegram:** https://t.me/songtubechannel **You can also join SongTube Official Group from the Channel, any kind of issue report or recommendation is welcomed!**

Other SongTube download sites:

+ Drive: https://tinyurl.com/SongTubeDrive
+ GitHub: https://tinyurl.com/STGithub
+ AppGallery: https://tinyurl.com/STAppGallery

---

## How to Update NewPipeExtractor_Dart(Library for Youtube)

**1st Step:** Select NewPipeExtractor(including forks) you want to use

- NewPipe [NewPipeExtractor](https://github.com/TeamNewPipe/NewPipeExtractor)
- AnimePipe [NewPipeExtractor](https://github.com/InfinityLoop1309/NewPipeExtractor)
- SkyTube [NewPipeExtractor](https://github.com/SkyTubeTeam/NewPipeExtractor)
- And Other Forks [Click this link to see Active Forks](https://techgaun.github.io/active-forks/index.html#TeamNewPipe/NewPipeExtractor)

**2nd Step:** Update NewPipeExtractor to NewPipeExtractor_Dart

Find build.gradle under **NewPipeExtractor_Dart\android** folder.  
Than Find line ``implementation 'com.github.SkyTubeTeam.NewPipeExtractor:NewPipeExtractor:LOCAL_SNAPSHOT'``  
Change the dependency version you want to use  
```gradle
// NewPipe
implementation 'com.github.TeamNewPipe:NewPipeExtractor:v0.20.10'

// Skytube
implementation 'com.github.SkyTubeTeam.NewPipeExtractor:NewPipeExtractor:skytube-2022-11-04'
```