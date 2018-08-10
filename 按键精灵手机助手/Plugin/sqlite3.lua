
--查询表
function QMPlugin.SQLSelect(DBpath, tbl, field, where)
	local result = {}
	local sql
	local sqlite3 = require("sqlite3")
	field = field or "*"
	where = where or " "
	sql = string.format("SELECT %s FROM %s %s", field, tbl, where)
	if sqlite3.complete(sql) == nil then return nil end
	local db = sqlite3.open(DBpath)
	if db == nil then return nil end
	function GetResult(ud, ncols, values, names)
		local tmptable = {}
		for i=1, ncols do
			key = names[i]
			tmptable[key] = values[i]
		end
		table.insert(result, tmptable)
		return 0
	end
	db:exec(sql, GetResult)
	db:close()
	if next(result) then
		return result
	else
		return nil
	end
end

--插入数据
function QMPlugin.SQLInsert(DBpath, tbl, valtbl)
	local sql
	local sqlite3 = require("sqlite3")
	local keys, vals
	for k, v in pairs(valtbl) do
		if keys == nil then
			keys = k
		else
			keys = keys .."," .. k
		end
		if vals == nil then
			vals = string.format("\"%s\"", v)
		else
			vals = vals .."," .. string.format("\"%s\"", v)
		end
	end
	sql = string.format("INSERT INTO %s(%s) VALUES(%s)", tbl, keys, vals)
	if sqlite3.complete(sql) == nil then return false end
	local db = sqlite3.open(DBpath)
	if db == nil then return nil end
	if db:exec(sql) == sqlite3.OK then
		db:close()
		return true
	else
		db:close()
		return false
	end
end

--修改数据
function QMPlugin.SQLUpdate(DBpath, tbl, valtbl, where)
	local sql
	local sqlite3 = require("sqlite3")
	local str, ret
	for k, v in pairs(valtbl) do
		if str == nil then
			str = string.format("%s='%s'", k, v)
		else
			str = str .. "," ..string.format("%s = '%s'", k, v)
		end
	end
	where = where or " "
	sql = string.format("UPDATE %s SET %s %s", tbl, str, where)
	if sqlite3.complete(sql) == nil then return false end
	local db = sqlite3.open(DBpath)
	if db == nil then return nil end
	if db:exec(sql) == sqlite3.OK then
		db:close()
		return true
	else
		db:close()
		return false
	end
end

--删除数据
function QMPlugin.SQLDelete(DBpath, tbl, where)
	local sql
	local sqlite3 = require("sqlite3")
	local str, ret
	where = where or " "
	sql = string.format("DELETE FROM %s %s", tbl, where)
	if sqlite3.complete(sql) == nil then return false end
	local db = sqlite3.open(DBpath)
	if db == nil then return nil end
	if db:exec(sql) == sqlite3.OK then
		db:close()
		return true
	else
		db:close()
		return false
	end
end



