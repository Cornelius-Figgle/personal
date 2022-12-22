#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

Menu,Tray,Icon,%A_ScriptDir%\icons\loading.ico,,0
#KeyHistory 0
#SingleInstance On

#MaxThreadsPerHotkey 1

^#s::
    Tooltip, "Getting Drives"
    DriveGet, fixedDrives, List, FIXED 

    If fixedDrives contains F 
    {
        Tooltip, "F: Drive Found"

        Tooltip, "Removing Prev Bak Dir"
        FileRemoveDir, f:\__pcBak\COD3\bak, 1

        Tooltip, "Constructing Bak Path"
        FormatTime, isoCurrentTime, A_NowUTC, yyyyMMddTHHmmssZ
        bakPath = f:\__pcBak\COD3\bak\%isoCurrentTime%\source

        Tooltip, "Moving F: ``source`` to ``bak``"
        FileMoveDir, f:\__pcBak\COD3\source, %bakPath%, 2

        Tooltip, "Copying T: ``source`` to F: ``source``"
        FileCopyDir, t:\, f:\__pcBak\COD3\source, 1

        Tooltip, "Complete!"
    } Else {
        Tooltip, "No F: Drive Found"
        Sleep, 5000
    }
    Tooltip
Return