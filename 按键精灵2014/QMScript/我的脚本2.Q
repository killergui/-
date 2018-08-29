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
MacroID=dccddf90-2413-4c0e-8969-d50d91e58ee8
Description=我的脚本2
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

[UIPackage]
UEsDBBQAAgAIAIYiHU1Ehc50fgQAAAg0AAAJABEAVUlQYWNrYWdlVVQNAAcDH4ZbAx+GWwMfhlvtWltvTFEU/s5Mq/erdlpVDFrqWqXut6i4JUWjw4OEZFCXmE5lOoS/IBG/QTx6QCJNPPHkifAgnnnw4F28Mb595hyzW2169oWt0jVZXe3p7P3ty9prrW/PxFGUd2+bPj542vEJU2Qf4vhRqMIC6ZkXqC+NQCz4+0ehUAgfF+ZlTsl3almwh2Kvy6kV1CpqJbWaWketodZS64tbjwZqE3UhtZnaQk1QW6ltQX/tgZ2Xf1dOYYyvPJI4hCxtDnegIgl6TNiXN8t7h77suFu7/70X5+8v64rPTuMYNkFfKuF5IX7bLLihlf93ECkMGoygmhEwxC/XwE9xvW9gBCeQxiitqjQj5s+/KYi9UduVBVacz/9V52V2OTyWGzU4fhDt+wzaezAT0/am8uzJ688m81c4sn+kvW7cKcW/2KSaL+qehbFSZJ00LiCjOYZ6xr+aoE6Jih+T4t8ZXMM4VXcEjRrzj0v4p4iaxiWc5DpkFHNvGP9rgz6j4pdJ+Cni32beN9h/T3X+5dL+H2T1kaHmNEfSooG/QJp/CX+A+3AR19Xx/Xq5QWH9K6bs/0XD9RelVKUCfiWKNbws53govmHuSYVj/G/Tr7mflo4PJ4fT2fHk8Eju2uU/hN/96LxR+7OMPDnGnxH+1BERf1uDMxXV/6ok/x/k2VM/dZP9vzHoLyp+9bTnf5jjuMp1UMuG7Tz/IQeOil8j4R9g9X/DzwE5apZjUMtCCc6/CkVeHhW/VsI/zLlnzeKPcv4T8WrPr/lnmH2vcAxi3bM68V8Zv37S/qe5/nmOQazDgL8PYSYo+cbM0sP1T6B07xUFv0HCH/D7L56/KHjT+J/XoojfKOGbxg/T+tNUBm7m82NZ0/b6Ffxc5y8pen7er311vM+PP8rnr0nyvyHi3yZ6hlW4jtRr4DdPwRf1103OW+cWpl0DX74vL94/6ftfNTxP8Jl11I4Z3vM37p9U5i/yZfi5ggv+KeJlWDfa4J9J2mWInn9b4ZZ/JmCXfy73z0H0+bfBLf9sx3T139/jn4tgl3920nYprH+HhP/q68RjGIhp/jetP7ZTj1A7GdXua7R3nX/jjvFt3D+soF2i4H+LUbp/sME/VwV9RsXvhF3+2R2c6aj4S2CXf/bQrlXAXwq7/FP0t1IBfxnc8s8kSvzTRf25XJr/CX/vR7n2GV3+p4y/QsJ3fX/VO3HVqH3/C7P2ix+kjNrb4Z+btdub5q+j9Ldb2rcPxfOv6n8rIfMvwbvG+RphFlAfQ4eG/3fBKv/zVtOuUYh/v/M//f2Xv3+wcYb3/Gv8T+RLl/xP1As2+V8/7RaF/V8Nt/yvR8J3Xf++efjhuUl71/xjtyd8iDVFDLin0T7meP1t8P+ttOsV/H8N3PL/tXDL/9fBLv8X317bobD+62H38+dttH0K+Btgl//tou1VwN8Iu/xvZzCnqPi9sMv/BJfZp4C/ScJ3ff8wzz9ScCk2+L+oXrcr+F8f3PJ/MV6X/H8L3PL/fgnfBf/bCrf8bxvs8r/dtHuhx/9siOr8ZfkJUEsBAhcLFAACAAgAhiIdTUSFznR+BAAACDQAAAkACQAAAAAAAAAAAACAAAAAAFVJUGFja2FnZVVUBQAHAx+GW1BLBQYAAAAAAQABAEAAAAC2BAAAAAA=


