; ===== flags & globals ======================================================

#Requires AutoHotkey v2.0
#SingleInstance Force

; Persistent(true)


path_base := "t:\personal\ahk\"
TraySetIcon(path_base . "icons\exclam.ico")

; ===== main func ============================================================

AHKPanic(Kill:=1, Pause:=0, Suspend:=0, SelfToo:=1) {

    DetectHiddenWindows(true)

    IDList := WinGetList("ahk_class AutoHotkey")
    
    Loop IDList.Length {
        ID := IDList[A_Index]
        ATitle := WinGetTitle("ahk_id" . ID)

        If !InStr(ATitle, A_ScriptFullPath) {
			If Suspend
				PostMessage(0x111, 65404, , , "ahk_id" . ID)  ; Suspend
			If Pause
				PostMessage(0x111, 65403, , , "ahk_id" . ID)  ; Pause
			If Kill
				WinClose("ahk_id" . ID)  ; Kill
		}
    }
    If SelfToo {
        If Suspend
        	Suspend(-1)  ; Suspend
        If Pause
        	Pause(-1)  ; Pause
        If Kill
        	ExitApp  ; Kill
    }
}

; ===== hotkeys for func =====================================================

~RButton & ~XButton1::
+Esc:: {
	AHKPanic(1, 0, 0, 1)
}