#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases
SendMode Input  ; default mode
SetWorkingDir %A_ScriptDir%  ; consistent start dir
#SingleInstance, Force
#InstallKeybdHook
#KeyHistory 0

Menu, Tray, Icon, "%A_ScriptDir%\..\icons\ibm.ico", , 0

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
While Toggle{
MouseMove, 0, -10, 0, R
MouseMove, 0, 10, 0, R
sleep 300000
}
Return

*F1::
Menu, Tray, Icon, "%A_ScriptDir%\..\icons\loading.ico", , 0
Run, "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\AutoHotkey\AutoHotkey Help File", , Max
Menu, Tray, Icon, "%A_ScriptDir%\..\icons\ibm.ico", , 0
Return

*F4::!F4
*F9:: Run sndvol
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
