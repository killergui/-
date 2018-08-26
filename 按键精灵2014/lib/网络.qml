[General]
SyntaxVersion=2
MacroID=a1c52b4e-dc44-4ded-887c-ff94144acf68
[Comment]
命令库是按键精灵8.0版推出的全新功能
您可以把自己常用的函数和子程序写在命令库里让很多个脚本去调用
命令库最大的优势是让多个脚本共享一个命令，修改一处就等于修改多处
目前命令库功能还在测试当中，有任何建议可以在按键精灵论坛提出，网址：http://bbs.ajjl.cn
******注意！这是官方提供的命令库，请勿修改！避免以后按键精灵升级时覆盖您的修改。******//
******          如需新增命令库，可在命令库点击右键选择“新建”命令库            ******//

[Script]
Function 获得网页源文件(网页地址)
    //说明：支持远程获取文本内容，如：MsgBox lib.网络.获得网页源文件("http://www.anjian.com/test.txt")
    //例子：MsgBox lib.网络.获得网页源文件("http://www.anjian.com")
    Dim xmlUrl
    Dim ThisCharCode ,NextCharCode ,BytesToBstr
    If InStr(网页地址, "http://") = 0 Then 
        xmlUrl = "http://" & 网页地址
    Else
        xmlUrl = 网页地址
    End If
    Dim xmlHttp
    Set xmlHttp = CreateObject("Microsoft.XMLHTTP")
    xmlHttp.Open "Get", xmlUrl, False
    xmlHttp.Send
    Do
        Delay 1
    Loop Until xmlHttp.readyState = 4
    获得网页源文件 = xmlHttp.ResponseText
    Set xmlHttp = Nothing
End Function
Function 获得外网IP地址()   
    //例子：MsgBox lib.网络.获得外网IP地址()
    Dim 网页内容,开始位置,结束位置
    网页内容 = lib.网络.获得网页源文件("http://city.ip138.com/ip2city.asp")
    开始位置 = inStr(网页内容,"[") + 1
    结束位置 = inStr(网页内容,"]") - 开始位置
    获得外网IP地址 = Mid(网页内容,开始位置,结束位置)
End Function
Function 发送邮件(你的邮箱帐号, 你的邮箱密码, 发送邮件地址, 邮件主题, 邮件内容, 邮件附件) 
    //例子：MsgBox lib.网络.发送邮件("ceshi0000001@163.com","ceshi000001","ceshi0000001@163.com","邮件主题","邮件内容","")
    Dim You_ID,MS_Space,Email
    '帐号和服务器分离 
    You_ID = Split(你的邮箱帐号, "@") 
    '这个是必须要的，不过可以放心的事，不会通过微软发送邮件 
    MS_Space = "http://schemas.microsoft.com/cdo/configuration/" 
    Set Email = CreateObject("CDO.Message") 
    '这个一定要和发送邮件的帐号一样
    Email.From = 你的邮箱帐号 
    'Execute "Email.to = 发送邮件地址"
    Email.CC = 发送邮件地址
    Email.Subject = 邮件主题
    Email.Textbody = 邮件内容 
    If 邮件附件 <> "" Then 
        Email.AddAttachment 邮件附件 
    End If 
    With Email.Configuration.Fields 
        '发信端口 
        .Item(MS_Space & "sendusing") = 2 
        'SMTP服务器地址 
        .Item(MS_Space & "smtpserver") = "smtp." & You_ID(1) 
        'SMTP服务器端口 
        .Item(MS_Space & "smtpserverport") = 25 
        .Item(MS_Space & "smtpauthenticate") = 1
        .Item(MS_Space & "sendusername") = You_ID(0) 
        .Item(MS_Space & "sendpassword") = 你的邮箱密码  
        .Update 
    End With 
    '发送邮件 
    Email.Send 
    '关闭组件 
    Set Email = Nothing 
    发送邮件 = True
    '如果没有任何错误信息，则表示发送成功,否则发送失败 
    If Err Then 
        Err.Clear 
        发送邮件 = False 
    End If 
