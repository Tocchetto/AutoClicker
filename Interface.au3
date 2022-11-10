#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=C:\Users\Zelp\Documents\git\AutoClicker\Forms\main_form.kxf
$Form1 = GUICreate("AutoClicker", 349, 274, 832, 385)
$btnStart = GUICtrlCreateButton("Start", 264, 240, 75, 25)
$btnPause = GUICtrlCreateButton("Pause", 184, 240, 75, 25)
$console = GUICtrlCreateEdit("", 8, 24, 329, 201)
GUICtrlSetData(-1, "console")
$btnHelp = GUICtrlCreateButton("?", 160, 244, 19, 17)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
$lblCoordinates = GUICtrlCreateLabel("X/Y:", 8, 236, 138, 17)
$lblDelay = GUICtrlCreateLabel("Click delay:", 8, 252, 138, 17)
$lblPause = GUICtrlCreateLabel("z - Pause", 64, 4, 48, 17)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
$lblSetXYPos = GUICtrlCreateLabel("x - Set X/Y", 120, 4, 56, 17)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
$lblStartClicking = GUICtrlCreateLabel("c - Start clicking", 184, 4, 80, 17)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

Global $g_bContinue = False
Global $g_aClickPos[2] = [0, 1]
Global $g_iDelay = 20
Global $g_sXYPosLbl = "X/Y:"
Global $g_sClickDelayLbl = "Click delay:"

GUICtrlSetData($lblCoordinates, $g_sXYPosLbl & " " & $g_iDelay)
GUICtrlSetData($lblDelay, $g_sClickDelayLbl & " (" & $g_aClickPos[0] & "," & $g_aClickPos[1] & ")")
GUICtrlSetData($console, "")
GUICtrlSetState($btnPause, $GUI_DISABLE)