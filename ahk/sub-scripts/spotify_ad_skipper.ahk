#NoEnv
#SingleInstance, Force
SendMode, Input
SetBatchLines, -1
SetWorkingDir, %A_ScriptDir%
#KeyHistory, 0
#Persistent

GrandParentOfFile := A_ScriptDir "\.."
; Menu, Tray, Icon, %GrandParentOfFile%\icons\ibm.ico, , 0


; bg thread for automatically skipping
sleep, 5000
While True {
	if WinExist("Advertisement") || WinExist("Spotify Free") {  ; if advertisement window?
		spotify_skip()
		sleep, 5000  ; delay to stop application loop
	}
	sleep, 1000  ; only check every second to reduce resources impact
}
Return

spotify_skip() {
	; skips adverts in Spotify
	; take ~3sec to run, but skips 30-60secs of advertisement so it's worth it

	SoundGet, currentVolume  ; gets current volume
	SoundSet, 0  ; mutes it
	WinClose ahk_exe spotify.exe  ; close spotify
	Run spotify.exe  ; first run creates an error box saying "Spotify is not responding" or smth
	Sleep, 500
	Send {Enter}  ; so we close that and then wait a bit
	Sleep 1500  ; needs such a long wait time bc of the error box
	Run spotify.exe  ; and run it again
	Sleep 1000
	SoundSet, %currentVolume%
	Send {Media_Play_Pause}  ; resume playback

	Return
}

#+w::
	; checks if window can be found
	if WinExist("Advertisement") || WinExist("Spotify Free") {
		MsgBox, Advert Window Found!
	} else {
		MsgBox, No Viable Window...
	}
Return