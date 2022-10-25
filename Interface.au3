#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=C:\Users\Zelp\Documents\git\AutoClicker\Forms\main_form.kxf
$Form1 = GUICreate("AutoClicker", 349, 274, 832, 385)
$btnStart = GUICtrlCreateButton("Start", 264, 240, 75, 25)
$btnPause = GUICtrlCreateButton("Pause", 184, 240, 75, 25)
$console = GUICtrlCreateEdit("", 8, 8, 329, 225)
$btnHelp = GUICtrlCreateButton("?", 160, 244, 19, 17)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###
