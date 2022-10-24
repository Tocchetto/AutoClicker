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
   ConsoleWrite("Pause was pressed." & @CRLF)
   $bContinue = False
EndFunc

Func Stop()
   ConsoleWrite("Stop was pressed." & @CRLF)
   Exit 1
EndFunc

Func SpeedUp()
   $nDelay = $nDelay + 10
   ConsoleWrite("Speed up was pressed. Current delay: " & $nDelay & @CRLF)
EndFunc

Func SpeedDown()
   $nDelay = $nDelay - 10
   ConsoleWrite("Speed down was pressed. Current delay: " & $nDelay & @CRLF)
EndFunc

Func DefineClickPos()
   $arClickPos = MouseGetPos()
   ConsoleWrite("Defining click position. Position picked: x(" & $arClickPos[0] & "), y(" & $arClickPos[1] & ")." & @CRLF)
EndFunc

Func AutoClick()
   ConsoleWrite("AutoClick started!" & @CRLF)
   $bContinue = True
   While $bContinue
	  MouseClick("left", $arClickPos[0], $arClickPos[1])
	  Sleep($nDelay)
   WEnd

EndFunc

While 1
   Sleep(20)
WEnd