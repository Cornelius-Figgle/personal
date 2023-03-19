; ===== flags & globals ======================================================

#Requires AutoHotkey v2.0
#SingleInstance Force

; Persistent(true)


path_base := "t:\personal\ahk\"
Try {
	TraySetIcon(path_base . "icons\sp.ico")
} catch {  ; if icons dir cannot be found
	TraySetIcon(A_ScriptDir . "\sp.ico")
}

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

#+w:: {
	; checks if window can be found
	if WinExist("Advertisement") || WinExist("Spotify Free") {
		MsgBox("Advert Window Found! `n" . RunWait("v1_av_checks.exe", , "HIDE"))
	} else {
		MsgBox("No Viable Window... `n" . RunWait("v1_av_checks.exe", , "HIDE"))
	}
}

; ===== function call ========================================================

if (!A_IsCompiled && A_LineFile == A_ScriptFullPath) ; only call function if it was ran directly (ie not #Include'd)
	BgThread()