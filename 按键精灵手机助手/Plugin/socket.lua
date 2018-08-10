
local tcp, socket
function QMPlugin.CliendConnect(host, port)
	local socket = require("socket")
	local tcp = socket.connect(host, port)
	if tcp then
		return true
	else
		return false
	end
end

function QMPlugin.ClientSend(msg)
	if tcp then
		tcp:send(msg .. "\n")
	end
end

function QMPlugin.ClientReceive()
	if tcp then
		chunk, status, partial = tcp:receive("*a")
		return chunk
	end
end

