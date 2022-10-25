#include "interface.au3"
#include "LogManager.au3"

HotKeySet("{ESC}", "Stop")
HotKeySet("z", "Pause")
HotKeySet("c", "AutoClick")
HotKeySet("x", "DefineClickPos")
HotKeySet("o", "SpeedUp")
HotKeySet("l", "SpeedDown")

Global $bContinue = False
Global $arClickPos[2]
Global $nDelay = 20

Func Pause()
   ConsoleLog("Pause was pressed.")
   $bContinue = False
EndFunc

Func Stop()
   ConsoleLog("Stop was pressed.")
   Exit 1
EndFunc

Func SpeedUp()
  ConsoleLog("Speed up button pressed. Current delay: " & $nDelay)
	$nDelay = $nDelay + 10
EndFunc

Func SpeedDown()
	$nDelay = $nDelay - 10
	ConsoleLog("Speed down was pressed. Current delay: " & $nDelay)
EndFunc

Func DefineClickPos()
	$arClickPos = MouseGetPos()
	ConsoleLog("Defining click position. Position picked: x(" & $arClickPos[0] & "), y(" & $arClickPos[1] & ").")
EndFunc

Func AutoClick()
	ConsoleLog("AutoClick started!")
	$bContinue = True
	While $bContinue
		MouseClick("left", $arClickPos[0], $arClickPos[1])
		Sleep($nDelay)
	WEnd

EndFunc

Func OpenHelpWindow()
	$strMsg = ""
	$strMsg = $strMsg & "Press 'z' to Pause the script;" & @CRLF
	$strMsg = $strMsg & "Press 'c' to start clicking;" & @CRLF
	$strMsg = $strMsg & "Press 'x' to define the cursor position;" & @CRLF
	$strMsg = $strMsg & "Press 'o' to increase clicks per second;" & @CRLF
	$strMsg = $strMsg & "Press 'l' to reduce clicks per second;" & @CRLF
	$strMsg = $strMsg & "Press ESC to halt the program." & @CRLF	
	
	MsgBox(64, "HotKeys", $strMsg)	
EndFunc

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $btnStart
			ConsoleLog("Start button pressed.")
		Case $btnHelp
			ConsoleLog("Help button pressed.")
			OpenHelpWindow()

	EndSwitch
WEnd