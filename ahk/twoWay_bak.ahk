#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

Menu,Tray,Icon,%A_ScriptDir%\icons\loading.ico,,0
#KeyHistory 0
#SingleInstance On

^!s::
    ;if (A_ComputerName = "PHOENIX") {
        syncLocalCloud("C:\Users\Max.Harrison\My Drive\_COD3\source", "C:\Users\Max.Harrison\source")
    ;} else if (A_ComputerName = "NIGHTCRAWLER") {
    ;    syncLocalCloud("C:\Users\Max.Harrison\Google Drive\_COD3\source", "C:\Users\Max.Harrison\source") 
    ;} 

    syncLocalCloud(cloud_path, local_path) {
        FileGetTime, cloudTime, %cloud_path%, M
        FileGetTime, localTime, %local_path%, M

        EnvSub, cloudTime, %localTime%, Seconds

        if (currentFileTime  > 0) {
            FileRemoveDir, %local_path%, 1
            If (ErrorLevel != 0)
                reportError()

            FileCopyDir, %cloud_path%, %local_path%, 1
            If (ErrorLevel != 0)
                reportError()

            FormatTime, isoCurrentTime, A_NowUTC, yyyyMMddTHHmmssZ
            FileAppend, %isoCurrentTime% | Ln: %A_LineNumber% | 'Bak 2 Local Complete'`n, c:\users\max.harrison\source\ahk\logs\twoWay_bak\logs.txt
        } else if (currentFileTime  < 0) {
            FileRemoveDir, %cloud_path%, 1
            If (ErrorLevel != 0)
                reportError()

            FileCopyDir, %local_path%, %cloud_path%, 1
            If (ErrorLevel != 0)
                reportError()

            FormatTime, isoCurrentTime, A_NowUTC, yyyyMMddTHHmmssZ
            FileAppend, %isoCurrentTime% | Ln: %A_LineNumber% | 'Bak 2 Cloud Complete'`n, c:\users\max.harrison\source\ahk\logs\twoWay_bak\logs.txt
        }
    }

    reportError() {
        MsgBox, 0, bak, Ln: %A_LineNumber% | ErLvl: %ErrorLevel% | LastEr: %A_LastError%, 5
        FormatTime, isoCurrentTime, A_NowUTC, yyyyMMddTHHmmssZ
        FileAppend, %isoCurrentTime% | Ln: %A_LineNumber% | ErLvl: %ErrorLevel% | LastEr: %A_LastError%, c:\users\max.harrison\source\ahk\logs\twoWay_bak\logs.txt
    }
return