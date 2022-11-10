#include "interface.au3"
#include "LogManager.au3"

HotKeySet("{ESC}", "Stop")
HotKeySet("z", "HandleBtnPause")
HotKeySet("c", "HandleBtnStart")
HotKeySet("x", "DefineClickPos")
HotKeySet("o", "SpeedUp")
HotKeySet("l", "SpeedDown")

Func Pause()
	ConsoleLog("Pause was pressed.")
	$g_bContinue = False
EndFunc

Func Stop()
	ConsoleLog("Stop was pressed.")
	Exit 1
EndFunc

Func SpeedUp()
	$g_iDelay = $g_iDelay + 10
  ConsoleLog("Speed up button pressed. Current delay: " & $g_iDelay)	
	
	GUICtrlSetData($lblCoordinates, $g_sXYPosLbl & " " & $g_iDelay)
EndFunc

Func SpeedDown()
	if $g_iDelay - 10 >= 0 Then	
		$g_iDelay = $g_iDelay - 10
	Else
		ConsoleLog("Can't set delay below 0.")
		GUICtrlSetData($lblCoordinates, $g_sXYPosLbl & " " & $g_iDelay)
		GUICtrlSetColor($lblCoordinates, 0xFF0000)
		Sleep(100)
		GUICtrlSetColor($lblCoordinates, 0x000000)
	EndIf		
	ConsoleLog("Speed down was pressed. Current delay: " & $g_iDelay)
	
	GUICtrlSetData($lblCoordinates, $g_sXYPosLbl & " " & $g_iDelay)
EndFunc

Func DefineClickPos()
	$g_aClickPos = MouseGetPos()
	ConsoleLog("Defining click position. Position picked: x(" & $g_aClickPos[0] & "), y(" & $g_aClickPos[1] & ").")
	GUICtrlSetData($lblDelay, $g_sClickDelayLbl & " (" & $g_aClickPos[0] & "," & $g_aClickPos[1] & ")")
EndFunc

Func AutoClick()
	ConsoleLog("AutoClick started!")
	$g_bContinue = True
	While $g_bContinue
		MouseClick("left", $g_aClickPos[0], $g_aClickPos[1])
		Sleep($g_iDelay)
	WEnd

EndFunc

Func OpenHelpWindow()
	$sMsg = ""
	$sMsg = $sMsg & "Press 'z' to Pause the script;" & @CRLF
	$sMsg = $sMsg & "Press 'c' to start clicking;" & @CRLF
	$sMsg = $sMsg & "Press 'x' to define the cursor position;" & @CRLF
	$sMsg = $sMsg & "Press 'o' to increase clicks per second;" & @CRLF
	$sMsg = $sMsg & "Press 'l' to reduce clicks per second;" & @CRLF
	$sMsg = $sMsg & "Press ESC to halt the program." & @CRLF	
	
	MsgBox(64, "HotKeys", $sMsg)	
EndFunc

Func HandleBtnStart()
	ConsoleLog("Start button pressed.")
	
	GUICtrlSetState($btnPause, $GUI_ENABLE)
	GUICtrlSetState($btnStart, $GUI_DISABLE)
	AutoClick()
EndFunc

Func HandleBtnHelp()
	ConsoleLog("Help button pressed.")
	
	OpenHelpWindow()
EndFunc

Func HandleBtnPause()
	ConsoleLog("Pause button pressed.")
	GUICtrlSetState($btnStart, $GUI_ENABLE)
	GUICtrlSetState($btnPause, $GUI_DISABLE)
	
	Pause()
EndFunc

While 1
	$iMsg = GUIGetMsg()
	Switch $iMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $btnStart			
			HandleBtnStart()
		Case $btnHelp
			HandleBtnHelp()
		Case $btnPause
			HandleBtnPause()
	EndSwitch
WEnd