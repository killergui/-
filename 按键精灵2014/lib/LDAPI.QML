[General]
SyntaxVersion=2
MacroID=a8e3450a-ce58-4f6f-adf2-310bea4922d9
[Comment]

[Script]
'==================================================================================================
'【利用神梦插件操作雷电模拟器】

'问题反馈联系ＱＱ：540018426


'神梦按键交流群：624655641


'脚本定制联系ＱＱ：1042207232


//雷电模拟器命令
//http://bbs.ldmnq.com/forum.php?mod=viewthread&tid=30&extra=page%3D1

//ld命令
//http://bbs.ldmnq.com/forum.php?mod=viewthread&tid=9178&extra=page%3D1

//部分adb命令
//http://bbs.ldmnq.com/forum.php?mod=viewthread&tid=32

Dim LDPath           //模拟器安装路径
Dim g_PlayerList     //模拟器列表

Private Declare Function URLDownloadToFile Lib "urlmon" Alias "URLDownloadToFileA" (ByVal pCaller As Long, ByVal szURL As String, ByVal szFileName As String, ByVal dwReserved As Long, ByVal lpfnCB As Long) As Long
Function 初始化数据()
	//神梦插件下载
	 Dim tmp, 文件名, i, Win, Fi, pSysEnv, EnvPath, baseName, 系统目录, PathS
    Set File = CreateObject("QMPlugin.File")
    Set SysEx = CreateObject("QMPlugin.SysEx")
    系统目录 = SysEx.GetDir(1) : If SysEx.Is64Bit() Then 系统目录 = Replace(系统目录, "System32", "SysWOW64", 1, 1, 1)
    PathS = 系统目录 & "\SMWH.dll"
    TracePrint("系统目录:" &PathS)
    If Not CreateObject("Scripting.FileSystemObject").FileExists(PathS)  Then 
    	TracePrint("smwh.dll 不存在 下载")
        If     URLDownloadToFile(0, "http://smwh-1251741854.file.myqcloud.com/DLL/SMWH.dll", PathS, 0, 0) = 0 Then 
        ElseIf URLDownloadToFile(0, "http://smwh-1251741854.cosgz.myqcloud.com/DLL/SMWH.dll", PathS, 0, 0) = 0 Then 
        ElseIf URLDownloadToFile(0, "http://smyun.nos-eastchina1.126.net/SMWH.dll", PathS, 0, 0) = 0 Then 
        ElseIf URLDownloadToFile(0, "http://smyun.oss-cn-beijing.aliyuncs.com/DLL/SMWH.dll", PathS, 0, 0) = 0 Then 
        Else 
            If GetEnv("关闭信息框") Then 
                TracePrint "出错，下载组件 SMWH.dll 失败！"
            Else 
                MsgBox "出错，下载组件 SMWH.dll 失败！", 16+4096, "雷电模拟器"
            End If
        End If
        Delay 2500
    End If
    RunApp 系统目录 & "\regsvr32 " & PathS & " /s"
    Set SMWH = CreateObject("QMPlugin.SMWH")
    
	TracePrint ("神梦插件版本 ：" &SMWH.Ver())
    
	If not 获取模拟器路径() Then 
		MsgBox ("请确认是否安装了雷电模拟器")
		初始化数据 = false
	End If
	//暂时不需要刷新模拟器列表
	//Call 刷新模拟器列表()
End Function

Function 获取模拟器路径()
	Set regObject = CreateObject("WScript.Shell")
	Dim keyValue
	keyValue = regObject.RegRead("HKEY_CURRENT_USER\Software\ChangZhi2\dnplayer\InstallDir")
	TracePrint ("模拟器安装路径 " & keyValue)
	LDPath = keyValue
	If not (LDPath <> "") Then 
		获取模拟器路径 = false
	End If
	获取模拟器路径 = true
End Function

Function 启动(player)
	Dim ret, dosCommand
	If (IsNumeric(player)) Then 
		dosCommand = LDPath & "\dnconsole.exe launch --index " & player
	Else 
		dosCommand = LDPath & "\dnconsole.exe launch --name " & player
	End If
	
	TracePrint("启动模拟器 " &dosCommand)
	SMWH.GetDOS(dosCommand)
