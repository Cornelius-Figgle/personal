; ===== flags & globals ======================================================

#Requires AutoHotkey v2.0
#SingleInstance Force

; Persistent(true)


path_base := "t:\personal\ahk\"


; ===== main macros ==========================================================

*F1:: {
	; opens help file for currently running ahk version
	SplitPath(A_AhkPath, , &AhkDir)
	Run(AhkDir . "\AutoHotkey.chm", , "Max")
}

*F4::!F4  ; quicker close

*F9::Run("control mmsys.cpl sounds")  ; sound control panel

*ScrollLock:: {
	; opens an untitled text file in VS Code if it is open
	; else in notepad

	if WinExist("ahk_exe Code.exe") {
		if WinActive("ahk_exe Code.exe") {
			Send("^n")
		} else {
			WinActivate("ahk_exe Code.exe")
			Send("^n")
		}
	} else {
		Run("notepad.exe")
	}
}

Pause::Run("ms-paint:")

^#a::WinSetAlwaysOnTop(-1, "A")

Toggle := 0
#MaxThreadsPerHotkey 2
*F3:: {
	global Toggle
	Toggle := !Toggle
	SetScrollLockState Toggle
	While Toggle = 1 {
		MsgBox("go")
		MouseMove(0, -20, 0, "R")
		MouseMove(0, 20, 0, "R")
		Sleep(300000)
	}
}

; ===== application specific macros ==========================================

#HotIf WinActive("methodmaths")

~PgDn:: {
	Send("{Click 1571 186}")
	KeyWait("PgDn")
	SendEvent("{Click 1571 186}")
	Sleep(500)
	Send("{Tab}")
}

~PgUp:: {
	Send("{Click 1547 186}")
	KeyWait("PgDn")
	SendEvent("{Click 1547 186}")
}

#HotIf  ; resets the #HotIf
