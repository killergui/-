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
MacroID=0a926d17-3119-46ae-a237-346e8bf2a8c0
Description=我的脚本1
Enable=1
AutoRun=0
[Repeat]
Type=0
Number=1
[SetupUI]
Type=1
QUI=Form1
[Relative]
SetupOCXFile=
[Comment]

[Script]
Hwnd = 22226204
//Hwnd = 4790990
Import "e:\obj.vbs"
set dm = createobject("dm.dmsoft")
base_path = dm.GetBasePath()
TracePrint base_path
dm_ret = dm.Reg("killergui2147a5bb90ae5085c0ea30d6968e7657","")
TracePrint dm_ret
dm_ret = dm.SetPath(base_path)
TracePrint dm_ret
dm_ret = dm.SetDict(0, "dm_soft.txt")
TracePrint dm_ret
dm_ret = dm.BindWindow(Hwnd, "dx2", "dx", "normal", 0)
TracePrint dm_ret

RestartScript
TracePrint s
Delay 1500

//dm_ret = dm.Capture(0, 0, 2000, 2000, "123.bmp")
dm_ret = dm.FindStr(0, 0, 628, 1041, "叼", "111111-111111|050505-111111|363636-111111",0.8, intX, intY)
    TracePrint intX&","&intY
Sub OnScriptExit()
    TracePrint "解除绑定"
    dm_ret = dm.UnBindWindow()
    Set dm = nothing'释放对象
End Sub