[Script]
Import "e:\obj.vbs"
set dm = new dmsoft   '创建对象
set dm = createobject("dm.dmsoft")
base_path = dm.GetBasePath()
TracePrint base_path
dm_ret = dm.Reg("killergui2147a5bb90ae5085c0ea30d6968e7657","")
TracePrint dm_ret
dm.SetAero 0
dm_ret = dm.SetPath(base_path)
dm_ret = dm.SetDict(0, "dm_soft.txt")
Dim 开发宽度, 开发高度, 缩放比例,启动时间
开发宽度 = 1110 : 开发高度 = 722
Dim 容错参数, 安卓小精灵初始坐标,安卓小精灵初始启动坐标
容错参数 = 0
启动时间 = Plugin.Sys.GetTime
Do
    Rem 开始循环
    //遍历符合窗口标题("海马玩模拟器")的句柄保存到数组(HwndEx)里
    HwndEx = Plugin.Window.Search("海马玩模拟器")
    //下面这句用于分割字符串,将获得的句柄组分割   
    dim MyArray   
    MyArray = Split(HwndEx, "|")
    If UBound(MyArray)>=0 Then  
        i=0   
        For UBound(MyArray)   
            //下面这句将字符串转换成数值   
            Hwnd = MyArray(i)
            If dm.GetWindowState(Hwnd, 0) = 0 Then 
                TracePrint "该模拟器已经被关闭了"
                Call 重启模拟器(1)
                Delay 30000
                Goto 开始循环
            End If
            title = dm.GetWindowTitle(Hwnd)
            TracePrint "开始执行"&i&"号窗口"&"名字"&title
            //先判断是横屏还是竖屏 
            If 是否横屏 Then 
                If w <> 开发宽度 Or h <> 开发高度 Then 
                    dm_ret = dm.SetWindowSize(Hwnd, 1110, 722)
                    Delay 2000
                End If
            Else 
                If w <> 628 Or h <> 1041 Then 
                    dm_ret = dm.SetWindowSize(Hwnd, 628, 1041)
                    Delay 2000
                End If
                安卓小精灵初始启动坐标 = Array(350, 316)
            End If
            Delay 2000
            If 检测() Then 
                TracePrint "准备下一个窗口"
            Else 
                TracePrint "检测失败,从头开始"
                Goto 开始循环
            End If
            Delay 10000
            i=i+1  
        Next
    End If
    TracePrint "WINDOWS_NUMS"&UBound(MyArray)
    If UBound(MyArray) < 3 Then
        TracePrint "当前模拟器启动个数" & (UBound(MyArray) + 1)
        Call 重启模拟器(1)
        Delay 30000
        Goto 开始循环
    End If
    If Plugin.Sys.GetTime - 启动时间 >= 3600 * 1000 Then 
        TracePrint "到达一小时重启脚本"
        RestartScript
    End If
    TracePrint "完成一次循环，等待下一次循环"
    Delay 300000
Loop
Set dm = nothing'释放对象
Function 是否横屏()
    //获取游戏窗口的宽高
    dm_ret = dm.GetClientSize(Hwnd,w,h)
    //先判断是横屏还是竖屏 
    If w > h Then 
        是否横屏 = True
    Else 
        是否横屏 = False
    End If
End Function
Function 检测()
    TracePrint("开始检测")
    dm_ret = dm.BindWindowEx(Hwnd, "dx2", "dx", "normal", "", 0)
    Delay 1500
    容错参数1 = 0
    Rem 检测状态
    容错参数 = 0 
    //运行脚本
    //绑定大窗口
    While Not 脚本是否启动了() And 容错参数 < 4
        TracePrint "展开脚本"
        If 是否横屏 Then 
            安卓小精灵初始坐标 = Array(1100, 220)
        Else 
            安卓小精灵初始坐标 = Array(620, 313)
        End If
        dm.MoveTo 安卓小精灵初始坐标(0), 安卓小精灵初始坐标(1)
        Delay 500
        dm.LeftClick 
        Delay 1000
        容错参数 = 容错参数 + 1
    Wend
    If 容错参数 >= 4 Then 
        If 小精灵启动流程() And 容错参数1 < 3 Then 
            容错参数1 = 容错参数1 + 1
            Goto 检测状态
        Else 
            检测 = False
            Call 重启模拟器(3)
            Delay 30000
            Exit Function
        End If
    End If
    dm_ret = dm.UnBindWindow()
    检测 = True
    TracePrint "检测完毕"
