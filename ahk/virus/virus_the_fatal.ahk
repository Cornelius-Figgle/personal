SendMode Input
SetWorkingDir, %A_ScriptDir%
#NoEnv
#NoTrayIcon

ExitApp, 0

FileCreateShortcut, %A_ScriptFullPath%, %A_Startup%\%A_ScriptName%.lnk, %A_ScriptDir% ;create one

Loop, 16 {
  Run, %A_ScriptFullPath%
  MsgBox, 262178, help me, run
}

AHKPanic(Kill=1, Pause=0, Suspend=0, SelfToo=0) {
DetectHiddenWindows, On
WinGet, IDList ,List, ahk_class AutoHotkey
Loop %IDList%
  {
  ID:=IDList%A_Index%
  WinGetTitle, ATitle, ahk_id %ID%
  IfNotInString, ATitle, %A_ScriptFullPath%
    {
    If Kill
      WinClose, ahk_id %ID% ;kill
    }
  }

AHKPanic(1, 0, 0, 0)

Shutdown, 13
