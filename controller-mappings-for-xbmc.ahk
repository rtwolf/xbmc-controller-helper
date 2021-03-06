; Cobbled together by RT Wolf from various autohotkey forum posts on Dec 17, 2013.
; Source URL: https://github.com/rtwolf/xbmc-controller-helper
; Thanks to the good folk over at the autohotkey forums.

; In the line "~1joy13::" replace the 13 with the number of your PS/X/Home (or whatever) button
; as determined by JoystickTest.ahk or through XBMC.

; Additional tip for mame: Set "UI Cancel" to the PS/X/Home as well and it'll quit back to XBMC.

#Persistent ; Keeps it running until explicitly ended by user

~1joy13::
	Process, Exist, XBMC.exe ; check if it is running
		If (ErrorLevel = 0) ; PID = 0 it's not running
			{
			IfExist, %A_ProgramFiles%\XBMC\XBMC.exe
				Run,%A_ProgramFiles%\XBMC\XBMC.exe
			Return
			}
		else ; ErrorLevel contains the process id (PID)
			{
			IfWinNotActive ahk_pid %ErrorLevel%
				{
				Sleep, 500 ; Wait half a second to allow MAME to quit.
				Send !{f4}
				Sleep, 500
				WinActivate ahk_pid %ErrorLevel%
				}
			}
	Return