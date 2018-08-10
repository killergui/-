
-- 指定模式匹配
function QMPlugin.LPeg_match(patt,str)
	local lpeg = require "lpeg"
	local match = lpeg.match    
	local ret
	ret = match(patt, str)
	return ret
end

function QMPlugin.LPeg_P(str,count)
	local lpeg = require "lpeg"
	local match = lpeg.match    
	local ret
	if count ~=nil then
		patt = lpeg.P(str)^count
	else
		patt = lpeg.P(str)
	end
	ret = patt
	return ret
end

function QMPlugin.LPeg_R(str,count)
	local lpeg = require "lpeg"
	local match = lpeg.match    
	local ret
	if count ~=nil then
		patt = lpeg.R(str)^count
	else
		patt = lpeg.R(str)
	end
	ret = patt
	return ret
end

function QMPlugin.LPeg_S(str,count)
	local lpeg = require "lpeg"
	local match = lpeg.match    
	local ret
	if count ~=nil then
		patt = lpeg.S(str)^count
	else
		patt = lpeg.S(str)
	end
	ret = patt
	return ret
end