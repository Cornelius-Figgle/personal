@echo off
taskkill /IM explorer.exe /F
glazewm.exe

if HOSTNAME==NightCrawler "C:\Users\Max.Harrison\source\personal\ahk\base_remaps\ibm_remaps.ahk"
if HOSTNAME==NightCrawler "C:\Users\Max.Harrison\source\personal\ahk\tools\PANIC.ahk"