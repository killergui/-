---------------------------------------	制作说明	---------------------------------------
--[[
		插件作者	:	山海师、小玮、神梦无痕、天纵少侠
		制作时间	:	2016.03.04
		联系 Q Q	:	1915025270
		交流QQ群	:	153263411
		
		本插件稳定每周更新，发现BUG或有新的功能需求请联系作者（联系方式往上看↑_↑）
--]]



--
---------------------------------------------- 全局数据 ----------------------------------------------
--

local SHver			= 2.5			-- 对外版本号
local Ver_LastUpd	= 20160905		-- 内部版本号 [即最后更新日期]



--
---------------------------------------------- 内部函数 ----------------------------------------------
--




-- 按键精灵缓存目录的上级目录 [无参数] [返回临时文件目录路径, 失败返回空字符串]
function TempPath()
	local iRet, sRet = pcall(function()
		return __MQM_RUNNER_LOCAL_PATH_GLOBAL_NAME__:match("(.+)/[^/]").."/"
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return ""
	end
end

-- 临时文件路径 [fn:文件名] [返回文件路径, 失败返回空字符串]
function TempFile(fn)
	local tPath = TempPath()
	if tPath == "" then
		return ""
	else
		if fn == null then
			return tPath .. "shs_temp.txt"
		else
			return tPath .. fn .. ".txt"
		end
	end
end

-- 执行并返回execute命令的结果 [cmd:执行的命令行] [返回结果文本]
function execute(cmd)
	sh_init()
	local iRet, sRet = pcall(function()
		local tFile = TempFile()
		if tFile == "" then
			return ""
		else
			cmd = cmd.." > " .. tFile
			local ret = os.execute(cmd)
			--return ReadFile(tFile, true)
			return TrimEx(ReadFile(tFile, true), "\r\n ")
		end
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return ""
	end
end
QMPlugin.execute = execute

function temppath()--按键精灵缓存目录的上级目录
	return __MQM_RUNNER_LOCAL_PATH_GLOBAL_NAME__:match("(.+)/[^/]").."/"
end

-- 复制表 [old:旧表] [返回复制表]
function CopyTable(old)
	local NewTable = {}
	for k, v in pairs(old) do
		NewTable[k] = v
	end
	return NewTable
end

-- 复制数组 [old:旧数组] [返回复制数组]
function CopyArray(old)
	local NewArray = {}
	for k, v in ipairs(old) do
		NewArray[k] = v
	end
	return NewArray
end

function print(...)
	LuaAuxLib.TracePrint(...)
end

function match(str,format)
	return str:match(format)
end
function gsub(str,f,s)
	return str:gsub(f,s)
end

-- 统计使用量
function sh_init()
	LuaAuxLib.URL_OperationGet("http://monster.gostats.cn/bin/count/a_480985/t_5/i_1/counter.png", 3)
	sh_init = function() end
end




--
---------------------------------------------- 字符串函数 ----------------------------------------------
--



-- 过滤前导字符 [str:要处理的字符串, filt:要过滤的字符]
function LTrimEx(str, filt)
	sh_init()
	local iRet, sRet = pcall(function()
		local retstr = ""
		for i = 1, string.len(str) do
			if string.find(filt, string.sub(str, i, i)) == nil then
				retstr = string.sub(str, i, -1)
				break
			end
		end
		return retstr
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return ""
	end
end
QMPlugin.LTrimEx = LTrimEx

-- 过滤后导字符 [str:要处理的字符串, filt:要过滤的字符]
function RTrimEx(str, filt)
	sh_init()
	local iRet, sRet = pcall(function()
		local retstr = ""
		for i = string.len(str), 1, -1 do
			if string.find(filt, string.sub(str, i, i)) == nil then
				retstr = string.sub(str, 1, i)
				break
			end
		end
		return retstr
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return ""
	end
end
QMPlugin.RTrimEx = RTrimEx

-- 过滤前导与后导字符 [str:要处理的字符串, filt:要过滤的字符]
function TrimEx(str, filt)
	sh_init()
	local tmpstr
	tmpstr = LTrimEx(str, filt)
	return RTrimEx(tmpstr, filt)
end
QMPlugin.TrimEx = TrimEx

-- 删除字符中间的一段 [str:要处理的字符串, sval:删除开始位置, eval:删除结束位置]
function QMPlugin.DelPartStr(str, sval, eval)
	sh_init()
	local iRet, sRet = pcall(function()
		local LStr = string.sub(str, 1, sval-1)
		local RStr = string.sub(str, eval+1, -1)
		local RetStr = LStr ..RStr
		return RetStr
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return ""
	end
end

-- 删除指定字符 [str:要处理的字符串, filter:要删除的字符]
function QMPlugin.DelFilStr(str, filter)
	sh_init()
	local iRet, sRet = pcall(function()
		local RetStr, TmpLStr, TmpRStr, s, e
		RetStr = str
		while true do
			s, e = string.find(RetStr, filter, e)
			if s~= nil then
				TmpLStr = string.sub(RetStr, 1, s-1)
				TmpRStr = string.sub(RetStr, e+1, -1)
				RetStr = TmpLStr ..TmpRStr
			else
				break
			end
		end
		return RetStr
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return ""
	end
end
 
-- 统计指定字符数量 [str:要处理的字符串, substr:要查找的子串]
function QMPlugin.CountStr(str, substr)
	sh_init()
	local iRet, sRet = pcall(function()
		local count = 0
		for k in string.gmatch(str, substr) do
			count = count +1
		end
		return count
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return ""
	end
end

-- 从左侧删除指定字符 [str:要处理的字符串, num:要删除的数量] [返回删除后的字符]
function QMPlugin.LeftDel(str, num)
	sh_init()
	local iRet, sRet = pcall(function()
		return str:sub(num + 1, -1)
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return ""
	end
end

-- 从右侧删除指定字符 [str:要处理的字符串, num:要删除的数量] [返回删除后的字符]
function QMPlugin.RightDel(str, num)
	sh_init()
	local iRet, sRet = pcall(function()
		return str:sub(1, str:len() - num)
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return ""
	end
end

-- 生成随机汉字
function QMPlugin.RndChr()
	sh_init()
	local iRet, sRet = pcall(function()
		local x,n
		local chr=string.char
		n=math.random (19968 , 40869)
		x=chr(bit32.bor(0xE0,bit32.extract (n, 12, 4)))..
		chr(bit32.bor(0x80,bit32.extract (n, 6, 6)))..
		chr(bit32.bor(0x80,bit32.extract (n, 0, 6)))
		return x
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return ""
	end
end

-- XML转Table
function XmlToTable(xml)
	sh_init()
	local iRet, sRet = pcall(function()
		local tXml = {}
		local i = 1
		for k in xml:gmatch("<node[^>]+/?>") do
			tXml[i] = {}
			for w, y in k:gmatch("([^ ]+)=([^ ]+)") do
				tXml[i][w] = y
			end
			i = i + 1
		end
		return tXml
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return ""
	end
end
QMPlugin.XmlToTable = XmlToTable


-- 查找XML字符串 [返回第一个查找到的字符串]
function QMPlugin.FindXmlKey(Xml, key, val, key1)
	local iRet, sRet = pcall(function()
		local tXml = XmlToTable(Xml)
		local i = 1
		for i = 1, #tXml do
			if tXml[i][key] == "\""..val.."\"" then
				return tXml[i][key1]:match("\"(.+)\"")
			end
		end
		return ""
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return ""
	end
end

-- 查找XML字符串增强 [返回数组,包含了所有符合条件的结果]
function QMPlugin.FindXmlKeyA(Xml, key, val, key1)
	local iRet, sRet = pcall(function()
		local tXml = XmlToTable(Xml)
		local tmptable = {}
		for i = 1, #tXml do
			if tXml[i][key] == "\""..val.."\"" then
				table.insert(tmptable, tXml[i][key1]:match("\"(.+)\""))
			end
		end
		if tmptable[1] == nil then
			return nil
		else
			return tmptable
		end
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return nil
	end
end

function FindXmlKeyEx(tblXml, tblList, key)
	sh_init()
	local iRet, sRet = pcall(function()
		
	
	
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return nil
	end
end
-- URL编码转uft8字符
function QMPlugin.UrlToChar(str)
	sh_init()
	local iRet, sRet = pcall(function()
		s = string.gsub(str, '%%(%x%x)', function(h) return string.char(tonumber(h, 16)) end)
		return s
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return nil
	end
end	

-- uft8字符转URL编码
function QMPlugin.CharToUrl(str)
	sh_init()
	local iRet, sRet = pcall(function()
		s = string.gsub(str, "([^%w%.%- ])", function(c) return string.format("%%%02X", string.byte(c)) end)
		return string.gsub(s, " ", "+")
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return nil
	end
end





--
---------------------------------------------- 数组函数 ----------------------------------------------
--






-- 过滤数组 [arr:数组, substr:要过滤掉的字符串, tpe:是包含substr过滤还是不包含过滤] [返回过滤后的数组]
function QMPlugin.Filter(arr, substr, tpe)
	sh_init()
	local iRet, sRet = pcall(function()
		local tarr = {}
		for k, v in ipairs(arr) do
			if tpe then
				if string.find(v, substr) ~= nil then
					table.insert(tarr, v)
				end
			else
				if string.find(v, substr) == nil then
					table.insert(tarr, v)
				end
			end
		end
		return tarr
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return arr
	end
end

-- 数组排序 [arr:数组, comp:是否重构数组索引] [返回排序后的数组]
function QMPlugin.Sort(arr, comp)
	sh_init()
	local iRet, sRet = pcall(function()
		local t = {}
		local j = 1
		tarr = CopyTable(arr)
		table.sort(tarr)
		if comp then
			for i = #tarr, 1, -1 do
				t[j] = tarr[i]
				j = j + 1
			end
			return t
		else
			return tarr
		end
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return arr
	end
end

-- 删除数组元素 [arr:数组, ipos:删除元素的位置] [返回操作后的数组]
function QMPlugin.Remove(arr, ipos)
	sh_init()
	local iRet, sRet = pcall(function()
		tarr = CopyTable(arr)
		table.remove(tarr, ipos+1)
		return tarr
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return arr
	end
end

-- 插入数组元素 [arr:数组, ipos:删除元素的位置, value:插入的值] [返回操作后的数组]
function QMPlugin.insert(arr, ipos, value)
	sh_init()
	local iRet, sRet = pcall(function()
		tarr = CopyTable(arr)
		table.insert(tarr, ipos+1, value)
		return tarr
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return arr
	end
end

-- 数组去重 [tbl:数组或表] [返回操作后的数组]
function QMPlugin.RemoveDup(tbl)
	sh_init()
	local iRet, sRet = pcall(function()
		local a = {}
		local b = {}
		for _, v in ipairs(tbl) do
			a[v] = 0
		end
		for k, v in pairs(a) do
			table.insert(b, k)
		end
		return b
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return ""
	end
end

-- 数组元素改变位置 [arr:数组或表, a:交换位置的第一个元素, b:第二个元素] [返回操作后的数组]
function QMPlugin.ChangePos(arr, a, b)
	sh_init()
	local iRet, sRet = pcall(function()
		local tmptbl = arr
		local tmpval = arr[a+1]
		table.remove(tmptbl, a+1)
		table.insert(tmptbl, b+1, tmpval)
		return tmptbl
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return ""
	end
end



--
---------------------------------------------- 随机数函数 ----------------------------------------------
--



--范围随机数 
function QMPlugin.RndEx(min,max)
	sh_init()
	local iRet, sRet = pcall(function()
		return math.random(min,max)
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return 0
	end
end 

--随机取逻辑值
function QMPlugin.RndBool()
	sh_init()
	local iRet, sRet = pcall(function()
		local tmpnum = math.random(2)-1
		if tmpnum == 0 then
			return true
		else 
			return false
		end
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return ""
	end
end 

--随机取数组内容 
function QMPlugin.RandArray(arr)
	sh_init()
	local iRet, sRet = pcall(function()
		local index
		index = math.random(1,#arr)
		return arr[index]
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return ""
	end
end 

--随机生成不重复数字  [作者：小玮]
function QMPlugin.RanDiffarr(arr,num)
	sh_init()
	local iRet, sRet = pcall(function()
		if num == null or num > #arr then num = #arr end
		local Lines = {}
		for _ = 1,num do
			local n = math.random(#arr)
			Lines[#Lines + 1] = arr[n]
			table.remove(arr,n)
		end
		return Lines
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return ""
	end
end




--
---------------------------------------	文件处理	---------------------------------------
--



-- 读取文件 [path:路径, isdel:是否删除] [返回文件内容, 失败返回空字符串]
function ReadFile(path, isdel)
	local iRet, sRet = pcall(function()
		local f = io.open(path, "r")
		if f == null then
			return ""
		end
		local ret = f:read("*all")
		f:close()
		if isdel then
			os.remove(path)
		end
		return ret
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return ""
	end
end

-- 读取文件存为数组
function ReadFileLines(path, isdel)
	local iRet, sRet = pcall(function()
		local Lines = {}
		local f = io.open(path, "r")
		if f == null then
			return nil
		end
		for v in f:lines() do
			table.insert(Lines, v)
		end
		f:close()
		if isdel then
			os.remove(path)
		end
		return Lines
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return nil
	end
	
end

-- 写文件 [path:路径, str:写入字符, mode:写入模式] [返回文件内容, 失败返回空字符串]
function WriteFile(path, str, mode)
	local iRet, sRet = pcall(function()
		if mode == nil then mode = "w" end
		local f = io.open(path, mode)
		if f == nil then
			return ""
		end
		local ret = f:write(str)
		f:close()
		return ReadFile(path)
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return ""
	end
end

-- 判断文件是否存在
function FileExist(path)
	local f = io.open(path, "r")
	if f then
		return true
	else
		return false
	end
end


--提取路径中包含的文件后缀
function QMPlugin.GetFileType(path)
	sh_init()
	local iRet, sRet = pcall(function()
		s,e = string.find(path,"%.")
		local str = string.sub(path,s+1 ,-1)
		if str then
			return str
		else
			return ""
		end
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return ""
	end
end 

--提取路径中包含的文件名 
function QMPlugin.GetFileName(path)
	sh_init()
	local iRet, sRet = pcall(function()
		path = "/" .. path
		local ret
		for w in string.gmatch(path, "/([^/]+)") do
			ret = w
		end
		return ret
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return ""
	end
end

--生成随机名称文件
function QMPlugin.GetTempFile(Path, Prefix, Postfix, Lenght)
	sh_init()
	local iRet, sRet = pcall(function()
		local RndText,RetText
		for i=1,Lenght do 
			if RndText == nil then
				RndText = math.random(Lenght)
			else 
				RndText = RndText .. math.random(Lenght)
			end 
		end 
		RetText = Path .. Prefix .. RndText .. Postfix
		local f = io.open(RetText,"a+")
		f:close()
		return RetText
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return ""
	end
end 

--遍历目录 
function QMPlugin.ScanPath(path,filter)
	sh_init()
	local iRet, sRet = pcall(function()
		if string.sub(path,-1,-1) ~= "/"then
			path = path .. "/"
		end
		local tpath = TempFile("scan")
		os.execute("ls -F -a "..path.." > " ..tpath)
		local f = io.open(tpath,"r")
		local file = {}
		local folder = {}
		for v in f:lines() do
			if string.find(v,"d ") then		-- 文件夹
				sPos = string.find(v," ")
				v = string.sub(v,sPos+1,-1)
				table.insert(folder,v)
			elseif string.find(v,"- ") then	-- 文件
				sPos = string.find(v," ")
				v = string.sub(v,sPos+1,-1)
				table.insert(file,v)
			end
		end
		os.remove(tpath)
		f:close()
		if filter ~= nil then
			return folder
		else
			return file
		end
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return ""
	end
end

-- 递归遍历目录 [path:遍历路径] [返回包含完整文件路径的数组]
function QMPlugin.ScanPathEx(path)
	sh_init()
	local iRet, sRet = pcall(function()
		if string.sub(path,-1,-1) ~= "/" then path = path .. "/" end
		local tscan = TempFile("scan")
		os.execute("ls -F -a -R "..path.." > " ..tscan)
		local file = {}
		local tpath = ""
		local f = io.open(tscan,"r")
		for v in f:lines() do
			if v:find("/") ~= null then
				v = RTrimEx(v, ":")
				tpath = v.. "/"
			else
				local s, e =v:find("- ")
				if s then
					v = tpath..v:sub(e + 1, -1)
					v = v:gsub("//", "/")
					table.insert(file,v)
				end
			end
		end
		f:close()
		return file
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return ""
	end
end
--[[遍历文件夹下所有文件  [作者：小玮]
function QMPlugin.Listall(path)
	local localpath = temppath().."listall"
	os.execute(string.format("ls -al %s > %s",path,localpath))
	local listall = ReadFile(localpath)
	return listall
end
--]]

--设置文件权限 
function QMPlugin.Chmod(path,per)
	sh_init()
	if per == 0 then
		ChmodEx(path, 666)
	elseif per == 1 then
		ChmodEx(path, 444)
	elseif per == 2 then
		ChmodEx(path, 777)
	end
end 
--[[修改权限，参数为权限、文件路径，无返回值  [作者：小玮]
function QMPlugin.ChangeFolder(per,dirname)
	pcall(
	function()
	    os.execute("chmod "..per.." ".. dirname)
	end)
end
--]]

--设置文件权限[增强]
function ChmodEx(path,per)
	sh_init()
	return os.execute("chmod " ..per.." "..path)
end
QMPlugin.ChmodEx = ChmodEx

--写内容到指定行 
function QMPlugin.WriteFileLine(path,line,str)
	sh_init()
	local iRet, sRet = pcall(function()
		local t={}
		f = io.open(path,"r")
		-- 防止无文件
		if f == nil then
			f = io.open(path,"w")
			f:close()
			f = io.open(path,"r")
		end
		for i in f:lines() do
			table.insert(t,i)
		end
		if line > #t then line = #t + 1 end
		table.insert(t,line,str)
		f:close()
		f = io.open(path,"w")
		for _,v in ipairs(t) do
			f:write(v.."\r\n")
		end
		f:close()
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return ""
	end
end 

--删除指定目录下指定后缀的文件  [作者：小玮]
function QMPlugin.FindFileDelete(findpath,filename)
	sh_init()
	execute(string.format("find %s -name '%s' | xargs rm -rf",findpath,filename))
end

-- 替换文件内容 [path:文件路径, str:原字符串, repl:替换字符串] [返回文本内容]
function ReplaceFile(path, str, repl)
	sh_init()
	local iRet, sRet = pcall(function()
		local result
		local retText = ReadFile(path)
		if retText == "" then return "" end
		if retText:find(str) == nil then return "" end
		local tmpstr = retText:gsub(str,repl)
		WriteFile(path, tmpstr)
		return tmpstr
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return ""
	end
end
QMPlugin.ReplaceFile = ReplaceFile

--读取文件转换成base64编码
function QMPlugin.ReadFileBase(path)
	sh_init()
	local iRet, sRet = pcall(function()
		f = io.open(path,"rb")
		if f == null then 
			return null 
		end 
		bytes = f:read("*all")
		f:close()
		local key='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
		return ((bytes:gsub('.', function(x) 
			local r,key='',x:byte()
			for i=8,1,-1 do r=r..(key%2^i-key%2^(i-1)>0 and '1' or '0') end
			return r;
		end)..'0000'):gsub('%d%d%d?%d?%d?%d?', function(x)
			if (#x < 6) then return '' end
			local c=0
			for i=1,6 do c=c+(x:sub(i,i)=='1' and 2^(6-i) or 0) end
			return key:sub(c+1,c+1)
		end)..({ '', '==', '=' })[#bytes%3+1])
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return ""
	end
end 

-- 统计文件大小
function QMPlugin.ReadFileSize(path)
	sh_init()
	local iRet, sRet = pcall(function()
		
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return ""
	end
end

-- 读取文件大小
function QMPlugin.ReadFileSize(path)
	sh_init()
	local iRet, sRet = pcall(function()
		local size
		local f = io.open(path)
		if f then
			size = f:seek("end")
			f:close()
		else
			return -1
		end
		return size
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return ""
	end
end

--
---------------------------------------------- 网页日志函数 ----------------------------------------------
--



local Html = {}
local isAutoSave = true
local isInit = true
local HtmlData = ""
local HtmlPage = ""

function Init()
	local iRet, sRet = pcall(function()
	-- 0=白色、1=绿色、2=橙色、3=红色
	if Html.HtmlLevel == nil then
		Html.HtmlLevel = 1
	end
	-- 日志模版
	if Html.TempletItem == nil then
		Html.TempletItem = "<p class='class{$level}'>{$data}</p>"
	end
	-- 日志路径
	if Html.HtmlPath == nil then
		Html.HtmlPath = TempPath().."log_"..os.date("%Y%m%d%H%M")..".html"
	end
	-- 日志标题
	if Html.HtmlTitle == nil then
		Html.HtmlTitle = "日志记录系统"
	end
	-- 网页模版
	if Html.TempletPage == nil then
		Html.TempletPage = [[
		<html>
		<head>
		<meta charset='utf-8'>
		<title>{$title}</title>
		<style type='text/css'>
		.title {background-color : #000000;color : #FFFF00;font-family : Microsoft YaHei;font-size : 24pt;margin : 0;padding : 0;text-align : center;}
		.null {background-color : #000000;color : #FFFFFF;font-family : SimSun;font-size : 10pt;margin : 0;padding : 9px;}
		.class0 {background-color : #000000;color : #FFFFFF;font-family : SimSun;font-size : 10pt;margin : 0;padding : 0;text-indent : 16px;text-align : left;}
		.class1 {background-color : #000000;color : #00FF00;font-family : SimSun;font-size : 10pt;margin : 0;padding : 0;text-indent : 16px;text-align : left;}
		.class2 {background-color : #000000;color : #FF8000;font-family : SimSun;font-size : 10pt;margin : 0;padding : 0;text-indent : 16px;text-align : left;}
		.class3 {background-color : #000000;color : #FF0000;font-family : SimSun;font-size : 10pt;margin : 0;padding : 0;text-indent : 16px;text-align : left;}
		</style>
		</head>
		<body>
		<p class='null'></p>
		<p class='title'>{$title}</p>
		<p class='null'></p>
		{$data}
		</body>
		</html>
	]]
	end
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return ""
	end
end

-- 添加日志内容 [LogText:日志内容, Level:等级(可选)]
function QMPlugin.AddLog(LogText, Level)
	sh_init()
	local iRet, sRet = pcall(function()
		-- 初始化模版
		if isInit then 
			Init()
			isInit = false
		end
		local tmpLevel, tmpCode, tmpData
		tmpLevel = Html.HtmlLevel
		tmpPage  = Html.TempletPage
		if Level ~= nil then 
			tmpLevel = Level
		end
		-- 单条日志
		tmpData  = string.gsub(Html.TempletItem, "{$level}", tmpLevel)
		tmpData  = string.gsub(tmpData, "{$data}", os.date("[%H:%M:%S] ")..LogText)
		HtmlData = HtmlData..tmpData.."\n"
		-- 网页模版
		tmpPage  = string.gsub(Html.TempletPage, "{$title}", Html.HtmlTitle)
		tmpPage  = string.gsub(tmpPage, "{$data}", HtmlData)
		HtmlPage = tmpPage
		if isAutoSave then
			-- 写入日志
			WriteFile(Html.HtmlPath, HtmlPage, "w")
		end
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return ""
	end
end

-- 保存日志 [path:保存路径(可选)]
function QMPlugin.Save(path)
	sh_init()
	local iRet, sRet = pcall(function()
		Init()
		if Html.HtmlPath == nil then
			Html.HtmlPath = TempPath().."log_"..os.date("%Y%m%d%H%M")..".html"
		end
		if path ~= nil then
			WriteFile(path, HtmlPage, "w")
		else
			WriteFile(Html.HtmlPath, HtmlPage, "w")
		end
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return ""
	end
end

-- 设置是否自动保存 [mode:true自动保存]
function QMPlugin.AutoSave(mode)
	if mode then
		isAutoSave = mode
	end
end

-- 设置模版 [tbl:包含模版内容的table数据]
function QMPlugin.SetTemplet(tbl)
	Html.HtmlLevel   = tbl.HtmlLevel
	Html.TempletItem = tbl.TempletItem
	Html.HtmlPath    = tbl.HtmlPath
	Html.HtmlTitle   = tbl.HtmlTitle
	Html.TempletPage = tbl.TempletPage
end

-- 获取模版内容 
function QMPlugin.GetTemplet()
	Init()
	return Html
end






--
---------------------------------------------- 设备操作函数 ----------------------------------------------
--




--获取MAC地址
function QMPlugin.GetMAC()
	sh_init()
	local iRet, sRet = pcall(function()
		local info, s, e, retMac
		if FileExist("/sys/class/net/wlan0/address") then
			retMac = execute("cat /sys/class/net/wlan0/address")
		else
			info = execute("getprop")
			s, e = info:find("mac")
			if s then
				_, _, retMac = info:find("%[(%w%w:%w%w:%w%w:%w%w:%w%w:%w%w)%]", s+1)
			end
		end
		retMac = retMac or ""
		--retMac = TrimEx(retMac, "\n")
		return retMac
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return ""
	end
end

--设置输入法
function QMPlugin.SetIME(pattern)
	sh_init()
	local iRet, sRet = pcall(function()
		local imelist = {
			"com.baidu.input_mi/.ImeService",										-- 1.百度小米输入法
			"com.iflytek.inputmethod/.FlyIME",										-- 2.讯飞输入法
			"com.google.android.inputmethod.pinyin",								-- 3.谷歌输入法
			"com.xinshuru.inputmethod/.FTInputService",								-- 4.手心输入法
			"com.jb.gokeyboard/.GoKeyboard",										-- 5.GO输入法
			"com.cootek.smartinputv5.tablet/com.cootek.smartinput5.TouchPalIME",	-- 6.触宝输入法
			"com.tencent.qqpinyin/.QQPYInputMethodService",							-- 7.QQ拼音
			"com.baidu.input/.ImeService",											-- 8.百度输入法
			"com.komoxo.octopusime/com.komoxo.chocolateime.LatinIME",				-- 9.章鱼输入法
			"com.cyjh.mobileanjian/.input.inputkb",									-- 10.按键输入法
			"com.sohu.inputmethod.sogou/.SogouIME",									-- 11.搜狗输入法
		}
		os.execute("ime set " ..imelist[pattern])
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return ""
	end
end 	


--安装app
function QMPlugin.Install(path)
	sh_init()
	os.execute("pm install -r " .. string.format("%s",path) )
end 

--卸载app
function QMPlugin.Uninstall(PackageName)
	sh_init()
	os.execute("pm uninstall  " .. string.format("%s",PackageName) )
end 
--[[静默安装apk  [作者：小玮]
function QMPlugin.Install(packagepath)
	os.execute(string.format("pm install %s",packagepath))
end
--静默卸载apk
function QMPlugin.Uninstall(packagename)
	os.execute(string.format("pm uninstall %s",packagename))
end
--]]

--获取通知栏信息
function QMPlugin.GetNotification(PackageName)
	sh_init()
	local iRet, sRet = pcall(function()
		local s,e,pkgname, info
		info = execute("dumpsys notification")
		repeat
			s,e = string.find(info,"pkg=[^ ]+",e)
			if s == nil then 
				return ""
			end
			pkgname = string.sub(info,s+4,e)
			if pkgname == PackageName then
				s,e = string.find(info,"tickerText=[^\r\n]+",e)
				if s == nil then 
					return ""
				end 
				tickertext = string.sub(info,s+11,e)
				return tickertext
			end
		until s == null
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return ""
	end
end 
--[[获取通知栏信息  [作者：小玮]
function QMPlugin.Notification(pkgname)
		local localpath = temppath().."Notification"
		os.execute("dumpsys notification > "..localpath)
		xw = ReadFile(localpath)
		pkg = 1
		notifications = ""
		repeat
			_,pkg = xw:find("pkg="..pkgname,pkg)
			_,text = xw:find("tickerText=",pkg)
			content,_ = xw:find("contentView=",text)
			notification = xw:sub(text + 1,content - 8)
			if notification ~= "null" then
				notifications = notifications..notification.." \n"
			end
		until pkg == nil
		if #notifications == 0 then
			notifications= "null"
		end
		return notifications
end
--]]

--获取外网ip
function QMPlugin.GetIP()
	sh_init()
	local iRet, sRet = pcall(function()
		local iplist = {
			"http://1212.ip138.com/ic.asp",
			"http://ip.chinaz.com/getip.aspx",
		}
		local retip = ""
		for _, v in ipairs(iplist) do
			retip = LuaAuxLib.URL_OperationGet(v, 5)
			if ret ~= "" then
				break
			end
		end
		return retip:match("%d+%.%d+%.%d+%.%d+")
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return ""
	end
end
--[[获取外网ip地址  [作者：小玮]
function QMPlugin.GetIP()
	return LuaAuxLib.URL_Operation("http://52xiaov.com/getipinfo.php"):match("ip:(.-)<br/>")
end
--]]

--获取当前应用包名与组件名
function QMPlugin.GetTopActivity(tpe)
	sh_init()
	local ret = execute("dumpsys activity top ")
	if tpe and tpe == 1 then
		return string.match(ret, "ACTIVITY ([^/]+)") 
	elseif tpe and tpe == 2 then
		return string.match(ret, "ACTIVITY .-/([^ ]+)")
	else
		return string.match(ret,"ACTIVITY ([^ ]+)")
	end
end
--[[获取前台应用包名、组件名  [作者：小玮]
function QMPlugin.TopActivityName() 
	local localpath = temppath().."TopActivityName"
	os.execute("dumpsys activity top | grep ACTIVITY > "..localpath)
	local TopActivity = ReadFile(localpath)
	return TopActivity:match("ACTIVITY (.-) ")
end
--]]

--获取设备中的应用 
function GetAppList(tpe)
	sh_init()
	local iRet, sRet = pcall(function()
		local sRet
		local appList = {}
		if tpe == 0 then
			sRet = execute("pm list packages -3")
		elseif tpe == 1 then
			sRet = execute("pm list packages -s")
		end
		for k in sRet:gmatch("package:([^\r\n]+)") do
			table.insert(appList, TrimEx(k, " "))
		end
		return appList
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return ""
	end
end
QMPlugin.GetAppList = GetAppList
--[[获取已安装包名  [作者：小玮]
function QMPlugin.ListPackage(issystem)
	local localpath = temppath().."ListPackage"
	os.execute("pm list package -f > "..localpath)
	local ReadContent = ReadFile(localpath)
	local systempackage={}
	local userpackage={}
	for i in ReadContent:gmatch("(.-)\n(.-)") do
		local _,_,savepath,packagename = i:find("package:/(.-)/.-=(.+)")
		if savepath == "system" then
			systempackage[#systempackage+1]=packagename
		elseif savepath == "data" then
			userpackage[#userpackage+1]=packagename
		end
	end
	issystem = tostring(issystem)
	if issystem == "true" then
		return systempackage
	elseif issystem == "false" then
		return userpackage
	else
		for _,i in pairs(userpackage) do
			table.insert(systempackage,i)
		end
		return systempackage
	end
end
--]]

--关闭\开启wifi
function QMPlugin.ControlWifi(mode)
	sh_init()
	if mode then
		os.execute("svc wifi enable")
	else 
		os.execute("svc wifi disable")
	end 
end 

--关闭\开启数据流量
function QMPlugin.ControlData(mode)
	sh_init()
	if mode then
		os.execute("svc data enable")
	else 
		os.execute("svc data disable")
	end 
end 

--检测wifi是否开启
function QMPlugin.IsConnectWifi()
	sh_init()
	local iRet, sRet = pcall(function()
		local ret
		ret = execute("dumpsys wifi")
		if ret:find("enabled") then
			return true
		else
			return false
		end
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return ""
	end
end 

--获取安卓系统版本号
function QMPlugin.GetAndroidVer()
	sh_init()
	return execute("getprop ro.build.version.release")
end 

--重启手机
function QMPlugin.Reboot()
	sh_init()
	os.execute("reboot")
end 

--关机
function QMPlugin.ShutDown()
	sh_init()
	os.execute("reboot -p")
end 

--判断设备是否是虚拟机
function QMPlugin.IsVM()
	sh_init()
	local iRet, sRet = pcall(function()
		local retinfo = execute("cat /proc/cpuinfo")
		if retinfo ~= "" then
			if retinfo:find("model name")  and retinfo:find("vendor_id") then
				return true
			else
				return false
			end
		else
			return false
		end
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return false
	end
end 

--判断充电状态 
function QMPlugin.GetBatteryState()
	sh_init()
	local iRet, sRet = pcall(function()
		local state
		local path = TempFile("Battery")
		os.execute("dumpsys battery > " ..path)
		local ret = execute("dumpsys battery")
		if string.find(ret,"AC powered: true") then
			state = 1
		elseif string.find(ret,"USB powered: true") then
			state = 2
		elseif string.find(ret,"Wireless powered: true") then
			state = 3
		else 
			state = 0
		end 
		return state
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return 0
	end
end 

--判断蓝牙是否开启 
function QMPlugin.IsBluetooth()
	sh_init()
	local iRet, sRet = pcall(function()
		local ret = execute("getprop bluetooth.status")
		if ret == "on" then
			return true
		else
			return false
		end
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return false
	end
end 

--指定APP打开网址  [存在部分应用版本不兼容情况]
function QMPlugin.RunUrl(url,ID)
	sh_init()
	local tmpact 
	if ID == 0 then		--360浏览器
		tmpact = "com.qihoo.browser/.BrowserActivity"
	elseif ID == 1 then	--QQ浏览器
		tmpact = "com.tencent.mtt.x86/.MainActivity"
	elseif ID == 2 then	--海豚浏览器
		tmpact = "com.dolphin.browser.xf/mobi.mgeek.TunnyBrowser.MainActivity"
	elseif ID == 3 then	--欧朋浏览器
		tmpact = "com.oupeng.browser/com.opera.android.OperaMainActivity"
	elseif ID == 4 then	--傲游浏览器
		tmpact = "com.mx.browser/.MxBrowserActivity"
	elseif ID == 5 then	--UC浏览器
		tmpact = "com.UCMobile/com.uc.browser.InnerUCMobile"
	end 
	os.execute(string.format("am start -n %s -d %s",tmpact,url))
end 

--用微信浏览器打开网页  [作者：小玮]
function QMPlugin.WeiXinUrl(packagename,url)
	sh_init()
	os.execute(string.format("am start -n %s/.plugin.webview.ui.tools.WebViewUI -d '%s'",packagename,url))
end

--用默认浏览器打开网页  [作者：小玮]
function QMPlugin.OpenWeb(url)
	sh_init()
	if url:find("http://") == nil then url = "http://"..url end
	os.execute(string.format("am start -a android.intent.action.VIEW -d "..url))
end

--判断设备中是否有安装指定app
function QMPlugin.ExistApp(pkgname)
	sh_init()
	local iRet, sRet = pcall(function()
		local ret = execute("pm list packages")
		if ret:find(pkgname) then
			return true
		else
			return false
		end
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return false
	end
end 

--设置手机时间
function QMPlugin.SetTime(d,t)
	sh_init()
	os.execute("date -s "..d.."."..t)
end 

--隐藏app
function QMPlugin.DisableApp(pkgname)
	sh_init()
	os.execute("pm disable "..pkgname)
end 

--显示app
function QMPlugin.EnableApp(pkgname)
	sh_init()
	os.execute("pm enable  "..pkgname)
end

--检测虚拟键高度 
function QMPlugin.GetNavigationBar() 
	sh_init()
	local iRet, sRet = pcall(function()
		local ret = execute("dumpsys window windows")
		local _, _, pos1, pos2 = ret:find("NavigationBar.-mFrame=%[%d+,(%d+)%]%[%d+,(%d+)%]")
		if pos1 then
			return tonumber(pos2 - pos1)
		else
			return 0
		end
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return 0
	end
end

-- 获取通知栏高度
function QMPlugin.GetStatusBar()
	sh_init()
	local iRet, sRet = pcall(function()
		local ret = execute("dumpsys window windows")
		local _,_,h,h1 = ret:find("StatusBar.-mFrame=%[%d+,(%d+)%]%[%d+,(%d+)%]")
		if h ~= nil then
			return tonumber(h1-h)
		else 
			return 0
		end 
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return 0
	end
end

--获取屏幕分辨率 
function QMPlugin.GetScreen(tpe)
	sh_init()
	local iRet, sRet = pcall(function()
		local ret = execute("dumpsys window")
		local info = {}
		_,_,info[1],info[2],info[3] = ret:find("init=(%d+)x(%d+) (%d+)dpi")
		if info[1] then
			return info[tpe-1]
		else
			return 0
		end
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return 0
	end
end 

--获取剩余内存百分比 
function QMPlugin.GetRAM()
	sh_init()
	local iRet, sRet = pcall(function()
		local Total,Free
		local path = TempFile("RAM")
		os.execute("dumpsys meminfo > "..path)
		local text = ReadFile(path)
		_,_,Total = string.find(text,"Total RAM: (%d+)")
		_,_,Free = string.find(text,"Free RAM: (%d+)")
		if Free ~= nil then
			return string.format("%d",(tonumber(Free)/tonumber(Total))*100)
		else
			return 0
		end		
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return 0
	end
end 

--获取已安装应用的版本号  [作者：小玮]
function QMPlugin.AppVersion(packagename)
	sh_init()
	local retVer = execute(string.format("dumpsys package %s ", packagename))
	return retVer:match("versionName=(.-)\n")
end
--获取已安装应用首次安装的时间  [作者：小玮]
function QMPlugin.AppFirstInstallTime(packagename)
	sh_init()
	local InsTime = execute(string.format("dumpsys package %s ", packagename))
	return InsTime:match("firstInstallTime=(.-)\n")
end
--获取已安装应用升级安装的时间  [作者：小玮]
function QMPlugin.AppLastUpdateTime(packagename)
	sh_init()
	local UpdateTime = execute(string.format("dumpsys package %s ", packagename))
	return UpdateTime:match("lastUpdateTime=(.-)\n")
end
--发送广播强制刷新指定目录下的图片到图库展示  [作者：小玮]
function QMPlugin.UpdatePicture(picturepath)
	sh_init()
	os.execute("am broadcast -a android.intent.action.MEDIA_MOUNTED -d file://"..picturepath)
end

--是否亮屏(原理是检测光感是否开启)  [作者：小玮]
function QMPlugin.IsScreenOn()
	sh_init()
	local ret = execute("dumpsys power"):match("mLightSensorEnabled=(.-) ")
	if ret:find("ture") then
		return true
	else
		return false
	end
end

--开启飞行模式  [作者：小玮]
function QMPlugin.OpenAirplane()
	sh_init()
	os.execute("settings put global airplane_mode_on 1")
	os.execute("am broadcast -a android.intent.action.AIRPLANE_MODE --ez state true")
end
--关闭飞行模式  [作者：小玮]
function QMPlugin.CloseAirplane()
	sh_init()
	os.execute("settings put global airplane_mode_on 0")
	os.execute("am broadcast -a android.intent.action.AIRPLANE_MODE --ez state false")
end

--获取是否自动调节亮度 
function QMPlugin.IsAutoBrightness()
	sh_init()
	ret = execute("settings get system screen_brightness_mode")
	if ret == 1 then
		return true
	elseif ret == 0 then
		return false
	end 
end 

--设置自动调节亮度 
function QMPlugin.SetAutoBrightness(mode)
	sh_init()
	if mode == 0 then --关闭自动调节亮度
		os.execute("settings put system screen_brightness_mode 0")
	elseif mode == 1 then
		os.execute("settings put system screen_brightness_mode 1")
	end 
end 

--获取当前屏幕亮度 
function QMPlugin.GetBrightness()
	sh_init()
	local ret = execute("settings get system screen_brightness")
	if ret ~= "" then
		return tonumber(ret)
	else
		return -1
	end
end 

--设置当前屏幕亮度  
function QMPlugin.SetBrightness(val)
	sh_init()
	os.execute("settings put system screen_brightness " .. val)
end 

--获取屏幕休眠时间 
function QMPlugin.GetScreenSleep()
	sh_init()
	local itime = execute("settings get system screen_off_timeout")
	if itime ~= "" then
		return tonumber(itime)/1000
	else
		return -1
	end
end 

--设置屏幕休眠时间 
function QMPlugin.SetScreenSleep(val)
	sh_init()
	os.execute("settings put system screen_off_timeout "..val*1000)
end 

--设置隐藏\显示虚拟键 [isDisplay:是否显示虚拟键]
function QMPlugin.SetNavigationBar(isDisplay)
	sh_init()
	local iRet, sRet = pcall(function()
		local path = "/system/build.prop"
		-- 判断挂载
		if Mount("/system") ~= true then return false end
		-- 判断变量
		local mode
		if isDisplay then mode = 0 else mode = 1 end
		-- 判断设置权限
		if ChmodEx(path, "777") ~= true then return false end
		-- 读取文件内容
		local retText = ReadFile(path)
		-- 判断是否已有相关设置选项
		if retText:find("qemu%.hw%.mainkeys=%w") then
			retText = retText:gsub("qemu%.hw%.mainkeys=%w", "qemu.hw.mainkeys="..mode)
			ReplaceFile(path, "qemu%.hw%.mainkeys=%w", "qemu.hw.mainkeys="..mode)
		else
			WriteFile(path, "\nqemu.hw.mainkeys="..mode, "a+")
		end
		retText = ReadFile(path)
		if retText:find("qemu%.hw%.mainkeys=%w") then
			return true
		else
			return false
		end
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return ""
	end
end

-- 获取sim卡状态
function QMPlugin.GetSIMState()
	sh_init()
	local iRet, sRet = pcall(function()
		local ret = execute("getprop gsm.sim.state")
		if ret:find("READY") ~= nil then
			return true
		else
			return false
		end
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return false
	end
end

--清理后台,参数:白名单(不清理应用)，table类型  [作者：小玮]
function KillClean(pgknamearr)
	sh_init()
	local localpath = temppath().."list"
	local localpath1 = temppath().."ps"
	os.execute("ls /data/app/ > "..localpath)
	os.execute("ps > "..localpath1)
	local f
	ReadContent = ReadFile(localpath)
	ReadContent,_ = ReadContent:gsub("-[12]%.apk","")
	f = io.open(localpath,"w")
	f:write(ReadContent)
	f:close()
	ReadContent = ReadFile(localpath1)
	for l in io.lines(localpath) do
		n=0
		if string.find(ReadContent,l) then
			for i, v in ipairs(pgknamearr) do
				if v == l then
					n=1
				break
				end
			end
			if n==0 then
				os.execute("am force-stop "..l)
			end
		end
	end
end

function QMPlugin.KillClean(pgknamearr)
	sh_init()
	local iRet, sRet = pcall(function()
		local locallist = GetAppList(0)
		local RunList = execute("ps")
		for _, v in locallist do
			if RunList:find(v) then
				for _, v1 in pgknamearr do
					if v1 ~= v then
						os.execute("am force-stop "..v)
					end
				end
			end
		end
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return false
	end
end

--清理应用缓存  [作者：小玮]
function QMPlugin.AppClean(packagename)
	sh_init()
	execute(string.format("pm clear %s",packagename))
end

--获取通话状态，返回值为0，表示待机状态、1表示来电未接听状态、2表示电话占线状态  [作者：小玮]
function QMPlugin.CallState()
	sh_init()
	local ret = execute("dumpsys telephony.registry")
	if ret ~= "" then
		return match("mCallState=(.-)\n")
	else
		return ""
	end
end

--获取来电号码  [作者：小玮]
function QMPlugin.CallIncomingNumber()
	sh_init()
	local ret = execute("dumpsys telephony.registry")
	if ret ~= "" then
		return match("mCallIncomingNumber=(.-)\n")
	else
		return ""
	end
end

--获取系统开机时间
function QMPlugin.GetUpTime()
	sh_init()
	local rettime = execute("cat /proc/uptime ")
	_,_,rettime = string.find(rettime,"([^ ]+)")
	if rettime then
		return tonumber(rettime)
	else
		return 0
	end
end 

--获取系统上输入法 [更新]
function QMPlugin.GetIME()
	sh_init()
	local retstr = execute("ime list -s")
	local retIME = {}
	for v in string.gmatch(retstr,"([^\n]+)") do 
		table.insert(retIME,v)
	end 
	return retIME
end 

-- 保持屏幕常亮
function QMPlugin.KeepScreenOn(isOn)
	sh_init()
	local iRet, sRet = pcall(function()
		if isOn then
			os.execute("svc power stayon true")
		else
			os.execute("svc power stayon false")
		end
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return ""
	end
end

---------------------------------------		HTTP请求	---------------------------------------


--GetHttp [可自定义头信息]
function QMPlugin.GetHttp(url, t, header)
	sh_init()
	local path = TempFile("GET") 
	if t == nil then t = 30 end
	if header == nil then
		os.execute(string.format("curl --connect-timeout %s -o %s '%s' ", t, path, url))
	else
		os.execute(string.format("curl --connect-timeout %s -H '%s' -o %s '%s'", t, header, path, url))
	end 
	result = ReadFile(path, true)
	return result
end

--GetHttp 下载文件
function QMPlugin.GetHttpFile(url, filepath, header)
	sh_init()
	if header == null then
		os.execute(string.format("curl -o '%s' '%s' ",filepath, url))
	else
		os.execute(string.format("curl -o %s -H '%s' '%s' ",filepath, header,url))
	end
end

--PostHttp [可自定义头信息]
function QMPlugin.PostHttp(url,post, t,header)
	sh_init()
	local path = TempFile("POST")  
	if t == nil then t = 30 end
	if header == nil then
		os.execute(string.format("curl -o %s -d '%s' --connect-timeout %s '%s'",path,post,t,url))
	else 
		os.execute(string.format("curl -o %s -d '%s' --connect-timeout %s -H '%s' '%s'",path,post,t,header,url))
	end 
	result = ReadFile(path, true)
	return result
end 

--Post提交信息，可附带cookie信息
function QMPlugin.PostHttpC(url,post,cookie_path ,t,header)
	sh_init()
	local path = TempFile("POST")
	if t == null then t = 30 end 
	if header == null then
		os.execute(string.format("curl -o %s -d '%s' -b '%s' --connect-timeout %s '%s'",path,post,cookie_path,t,url))
	else 
		os.execute(string.format("curl -o %s -d '%s' -b '%s' --connect-timeout %s -H '%s' '%s'",path,post,cookie_path,t,header,url))
	end 
	result = ReadFile(path, true)
	return result
end 

--GET提交信息，可附带cookie信息
function QMPlugin.GetHttpC(url,cookie_path ,t,header)
	sh_init()
	local path = TempFile("GET") 
	if t == null then t = 30 end 
	if header == null then
		os.execute(string.format("curl -o %s -b '%s' --connect-timeout %s '%s'",path,cookie_path,t,url))
	else 
		os.execute(string.format("curl -o %s -b '%s' --connect-timeout %s -H '%s' '%s'",path,cookie_path,t,header,url))
	end 
	result = ReadFile(path, true)
	return result
end

---------------------------------------	LUA正则模式匹配	---------------------------------------

--全局正则匹配[包含单子串]
function QMPlugin.RegexFind(str,pattern)
	sh_init()
	local iRet, sRet = pcall(function()
	local ret ={}
	for v in string.gmatch(str,pattern) do 
		table.insert(ret,v)
	end 
	return ret
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return arr
	end
end 

--全局正则匹配多子串 
function QMPlugin.RegexFindEx(str,pattern)
	sh_init()
	local t1 = {}
	local i=1
	local ePos
	repeat
		local ta = {string.find(str, pattern, ePos)}
		ePos = ta[2]
		if ta[1] ~= nil then
			t1[i] = ta
			table.remove(t1[i],1)
			table.remove(t1[i],1)
			i=i+1
		end
	until ta[1]==nil
	return t1
end





--
---------------------------------------------- 数据库函数 ----------------------------------------------
--


-- 查询数据库内容 [DBpath:数据库路径, field:列名, tbl:表名, where:过滤条件, req:附加条件]
function SQLSelect(DBpath, tbl, field, where, req)
	sh_init()
	local iRet, sRet = pcall(function()
		if where == "" then
			if req == "" then
				return execute(string.format("sqlite3 %s 'select %s from %s'", DBpath, field, tbl))
			else
				return execute(string.format("sqlite3 %s 'select %s from %s %s'", DBpath, field, tbl, req))
			end
		else
			if req == "" then
				return execute(string.format("sqlite3 %s 'select %s from %s where %s'", DBpath, field, tbl, where))
			else
				return execute(string.format("sqlite3 %s 'select %s from %s where %s %s'", DBpath, field, tbl, where, req))
			end
		end
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return ""
	end
end
QMPlugin.SQLSelect = SQLSelect

-- 增加数据库内容 [DBpath:数据库路径, tbl:表名, valtbl:新值(table类型)]
function SQLInsert(DBpath, tbl, valtbl)
	sh_init()
	local iRet, sRet = pcall(function()
		local key, val
		for k, v in pairs(valtbl) do
			if key == nil then
				key = k
			else
				key = key .."," .. k
			end
			if val == nil then
				val = string.format("\"%s\"", v)
			else
				val = val .."," .. string.format("\"%s\"", v)
			end
		end
		local ret = os.execute(string.format("sqlite3 %s 'insert into %s(%s) values(%s)'", DBpath, tbl, key, val))
		if ret then
			return true
		else
			return false
		end
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return ""
	end
end
QMPlugin.SQLInsert = SQLInsert

-- 修改数据库内容 [DBpath:数据库路径, tbl:表名, valtbl:新值(table类型), req:选择条件]
function QMPlugin.SQLUpdate(DBpath, tbl, valtbl, where)
	sh_init()
	local iRet, sRet = pcall(function()
		local str, ret
		for k, v in pairs(valtbl) do
			if str == nil then
				str = string.format("%s = \"%s\"", k, v)
			else
				str = str .. "," ..string.format("%s = \"%s\"", k, v)
			end
		end
		if where == "" then
			ret = os.execute(string.format("sqlite3 %s 'update %s set %s '", DBpath, tbl, str))
		else
			ret = os.execute(string.format("sqlite3 %s 'update %s set %s where %s'", DBpath, tbl, str, where))
		end
		if ret then
			return true
		else
			return false
		end
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return ""
	end
end

-- 删除数据库内容 [DBpath:数据库路径, tbl:表名, req:选择条件]
function QMPlugin.SQLDelete(DBpath, tbl, where)
	sh_init()
	local iRet, sRet = pcall(function()
		local ret
		if where == "" then
			ret = os.execute(string.format("sqlite3 %s 'delete from %s '", DBpath, tbl))
		else
			ret = os.execute(string.format("sqlite3 %s 'delete from %s where %s'", DBpath, tbl, where))
		end
		if ret then
			return true
		else
			return false
		end
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return ""
	end
end

-- 获取最后一条短信
function QMPlugin.LastSMS()
	sh_init()
	local iRet, sRet = pcall(function()
		local dbpath = "/data/data/com.android.providers.telephony/databases/mmssms.db"		--"/storage/emulated/legacy/mmssms.db"
		return SQLSelect(dbpath, "sms", "body", "", "order by date desc limit 0, 1")
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return ""
	end
end



-- 获取指定号码短信
function QMPlugin.GetSMS(number)
	sh_init()
	local iRet, sRet = pcall(function()
		local dbpath = 	"/data/data/com.android.providers.telephony/databases/mmssms.db"	--"/sdcard/mmssms.db"
		-- 组合电话号码
		if number:len() == 11 then number = "+86" .. number end
		return SQLSelect(dbpath, "sms", "body", "address=\"" .. number .."\" ")
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return ""
	end
end

-- 添加通讯录信息 [contact:联系人信息(table)]
function QMPlugin.AppendPhone(contact)
	sh_init()
	local iRet, sRet = pcall(function()
		local dbpath = "/data/data/com.providers.contacts/databases/contacts2.db"		--"/sdcard/contacts2.db"
		local maxID, nickname, phone
		local ret
		if Mount("/data/data") == fale then
			return false
		else
			if ChmodEx(dbpath, 777) == false then
				return false
			end
		end
		-- 获取ID最大值
		local maxID = tonumber(SQLSelect(dbpath, "data", "max(raw_contact_id)",  "", ""))
		local i = 1
		for k, v in pairs(contact) do
			nickname = k
			ret = SQLInsert(dbpath, "data", {["data1"] = nickname, ["raw_contact_id"] = maxID + 1, ["mimetype_id"] = 7})
			if v:find("|") then
				phone = LuaAuxLib.StringSplit(v, "|")
				for i = 1, #phone do
					ret = SQLInsert(dbpath, "data", {["data1"] = phone[i], ["raw_contact_id"] = maxID + 1, ["mimetype_id"] = 7})
				end
			else
				phone = v
				ret = SQLInsert(dbpath, "data", {["data1"] = phone, ["raw_contact_id"] = maxID + 1, ["mimetype_id"] = 7})
			end
			maxID = maxID + 1
			-- 插入失败时退出
			if ret == false then break end
		end
		if ret then
			return true
		else
			return false
		end
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return ""
	end
end






---------------------------------------	其他命令	---------------------------------------
--判断变量类型
function QMPlugin.type(varname)
	sh_init()
	return type(varname)
end 

--返回当前插件版本号 
function QMPlugin.GetVer()
	sh_init()
	return SHver
end 

--区域颜色一定时间是否变化
function QMPlugin.IsDisplayChange(x,y,x1,y1,t,delay)
	sh_init()
	local PicPath,t1,intx,inty
	PicPath = __MQM_RUNNER_LOCAL_PATH_GLOBAL_NAME__ .."TmpPic.png"
	t1 = LuaAuxLib.GetTickCount()
	--截取指定范围图片并保存
	LuaAuxLib.SnapShot(PicPath,x,y,x1,y1)
	--在指定的时间内循环找图
	while (LuaAuxLib.GetTickCount() - t1) < t*1000 do 
		LuaAuxLib.KeepReleaseScreenSnapshot(true)
		intx = LuaAuxLib.FindPicture(x-10,y-10,x1+10,y1+10,PicPath,"101010",0,0.8)
		if intx == -1 then 
			LuaAuxLib.KeepReleaseScreenSnapshot(false)
			return true 
		end 
		LuaAuxLib.Sleep(delay*1000)
	end 
	LuaAuxLib.KeepReleaseScreenSnapshot(false)
	return false 
end 

--iif判断
function QMPlugin.iif(exp,rtrue,rfalse)
	sh_init()
	if exp == false or exp == 0 then
		return rfalse
	else 
		return rtrue
	end 
end 

--逻辑等价运算[位运算]
function QMPlugin.Eqv(t1, t2)
	sh_init()
	if type(t1) == "boolean" and type(t2) == "boolean" then
		if t1 == t2 then
			return true
		else
			return false
		end
	else
		local i1, i2, ir
		i1 = tonumber(t1)
		i2 = tonumber(t2)
		ir = 0
		for i=0, 31 do
			local b1 = bit32.band(2^i, i1)
			local b2 = bit32.band(2^i, i2)
			if b1 == b2 then
				ir = bit32.bor(ir, 2^i)
			end
		end
		return ir
	end
end

--逻辑异或运算
function QMPlugin.Xor(t1,t2)
	sh_init()
	local i1, i2
	i1 = tonumber(t1)
	i2 = tonumber(t2)
	return bit32.bxor(i1, i2)
end 


--设置日志文件路径 
local log = {}
function QMPlugin.LogPath(path, sign)
	sh_init()
	if sign == nil then sign = 0 end
	log.sign = path
end 
--日志记录 
function QMPlugin.OutLog(msg, sign)
	if log.sign == nil then sign = 0 end
	local t = os.date("[%H:%M:%S]")
	local f = io.open(log.sign,"a")
	assert(f, "日志路径错误")
	f:write(t.. "\t"..msg.."\r\n")
    f:close()
end 

--挂载系统权限
function Mount(path)
	sh_init()
	local localpath, text, tmppath,tmpret
	local a = function()
		localpath = TempFile("mount")
		os.execute("mount > "..localpath)
		text = ReadFile(localpath)
		tmppath,tmpret = string.match(text,"\n([^ ]+ "..path..")([^,]+)") 
	end 	
	a()
	os.execute("mount -o rw,remount "..tmppath)
	a()
	if string.find(tmpret,"rw") then
		return true
	else 
		return false
	end 
end 
QMPlugin.Mount = Mount

function Mount(path)
	sh_init()
	local iRet, sRet = pcall(function()
		local ret,tmppath,tmpret
		ret = execute("mount")
		tmppath,tmpret = string.match(ret,"\n([^ ]+ "..path..")([^,]+)")
		if tmppath ~= "" then
			os.execute("mount -o rw,remount "..tmppath)
		else
			return false
		end
		ret = execute("mount")
		tmppath,tmpret = string.match(ret,"\n([^ ]+ "..path..")([^,]+)")
		if tmppath ~= "" then
			os.execute("mount -o rw,remount "..tmppath)
		else
			return false
		end
		if string.find(tmpret,"rw") then
			return true
		else 
			return false
		end 
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return false
	end
	
end 
--[[挂载/system目录为读写，无参，返回挂载点  [作者：小玮]
function QMPlugin.mount()
	os.remove("/data/system.txt")
	os.execute("mount|grep system > /data/system.txt")
	f = io.open("/data/system.txt", "r") 
	xw = f:read("*all") 
	f:close()
	xw = string.sub(xw,1,string.find(xw," "))
	os.execute("su -c 'mount -o rw "..xw.." /system'")
	return xw
end
--]]

--获取XML文件 
function QMPlugin.GetUIXml()
	sh_init()
	local iRet, sRet = pcall(function()
		os.execute("uiautomator dump ")
		return ReadFile(TempPath() .."window_dump.xml")
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return ""
	end
end 


--定时器 
local t={} 
function QMPlugin.TimeSign(id)
	sh_init()
	t[id] = os.time()
end 
function QMPlugin.Timer(id,diff)
	sh_init()
	local t1 =os.time()
	if t1-t[id] >= diff then
		t[id] = os.time()
		return true
	else 
		return false
	end 
end 



--Base64加密Encoding  [作者：小玮]
function QMPlugin.Base64En(data)
	sh_init()
	local key='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
	return ((data:gsub('.', function(x) 
		local r,key='',x:byte()
		for i=8,1,-1 do r=r..(key%2^i-key%2^(i-1)>0 and '1' or '0') end
		return r;
	end)..'0000'):gsub('%d%d%d?%d?%d?%d?', function(x)
		if (#x < 6) then return '' end
		local c=0
		for i=1,6 do c=c+(x:sub(i,i)=='1' and 2^(6-i) or 0) end
		return key:sub(c+1,c+1)
	end)..({ '', '==', '=' })[#data%3+1])
end
--Base64解密Decoding  [作者：小玮]
function QMPlugin.Base64De(data)
	sh_init()
	local key='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
	data = string.gsub(data, '[^'..key..'=]', '')
	return (data:gsub('.', function(x)
		if (x == '=') then return '' end
		local r,f='',(key:find(x)-1)
		for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0') end
		return r;
	end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)
		if (#x ~= 8) then return '' end
		local c=0
		for i=1,8 do c=c+(x:sub(i,i)=='1' and 2^(8-i) or 0) end
		return string.char(c)
	end))
end

--获取用户点击屏幕坐标
--参数为横向分辨率,纵向分辨率,扫描周期
--返回值为一个数组，第一个是x坐标，第二个是y坐标  [作者：小玮]
function QMPlugin.Coordinate(ScreenX,ScreenY,Time)
	sh_init()
	local localpath = temppath().."Coordinate"
	os.execute("getevent -pl>"..localpath)
	file=io.open(localpath, "r+")
	data=file:read("*l")
	while data~=nil do
		data=file:read("*l")
		if data~=nil then
			find=nil
			_,_,find=data:find("ABS_MT_POSITION_X.*max%s+(%d*)")
				if find~=nil then
					maxx=find
				end
			find=nil
			_,_,find=data:find("ABS_MT_POSITION_Y.*max%s+(%d*)")
			if find~=nil then
				maxy=find
			end
		end
	end
	times=tostring(times)
	os.execute("getevent -l -c "..Time..">"..localpath)
	file=io.open(localpath, "r+");
	data=file:read("*l")
	while data~=nil do
		data=file:read("*l")
		if data~=nil then
			if data:find("ABS_MT_POSITION_X")~=nil then
				x= math.floor(tonumber(data:sub(59,62),16)*ScreenX/maxx)
			elseif data:find("ABS_MT_POSITION_Y")~=nil then
				y= math.floor(tonumber(data:sub(59,62),16)*ScreenY/maxy)
			end
		end
	end
	os.remove(localpath)
	local C = {}
	C[1] = x
	C[2] = y
	return C
end

local function digit_to(n,s)
	assert(type(n)=="number", "arg #1 error: need a number value.")
	assert(type(s)=="string", "arg #2 error: need a string value.")
	assert((#s)>1, "arg #2 error: too short.")
	local fl = math.floor
	local i = 0
	while 1 do
		if n>(#s)^i then
			i = i + 1
		else
			break
		end
	end
	local ret = ""
	while i>=0 do
		if n>=(#s)^i then
			local tmp = fl(n/(#s)^i)
			n = n - tmp*(#s)^i
			ret = ret..s:sub(tmp+1, tmp+1)
		else
			if ret~="" then
				ret = ret..s:sub(1, 1)
			end
		end
		i = i - 1
	end
	return ret
end
local function to_digit(ns,s)
	assert(type(ns)=="string", "arg #1 error: need a string value.")
	assert(type(s)=="string", "arg #2 error: need a string value.")
	assert((#s)>1, "arg #2 error: too short.")
	local ret = 0
	for i=1,#ns do
		local fd = s:find(ns:sub(i,i))
		if not fd then
			return nil
		end
		fd = fd - 1
		ret = ret + fd*((#s)^((#ns)-i))
	end
	return ret
end
local function s2h(str,spacer)return (string.gsub(str,"(.)",function (c)return string.format("%02x%s",string.byte(c), spacer or"")end))end
local function h2s(h)return(h:gsub("(%x%x)[ ]?",function(w)return string.char(tonumber(w,16))end))end
--unicode转utf8  [作者：小玮]
function QMPlugin.Unicode2Utf8(us)
	sh_init()
	local u16p = {
		0xdc00,
		0xd800,
	}
	local u16b = 0x3ff
	local u16fx = ""
	local padl = {
		["0"] = 7,
		["1"] = 11,
		["11"] = 16,
		["111"] = 21,
	}
	local padm = {}
	for k,v in pairs(padl) do
		padm[v] = k
	end
	local map = {7,11,16,21}
	return (string.gsub(us, "\\[Uu](%x%x%x%x)", function(uc)
		local ud = tonumber(uc,16)
		for i,v in ipairs(u16p) do
			if ud>=v and ud<(v+u16b) then
				ud = ud - v + (i-1) * 0x40
				if (i-1)>0 then
					u16fx = digit_to(ud, "01")
					return ""
				end
				local bi = digit_to(ud, "01")
				uc = string.format("%x", to_digit(u16fx..string.rep("0",10-#bi)..bi,"01"))
				u16fx = ""
				ud = tonumber(uc,16)
				break
			end
		end
		local bins = digit_to(ud,"01")
		local pads = ""
		for _,i in ipairs(map) do
			if #bins<=i then
				pads = padm[i]
				break
			end
		end
		while #bins<padl[pads] do
			bins = "0"..bins
		end
		local tmp = ""
		if pads~="0" then
			tmp = bins
			bins = ""
		end
		while #tmp>0 do
			bins = "10"..string.sub(tmp, -6, -1)..bins
			tmp = string.sub(tmp, 1, -7)
		end
		return (string.gsub(string.format("%x", to_digit(pads..bins, "01")), "(%x%x)", function(w)
			return string.char(tonumber(w,16))
		end))
	end))
end
--utf8转unicode  [作者：小玮]
function QMPlugin.Utf82Unicode(s, upper)
	sh_init()
	local uec = 0
	s = s:gsub("\\", "\\")
	if upper then
		upper = "\\U"
	else
		upper = "\\u"
	end
	local loop1 = string.gsub(s2h(s), "(%x%x)", function(w)
		local wc = tonumber(w,16)
		if wc>0x7F then
			if uec>0 then
				uec = uec - 1
				if uec==0 then
					return w.."/"
				end
				return w
			end
			local bi = digit_to(wc, "01")
			bi = string.sub(bi, 2, -1)
			while string.sub(bi, 1, 1)=="1" do
				bi = string.sub(bi, 2, -1)
				uec = uec + 1
			end
			return "u/"..w
		else
			if uec>0 then
				uec = 0
				return w.."/"
			end
		end
		return w
	end)
	local u16p = {
		0xdc00,
		0xd800,
	}
	local u16id = 0x10000
	local loop2 = string.gsub(loop1, "u/(%x%x*)/", function(w)
		local wc = tonumber(w,16)
		local tmp
		local bi = digit_to(wc, "01")
		tmp = ""
		while #bi>8 do
			tmp = string.sub(bi, -6, -1)..tmp
			bi = string.sub(bi, 1, -9)
		end
		bi = bi..tmp
		while string.sub(bi, 1, 1)=="1" do
			bi = string.sub(bi, 2, -1)
		end
		wc = to_digit(bi, "01")
		if (wc>=u16id) then
			wc = wc - u16id
			tmp = digit_to(wc, "01")
			tmp = string.rep("0", 20-#tmp)..tmp
			local low = to_digit(string.sub(tmp, -10, -1), "01") + u16p[1]
			local high = to_digit(string.sub(tmp, 1, -11), "01") + u16p[2]
			tmp = string.format("%4x", low)
			return s2h(upper..string.format("%4x", high)..upper..string.format("%4x", low))
		end
		local h = string.format("%x", wc)
		if (#h)%2~=0 then
			h = "0"..h
		end
		return s2h(upper..h)
	end)
	return h2s(loop2)
end

--日期转换成时间戳  [作者：小玮]
function QMPlugin.ToTime(Date,format)
	sh_init()
	local iRet, sRet = pcall(function()
		local Year,Month,Day,Hour,Min,Sec
		Time = {}
		_,_,Year,Month,Day,Hour,Min,Sec = Date:find(format)
		Time.year=Year
		Time.month=Month
		Time.day=Day
		Time.hour=Hour
		Time.min = Min
		Time.sec=Sec
		if next(Time) then
			return os.time(Time)
		else
			return 0
		end
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return nil
	end
end
--秒数转换为天数  [作者：小玮]
function QMPlugin.SecToDay(Sec)
	sh_init()
	local iRet, sRet = pcall(function()
		local Day,Hour,Min = 0,0,0
		if Sec < 0 then
			return "0天0小时0分0秒"
		end
		Sec = tonumber(Sec)
		for i =1,Sec/60 do
			Min = Min + 1
			if Min == 60 then Min = 0 Hour = Hour + 1 end
			if Hour == 24 then Hour = 0 Day = Day + 1 end
		end
		Sec=Sec%60
		return Day.."天"..Hour.."小时"..Min.."分"..Sec.."秒"
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return nil
	end
end


--两点经纬度之间的直线距离  [作者：小玮]
function QMPlugin.GetDistance(lat1,lng1,lat2,lng2)
	sh_init()
	local rad = function(d) return d*math.pi/180 end
	local radLat1 = rad(lat1)
	local radLat2 = rad(lat2)
	return math.floor(2*math.asin(math.sqrt(math.pow(math.sin((radLat1-radLat2)/2),2)+math.cos(radLat1)*math.cos(radLat2)*math.pow(math.sin((rad(lng1) - rad(lng2))/2),2)))*6378.137*10000)/10000
--地球是一个近乎标准的椭球体,此处地球半径我们选择的是6378.137km
end

--对比是否到期,参数：到期时间的年、月、日、时、分、秒,返回值：到期返回-1,获取网络时间失败返回null,未到期返回距离到期剩余的时间(单位秒)  [作者：小玮]
function QMPlugin.CompareTime(Year,Month,Day,Hour,Min,Sec)
	sh_init()
	local NowNetTime = LuaAuxLib.URL_OperationGet("http://52xiaov.com/getipinfo.php"):match("秒数%):(.-)</body>")
	if NowNetTime == nil then return null else NowNetTime = tonumber(NowNetTime) end
	local Time = {};Time.year=Year;Time.month=Month;Time.day=Day;Time.hour=Hour;Time.min = Min;Time.sec=Sec
	local ExpireTime = os.time(Time)
	if NowNetTime > ExpireTime then return -1 else return (ExpireTime - NowNetTime) end
end

--计算几天后的日期  [作者：小玮] 
function QMPlugin.LateTime(late,Year,Month,Day)
	sh_init()
	local starttime --
	if Day ~= nil then
		local Time = {};Time.year=Year;Time.month=Month;Time.day=Day
		starttime = os.time(Time)
	else
		starttime = os.time()
	end
	return os.date("%Y-%m-%d",starttime + tonumber(late) * 24 * 60 * 60)
end


--获取网络时间 
function QMPlugin.GetNetTime()
	sh_init()
	local iRet, sRet = pcall(function()
		local timetext = execute("curl --connect-timeout 10 -I www.taobao.com")
		local Time = {}
		if timetext ==nil then
			return ""
		end 
		_,_,_,day,mouth,year,hour,min,sec = string.find(timetext,"Date: (%a+), (%d+) (%a+) (%d+) (%d+):(%d+):(%d+)")
		Time = {["Jan"]=1,["Feb"]=2,["Mar"]=3,["Apr"]=4,["May"]=5,["Jun"]=6,["Jul"]=7,["Aug"]=8,["Sep"]=9,["Oct"]=10,["Nov"]=11,["Dec"]=12}
		if year == nil then
			return nil
		else 
			return string.format("%s/%s/%s %s:%s:%s",year,Time[mouth],day,tonumber(hour)+8,min,sec)
		end
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return nil
	end
end 

-- 返回算式计算结果 [expr:计算公式] [返回计算结果]
function QMPlugin.Eval(expr)
	sh_init()
	local iRet, sRet = pcall(function()
		f = load('return ' .. expr)
		return f()
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return ""
	end
end

-- RGB颜色转换HSV
function RGBtoHSV(r, g, b)
	sh_init()
	local iRet, sRet = pcall(function()
		local R, G, B = r, g, b
		local max=math.max(R,G,B)
		local min=math.min(R,G,B)
		if R == max then H = (G-B)/(max-min) end
		if G == max then H = 2 + (B-R)/(max-min) end
		if B == max then H = 4 + (R-G)/(max-min) end
		H = math.floor((H * 60) + 0.5)
		if H < 0 then H = H + 360 end
		V=math.floor((math.max(R,G,B) / 255 * 100) + 0.5)
		S=math.floor(((max-min)/max * 100) + 0.5)
		return {H, S, V}
	end)
	if iRet == true then
		return sRet
	else
		print(sRet)
		return ""
	end
end

-- 获取时间戳
function QMPlugin.GetUnixTime(tim)
	local tmpstr = tim.." "
	local tDate = {}
	_, _, tDate.year, tDate.month, tDate.day, tDate.hour, tDate.min, tDate.sec = tmpstr:find("(%d-)%-(%d-)%-(%d-) (%d-):(%d-):(%d-) ")
	if tDate.year then 
		return os.time(tDate)
	else
		return 0
	end
end




