; ===== flags & globals ======================================================

#Requires AutoHotkey v2.0
#SingleInstance Force

; Persistent(true)


path_base := "C:\Users\Max.Harrison\source\personal\ahk\"
TraySetIcon(path_base . "icons\ibm.ico")

; ===== macro setups =========================================================

#Include ..\macros\  ; we have to set this as user variables cannot be used

#Include ibm_macros.ahk

#Include .\  ; resets the include (idk if needed, but why not)

; ===== main remaps ==========================================================

#\::DllCall("LockWorkStation")  ; allows us to `Win+l` without being blocked by system
*LAlt::RWin  ; no windows key on the Model M

LControl & RAlt::Alt  ; `AltGr` becomes `LAlt` for us
Ins::AppsKey  ; context menus (use `mod+Ins` for normal insert)

CapsLock::Return

; ===== numpad -> media keys =================================================

NumpadHome::Volume_Down
NumpadLeft::Media_Prev
NumpadEnd::Browser_Back
NumpadUp::Volume_Mute
NumpadClear::Media_Play_Pause
NumpadDown::Media_Stop
NumpadPgUp::Volume_Up
NumpadRight::Media_Next
NumpadPgDn::Browser_Forward
NumpadIns::Browser_Home
NumPadDel::Return  ; idk what else to do here