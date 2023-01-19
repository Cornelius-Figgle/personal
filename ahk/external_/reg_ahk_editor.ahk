#NoEnv
#SingleInstance, Force
SendMode, Input
SetBatchLines, -1
SetWorkingDir, %A_ScriptDir%

If not A_IsAdmin{
Run *RunAs "%A_ScriptFullPath%" ; causes script to reload and be run as admin
}
#SingleInstance, Force ; prevent's 2nd prompt to change the editor
FileSelectFile Editor, 2,, Select your editor, Programs (*.exe)
if ErrorLevel
    ExitApp
RegWrite REG_SZ, HKCR, AutoHotkeyScript\Shell\Edit\Command,, "%Editor%" "`%1"