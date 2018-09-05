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
MacroID=031c3249-a7e0-49ea-a36c-198ad393ba69
Description=adb版监控
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
只支持雷电模拟器
修改模拟器数量后,请自行添加模拟器后再重新运行脚本,或者停用第一个模拟器,并重新启动脚本,脚本将自动复制第一个模拟器
模拟器分辨率将强制设置为720*1280,请勿修改
如果你在运行脚本前就启动了模拟器,请手动修改分辨率为20*1280

[UIPackage]
UEsDBBQAAgAIAM4OJk1Liz+77wQAAAg2AAAJABEAVUlQYWNrYWdlVVQNAAfviJBb74iQW++IkFvtWstPVFcY/+4MyAzg8CgMCFrGBz7wUV9Va21TMRpJ0TYyumiiyYgopJeBzEBL+z90Y+Je49JNm7RrY2KMMTV14cqFUaMrdy7sopHp79wHcyAQ73fOgeOY+cjHGS5z7u+c73zve+Pk06N/Wp7d+KPrOS2grylOs6UkrZKuOQF71EwUC/6eLZVK4eVSlSqK3oFrgjMUZ10LrgMnwQlwPXg1uAHcCE75R09N4BbwJ+BWcBs4DW4Hd4DXgDuD+85WxfzB0hmawM8UZeg45TEW6BfiUBoaE97Lec93r/fc+u3o8cdOHJ+/SfnXztIA7SZ1SpDjhPgd78ENR/l/xyhLgxorqIcHDPFrFfCzkPckjdBpytE4Ri61Uszbf0vge6POqwnG0D4/Zq7S0nRiojCuYX4k5u/RmO+QHunO16U/f//7lc7+GSa7LPNV/U7Z/8Xm5XxRzyz0lSLq5OgiuYprSMH/NQR5SlT8mOT/ztEYFcGqK2hW2H9cwj8D1Bxdou8gB5cZe0P/3xjcMyp+jYSfBf4M4r7G+Tvc/ddK538M2YcLLiiupE0Bf5W0/zJ+P85hmH7k43v5chND/nULzn9YU/4iP08w8BPk5/AynYdRvKXKozrL+G8Xl7kXlk4NZYZy+WJmaKQwdnmZ8HtvXdCa/wM8TwH+ZwS/VUj43/bApqLqX1LS/0HYHt/q5ut/c3C/qPj1i9r/ENYxCjnwomEn7D+sgaPiN0j4R5H9T3oxoADOYw28KJTG/pPk1+VR8Rsl/BPYe17P/7Djn/BXR+b27yL6XsEahNzzKv6fjZ+ad/45yH8KaxBy6PfOIYwEZd1YmrZC/mkq972i4DdJ+P3e/X37i4K3iP45bUz8Zglf13/o5p+6NJCfnJ7qn5jRna+aw1d6/ZKF5k95ua+K9nn+h21/LZL+fQ/8GaC7yMJVKKWA37oAX+Rf09i3ShemUwFf7pf7/Sf1CrKeHEfUMzvBXUt8ZyX6T5spevwR8TIRfLZRfwp/mQw+m6g/Mxh7GPtvJ6P1p7Me4xYGfprM1p/d5Pf6o+J3kN36U6y1bs7+tOtPtv6tIbP151qMmxjy75LwH7y8//r2G50Olh7p5g/XwAPgp+BRhfm242/cMr6J/sMGjOsY+tdN5f6DgfqTbX9ryWz92RvYdFT8dWS2/uzDuI2B/ymZrT+3YtzIwO8hu/VnhuzWn+tJzj9ziP9F+jmoA7nUqoC/QcK33b+yTbr1b99fo1rzu29kre7/FCof1+t/DILz7BxU9N+FP9nBsP+Nkv6d9vR+HFbgKvc/uPq/ScI/CbyflLsvvv/bTrz+S+8C/zeMMyiuYP29WcIXUafgIbtB92v5/d8WkuOfqH/3Kuuv/P7FUm9xrET9e4Sh/yJe1s7p/8rXvyJXCN/rG8xdHHE1/Ic3X6N8qPT+2b0nD/+7e/Pui3v/Pnh35zZ/vu3+q4n+xwGMnzP0v4/M9j8OknhfNTr+djLb/xDqv4uBv4Ps9j92kv8MRJCN5++7yGz/Q0SPwwz5f0Zmn78fwriPgb+b7Na/e6T9i1jwLfgqWCXHj5Fdst0/qfT6yUT/48vApqLq314y2v/w/M9XDPx9ZLb/sR/jFwz8/WS3/yFitc3+xwGS458v9yJOIec9g+OtQeX528F55z8NvAlo3xj9qpb/s/EPSfgmiItfpSqF9D9QSwECFwsUAAIACADODiZNS4s/u+8EAAAINgAACQAJAAAAAAAAAAAAAIAAAAAAVUlQYWNrYWdlVVQFAAfviJBbUEsFBgAAAAABAAEAQAAAACcFAAAAAA==


