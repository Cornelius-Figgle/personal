#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%  ; start dir
Menu, Tray, Icon, %A_ScriptDir%\icons\exclam.ico, , 0

AHKPanic(Kill=1, Pause=0, Suspend=0, SelfToo=1) {
    DetectHiddenWindows, On
    WinGet, IDList, List, ahk_class AutoHotkey
    
    Loop %IDList% {
        ID := IDList%A_Index%
        WinGetTitle, ATitle, ahk_id %ID%
        IfNotInString, ATitle, %A_ScriptFullPath%
        {
        If Suspend
            PostMessage, 0x111, 65305, , , ahk_id %ID%  ; Suspend
        If Pause
            PostMessage, 0x111, 65306, , , ahk_id %ID%  ; Pause
        If Kill
            WinClose, ahk_id %ID% ; Kill
        }
        }
    If SelfToo {
        If Suspend
        Suspend, Toggle  ; Suspend
        If Pause
        Pause, Toggle, 1  ; Pause
        If Kill
        ExitApp  ; Kill
    }
}

~RButton & ~XButton1::
    AHKPanic(1, 0, 0, 1)
    MsgBox, Don't Panic
Return

~+Esc::
    AHKPanic(1, 0, 0, 1)
    MsgBox, Don't Panic
Return