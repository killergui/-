--从文件读取xml内容
function QMPlugin.ParseByXmlFile(path)
	local xfile = xml.load(path) 
	local ret
	if xfile ~= nil then
		ret = xfile
	else
		ret = ""
	end
  	return ret
end

--从字符串数据读取xml内容
function QMPlugin.ParseByXmlStr(data)
	local xfile = xml.eval(data) 
	local ret
	if xfile ~= nil then
		ret = xfile
	else
		ret = ""
	end
  	return ret
end

function QMPlugin.Find(xmltab,item)
	local ret
	local tmp = xmltab:find(item)
	if tmp ~= nil then
		ret = tmp
	else
		ret = ""
	end
  	return ret
end

function QMPlugin.Save(xmltab,path)
	xmltab:save(path)
end

function QMPlugin.New(item)
	local ret = xml.new(item);
  	return ret
end

function QMPlugin.Append(xmltab,item)
	local ret = xmltab:append(item);
  	return ret
end