End Function

Function 关闭(player)
	Dim ret, dosCommand
	If (IsNumeric(player)) Then 
		dosCommand = LDPath & "\dnconsole.exe quit --index " & player
	Else 
		dosCommand = LDPath & "\dnconsole.exe quit --name " & player	
	End If
	
	TracePrint ("关闭模拟器 " &dosCommand)
	SMWH.GetDOS(dosCommand)
End Function

Function 关闭全部()
	TracePrint("关闭全部模拟器 quitall")
	SMWH.GetDOS (LDPath & "\dnconsole.exe quitall")
End Function

Function 重启(player)
	Dim dosCommand
	If (IsNumeric(player)) Then 
		dosCommand = LDPath & "\dnconsole.exe reboot --index " & player
	Else 
		dosCommand = LDPath & "\dnconsole.exe reboot --name " & player
	End If
	
	TracePrint ("重启模拟器 " & dosCommand)
	SMWH.GetDOS(dosCommand)
End Function

Function 新建(name)
	TracePrint("添加模拟器 " & name)
	SMWH.GetDOS(LDPath & "\dnconsole.exe add --name " & name)
End Function

Function 拷贝(name, srcPlayer)
	Dim dosCommand
	dosCommand = LDPath & "\dnconsole.exe rename --name " & name & " --from " & srcPlayer

	TracePrint("拷贝模拟器 " &dosCommnad)
	SMWH.GetDOS(dosCommnad)	
End Function

Function 删除(player)
	TracePrint("删除模拟器 " & player)
	If (IsNumeric(player)) Then
		SMWH.GetDOS(LDPath & "\dnconsole.exe remove --index " & player)
	Else 
		SMWH.GetDOS(LDPath & "\dnconsole.exe remove --name " & player)	
	End If
End Function

Function 重命名(player, name)
	Dim dosCommand
	If (IsNumeric(player)) Then 
		dosCommand = LDPath & "\dnconsole.exe rename --index " & player & " --title " & name
	Else 
		dosCommand = LDPath & "\dnconsole.exe rename --name " & player & " --title " & name	
	End If
	
	TracePrint("重命名模拟器 " &dosCommnad)
	SMWH.GetDOS(dosCommnad)	
End Function

Function 安装App(player, apkPath)
	Dim ret, dosCommand
	If (IsNumeric(player)) Then 
		dosCommand = LDPath & "\dnconsole.exe installapp --index " & player & " --filename " & apkPath
	Else 
		dosCommand = LDPath & "\dnconsole.exe installapp --name " & player & " --filename " & apkPath
	End If
	
	TracePrint ("安装App异步 " & dosCommand)
	ret = SMWH.GetDOS(dosCommand)
End Function

Function 安装App_同步(player, apkPath)
	Dim ret, dosCommand
	If (IsNumeric(player)) Then 
		dosCommand = LDPath & "\dnconsole.exe installapk --index " & player & " --filename " & apkPath &" --wait"
	Else 
		dosCommand = LDPath & "\dnconsole.exe installapk --name " & player & " --filename " & apkPath &" --wait"
	End If
	
	TracePrint ("安装App同步: " & dosCommand)
	ret = SMWH.GetDOS(dosCommand)
	TracePrint("ret is " &ret)
	安装App_同步 = ret
End Function

Function 卸载App_异步()
	Dim ret, dosCommand
	If (IsNumeric(player)) Then 
		dosCommand = LDPath & "\dnconsole.exe uninstallapk --index " & player & " --packagename " & package
	Else 
		dosCommand = LDPath & "\dnconsole.exe uninstallapk --name " & player & " --packagename " & package
	End If
	
	TracePrint ("卸载App异步 " &dosCommand)
	ret = SMWH.GetDOS(dosCommand)
End Function


