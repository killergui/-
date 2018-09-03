[General]
SyntaxVersion=2
BeginHotkey=121
BeginHotkeyMod=0
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=1f4a4ddf-9073-429b-b242-0c4b6dfa1b02
Description=ÎÒµÄ½Å±¾1
Enable=1
AutoRun=0
[Repeat]
Type=0
Number=1
[SetupUI]
Type=2
QUI=
[Relative]
SetupOCXFile=
[Comment]

[Script]
KeyDown "Win", 1
KeyPress 82, 1
KeyUp "Win", 1
SayString "cmd"
KeyPress "Enter", 1
SayString "adb start-server"


