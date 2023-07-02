@echo off

START /B "" glazewm.exe

:: START /B "" taskkill /IM explorer.exe /F

if %COMPUTERNAME%==NIGHTCRAWLER START /B "" "C:\Users\Max.Harrison\source\personal\ahk\base_remaps\ibm_remaps.ahk"
if %COMPUTERNAME%==NIGHTCRAWLER START /B "" "C:\Users\Max.Harrison\source\personal\ahk\tools\PANIK.ahk"

:: make sure to `auto hide the taskbar` as well otherwise Glaze won't recognise the gap!