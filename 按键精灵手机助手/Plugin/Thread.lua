function QMPlugin.Start(thread_func, param1, param2, param3, param4, param5, param6, param7, param8, param9, param10)
	function body_func()
		ThreadHelper.InitThread()
		thread_func(param1, param2, param3, param4, param5, param6, param7, param8, param9, param10)
	end 

	return  ThreadHelper.CreateThread();
end

function QMPlugin.Stop(thread_handle)
	thread_handle:cancel()
end

function QMPlugin.Wait(thread_handle)
	thread_handle:join()
end

function QMPlugin.SetShareVar(key, value)
	key=string.upper(tostring(key))
	Thread_SharedVariableStore:set(key, value)
end

function QMPlugin.GetShareVar(key)
	key=string.upper(tostring(key))
	return Thread_SharedVariableStore:get(key)
end