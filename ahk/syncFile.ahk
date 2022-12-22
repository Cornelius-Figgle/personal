#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

Menu,Tray,Icon,%A_ScriptDir%\icons\sync.ico,,0
#KeyHistory 0


file = t:\projects\qol_mth.py
whereToSync = t:\projects\*qol_mth.py

checkFileForSync(file, whereToSync)

checkFileForSync(file, whereToSync)
{
Loop
{
Menu,Tray,Icon,%A_ScriptDir%\icons\loading.ico,,0

FileGetTime, fileTime, %file%, M

Loop, Files, %whereToSync%, DFR
{
FileGetTime, currentFileTime, %A_LoopFileLongPath%
EnvSub, currentFileTime, %fileTime%, Seconds
if currentFileTime  < 0
{
FileCopy, %file%, %A_LoopFileLongPath%, 1
}
}
Menu,Tray,Icon,%A_ScriptDir%\icons\sync.ico,,0
Sleep, 60000 ;1min
}
}