# Spotify Ad Skipper

## Main App

Skips adverts in Spotify by relaunching if all of the following conditions are met:

1. A window exists called "Spotify Free"
2. A windows exists called "ahk_exe spotify.exe"
3. The id of the "ahk_exe spotify.exe" window is the same as the "Spotify Free" window
4. [av_checks_v1.exe](#av_checks_v1) returns that audio is playing

These are controlled by the `DetermineWhetherToSkip()` function

The `SkipViaRestart()` function then:

- Closes Spotify
- Waits for 2 seconds (because Spotify errors if you relaunch too quickly)
- Launches Spotify
- Waits 1 second for Spotify to load
- Sends `Media_Play_Pause` to restart the playback

The checks for an advertisement are called with a 1 second delay between (to reduce resource usage). This is controlled by the `BgThread()` function

## av_checks_v1

This is a secondary script that returns a boolean (ie 0 or 1) for whether or not audio is actually playing. For example, if Spotify is paused, it has the window title "Spotify Free" but it is not an advert

The script has actually written by [@noname on the AutoHotkey boards](https://www.autohotkey.com/boards/viewtopic.php?t=41872) using [@Kurolight's adaption](https://www.autohotkey.com/boards/viewtopic.php?f=5&t=40132) of [the VA library created by @Lexikos](https://www.autohotkey.com/board/topic/21984-vista-audio-control-functions/), but for AHK v1

I initially planned on rewriting it for v2 (in part using [@mmikeww's converter](https://github.com/mmikeww/AHK-v2-script-converter)), however, I don't really understand the script so I gave up and compiled it to an exe inside a sandbox

Consequently, `av_checks_v1.ahk` must be compiled to exe using the v1.1 [Ahk2Exe script](https://github.com/AutoHotkey/Ahk2Exe) present in *most v1.1 AHK installations

## Compiled Exe

`av_checks_v1.exe` is included via `FileInstall` and therefore `spotify_ad_skipper.exe` is a standalone executable
