function QMPlugin.Year(time)
	if time == null then
		time = os.time()
	end
	return os.date("*t", time).year
end

function QMPlugin.Month(time)
	if time == null then
		time = os.time()
	end
	return os.date("*t", time).month
end

function QMPlugin.Day(time)
	if time == null then
		time = os.time()
	end
	return os.date("*t", time).day
end

function QMPlugin.Hour(time)
	if time == null then
		time = os.time()
	end
	return os.date("*t", time).hour
end

function QMPlugin.Minute(time)
	if time == null then
		time = os.time()
	end
	return os.date("*t", time).min
end

function QMPlugin.Second(time)
	if time == null then
		time = os.time()
	end
	return os.date("*t", time).sec
end

function QMPlugin.WeekDay(time)
	if time == null then
		time = os.time()
	end
	--按照国人习惯，把星期一作为每个星期的第一天
	weekday = os.date("*t", time).wday - 1
	if weekday == 0 then 
		weekday = 7
	end
	return weekday
end

function QMPlugin.YearDay(time)
	if time == null then
		time = os.time()
	end
	return os.date("*t", time).yday
end

function QMPlugin.Format(format, time)
	if time == null then
		time = os.time()
	end
	if format == null then
	--按照国人习惯，排列默认格式
		format = "%Y-%m-%d %H:%M:%S"
	end
	return os.date(format, time)
end

function QMPlugin.DateTimeToNumTimes(srcDateTime) 
	--从日期字符串中截取出年月日时分秒 
	--个人修改，暂时不需要时分秒
	local Y = string.sub(srcDateTime,1,4) 
	local M = string.sub(srcDateTime,6,7) 
	local D = string.sub(srcDateTime,9,10) 
--	local H = string.sub(srcDateTime,9,10) 
--	local MM = string.sub(srcDateTime,11,12) 
--	local SS = string.sub(srcDateTime,13,14) 

	--把日期时间字符串转换成对应的日期时间 
--	local dt1 = {year=Y, month=M, day=D, hour=H,min=MM,sec=SS} 
	local dt1 = {year=Y, month=M, day=D}
		--这里返回 转化成时间数值（就是这一行代码）
	return os.time(dt1)
end