End Function
Function 小精灵启动流程()
    Call 启动脚本()
    Delay 1500
    容错参数 = 0
    While Not 脚本是否准备好了() And 容错参数 < 20
        TracePrint "等待启动好"
        Delay 5000
        容错参数 = 容错参数 + 1
    Wend
    If 容错参数 >= 20 Then 
        TracePrint "小精灵启动失败"
        小精灵启动流程 = False
        Call 重启模拟器(3)
        Delay 30000
        Exit Function
    End If
    TracePrint "准备运行脚本"
    Delay 1500
    dm.MoveTo 345, 975
    Delay 500
    dm.LeftClick 
    Delay 2000
    TracePrint "小精灵启动完毕"
    小精灵启动流程 = True
End Function
Sub 启动脚本()
    If 是否横屏 Then 
        TracePrint "横屏点击Home"
        dm.MoveTo 118, 1020
        Delay 500
        dm.LeftClick
    Else 
        TracePrint "竖屏点击Home"
        dm.MoveTo 33, 951
        Delay 500
        dm.LeftClick 
    End If
    Delay 2000
    If Not 是否横屏  Then 
        dm_ret = dm.FindStr(0, 0, 628, 1041, "叼", "111111-111111|050505-111111|363636-111111",0.8, intX, intY)
        TracePrint intX&","&intY
        dm.MoveTo intX, intY
        Delay 500
        dm.LeftClick 
        Delay 1500
    End If
End Sub
Function 脚本是否准备好了()
    If Not 是否横屏 Then 
        s = dm.Ocr(266,962,421,1009,"ffffff-101010",1.0)
        TracePrint s
        If s = "启动功能" Then
            TracePrint "脚本已经准备好了"
            脚本是否准备好了 = True
        Else
            TracePrint "脚本还没有完全启动好"
            s = dm.Ocr(269, 92, 422, 135, "ffffff-111111", 1)
            If s = "软件设置" Then 
                dm.Moveto 113,117
                Delay 100
                dm.LeftClick
                脚本是否准备好了 = True
            Else 
                dm.Moveto 575, 126
                Delay 100
                dm.LeftClick
            End If
            脚本是否准备好了 = False
            Call 启动脚本()
        End If
    Else 
        Call 启动脚本()
    End If
