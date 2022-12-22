#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

Menu,Tray,Icon,%A_ScriptDir%\icons\Code_1.ico,,0

Run, "C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\Common7\Tools\LaunchDevCmd.bat"
Sleep, 500
Send, cd /d t:\ {Enter}
Send, code . {Enter}
Sleep, 1000
WinKill, Developer Command Prompt 