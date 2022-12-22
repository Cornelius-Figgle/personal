#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory

#SingleInstance, force

GrandParentOfFile := A_ScriptDir "\.."

Menu,Tray,Icon,%GrandParentOfFile%\icons\ewoma.ico,,0
#SingleInstance On

#InstallKeybdHook

Ins::AppsKey
	
F1::
Menu,Tray,Icon,%GrandParentOfFile%\icons\loading.ico,,0
Run C:\ProgramData\Microsoft\Windows\Start Menu\Programs\AutoHotkey\AutoHotkey Help File,,Max
Menu,Tray,Icon,%GrandParentOfFile%\icons\ewoma.ico,,0
Return

!p:: Run mspaint
!n::Run Notepad
!c::Run C:\Users\Max.Harrison\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\TOG Python Text Calculator                     

!s:: Run %A_ScriptDir%\HW.ahk

toggle = 0
#MaxThreadsPerHotkey 2
!m::
Toggle := !Toggle
SendInput {ScrollLock}
While Toggle{
MouseMove, 0, -10, 0, R
MouseMove, 0, 10, 0, R
sleep 300000
}
return


#KeyHistory 0