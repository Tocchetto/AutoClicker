#include <GuiEdit.au3>

GLOBAL $strConsoleLog = ""

Func ConsoleLog($message)
	$strConsoleLog = $strConsoleLog & $message & @CRLF
	GUICtrlSetData($console, $strConsoleLog)
	_GUICtrlEdit_LineScroll($console, 0, _GUICtrlEdit_GetLineCount($console))
EndFunc