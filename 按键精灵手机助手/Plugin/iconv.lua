-- 编码转换
function QMPlugin.Transcoding(to, from, text)
	local iconv = require("iconv")
	local cd = iconv.new(to, from)
	local ostr, err = cd:iconv(text)
	if err == iconv.ERROR_INCOMPLETE then
		print(":", "ERROR: Incomplete input.")
	elseif err == iconv.ERROR_INVALID then
		print(":", "ERROR: Invalid input.")
	elseif err == iconv.ERROR_NO_MEMORY then
		print(":", "ERROR: Failed to allocate memory.")
	elseif err == iconv.ERROR_UNKNOWN then
		print(":", "ERROR: There was an unknown error.")
	end
	return ostr
end

function print(msg)
	LuaAuxLib.TracePrint(msg)
end