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
UEsDBBQAAgAIAGpRG013/E1HhAQAAAg0AAAJABEAVUlQYWNrYWdlVVQNAAc5zoNbOc6DWznOg1vtWttvjEEU/327rV71pt1WFete1yqtO6HilrhFlwdCsqhLbLeyXcKrd/E3iEcPSEQiHnjyRHgQzzz4D8Qb6zffxU6rjW8uNSo9m9Npt9/Mb+bMmXPOb3aTCOT9u+ZP9590fsY42YUkfpRqMEt6zwvVlyYgEf79o1QqRW+XZmRayXdqRbiHYq8rqVXUGmo1tZY6m1pHrac2BFuPRmozdQ61hdpKTVHbqO3heB1hOyP/rpzACF9FpLEPebYF3IaKpOgx0VjeH549fudF/8OdH7wkf381O3jvJA5hPfSlGp4X4bdP8szuMwFuhC//by8yOGwwg1pGwAi/UgM/Q3tfxxCOIothtqrSgoS//uYw9sbtVxG24nz+rzojf5b9I4Vhg+MH0b/XoL8HMzHtbypPH7/5YrJ+hSM7Jf114045/iXG1Hxx9yyKlSLrZHEeOc05NDD+1YV1Slz8hBT/TuEqRqm6M2jSWH9Swj9B1Cwu4hjtkFPMvVH8rw/HjItfIeFniH+Led9g/z3V9VdK+7+X1UeOWtCcSasG/ixp/WX8Ae7DBVxTx/fr5UYF+1eN2/8LhvYXpVS1An41ghpelrM8FN8w/aTKMf63iW3up6Ujg+nBbH40PThUuHppivCXPTxn1P80I0+B8WeIP3VExN+28EzF9b8ayf8P8+ypn7qx/t8UjhcXv3bC8z/IeVyhHdSyYQfPf8SB4+LXSfh7WP1f93NAgZrnHNSyUIrrr0HAy+Pi10v4+7n2vFn8Uc5/Il7t+LX+HLPvZc5B2D2vE/+V8RvG7H+W9i9yDsIOA/4+RJmg7BuTSzftn0L53isOfqOEP+CPH5y/OHgT+J/XqojfJOGbxg/T+tNUBm4UiyN50/76Ffx05y8Zen7Rr311vM+PP8rnr1nyv+PEv0X0HKtwHWnQwG8Zhy/qrxtct84tTIcGvnxfHtw/6ftfLTxP8JnV1M5Jnonunaby/kll/SJfRp8ruOCfIl5GdaMN/plmuxDx828b3PLPFOzyz0X+OYi//na45Z8dmKj++3v8cy7s8s8utksV7N8p4b/++uwRDMQ0/5vWH5upB6hdjGr3NPq7zr9Jx/g27h8Ws52v4H/zUL5/sME/l4djxsXvgl3+uSw803Hx58Mu/+xmu0oBfwHs8k8x3hIF/IVwyz/TKPNPF/XnImn9R/29H6btc7r8Txl/sYTv+v6q59kVo/59L836z7ufMepvh39u0O5vmr8O0t9uat8+BOdf1f+WQOZfgneN8jXELKA+h04N/18Kq/zPW8F2pUL8+53/6e+//P2DdZM886/xP5EvXfI/US/Y5H99bDcq7P8KuOV/3RK+6/r37YOPz036u+Yf2z3hQ6wpEsBdjf4Jx/a3wf/72a5R8P+VcMv/V8Et/18Nu/xffHtti4L918Du58+b2PYq4K+FXf63jW2PAv462OV/W8M1xcXvgV3+J7jMLgX89RK+6/uHGf6RgUuxwf9F9bpZwf964Zb/i/m65P8b4Zb/90n4LvhfP9zyv02wy/+2s90JPf5nQ1TXL8tPUEsBAhcLFAACAAgAalEbTXf8TUeEBAAACDQAAAkACQAAAAAAAAAAAACAAAAAAFVJUGFja2FnZVVUBQAHOc6DW1BLBQYAAAAAAQABAEAAAAC8BAAAAAA=


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
            TracePrint "开始执行"&i&"号窗口"&"句柄"&Hwnd
            //先判断是横屏还是竖屏 
            If 是否横屏 Then 
                TracePrint "横屏"
                If w <> 开发宽度 Or h <> 开发高度 Then 
                    dm_ret = dm.SetWindowSize(Hwnd, 1110, 722)
                    Delay 2000
                End If
                //小精灵驻留位置坐标
                安卓小精灵初始坐标 = Array(1100, 220)
                安卓小精灵初始启动坐标 = Array(805, 225)
                是否横屏 = True
            Else 
                TracePrint "竖屏"
                If w <> 628 Or h <> 1041 Then 
                    dm_ret = dm.SetWindowSize(Hwnd, 628, 1041)
                    Delay 2000
                End If
                安卓小精灵初始坐标 = Array(620, 313)
                安卓小精灵初始启动坐标 = Array(350, 316)
                是否横屏 = False
            End If
            Delay 2000
            Call 检测()
            Delay 10000
            i=i+1  
        Next  
    End If
    If Plugin.Sys.GetTime - 启动时间 >= 3600 * 1000 Then 
        RestartScript
    End If
    TracePrint "完成一次循环，等待下一次循环"
    Delay 300000
