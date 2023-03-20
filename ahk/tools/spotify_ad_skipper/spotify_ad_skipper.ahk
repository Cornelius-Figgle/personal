; ===== flags & globals ======================================================

#Requires AutoHotkey v2.0
#SingleInstance Force

; Persistent(true)


path_base := "t:\personal\ahk\"
try {
	TraySetIcon(path_base . "icons\sp.ico")
} catch {  ; if icons dir cannot be found
	TraySetIcon(A_ScriptDir . "\sp.ico")
}

FileInstall("av_checks_v1.exe", "av_checks_v1.exe", true)  ; copies `av_checks_v1.exe` into the compiled exe

; ===== main functions =======================================================

SkipViaRestart() {
	; skips adverts in Spotify
	; take 3-4sec to run, but skips 30-60secs of advertisement so it's worth it

	WinClose("ahk_exe spotify.exe")
	Sleep(2000)  ; spotify throws an error if you restart to soon fsr so we wait a bit
	Run("spotify.exe")
	Sleep(1000)  ; wait for app to load
	Send("{Media_Play_Pause}")  ; restart playback
}

DetermineWhetherToSkip() {
	Sleep(1000)
	if WinExist("Spotify Free")
		and WinExist("ahk_exe spotify.exe")
		and WinGetID("ahk_exe spotify.exe") == WinGetID("Spotify Free")
		and RunWait("av_checks_v1.exe", , "HIDE") { 

		SkipViaRestart()
	}
}

BgThread() {
	While true {
		Sleep(1000)  ; only check every second to reduce resources impact
		DetermineWhetherToSkip()
	}
}

; ===== debugging hotkeys ====================================================

; @Ahk2Exe-IgnoreBegin

#+w:: {
	; checks if window can be found
	if WinExist("Spotify Free") {
		MsgBox("Advert Window Found! `n" . RunWait("av_checks_v1.exe", , "HIDE"))
	} else {
		MsgBox("No Viable Window... `n" . RunWait("av_checks_v1.exe", , "HIDE"))
	}
}

; @Ahk2Exe-IgnoreEnd

; ===== function call ========================================================

if (!A_IsCompiled and A_LineFile == A_ScriptFullPath) or A_IsCompiled ; only call function if it was ran directly (ie not #Include'd)
	BgThread()