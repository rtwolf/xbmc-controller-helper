; Cobbled together by RT Wolf from various autohotkey forum posts on Dec 17, 2013.

; In the line "~1joy13::" replace the 13 with the number of your PS/X/Home (or whatever) button
; as determined by JoystickTest.ahk or through XBMC.

#Persistent ; Keeps it running until explicitly ended by user

~1joy13::
	Process, Exist, XBMC.exe ; check if it is running
		If (ErrorLevel = 0) ; if it's not running
			{
			IfExist, %A_ProgramFiles%\XBMC\XBMC.exe
				Run,%A_ProgramFiles%\XBMC\XBMC.exe
			Return
			}
		else
			{
			#IfWinNotActive, XBMC
				Send !{f4}
			#IfWinNotActive
			}
	Return