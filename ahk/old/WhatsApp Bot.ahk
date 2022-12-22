#NoEnv
;#Warn
SendMode Input
SetWorkingDir %A_ScriptDir%


toggle = 0
#MaxThreadsPerHotkey 2
+^w::
MsgBox, waBot Toggled
Toggle := !Toggle
While Toggle{

Random, slepTim, 2, 22
slepNeTime := slepTim * 60000

Random, msgNum, 1, 60
FileReadLine, msgStore, %A_MyDocuments%\whatsapp bot.txt, (msgNum)

#IfWinActive ahk_id 0x6f0464 

#IfWinExist ahk_id 0x6f0464
#IfWinNotActive ahk_id 0x6f0464
WinActivate, ahk_id 0x6f0464

#IfWinNotExist ahk_id 0x6f0464
{
Run C:\Users\Max.Harrison\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\WhatsApp\WhatsApp
WinActivate, ahk_id 0x6f0464
Sleep 5000
Send {LWin Down}
Send {Up}
Send {LWin Up}
} 

MouseMove, 0, 0
MouseMove, 0, 150, 0, R
SendEvent {Blind}{LButton}
Sleep 5

Send %msgStore% 
Send {Enter}
Sleep 3000
Send {LWin Down}
Send {8}
Send {LWin Up}

Sleep %slepNeTime%

} 
Return