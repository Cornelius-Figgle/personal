#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases
SendMode Input  ; default mode
SetWorkingDir %A_ScriptDir%  ; consistent start dir
#SingleInstance, Force
#InstallKeybdHook
#KeyHistory 0

GrandParentOfFile := A_ScriptDir "\.."
Menu, Tray, Icon, %GrandParentOfFile%\icons\ibm.ico, , 0

; =======================================
; Remap keys
; =======================================

#l::DllCall("LockWorkStation")  ; lock machine
LAlt::LWin
Ins::AppsKey
<^>!::LAlt

^#a::Send, !{Esc}
^#d::Send, !+{Esc}

; =======================================
; Tool keys
; =======================================

; *F6:: Run %A_ScriptDir%\HW.ahk

toggle = 0
#MaxThreadsPerHotkey 2
*F3::
	Toggle := !Toggle
	SendInput {ScrollLock}
	While Toggle {
		MouseMove, 0, -10, 0, R
		MouseMove, 0, 10, 0, R
		sleep 300000
	}
Return

#NumpadRight::
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

*F1::
	Menu, Tray, Icon, %GrandParentOfFile%\icons\loading.ico, , 0
	Run, C:\ProgramData\Microsoft\Windows\Start Menu\Programs\AutoHotkey\AutoHotkey Help File, , Max
	Menu, Tray, Icon, %GrandParentOfFile%\icons\ibm.ico, , 0
Return

*F4::!F4
*F9:: Run control mmsys.cpl sounds
*ScrollLock::Run, Notepad
*Pause::Run ms-paint: 

; =======================================
; Media keys
; =======================================

NumpadHome::Volume_Down
NumpadLeft::Media_Prev
NumpadEnd::Browser_Back
NumpadUp::Volume_Mute
NumpadClear::Media_Play_Pause
NumpadDown::Media_Stop
NumpadPgUp::Volume_Up
NumpadRight::Media_Next
NumpadPgDn::Browser_Forward
NumpadIns::Browser_Home
NumpadDel::
	Run, "https://www.youtube.com/watch?v=4jxeYfqevl4"
	Sleep, 5000
	Send, {f}
Return
