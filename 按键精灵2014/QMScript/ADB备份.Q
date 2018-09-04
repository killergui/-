[General]
MacroID=e23ccbbb-9781-4896-a343-f4d4cf8500ba
SyntaxVersion=2
BeginHotkey=121
BeginHotkeyMod=0
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=1
EnableWindow=
Description=ADB备份
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
Import "C:\Users\hasee\Desktop\dm\Output\按键精灵\obj.vbs"
//Import "E:\obj.vbs"
LogStart "c:\a.log"
PutAttachment ".\plugin", "RegDll.dll"
PutAttachment ".\plugin\dm", "dm.dll"
PutAttachment ".\plugin\dm", "dm_soft.txt"
Plugin.RegDll.Reg (Plugin.Sys.GetDir(0) + "\plugin\dm\dm.dll")
set dm = new dmsoft   '创建对象
set dm = createobject("dm.dmsoft")
base_path = dm.GetBasePath()
TracePrint base_path
dm_ret = dm.Reg("killergui2147a5bb90ae5085c0ea30d6968e7657","")
TracePrint dm_ret
dm_ret = dm.SetPath(base_path)
TracePrint dm_ret
dm_ret = dm.SetDict(0, "dm_soft.txt")
TracePrint dm_ret
Dim 开发宽度, 开发高度, 缩放比例,启动时间
开发宽度 = 1110 : 开发高度 = 722
Dim 容错参数, 安卓小精灵初始坐标, 安卓小精灵初始启动坐标
//获取ADB路径并写入配置
Rem 获取adb路径
Dim AdbPath
AdbPath = Plugin.ofcmd.GetProcessAdbPath
If Instr(1,AdbPath, "\") = 0  Then 
    TracePrint "见鬼了"
    //因为插件自带的cmd命令启动adb会卡死,所以用这种办法
    KeyDown "Win", 1
    KeyPress 82, 1
    KeyUp "Win", 1
    SayString "cmd"
    KeyPress "Enter", 1
    Delay 1000
    SayString "adb start-server"
    KeyPress "Enter", 1
    Delay 3000
    Goto 获取adb路径
End If
AdbPath = Left(AdbPath, Instr(1,AdbPath,"exe") + 2)
TracePrint AdbPath
Delay 1000
//绑定插件
Plugin.ofcmd.BindAdb (AdbPath)
//adb版本号
AdbVersion = Plugin.ofcmd.AdbVersion
TracePrint AdbVersion
//初始化雷电API插件需要的其他插件
返回值 = Lib.LDAPI.初始化数据()
temp = Plugin.ofcmd.Adb("shell dumpsys window w visible | grep -e 'Window #' -e Surface:")
TracePrint temp
temp1 = Split(temp, "Window ", - 1 , 1)
For Each a In temp1
    TracePrint a
Next
Delay 1000
temp = Plugin.ofcmd.Adb("shell dumpsys window w visible | grep -e 'Window #' -e Surface:")
TracePrint temp
temp1 = Split(temp, "Window ", - 1 , 1)
For Each a In temp1
    TracePrint a
Next
Delay 1000
temp = Plugin.ofcmd.Adb("shell dumpsys window w visible | grep -e 'Window #' -e Surface:")
TracePrint temp
temp1 = Split(temp, "Window ", - 1 , 1)
For Each a In temp1
    TracePrint a
Next
容错参数 = 0
Do
    Rem 获取设备列表
    //获取设备列表
    模拟器列表 = Lib.LDAPI.刷新模拟器列表()
    Dim 模拟器信息
    Redim 模拟器信息(UBound(模拟器列表))
    For j = 0 To UBound(模拟器列表)
        模拟器信息(j) = Split(模拟器列表(j), ",")
    Next
    //模拟器多开始,关闭其中一个会导致其他的模拟器无法在db中连接,所以先判断已经储存的
    Dim 模拟器数量, 期望模拟器数量,运行设备数量
    期望模拟器数量 = Int(Form1.InputBox1.Text)
    模拟器数量 = UBound(模拟器信息)
    For Each a In 模拟器信息
    	If a(4) = 1 Then 
    		运行设备数量 = 运行设备数量 + 1
    	End If
    Next
    TracePrint "期望模拟器数量" & 期望模拟器数量
    TracePrint "模拟器数量" & 模拟器数量
    TracePrint "运行设备数量" & 运行设备数量
    If 期望模拟器数量 > 模拟器数量 Then 
        MessageBoxs "模拟器数量少于设置数量,请确认后再运行"
        EndScript
    Else 
        If 期望模拟器数量 > 运行设备数量 Then 
            TracePrint "有模拟器没正常运行"
            //启动模拟器
            If 容错参数 < 2 Then 
                For Each a In 模拟器信息
                    If a <> "" Then 
                        Dim response
                        response = Plugin.ofcmd.Adb("connect " & a)
                        TracePrint response
                        Delay 2000
                        If Instr(1,response, "failed") > 0 Or Instr(1,response, "unable") > 0  Then 
                            TracePrint "连接模拟器失败,应该是被关闭了尝试重启"
                            Call 重启模拟器(1)
                            Delay 2000
                            Exit For
                        End If
                    End If
                Next
                容错参数 = 容错参数 + 1
                Goto 获取设备列表
            ElseIf 容错参数 >= 2 Then
                TracePrint "错误次数太多,放弃"
            End If
        Else 
            TracePrint "可能新增设备没记录"
            // Call 重启模拟器(1)
        End If
    End If
    //处理加工并记录设备信息
    For i = 0 To 模拟器数量
        If 运行中的设备(i) <> "" Then 
            //表格行是从0开始的,获取设备列表第一行是空行,所以这里其实是从第一行开始
            运行中的设备(i) = Cstr("127.0.0.1:" & Int(运行中的设备(i)))
            If 已储存的设备(i) <> 运行中的设备(i) Then 
                TracePrint "设备信息不一致,记录"
                Plugin.File.WriteINI "设备号", "Devices" & i, 运行中的设备(i), "C:\Config.ini"
            Else 
                TracePrint "设备信息一致,不记录"
            End If
        End If
    Next
    容错参数 = 0
    启动时间 = Plugin.Sys.GetTime
    小精灵包名 = "com.mbmpmcmcmlnimnnlmp.dddfree:download_server"
    //程序包名
    海马玩包名 = "com.shouyou.sgzerq.hm"
    包名360 = "com.game.sgz.a360"
    //检查小精灵和游戏是否在运行中
    For Each a In 运行中的设备
        If a <> "" Then 
            //读取模拟器编号
            Client = a
            TracePrint Client
            //待完成部分,判断小精灵是否在运行
            //            Dim temp,temp1,temp2,temp3,temp4
            temp = Plugin.ofcmd.Adb("shell dumpsys window w visible | grep -e 'Window #' -e Surface:")
            //            TracePrint temp
            //            temp4 = Split(temp, ":", - 1 , 1)
            //            For Each a In temp4
            //                TracePrint a
            //            Next
            //查看所有进程及内存占用等
            Dim progressList
            progressList = Plugin.ofcmd.Adb("-s " & Client & " shell ps")
            //判断小精灵是否在
            If instr(1,progressList, 小精灵包名) > 0 Then 
                TracePrint "小精灵运行中"
            Else 
                TracePrint "小精灵没了"
                //先Home键返回主界面
                TracePrint Plugin.ofcmd.Adb("-s " & Client & " shell input keyevent 3")
                Delay 1500
                //启动辅助
                //TracePrint Plugin.ofcmd.Adb("-s 127.0.0.1:26944 shell am start -n com.mbmpmcmcmlnimnnlmp.dddfree/com.cyjh.elfin.activity.SplashActivity")
                //这个activity可以跳过启动时的2段广告
                TracePrint Plugin.ofcmd.Adb("-s " & Client & " shell am start -n com.mbmpmcmcmlnimnnlmp.dddfree/com.cyjh.elfin.activity.ElfinFreeActivity")
                Delay 15000
                //点击启动功能,其实不用这不,直接音量键也能启动,但是目前没有更好的办法判断小精灵是否运行,通过悬浮窗判断,所以先点启动,让悬浮窗出现
                TracePrint Plugin.ofcmd.Adb("-s " & Client & " shell input touchscreen tap 360 1200")
                Delay 1000
                //temp1 = Plugin.ofcmd.Adb("-s emulator-5554 shell find / -name bashd.sh")
                If temp1 = "" Then 
                    TracePrint "文件不存在"
                    Plugin.ofcmd.Adb("push C:\Users\killergui\Desktop\bashd.sh /sdcard/")
                    Delay 1000
                End If
                //通过音量键运行脚本
                TracePrint "运行脚本"
                //Plugin.ofcmd.Adb("-s " & Client & " shell sh /sdcard/bashd.sh")
                //说明,可以把下边4条命令写到文件中,在执行文件文件
                Plugin.ofcmd.Adb("shell sendevent /dev/input/event6 1 114 1")
                Plugin.ofcmd.Adb("shell sendevent /dev/input/event6 0 0 0")
                Plugin.ofcmd.Adb("shell sendevent /dev/input/event6 1 114 0")
                Plugin.ofcmd.Adb("shell sendevent /dev/input/event6 0 0 0")
            End If
            //判断游戏包是否在
            If instr(1,progressList, 海马玩包名) > 0 Then 
                TracePrint "海马玩包运行中"
            ElseIf instr(1,progressList, 包名360) > 0 Then
                TracePrint "360包运行中"
            Else 
                TracePrint "没有检测到游戏在运行,请确认安装了相应的游戏"
            End If
        End If
    Next
    Delay 300000
Loop
Set dm = nothing'释放对象
Function 重启模拟器(操作类型)
    //1 = 开, 2 = 关, 3 = 先关后开
    dm_ret = dm.UnBindWindow()
    Hwnd1 = dm.FindWindow("", "雷电多开器")
    If Hwnd1 = 0 Then 
        TracePrint "多开管理器没有运行"
        dm.RunApp Form1.InputBox2.Text, 0
        Delay 1500
        Hwnd1 = dm.FindWindow("", "雷电多开器")
        dm_ret = dm.BindWindow(Hwnd1, "dx2", "dx", "normal", 0)
        Delay 1500
        dm.MoveTo 25,640
        Delay 100
        dm.LeftClick 
        Delay 1000
    Else 
        dm_ret = dm.BindWindow(Hwnd1, "dx2", "dx2", "normal", 0)
        Delay 1500
    End If
    Delay 1500
    Select Case 操作类型
    Case 1
        dm.MoveTo 140, 640
        Delay 100
        dm.LeftClick 
        Delay 1000
        dm.MoveTo 282,699
        Delay 100
        dm.LeftClick 
        Delay 15000
        If 0 > 1 Then 
            For i = 0 To Int(Form1.InputBox1.Text) - 1
                name = "海马玩模拟器_" & i
                Rem 确定对应模拟器坐标1
                dm_ret = dm.FindStrFast(3, 55, 130, 450, name, "ffffff-111111|e8c0ff-111111|ede0e0-111111|f3ffc0-111111|f9e09e-111111|ede0ff-111111|f3ffe0-111111|e29ee0-111111", 1, intX, intY)
                TracePrint "模拟器名字的Y坐标" & intY
                If intX >= 0 and intY >= 0 Then 
                    Rem 确认模拟器状态
                    s = dm.Ocr(276, intY - 20, 326, intY + 20, "ffffff-111111|e8c0ff-111111|ede0e0-111111|f3ffc0-111111|f9e09e-111111|ede0ff-111111|f3ffe0-111111|e29ee0-111111", 1)
                    If s = "关闭" Then 
                        TracePrint "模拟器运行中"
                    ElseIf s = "启动" Then
                        TracePrint "模拟器停止中"
                        dm.MoveTo 300, intY
                        Delay 100
                        dm.LeftClick 
                        Delay 10000
                        Goto 确认模拟器状态
                    End If
                Else 
                    TracePrint "没有找到对应的模拟器"
                    //移动鼠标到窗体内,然后滚动
                    dm.MoveTo 300, 100
                    Delay 100
                    If name = "海马玩模拟器_0" Then 
                        dm.WheelUp
                    End If
                    Goto 确定对应模拟器坐标1
                End If
            Next
        End If
        TracePrint "启动模拟器执行完毕"
    Case 2, 3
        title = dm.GetWindowTitle(Hwnd)
        TracePrint Hwnd
        If dm.GetWindowState(Hwnd, 0) = 0 Then 
            TracePrint "该模拟器已经被关闭了"
            Exit Function
        End If
        name = Left(title, 8)
        TracePrint name
        容错参数 = 0
        Rem 确定对应模拟器坐标2
        dm_ret = dm.FindStrFast(3, 55, 130, 450, name, "ffffff-111111|e8c0ff-111111|ede0e0-111111|f3ffc0-111111|f9e09e-111111|ede0ff-111111|f3ffe0-111111|e29ee0-111111", 1, intX, intY)
        TracePrint "找到模拟器名字的Y坐标" & intY
        If intX >= 0 and intY >= 0 Then 
            //确认模拟器状态
            Rem 确认模拟器状态1
            s = dm.Ocr(276, intY - 20, 326, intY + 20, "ffffff-111111|e8c0ff-111111|ede0e0-111111|f3ffc0-111111|f9e09e-111111|ede0ff-111111|f3ffe0-111111|e29ee0-111111", 1)
            If s = "关闭" and dm.GetWindowState(Hwnd, 0) = 1 Then 
                TracePrint "模拟器运行中"
                Rem 结束模拟器进程
                dm_ret = dm.SetWindowState(Hwnd, 0)
                Delay 3000
                If dm_ret = 0 Then 
                    TracePrint "关闭失败重试"
                    Goto 结束模拟器进程
                End If
                Goto 确认模拟器状态1
            ElseIf s = "启动" And 操作类型 = 3 Then
                TracePrint "模拟器停止中"
                dm.MoveTo 300, intY
                Delay 100
                dm.LeftClick 
                Delay 2000
                Goto 确认模拟器状态1
            ElseIf s = "启动" And 操作类型 = 2 Then
                TracePrint "已经完成停止操作,退出"
            ElseIf s = "关闭" And 操作类型 = 3 Then
                TracePrint "启动完成,退出"
            End If
        ElseIf 容错参数 < 5 Then
            TracePrint "没有找到对应的模拟器"
            //移动鼠标到窗体内,然后滚动
            dm.MoveTo 300, 100
            Delay 100
            If name = "海马玩模拟器_3" Then 
                dm.WheelDown 
            ElseIf name = "海马玩模拟器_0" Then 
                dm.WheelUp
            End If
            容错参数 = 容错参数 + 1
            Delay 1000
            Goto 确定对应模拟器坐标2
        End If
    End Select
    dm_ret = dm.UnBindWindow()
End Function
Sub OnScriptExit()
    TracePrint "解除绑定"
    dm_ret = dm.UnBindWindow()
    Set dm = nothing'释放对象
End Sub
//获取当前启动的app的Activity
//TracePrint Plugin.ofcmd.Adb("-s 127.0.0.1:26944 shell dumpsys window windows|findstr Current")
//列出安装的应用
//packages = Plugin.ofcmd.Adb("-s 127.0.0.1:26944 shell pm list packages")
//TracePrint packages
//MyString = Split(packages, "package:", -1, 1)
//For Each a In MyString
//TracePrint a
//Next
//运行海马玩客户端
//TracePrint Plugin.ofcmd.Adb("-s " & Client & " shell am start -n com.shouyou.sgzerq.hm/com.youkia.gamecenter.GameCenterActivity")
//运行360客户端
//TracePrint Plugin.ofcmd.Adb("-s 127.0.0.1:26944 shell am start -n com.game.sgz.a360/com.youkia.gamecenter.GameCenterActivity")
返回值 = Lib.LDAPI.执行ADB命令(0, "shell dumpsys window w visible | grep -e 'Window #' -e Surface:")
//判断运行中的模拟器