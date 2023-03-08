#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir% 
#Persistent
#SingleInstance, off
#NoTrayIcon

Run, %A_ScriptFullPath%
Random, xcord, -300, 300
Random, ycord, -300, 300
MouseMove, xcord, ycord, 13, R
;MsgBox, 2 , ‎, ‎