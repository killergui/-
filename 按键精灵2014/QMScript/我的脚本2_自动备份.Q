[General]
SyntaxVersion=2
BeginHotkey=121
BeginHotkeyMod=0
PauseHotkey=19
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=17693783-82db-4edd-8687-572a78ff5d78
Description=我的脚本2_自动备份
Enable=0
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

[UIPackage]
UEsDBBQAAgAIAGZoIU2BTBXz2QMAAAgoAAAJABEAVUlQYWNrYWdlVVQNAAcnjopbJ46KWyeOilvtWMtOU0EY/k/LpS1Y2goFuUi5I7rQvTFSIpEE0NDiwkSTiijEQyFtUdz4Aj4FcelGEl0bE+LCmOjCNVETXwFXUL85nUOHBsKZmVOOTfjIz/Q255vLf/dTCd+/RX9ubnX+ogrcID/tF4PUIHxmcLEQIfLx9/vFYtH+uHiGmsIepI7fIbvrekgjJAgJQEKQc5AmSDMkXLp6aoFE+bwYH89Qe5ijVfwVKEG3KIsxRy9JBnFojP0s44Tf3pzf6d8a/2H4iSsWME9TdJXUESDDsPl9J/Dao/jdBKVpWmMFIc7fzm1Hlj+N816jRZqlDK1glEWMfBZ/lPtep/Pq+Mjs9n+WM1QXk6u5FQ3zIzb/msZ8g/SgO18X7999/aOzfwmTrcp8Vb9T9n++Qzmf0zuzfSWLOhl6RKbiGsLwf008nDjl9wn+7x4tUx6iuoKIwv79Av8cWDP0mO7gHEzJ2Gv7/2b+TKf8dQJ/GvwbiPsa92/I7r9euP8JZB8mJKe4klYF/gZh/2X+JO5hgZ7J81v5covE+TdW3P+C5vmz/DwgwR+gUg4v4gGMYpdqD40e8+8efeZWWJpJJVKZbD6RWswtP6kS/9Dbh1rz78Pz5OB/FvFfBcz/tnGbcqp/QUH/p2F78lZ3WP8j/HlO+UNH2n8K61jCOchFww7Y/3liftg5f5PAP47sf82KATlIFmuQi0Jx7D9IpbrcKX+zwD+JvWf1/I90/GP+6vrB/k1E36dYAzv3rIr/l+YPH7r/DM6/gDWwc0ha92BHgrJuHI9RnH+cyn0vJ/wtAn/Sen7J/pzwHaF/Rqskf0Tg1/UfuvmnLqaya+uF5OqG6vztN9u/P//9svfpo9r8Wq9f0tD8gpX7qmif5X+k7S8q6N9d8G+A3UQWroKwAn+sgp/lX+vYt0oXpkOBX+yXl/pP6hVkCBpkc3ce85vT6D8Nk/P4w+JlgL/2ov5spYP2oyv1ZwJjr8T+28jV+tPowzgiwR8nd+vPLssOnPO3k7f1Z4dw/y7Un9L6d4HcrT+7MQ5KnH+nwK8b/3Shmz/sQNiZvYJXe60w3+v46/eY343+Qz/GHgn966Jy/8GF+lPa/rrJ3fpziNu0U/4ecrf+HMN4SYL/Irlbf45iHJDg7yVv688EeVt/9pGYf2YQ//P0gteBsogp8PcL/F73r7yGbv079mFJa37XZtrT/c+g8jGt/sc0JCudg7L+O/MnVyTsf0DQv1lL71dgBaZy/0NW/wcF/tvge67cfSn5v8sk138ZqvB/C7iD/CnW38MCP4s6OYvZ5N2v6vu/EYHfDcjyu41a5v8HUEsBAhcLFAACAAgAZmghTYFMFfPZAwAACCgAAAkACQAAAAAAAAAAAACAAAAAAFVJUGFja2FnZVVUBQAHJ46KW1BLBQYAAAAAAQABAEAAAAARBAAAAAA=


[Script]
Import "e:\obj.vbs"
LogStart "c:\a.log"
set dm = new dmsoft   '创建对象
set dm = createobject("dm.dmsoft")
base_path = dm.GetBasePath()
TracePrint base_path
dm_ret = dm.Reg("killergui2147a5bb90ae5085c0ea30d6968e7657","")
TracePrint dm_ret
dm.SetAero 0
dm_ret = dm.SetPath(base_path)
TracePrint dm_ret
dm_ret = dm.SetDict(0, "dm_soft.txt")
TracePrint dm_ret
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
    TracePrint "WINDOWS_NUMS" & UBound(MyArray)
    
    TracePrint Form1.模拟器数量.Text
    If UBound(MyArray) < Form1.模拟器数量.Text Then 
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
    Delay 600000
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
    Delay 5000
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
        dm_ret = dm.FindStr(0, 0, 628, 1041, "叼", "111111-111111|050505-111111|363636-111111",0.7, intX, intY)
        TracePrint intX & "," & intY
        If intX = - 1  Or intY = - 1  Then 
        	intX = 285 : intY = 342
        End If
        dm.MoveTo intX, intY
        Delay 500
        dm.LeftClick 
        Delay 1500
    End If
End Sub
Function 脚本是否准备好了()
    If Not 是否横屏 Then 
        //s = dm.Ocr(266,962,421,1009,"ffffff-101010",0.8)
        //TracePrint s
        s = dm.FindMultiColor(263,953,423,1012,"3c7ac5-0","96|-6|3c7ac5-0,97|-44|3c7ac5-0,-16|-38|3c7ac5-0",0.9, 1,intX,intY)
        If s = 1 Then
            TracePrint "脚本已经准备好了"
            脚本是否准备好了 = True
        Else
            TracePrint "脚本还没有完全启动好"
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
