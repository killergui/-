function QMPlugin.ReadFileBase(path)
	f = io.open(path,"rb")
	if f == null then 
		return null 
	end 
	bytes = f:read("*all")
	f:close()
--charcodestr=''
--for i = 1, string.len(bytes) do
--   charcode = tonumber(string.byte(bytes, i, i))
--   charcodestr = tostring(charcodestr)..tostring(string.format("%02X", charcode))
--end

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

	--return charcodestr
end 