[Script]
LogStart "c:\a.log"

Dim 容错参数,循环次数
//初始化雷电API插件需要的其他插件
返回值 = Lib.LDAPI.初始化数据()
Delay 1000
容错参数 = 0
循环次数 = 0
Do
    容错参数 = 0
    Rem 获取设备列表
    //获取设备列表
    模拟器列表 = Lib.LDAPI.刷新模拟器列表()
    Dim 模拟器信息
    Redim 模拟器信息(UBound(模拟器列表))
    For j = 0 To UBound(模拟器列表)
        模拟器信息(j) = Split(模拟器列表(j), ",")
    Next
    //模拟器多开始,关闭其中一个会导致其他的模拟器无法在db中连接,所以先判断已经储存的
    Dim 模拟器数量, 期望模拟器数量, 运行设备数量
    模拟器数量 = 0
    期望模拟器数量 = 0
    运行设备数量 = 0
    期望模拟器数量 = Int(Form1.InputBox1.Text)
    模拟器数量 = UBound(模拟器信息) + 1
    For Each a In 模拟器信息
        返回值 = Lib.LDAPI.设置基本属性(a(0),720,1280,320,1,1024)
        If a(4) = 1 Then 
            运行设备数量 = 运行设备数量 + 1
        End If
    Next
    TracePrint "期望模拟器数量" & 期望模拟器数量
    TracePrint "模拟器数量" & 模拟器数量
    TracePrint "运行设备数量" & 运行设备数量
    If 期望模拟器数量 > 模拟器数量 Then 
        MsgBox "模拟器数量少于设置数量,将复制第一个模拟器,请确认新模拟器中的脚本设置"
        For 期望模拟器数量 - 模拟器数量
            返回值 = Lib.LDAPI.复制("", 模拟器信息(0)(0))
        Next
        Goto 获取设备列表
    Else 
        If 期望模拟器数量 > 运行设备数量 Then 
            TracePrint "有模拟器没正常运行"
            //启动模拟器
            If 容错参数 < 2 Then 
                For i = 0 To 期望模拟器数量 - 1
                    If 模拟器信息(i)(3) = 0 Then 
                        TracePrint 模拟器信息(i)(1) & "没有运行,现在启动"
                        返回值 = Lib.LDAPI.启动(模拟器信息(i)(0))
                        Delay 5000
                    Else 
                        If 模拟器信息(i)(4) = 0 Then 
                            TracePrint "还没有完全进入安卓环境"
                        End If
                    End If
                Next
                容错参数 = 容错参数 + 1
                Delay 3000
                Goto 获取设备列表
            ElseIf 容错参数 >= 2 Then
                TracePrint "错误次数太多,放弃"
            End If
        Else 
            TracePrint "运行设备足够"
        End If
    End If
    容错参数 = 0
    
    小精灵包名 = "com.mbmpmcmcmlnimnnlmp.dddfree"
    //检查小精灵和游戏是否在运行中
    For Each a In 模拟器信息
        //判断小精灵是否在
        TracePrint a(1)
        Dim 小精灵宽, 小精灵高, 小精灵坐标X, 小精灵坐标Y, 小精灵是否存在,小精灵是否运行
        小精灵是否存在 = False
        小精灵是否运行 = False
        小精灵宽 = 0
        小精灵高 = 0
        小精灵坐标X = 0 
        小精灵坐标Y = 0
        //查看在运行的窗口以及相应的界面信息
        temp = Lib.LDAPI.执行ADB命令(a(0),"shell dumpsys window w visible | grep -e 'Window #' -e Surface:")
        temp1 = Split(temp, "Window #")
        For Each b In temp1
        	
            TracePrint b
            If Instr(1, b, 小精灵包名) > 0 Then 
                TracePrint "包含小精灵窗口"
                temp2 = Split(b, vbcrlf)
                For Each c In temp2
                    temp3 = Instr(1, c, "Surface:")
                    temp4 = Len(c)
                    If temp3 > 0 Then 
                        TracePrint "有界面大小信息"
                        tmep5 = Mid(c, temp3 + 9, temp4)
                        temp6 = Split(tmep5, " ")
                        小精灵宽 = temp6(UBound(temp6) - 2)
                        小精灵高 = temp6(UBound(temp6))
                        For Each d In temp6
                            If Instr(1, d, "rect") >0 Then 
                                temp7 = Mid(d, 7, len(d) - 7)
                                temp8 = Split(temp7, ",")
                                小精灵坐标X = temp8(0)
                                小精灵坐标Y = temp8(1)
                                Exit For
                            End If
                        Next
                        Exit For
                    End If
                Next
            Else 
                TracePrint "不是小精灵窗口"
            End If
        Next
        //小精灵准确状态判断
        //竖屏		收起(690.0,370.0) 头像(615.0,370.0) 展开(333.0,370.0)
        //横屏		收起(1250.0,230.0) 头像(1175.0,230.0) 展开(893.0,230.0)
        //未运行状态	收起30.0 x 74.0 头像 105.0 x 108.0 展开387.0 x 108.0
        //运行状态	收起30.0 x 75.0 头像 105.0 x 108.0 展开387.0 x 108.0
        If 小精灵宽 = 30 And 小精灵高 = 74 Then 
            TracePrint "小精灵在完全收起状态"
            小精灵是否存在 = True
        ElseIf 小精灵宽 = 105 And 小精灵高 = 108 Then
            TracePrint "小精灵头像显示"
            小精灵是否存在 = True
        ElseIf 小精灵宽 = 387 And 小精灵高 = 108 Then
            TracePrint "小精灵完全展开"
            小精灵是否存在 = True
        ElseIf 小精灵宽 = 30 And 小精灵高 = 75 Then
            TracePrint "小精灵运行中"
            小精灵是否存在 = True
            小精灵是否运行 = True
        Else 
            TracePrint "没有界面信息,是小精灵消失了或者这个是后台程序"
        End If
        If Not 小精灵是否存在  Then 
            //启动辅助
            //这个activity可以跳过启动时的2段广告
            返回值 = Lib.LDAPI.执行ADB命令(a(0),"shell am start -n com.mbmpmcmcmlnimnnlmp.dddfree/com.cyjh.elfin.activity.ElfinFreeActivity")
            Delay 15000
            //点击启动功能,其实不用这不,直接音量键也能启动,但是目前没有更好的办法判断小精灵是否运行,通过悬浮窗判断,所以先点启动,让悬浮窗出现
            返回值 = Lib.LDAPI.执行ADB命令(a(0),"shell input touchscreen tap 360 1200")
            Delay 1000
        End If
        If Not 小精灵是否运行  Then 
            //通过音量键运行脚本
            TracePrint "运行脚本"
            Lib.LDAPI.音量减小(a(0))
            Delay 5000
            返回值 = Lib.LDAPI.自动排列窗口()
        End If
        返回值 = Lib.LDAPI.降CPU(a(0),50)
    Next
    TracePrint "完成一次检测"
    循环次数 = 循环次数 + 1
    If 循环次数 >= 40 Then 
    	返回值 = Lib.LDAPI.关闭全部()
		EndScript
    End If
    Delay 180000
Loop
Sub OnScriptExit()
    TracePrint "结束脚本"
    Delay 5000
    RestartScript
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
//返回值 = Lib.LDAPI.执行ADB命令(0, "shell dumpsys window w visible | grep -e 'Window #' -e Surface:")
//判断运行中的模拟器
Event Form1.Load

End Event