Function 卸载App(player, package)
	Dim ret, dosCommand
	If (IsNumeric(player)) Then 
		dosCommand = LDPath & "\dnconsole.exe uninstallapp --index " & player & " --packagename " & package
	Else 
		dosCommand = LDPath & "\dnconsole.exe uninstallapp --name " & player & " --packagename " & package
	End If
	
	TracePrint ("卸载App " &dosCommand)
	ret = SMWH.GetDOS(dosCommand)
End Function

Function 启动App(player, package)
	Dim ret, dosCommand
	If (IsNumeric(player)) Then 
		dosCommand = LDPath & "\dnconsole.exe runapp --index " & player & " --packagename " & package
	Else 
		dosCommand = LDPath & "\dnconsole.exe runapp --name " & player & " --packagename " & package
	End If
	
	TracePrint("启动App " & dosCommand)
	ret = SMWH.GetDOS(dosCommand)
End Function

Function 退出App(player, package)
	Dim ret, dosCommand
	If (IsNumeric(player)) Then 
		dosCommand = LDPath & "\dnconsole.exe killapp --index " & player & " --packagename " & package
	Else 
		dosCommnad = LDPath & "\dnconsole.exe killapp --name " & player & " --packagename " & package	
	End If
	
	TracePrint ("退出App " &dosCommnad)
	ret = SMWH.GetDOS(dosCommnad)	
End Function

Function 备份(player, destFilePath)
	Dim ret, dosCommand
	If (IsNumeric(player)) Then 
		dosCommand = LDPath & "\dnconsole.exe backup --index " & player & " --file " & destFilePath
	Else 
		dosCommand = LDPath & "\dnconsole.exe backup --name " & player & " --file " & srcFilePath
		
	End If
	
	TracePrint ("备份 " & dosCommand)
	ret = SMWH.GetDOS(dosCommand)	
End Function

Function 还原(player, srcFilePath)
	Dim ret, dosCommand
	If (IsNumeric(player)) Then 
		dosCommand = LDPath & "\dnconsole.exe restore --index " & player & " --file " & srcFilePath
	Else 
		dosCommand = LDPath & "\dnconsole.exe restore --name " & player & " --file " & srcFilePath	
	End If
	
	TracePrint ("还原 " &dosCommand)
	ret = SMWH.GetDOS(dosCommand)
End Function

Function 定位(player, lng, lat)
	Dim ret, dosCommand
	If (IsNumeric(player)) Then 
		dosCommand = LDPath & "\dnconsole.exe locate --index " & player & " --LLI " & lng & "," & lat
	Else 
		dosCommand = LDPath & "\dnconsole.exe locate --name " & player & " --LLI " & lng & "," & lat
		
	End If
	
	TracePrint ("定位 " &dosCommand)
	ret = SMWH.GetDOS(dosCommand)
		
	Call action(player, "call.locate", ""&lng&","&lat)
End Function

Function 取模拟器列表()
	TracePrint ("取模拟器列表")
	取模拟器列表 = PlayerList
End Function

Function 刷新模拟器列表()
	TracePrint ("刷新模拟器列表")
	//索引，标题，顶层窗口句柄，绑定窗口句柄，是否进入android，进程PID，VBox进程PID
	Dim ret
	ret = SMWH.GetDOS(LDPath & "\dnconsole.exe list2")
	PlayerList = Split(ret, vbcrlf)
	刷新模拟器列表 = PlayerList
	TracePrint("模拟器信息:  "&ret)
End Function

Function 设置基本属性(player, width, height, dpi, cpuNumber, memorySize)
	Dim ret, dosCommand
	If (IsNumeric(player)) Then
		dosCommand = LDPath & "\dnconsole.exe modify --index " & player
	Else 
		dosCommand = LDPath & "\dnconsole.exe modify --name " & player
	End If
	
	//分辨率
	If (width <> 0 and height <> 0 and dpi <> 0) Then 
		dosCommand = dosCommand & " --resolution " & width & "," & height & "," & dpi
	End If
	
	//cpu
	If (cpuNumber <> 0) Then 
		dosCommand = dosCommand & " --cpu " & cpuNumber
	End If
	
	//内存
	If (memorySize <> 0) Then 
		dosCommand = dosCommand & " --memory " & memorySize
	End If
	
	TracePrint ("设置基本属性 " + dosCommand)
	ret = SMWH.GetDOS(dosCommand)
