#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

Menu,Tray,Icon,%A_ScriptDir%\icons\switch.ico,,0
#KeyHistory 0
DetectHiddenWindows, On
#SingleInstance On

Menu,Tray,Icon,%A_ScriptDir%\icons\loading.ico,,0
WinClose, %A_ScriptDir%\sub-scripts\E&Woma remap.ahk - AutoHotkey v1.1.33.10
Run, %A_ScriptDir%\sub-scripts\IBM remap.ahk - AutoHotkey v1.1.33.10
Menu,Tray,Icon,%A_ScriptDir%\icons\switch.ico,,0

OnMessage(0x404, "AHK_NOTIFYICON")
AHK_NOTIFYICON(wParam, lParam, uMsg, hWnd)
{
	if (lParam = 0x201) ;WM_LBUTTONDOWN := 0x201
	{
		Gosub, main
	}
}

XButton1::^c
XButton2::^v
XButton1 & XButton2::^x

~XButton1 & MButton::#^o

toggle = 0
#MaxThreadsPerHotkey 2
F10::
main:
Toggle := !Toggle

If Toggle{
Menu,Tray,Icon,%A_ScriptDir%\icons\loading.ico,,0
;MsgBox, 262208, KB Switch, Running E&Woma remap script...
WinClose, %A_ScriptDir%\sub-scripts\IBM remap.ahk - AutoHotkey v1.1.33.10
Run, %A_ScriptDir%\sub-scripts\E&Woma remap.ahk - AutoHotkey v1.1.33.10
Menu,Tray,Icon,%A_ScriptDir%\icons\ALTswitch.ico,,0
}

Else {
Menu,Tray,Icon,%A_ScriptDir%\icons\loading.ico,,0
;MsgBox, 262208, KB Switch, Running IBM remap script...
WinClose, %A_ScriptDir%\sub-scripts\E&Woma remap.ahk - AutoHotkey v1.1.33.10
Run, %A_ScriptDir%\sub-scripts\IBM remap.ahk - AutoHotkey v1.1.33.10
Menu,Tray,Icon,%A_ScriptDir%\icons\switch.ico,,0
}
return