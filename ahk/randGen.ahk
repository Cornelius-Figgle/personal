#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%
#InstallKeybdHook
Menu,Tray,Icon,%A_ScriptDir%\icons\random.ico,,0
#SingleInstance On

~Esc::Send, {Ctrl Up}{Alt Up}{Shift Up}{Win Up}{LCtrl Up}{LAlt Up}{LShift Up}{LWin Up}{RCtrl Up}{RAlt Up}{RShift Up}{RWin Up}
Return

^+#l::Run, https://flipclock.tk/
^+#k::
Run, https://www.youtube.com/watch?v=4jxeYfqevl4
Sleep, 5000
Send, {f}
Return

^!d::
Menu,Tray,Icon,%A_ScriptDir%\icons\loading.ico,,0
Run, https://mail.google.com/mail/u/3/?tab=wm&ogbl#inbox
Run, https://docs.google.com/forms/d/1BcXTadCmFxGUxMgvOFlhyyn1xg12LybX8cg5gfxS7MQ/edit
Run, https://docs.google.com/spreadsheets/d/1IxhCqZL1h_m7EG1F2Trd82xosOt0Uc1E353FDt9bosY/edit?resourcekey#gid=1739565041
Run, https://docs.google.com/spreadsheets/d/1CVOF4E4T4tnra-Wp09xefHQ1XqSWmZbEy_SdryQewAI/edit#gid=0
Run, https://analytics.google.com/analytics/web/?authuser=3#/p255176952/reports/intelligenthome
Menu,Tray,Icon,%A_ScriptDir%\icons\random.ico,,0
Return

!SPACE::  Winset, Alwaysontop, , A
#SPACE::  Winset, Alwaysontop, , A

:*:inshat::game:GetService("InsertService"):LoadAsset(assetId).Parent = game.Workspace

^!n::ñ
^!N::Ñ

::GNU TP::[//]: # (GNU Terry Pratchett)

:*:snke::snek
::bac::bak
::cos ::b/c

CapsLock::Return

::fcl::This program is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.`n This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY`; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
Return

::terraServ:: Run, https://terraria-archive.fandom.com/wiki/Server_Console#Server_Commands

~^e:: Send {BackSpace}

#IfWinActive methodmaths
~PgDn::
Menu,Tray,Icon,%A_ScriptDir%\icons\loading.ico,,0
MouseMove, 1571, 186
Sleep 200
SendEvent {Blind}{LButton down}
KeyWait PgDn
SendEvent {Blind}{LButton up}
Sleep 500
Send {Tab}
Menu,Tray,Icon,%A_ScriptDir%\icons\random.ico,,0
Return

#IfWinActive methodmaths
~PgUp::
Menu,Tray,Icon,%A_ScriptDir%\icons\loading.ico,,0
MouseMove, 1547, 183
Sleep 200
SendEvent {Blind}{LButton down}
KeyWait PgUp
SendEvent {Blind}{LButton up}
Menu,Tray,Icon,%A_ScriptDir%\icons\random.ico,,0
Return

#IfWinActive Excel
^+i::
Menu,Tray,Icon,%A_ScriptDir%\icons\loading.ico,,0
Send +{Space}
Send ^+{+}
Sleep 500
SendEvent {Blind}{LButton}
Menu,Tray,Icon,%A_ScriptDir%\icons\random.ico,,0
Return

::aw::Alan Walker & 
::aur::Au/Ra
Return

::*shrug*::¯\_(ツ)_/¯
::*SHRUG*::¯\_(ツ)_/¯
::*Shrug*::¯\_(ツ)_/¯
::*shurg*::¯\_(ツ)_/¯
::*SHURG*::¯\_(ツ)_/¯
::*Shurg*::¯\_(ツ)_/¯

::*face*::*ツ*
::*FACE*::*ツ*
::*Face*::*ツ*

~SC056::
Menu,Tray,Icon,%A_ScriptDir%\icons\loading.ico,,0
MouseMove, 1, 0, 0, R
MouseMove, -1, 0, 0, R
Send {SC056 Up}
;ToolTip, noSleepHere
Menu,Tray,Icon,%A_ScriptDir%\icons\random.ico,,0
Return

;SC056 UP::Tooltip

return
Return

^!h::Run %A_ScriptDir%\sub-scripts\Hegarty.ahk

~SC029::
Run, C:\ProgramData\Microsoft\Windows\Start Menu\Programs\AutoHotkey\Window Spy.lnk
Return

CoordMode, Mouse, Screen
~RButton::
MouseGetPos, begin_x, begin_y
while GetKeyState("RButton")
{
MouseGetPos, x, y
ToolTip, % begin_x ", " begin_y "`n" Abs(begin_x-x) " x " Abs(begin_y-y)
}
ToolTip
Return

#KeyHistory 30