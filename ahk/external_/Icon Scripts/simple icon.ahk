#NoEnv
SendMode Input 
SetWorkingDir %A_ScriptDir%
#KeyHistory 0

q::Menu,Tray,Icon,%A_ScriptDir%\icons\loading.ico,,0
a::Menu,Tray,Icon,C:\Program Files\AutoHotkey\AutoHotkey.exe,,0

OnMessage(0x404, "AHK_NOTIFYICON")
AHK_NOTIFYICON(wParam, lParam, uMsg, hWnd)
{
	if (lParam = 0x201) ;WM_LBUTTONDOWN := 0x201
	{
		Gosub, main
	}
}