#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, force
#InstallKeybdHook

GrandParentOfFile := A_ScriptDir "\.."

Menu,Tray,Icon,%GrandParentOfFile%\icons\ibm.ico,,0

#l::DllCall("LockWorkStation") ;lock machine
LAlt::LWin
Ins::AppsKey
<^>!::LAlt

^#a::Send, !{Esc}
^#d::Send, !+{Esc}
	
*F1::
Menu,Tray,Icon,%GrandParentOfFile%\icons\loading.ico,,0
Run C:\ProgramData\Microsoft\Windows\Start Menu\Programs\AutoHotkey\AutoHotkey Help File,, Max
Menu,Tray,Icon,%GrandParentOfFile%\icons\ibm.ico,,0
Return	

*F4::!F4
*F9:: Run sndvol
*ScrollLock::Run, Notepad
*Pause::Run ms-paint: 

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
Run, https://www.youtube.com/watch?v=4jxeYfqevl4
Sleep, 5000
Send, {f}
Return

;*F6:: Run %A_ScriptDir%\HW.ahk

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
return


#KeyHistory 0
