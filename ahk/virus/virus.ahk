SendMode Input
SetWorkingDir, %A_ScriptDir%
#NoEnv
#NoTrayIcon

Loop {
  Run, %A_ScriptFullPath%
  MsgBox, 262178, Error, Quandale Dingle?
}

~Esc::ExitApp