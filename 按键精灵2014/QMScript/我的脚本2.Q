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
UEsDBBQAAgAIAMIQG02blDv2fAQAAAg0AAAJABEAVUlQYWNrYWdlVVQNAAeJXINbiVyDW4lcg1vtWklPU1EU/l4LMsokFESUOqA4IorzkFjjlDgFqgsTjVVxiKWYUo3+CONvMC5dqIkhcaUrVxpdGNe68B8Yd1q/+/qevSCEdwe4YjjN4cCj9353OPec8902jpJ8/ND85fGLzq+YJAcRx69iDRZJz7xAfWkCYsHfv4rFYvi4uCDzSn5SK4I9FHtdSa2i1lCrqbXUxdQ6aj21obT1aKQ2U5dQW6it1AS1jdoe9NcR2AX5d2UQo3wVkMQR5GjzeAAVSdBjwr68Gd57OTWev3Hgkxfn728Wl56dwwlshb5Uw/NC/PYZcEMr/+8w0jhpMIJaRsAQv1IDP831voNhnEYGI7Sq0oKYP//mIPZGbVcRWHE+/1ddkJnl6Gh+xOD4QbTvN2jvwUxM25vKy+fvvpnMX+HIzkp73bhTjn+xCTVf1D0LY6XIOhlcQVZzDA2Mf3VBnRIVPybFv/O4hTGq7giaNOYfl/AHiZrBNZzhOmQVc28Y/+uDPqPiV0j4aeLfZ9432H9Pdf6V0v4fZvWRpeY1R9Kqgb9Imn8ZP8V9uIrb6vh+vdyosP5Vk/b/quH6i1KqWgG/GqUaXpaLPBQ/MP+kyjH+j6nX3E9Lp4aSQ5ncWHJoOH/r+izh9zy9ZNT+AiNPnvFnmD91RMTftuBMRfW/Gsn/T/LsqZ+6if7fFPQXFb92yvM/xHHc5DqoZcMOnv+QA0fFr5PwD7H6v+PngDw1xzGoZaEE51+DEi+Pil8v4R/l3HNm8Uc5/4l4tf/P/LPMvjc4BrHuOZ34r4zfMGH/M1z/Ascg1iHl70OYCcq+Mb30cv0TKN97RcFvlPBTfv+l8xcFbwr/81oV8ZskfNP4YVp/mkrqbqEwmjNtr1/Bz3f+kqbnF/zaV8f7/PijfP6aJf87S/z7RM+yCteRBg38lkn4ov66y3nr3MJ0aODL9+Wl+yd9/6uF5wk+s5HaOc175uL+SWX+Il+Gnyu44J8iXoZ1ow3+maTtRvT82wa3/DMBu/xzpX8Oos+/HW75Zwemqv/mjn8uhV3+2UW7RmH9OyX8t9/Hn8FATPO/af2xi3qM2sWo9kijvev8G3eMb+P+YRXtcgX/W4by/YMN/rk26DMqfhfs8s+e4ExHxV8Ou/yzl3aDAv4K2OWfor/VCvjdcMs/kyjzTxf150pp/qf9vR/h2md1+Z8y/ioJ3/X9Vd/4TaP2A6/N2i97nDZqb4d/btNub5q/jtPf7mnfPpTOv6r/rYbMvwTvGuNrmFlAfQydGv6/Blb5n7eOdr1C/Pub/+nvv/z9gy3TvOdf438iX7rkf6JesMn/Bmi3K+z/Orjlf70Svuv69/2Tz69M2rvmH/s84UOsKWLAQ432Mcfrb4P/76DdpOD/6+GW/2+AW/6/EXb5v/j22m6F9d8Eu58/76TtV8DfDLv8by9tnwL+Ftjlf3uCOUXF74Nd/ie4zEEF/K0Svuv7hwX+kYZLscH/RfW6S8H/+uGW/4vxuuT/2+GW/w9I+C743w645X87YZf/7aM9AD3+Z0NU5y/Lb1BLAQIXCxQAAgAIAMIQG02blDv2fAQAAAg0AAAJAAkAAAAAAAAAAAAAgAAAAABVSVBhY2thZ2VVVAUAB4lcg1tQSwUGAAAAAAEAAQBAAAAAtAQAAAAA


[Script]
Import "e:\obj.vbs"
set dm = new dmsoft   '创建对象
set dm = createobject("dm.dmsoft")
base_path = dm.GetBasePath()
TracePrint base_path
dm_ret = dm.Reg("killergui2147a5bb90ae5085c0ea30d6968e7657","")
TracePrint dm_ret
dm_ret = dm.SetPath(base_path)
dm_ret = dm.SetDict(0, "dm_soft.txt")
Dim 开发宽度, 开发高度, 缩放比例, 是否横屏,启动时间
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
            //获取游戏窗口的宽高
            dm_ret = dm.GetClientSize(Hwnd,w,h) 
            TracePrint "宽度:"& w &",高度:"& h
            //先判断是横屏还是竖屏 
            If w > h Then 
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
        Delay 1500
    Else 
        TracePrint "竖屏点击Home"
        dm.MoveTo 33, 951
        Delay 500
        dm.LeftClick 
        Delay 1500
    End If
    dm_ret = dm.FindStr(0, 0, 628, 1041, "叼", "111111-111111|050505-111111|363636-111111",0.8, intX, intY)
    TracePrint intX&","&intY
    dm.MoveTo intX, intY
    Delay 500
    dm.LeftClick 
    Delay 1500
End Sub
Function 脚本是否准备好了()
    s = dm.Ocr(266,962,421,1009,"ffffff-101010",1.0)
    TracePrint s
    If s = "启动功能" Then
        TracePrint "脚本已经准备好了"
        脚本是否准备好了 = True
    Else
        TracePrint "脚本还没有完全启动好"
        脚本是否准备好了 = False
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
