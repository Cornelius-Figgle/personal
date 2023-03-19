; ===== flags & globals ======================================================

#Requires AutoHotkey v2.0
#SingleInstance Force

; Persistent(true)


path_base := "t:\personal\ahk\"


; ===== main function ========================================================

RestartLoop(ExtToUse:=["lnk", "ahk"]) {
	Loop ExtToUse.Length {
		Loop Files, A_Startup . "\*." . ExtToUse[A_Index], "FR"  ; cycles through the startup folder
			Run(A_LoopFileFullPath)
	}
}

; ===== function call ========================================================

if (!A_IsCompiled and A_LineFile == A_ScriptFullPath) or A_IsCompiled  ; only call function if it was ran directly (ie not #Include'd)
	RestartLoop()