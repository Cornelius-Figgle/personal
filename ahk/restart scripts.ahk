#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Loop C:\Users\Max.Harrison\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\*.lnk
	Run, %A_LoopFileFullPath%
Loop C:\Users\Max.Harrison\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\*.ahk
	Run, %A_LoopFileFullPath%
ExitApp

;FileWithPath := "C:\Program Files\Cheese\Ricotta\Script.ahk"

; this concatenation is equivalent but not identical to "C:\Program Files\Cheese\Ricotta"
;ParentOfFile := FileWithPath "\.."

; this concatenation is equivalent but not identical to "C:\Program Files\Cheese"
;GrandParentOfFile := ParentOfFile "\.."

; show the simple concatenations
;MsgBox, %FileWithPath%`n%ParentOfFile%`n%GrandParentOfFile%