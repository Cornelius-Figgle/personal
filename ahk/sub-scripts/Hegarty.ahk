#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir% 

Sleep 1000
GrandParentOfFile := A_ScriptDir "\.."
Menu,Tray,Icon,%GrandParentOfFile%\icons\loading.ico,,0

Send {Tab 3}
Send {Enter}
Sleep 2000
Send max
Send {Tab}
Send harrison
Send {Tab 2}
Sleep 1000
Send {Numpad2 4}
Send {Tab 2}
Sleep 1000
Send {Numpad2 8}
Send {Tab 2}
Sleep 2000
Send {Enter}
Sleep 2000
Send {Enter}
MouseMove, 1241, 107
Sleep 1000
SendEvent {Blind}{LButton}
;Sleep 1000
MouseMove, 1388, 230
Sleep 1000
SendEvent {Blind}{LButton} 
Sleep 1000
MouseMove, 1200, 520
Return