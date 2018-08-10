function print(...)
	LuaAuxLib.TracePrint(...)
end
local mlfs
--获取文件属性
function QMPlugin.Attributes(filepath,name)   
	local ret
	mlfs = mlfs or require "lfs"
	ret = mlfs.attributes(filepath)
	return ret
end

function QMPlugin.Chdir(path)             --改变工作路径
	local ret
	mlfs = mlfs or require "lfs"
	ret = mlfs.chdir(path)
	return ret
end

--获取当前工作路径
function QMPlugin.Currentdir()
	local ret
	mlfs = mlfs or require "lfs"
	ret = mlfs.currentdir()
	return ret
end

--新建目录
function QMPlugin.Mkdir(path)
	local ret
	mlfs = mlfs or require "lfs"
	ret = mlfs.mkdir(path)
	return ret
end

--删除目录
function QMPlugin.Rmdir(path)               
	local ret
	mlfs = mlfs or require "lfs"
	ret = mlfs.rmdir(path)
	return ret
end