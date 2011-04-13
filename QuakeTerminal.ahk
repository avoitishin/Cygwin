; Change your hotkey here
f12::

DetectHiddenWindows, on
IfWinExist ahk_class Console_2_Main
{
	IfWinActive ahk_class Console_2_Main
	{
		WinHide ahk_class Console_2_Main
		WinActivate ahk_class Shell_TrayWnd
	}
	else
	{
		WinShow ahk_class Console_2_Main
		WinActivate ahk_class Console_2_Main
	}
}
else
{
	Run "C:\Program Files\Console2\Console.exe"
}
DetectHiddenWindows, off
return


; hide Console on "esc".
;#IfWinActive ahk_class Console_2_Main
;esc::
;{
;   	WinHide ahk_class Console_2_Main
;   	WinActivate ahk_class Shell_TrayWnd
;}
;return



; Maximize console window
f11::
IfWinActive ahk_class Console_2_Main
{
	WinGet, Status, MinMax
	if(Status = 0)
	{
		WinGetPos, X, Y
		WinMaximize, ahk_class Console_2_Main
		;WinMove, -5, -5
		return
	}
	else
	{
    		WinRestore, ahk_class Console_2_Main
		WinMove, X, Y
		return
	}

}
else
{
	return
}
return