End Function 
Function 获取网络时间()
    //例子：MsgBox "当前标准时间为：" & lib.网络.获取网络时间()
    //判断：If NowTime>CDate("2010-5-9") Then
    Dim SvrName(7),xPost,HttpAdd,NowTime,StartTime,i
    StartTime=Now 
    //SvrName(0) = "time-a.nist.gov"
    SvrName(1) = "time-a.timefreq.bldrdoc.gov"
    SvrName(2) = "time-b.timefreq.bldrdoc.gov"
    SvrName(3) = "time-c.timefreq.bldrdoc.gov"
    SvrName(4) = "utcnist.colorado.edu"
    SvrName(5) = "time.nist.gov"
    SvrName(6) = "nist1.datum.com"
    SvrName(7) = "nist1.aol-ca.truetime.com"
    Set xPost=createObject("Microsoft.XMLHTTP") 
    NowTime=""
    Do While NowTime=""
        For i=1 to 7
            NowTime=""
            HttpAdd="Http://" & SvrName(i) & ":13"
            xPost.Open "Put", HttpAdd, False
            xPost.Send
            Delay 10
            If xPost.readyState=4 Then
                NowTime=mid(xPost.responsetext, 8, 17)
                If NowTime<>"" Then
                    NowTime=CDate(NowTime) + 8 / 24
                    Exit Do
                Else
                    xPost.abort
                    NowTime=""
                End If
            End If
        Next
        If DateDiff("s", StartTime, Now)>=30 And NowTime="" Then
            Msgbox "请确定你已经连接上了互联网！", 0, "获取网络时间"
            Exit Do 
        End If
    Loop
    xPost.abort
    Set xPost=Nothing
    获取网络时间=NowTime
End Function






//制作：一只鱼
//日期：2009.12.30
//修改：2011.04.19




Function 获得网页源文件_增强版(网页地址, 网页编码)     //多个参数.设置编码.跟乱码说88
    //Plugin.Sys.SetCLB(lib.网络.获得网页源文件_增强版("www.baidu.com","utf-8")) //百度
    //Plugin.Sys.SetCLB(lib.网络.获得网页源文件_增强版("www.sina.com.cn","gbk")) //新浪
    Dim xmlHttp, xmlUrl,ObjStream
    If InStr(网页地址, "http://") = 0 Then 
        xmlUrl = "http://" & 网页地址
    Else
        xmlUrl = 网页地址
    End if
    Set xmlHttp = CreateObject("WinHttp.WinHttpRequest.5.1")   //用这个对象,跟缓存/cookie 干扰说88
    xmlHttp.Open "GET", xmlUrl, True
    xmlHttp.Send 
    If xmlhttp.waitforresponse() Then 
        Set ObjStream = CreateObject("Adodb.Stream")
        ObjStream.Type = 1
        ObjStream.Mode = 3
        ObjStream.Open
        ObjStream.Write xmlHttp.ResponseBody
        ObjStream.Position = 0
        ObjStream.Type = 2
        ObjStream.Charset = 网页编码
        获得网页源文件_增强版 = ObjStream.ReadText

        Set ObjStream = Nothing
    Else 
        获得网页源文件_增强版 = ""  //如果获取失败返回值是 空 
    End If

    Set xmlHttp = Nothing
End Function


Function 获取网络时间_增强版(网站地址)
    //TracePrint lib.网络.获取网络时间_增强版("msdn.microsoft.com") //去微软取时间玩
    //TracePrint lib.网络.获取网络时间_增强版("www.taobao.com") //看看淘宝服务器时间
    //TracePrint lib.网络.获取网络时间_增强版("www.qq.com") //看看qq网站时间
    Dim Http, URL,mt
    If InStr(网站地址, "http://") = 0 Then 
        Url = "http://" & 网站地址
    Else
        Url = 网站地址
    End if
    Set Http = CreateObject("WinHttp.WinHttpRequest.5.1")
    Http.Open "HEAD", URL, True //head方式,因为服务器返回的头部里面就有时间..所以不需要网页了
    Http.Send 
    If Http.waitforresponse() Then 
        mt = Http.getresponseheader("Date") //从头部取到时间..js格式的(带有星期几跟时区的格式,跟vbs不一样)
        mt = Cdate(Mid(mt, 5, len(mt) - 8))  //截取js格式的时间字符串.得到vbs的模式的时间
        获取网络时间_增强版 = DateAdd("h", 8, mt) //中国是8时区,而服务器普遍是世界标准时,也就是0时区得时间.所以得加上8小时
    Else 
        获取网络时间_增强版 = "" //失败返回值是 空
    End If
    Set Http = Nothing
End Function



//修改：michael3636
//日期：2015.4.28