End Function
Function 脚本是否启动了()
    If 是否横屏 Then 
        安卓小精灵初始启动坐标 = Array(805, 225)
        安卓小精灵初始坐标 = Array(1100, 220)
        temp1 = dm.CmpColor(798,211, "FFFFFF-111111", 0.9)
        temp2 = dm.CmpColor(797,238, "FFFFFF-111111", 0.9)
        temp3 = dm.CmpColor(819,225, "FFFFFF-111111", 0.9)
        temp4 = dm.CmpColor(806,216, "FFFFFF-111111", 0.9)
        temp5 = dm.CmpColor(806,233, "FFFFFF-111111", 0.9)
        If temp1 + temp2 + temp3 + temp4 + temp5 = 0 Then
            TracePrint "脚本停止运行了"
            脚本是否启动了 = False
            TracePrint "启动脚本"
            dm.MoveTo 安卓小精灵初始启动坐标(0), 安卓小精灵初始启动坐标(1)
            Delay 500
            dm.LeftClick 
        Else
            temp1 = dm.CmpColor(794,215, "FFFFFF-111111", 0.9)
            temp2 = dm.CmpColor(814,215, "FFFFFF-111111", 0.9)
            temp3 = dm.CmpColor(794,235, "FFFFFF-111111", 0.9)
            temp4 = dm.CmpColor(813,235, "FFFFFF-111111", 0.9)
            temp5 = dm.CmpColor(804, 224, "FFFFFF-111111", 0.9)
            If temp1 + temp2 + temp3 + temp4 + temp5 = 0 Then 
                TracePrint "脚本运行中"
                脚本是否启动了 = True
                dm.MoveTo 安卓小精灵初始坐标(0), 安卓小精灵初始坐标(1)
                Delay 100
                dm.LeftClick 
                s = dm.Ocr(444, 109, 676, 193, "111111-111111", 1.0)
                If s = "功能设置" Or s = "使用说明" Then 
                    TracePrint "冲突了"
                    dm.MoveTo 1101,370
                    Delay 100
                    dm.LeftClick 
                End If
            Else 
                TracePrint "检测脚本是否启动异常,建议重试"
            End If
        End If
    Else
        安卓小精灵初始启动坐标 = Array(350, 316)
        安卓小精灵初始坐标 = Array(620, 313)
        temp1 = dm.CmpColor(344, 304, "FFFFFF-111111", 0.9)
        temp2 = dm.CmpColor(344, 328, "FFFFFF-111111", 0.9)
        temp3 = dm.CmpColor(364, 316, "FFFFFF-111111", 0.9)
        temp4 = dm.CmpColor(353, 309, "FFFFFF-111111", 0.9)
        temp5 = dm.CmpColor(353, 323, "FFFFFF-111111", 0.9)
        temp6 = dm.CmpColor(444, 317, "7f7f7f-111111", 0.9)
        TracePrint temp1
        TracePrint temp2
        TracePrint temp3
        TracePrint temp4
        TracePrint temp5
        TracePrint temp6
        If temp1 + temp2 + temp3 + temp4 + temp5 + temp6 = 0 Then 
            TracePrint "脚本停止运行了"
            脚本是否启动了 = False
            TracePrint "启动脚本"
            dm.MoveTo 安卓小精灵初始启动坐标(0), 安卓小精灵初始启动坐标(1)
            Delay 500
            dm.LeftClick 
        Else 
            temp1 = dm.CmpColor(342,308, "FFFFFF-111111", 0.9)
            temp2 = dm.CmpColor(359,308, "FFFFFF-111111", 0.9)
            temp3 = dm.CmpColor(342,325, "FFFFFF-111111", 0.9)
            temp4 = dm.CmpColor(359,325, "FFFFFF-111111", 0.9)
            temp5 = dm.CmpColor(351, 316, "FFFFFF-111111", 0.9)
            TracePrint temp1
            TracePrint temp2
            TracePrint temp3
            TracePrint temp4
            TracePrint temp5
            TracePrint temp6
            If temp1 + temp2 + temp3 + temp4 + temp5 + temp6 = 0 Then 
                TracePrint "脚本运行中"
                脚本是否启动了 = True
                dm.MoveTo 安卓小精灵初始坐标(0), 安卓小精灵初始坐标(1)
                Delay 100
                dm.LeftClick 
                s = dm.Ocr(444, 109, 676, 193, "111111-111111", 1.0)
                If s = "功能设置" Or s = "使用说明" Then 
                    TracePrint "冲突了"
                    dm.MoveTo 1101,370
                    Delay 100
                    dm.LeftClick 
                End If
            Else 
                TracePrint "检测脚本是否启动异常,建议重试"
            End If
        End If
    End If
End Function
Sub OnScriptExit()
    TracePrint "解除绑定"
    dm_ret = dm.UnBindWindow()
End Sub
Function 重启模拟器(操作类型)
    //1 = 开, 2 = 关, 3 = 先关后开
    dm_ret = dm.UnBindWindow()
    Rem 确认多开管理器
    Hwnd1 = dm.FindWindow("", "海马玩多开管理器")
    If Hwnd1 = 0 Then 
        TracePrint "多开管理器没有运行"
        dm.RunApp "E:\Program Files (x86)\Droid4X\MultiMgr.exe", 0
        Delay 1500
        Goto 确认多开管理器
    End If
    dm_ret = dm.BindWindow(Hwnd1, "dx2", "dx", "normal", 0)
    Delay 1500
    Select Case 操作类型
    Case 1
        For i = 0 To 2
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