End Function

Function 设置手机信息(player, 手机厂商, 手机型号, 手机号码)
	Dim ret, dosCommand
	If (IsNumeric(player)) Then
		dosCommand = LDPath & "\dnconsole.exe modify --index " & player
	Else 
		dosCommand = LDPath & "\dnconsole.exe modify --name " & player
	End If
	
	If (手机厂商 <> "") Then 
		dosCommand = dosCommand + " --manufacturer " + 手机厂商
	End If

	If (手机型号 <> "") Then 
		dosCommand = dosCommand + " --model " + 手机型号
	End If

	If (手机号码 <> "") Then 
		dosCommand = dosCommand + " --pnumber " + 手机号码 
	End If
	
	TracePrint ("设置手机信息 " + dosCommand)
	ret = SMWH.GetDOS(dosCommand)
End Function

Function 设置内核信息(player, imei, imsi, simserial, androidid, mac)
	Dim ret, dosCommand
	If (IsNumeric(player)) Then
		dosCommand = LDPath & "\dnconsole.exe modify --index " & player
	Else 
		dosCommand = LDPath & "\dnconsole.exe modify --name " & player
	End If
	
	If (imei <> "") Then 
		dosCommand = dosCommand + " --imei " + imei
	End If

	If (imsi <> "") Then 
		dosCommand = dosCommand + " --imsi " + imsi
	End If

	If (simserial <> "") Then 
		dosCommand = dosCommand + " --simserial " + simserial 
	End If
	
	If (androidid <> "") Then 
		dosCommand = dosCommand + " --androidid " + androidid 
	End If
	
	If (mac <> "") Then 
		dosCommand = dosCommand + " --mac " + mac 
	End If
	
	TracePrint ("设置内核信息 " + dosCommand)
	ret = SMWH.GetDOS(dosCommand)
End Function

//value 传0或者1
Function 设置自动旋转(player, value)
	Dim ret, dosCommand
	If (IsNumeric(player)) Then
		dosCommand = LDPath & "\dnconsole.exe modify --index " & player
	Else 
		dosCommand = LDPath & "\dnconsole.exe modify --name " & player
	End If
	dosCommand = dosCommand + " --autorotate " + value
	TracePrint ("设置自动旋转" + dosCommand)
	ret = SMWH.GetDOS(dosCommand)
End Function

//value 传0或者1
Function 设置固定窗口(player, value)
	Dim ret, dosCommand
	If (IsNumeric(player)) Then
		dosCommand = LDPath & "\dnconsole.exe modify --index " & player
	Else 
		dosCommand = LDPath & "\dnconsole.exe modify --name " & player
	End If
	dosCommand = dosCommand + " --lockwindow " + value
	TracePrint ("设置固定窗口" + dosCommand)
	ret = SMWH.GetDOS(dosCommand)
End Function