Loop
Set dm = nothing'释放对象
Function 是否横屏()
    //获取游戏窗口的宽高
    dm_ret = dm.GetClientSize(Hwnd,w,h) 
    TracePrint "宽度:" & w & ",高度:" & h
    //先判断是横屏还是竖屏 
    If w > h Then 
        TracePrint "横屏"
        是否横屏 = True
    Else 
        TracePrint "竖屏"
        是否横屏 = False
    End If
End Function
Sub 检测
    TracePrint("开始检测")
    Rem 检测状态
    容错参数 = 0 
    //运行脚本
    //绑定大窗口
    dm_ret = dm.BindWindowEx(Hwnd, "dx2", "dx", "normal", "", 0)
    Delay 1500
    While Not 脚本是否启动了() And 容错参数 < 3
        TracePrint "展开脚本"
        dm.MoveTo 安卓小精灵初始坐标(0), 安卓小精灵初始坐标(1)
        Delay 500
        dm.LeftClick 
        Delay 1000
        容错参数 = 容错参数 + 1
    Wend
    If 容错参数 >= 3 Then 
        Call 小精灵启动流程()
        Goto 检测状态
    End If
    dm_ret = dm.UnBindWindow()
    TracePrint "检测完毕"
End Sub
Sub 小精灵启动流程
    Call 启动脚本()
    Delay 1500
    While Not 脚本是否准备好了()
        TracePrint "等待启动好"
        Delay 2000
    Wend
    TracePrint "准备运行脚本"
    Delay 1500
    dm.MoveTo 345, 975
    Delay 500
    dm.LeftClick 
    Delay 2000
End Sub
Sub 启动脚本
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
            脚本是否准备好了 = False
        End If
    Else 
        Call 启动脚本
    End If
End Function
Function 脚本是否启动了()
    If 是否横屏 Then 
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
        temp1 = dm.CmpColor(344, 304, "FFFFFF-111111", 0.9)
        temp2 = dm.CmpColor(344, 328, "FFFFFF-111111", 0.9)
        temp3 = dm.CmpColor(364, 316, "FFFFFF-111111", 0.9)
        temp4 = dm.CmpColor(353, 309, "FFFFFF-111111", 0.9)
        temp5 = dm.CmpColor(353, 323, "FFFFFF-111111", 0.9)
        temp6 = dm.CmpColor(582,334, "7f7f7f-111111", 0.9)
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
Event Form1.Button2.Click
    EndScript
End Event
Event Form1.Button1.Click
    KeyPress 121,1
End Event