Function 执行ADB命令(player, command)
	Dim ret, dosCommand
	If (IsNumeric(player)) Then
		dosCommand = LDPath & "\dnconsole.exe adb --index " & player
	Else 
		dosCommand = LDPath & "\dnconsole.exe adb --name " & player
	End If
	
	dosCommand = dosCommand + " --command """ + command + """"
	TracePrint ("执行ADB命令 " + dosCommand)
	ret = SMWH.GetDOS(dosCommand)
	TracePrint ("ADB命令返回 ret " + ret)
	执行ADB命令 = ret
End Function

Function 执行LD命令(index, command)
	Dim ret, dosCommand
	dosCommand = LDPath & "\ld.exe -s " & index &" " &command
	TracePrint ("执行LD命令 " + dosCommand)
	ret = SMWH.GetDOS(dosCommand)
	TracePrint ("LD命令返回 ret " + ret)
	执行LD命令 = ret
End Function

Function action(player, key, value)
	Dim ret, dosCommand
	If (IsNumeric(player)) Then
		dosCommand = LDPath & "\dnconsole.exe action --index " & player
	Else 
		dosCommand = LDPath & "\dnconsole.exe action --name " & player
	End If
	
	dosCommand = dosCommand + " --key " + key + " --value " + value
	TracePrint ("action " + dosCommand)
	ret = SMWH.GetDOS(dosCommand)
	TracePrint("action ret " + ret)
End Function

Function 降CPU侦(player, rate)
	Dim ret, dosCommand
	If (IsNumeric(player)) Then
		dosCommand = LDPath & "\dnconsole.exe downcpu --index " & player
	Else 
		dosCommand = LDPath & "\dnconsole.exe downcpu --name " & player
	End If
	
	dosCommand = dosCommand + " --rate " & rate
	TracePrint ("降CPU侦 " + dosCommand)
	ret = SMWH.GetDOS(dosCommand)
	TracePrint("降CPU侦 ret " + ret)
End Function

Function SetProp(player, key, value)
	Dim ret, dosCommand
	If (IsNumeric(player)) Then
		dosCommand = LDPath & "\dnconsole.exe setprop --index " & player
	Else 
		dosCommand = LDPath & "\dnconsole.exe setprop --name " & player
	End If
	
	dosCommand = dosCommand + " --key """ + key + """ --value """ + value + """"
	TracePrint ("SetProp " + dosCommand)
	ret = SMWH.GetDOS(dosCommand)
	TracePrint("SetProp ret " + ret)
End Function

Function GetProp(player, key)
	Dim ret, dosCommand
	If (IsNumeric(player)) Then
		dosCommand = LDPath & "\dnconsole.exe getprop --index " & player
	Else 
		dosCommand = LDPath & "\dnconsole.exe getprop --name " & player
	End If
	
	dosCommand = dosCommand + " --key """ + key + """"
	TracePrint ("GetProp " + dosCommand)
	ret = SMWH.GetDOS(dosCommand)
	TracePrint ("GetProp ret " + ret)
	GetProp = ret
End Function

Function 是否正在运行(player)
	For i = 0 To UBound(PlayerList)
		playerInfos = Split(PlayerList(i), ",")
	
		Dim index, name, isRunning
		index = playerInfos(0)        			//索引
		name = playerInfos(1)  				 	//标题
		isRunning = playerInfos(4)				//模拟器的安卓系统是否已经启动完成
		If (IsNumeric(player)) Then 
			If (player = CInt(index)) Then 
				是否正在运行 = (isRunning = "1")
				Exit Function
			End If
		Else 
			If (player = name) Then 
				是否正在运行 = (isRunning = "1")
				Exit Function
			End If
		End If
	Next
	是否正在运行 = false
End Function

Function 标题到索引(name)
	For i = 0 To UBound(PlayerList)
		playerInfos = Split(PlayerList(i), ",")
	
		Dim index, playerName, isRunning
		index = playerInfos(0)        			//索引
		playerName = playerInfos(1)  		    //标题
		isRunning = playerInfos(4)				//模拟器的安卓系统是否已经启动完成
		If (name = playerName) Then 
			标题到索引 = index
			Exit Function
		End If
	Next
	标题到索引 = "-1"
End Function

Function 设置网络状态(player, isOpen)
	If (isOpen) Then 
		Call action(player, "call.network", "connect")
	Else 
		Call action(player, "call.network", "offline")
	End If
End Function

Function 音量减小(player)
	Call action(player, "call.keyboard", "volumedown")
End Function

Function 自动排列窗口()
	Dim dosCommand
	dosCommand = LDPath & "\dnconsole.exe sortWnd"
	TracePrint ("自动排列窗口 " + dosCommand)
	SMWH.GetDOS(dosCommand)
End Function

Function 输入文本(player, text)
	Call action(player, "call.input", text)
End Function

Function 摇一摇()
	Call action(player, "call.shake", "")
End Function

