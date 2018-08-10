function Full(...)
	counter()	
	if ...==nil then
		return  
	end	 
	local touch ,find,dir,sim= true,false,0,0.9
	local colorarg,tag
	local x1,y1,x2,y2,s1,s2 =0,0,0,0,"",""
	if type(...) == "table" then
		colorarg = ...
	else	
		colorarg = {...}
	end
	pcall(function ()	
	if #colorarg == 1 then
		s1 = colorarg[1]
	elseif( #colorarg == 2) then
		s1 =colorarg[1]
		if (type(colorarg[2]) == "string") then
			s2 =colorarg[2]
		elseif (type(colorarg[2]) =="number" ) then
			if colorarg[2]>0 and colorarg[2]<1 then
				sim = colorarg[2]
			else
				dir = colorarg[2]
			end
		elseif (type(colorarg[2]) == "boolean") then
			touch = colorarg[2]
		end
	elseif(#colorarg == 3) then
		s1 =colorarg[1];
		if(type(colorarg[2]) == "string") then
			s2 =colorarg[2]
		elseif (type(colorarg[2]) == "number") then
			if colorarg[2]>0 and colorarg[2]<1 then
				sim = colorarg[2]
			else
				dir = colorarg[2]
			end
		elseif (type(colorarg[2]) == "boolean") then
			touch = colorarg[2]
		end
		if (type(colorarg[3]) == "number") then
			if colorarg[3]>0 and colorarg[3]<1 then
				sim = colorarg[3]
			else
				dir = colorarg[3]
			end
		elseif (type(colorarg[3]) == "boolean") then
			touch = colorarg[3]
		end
	elseif (#colorarg>3 and #colorarg<6) then
		x1,y1,x2,y2 = 0,0,0,0
		s1 = colorarg[1]
		if(type(colorarg[2]) == "string") then
			s2 =colorarg[2]
		elseif (type(colorarg[2]) == "number") then
			if colorarg[2]>0 and colorarg[2]<1 then
				sim = colorarg[2]
			else
				dir = colorarg[2]
			end
		elseif (type(colorarg[2]) == "boolean") then
			touch = colorarg[2]
		end
		if (type(colorarg[3]) == "number") then
			if colorarg[3]>0 and colorarg[3]<1 then
				sim = colorarg[3]
			else
				dir = colorarg[3]
			end
		elseif (type(colorarg[3]) == "boolean") then
			touch = colorarg[3]
		end
		if (type(colorarg[4]) == "number") then
			if colorarg[4]>0 and colorarg[4]<1 then
				sim = colorarg[4]
			else
				dir = colorarg[4]
			end
		elseif (type(colorarg[4]) == "boolean") then
			touch = colorarg[4]
		end
		if (type(colorarg[5]) == "number") then
			if colorarg[5]>0 and colorarg[5]<1 then
				sim = colorarg[5]
			else
				dir = colorarg[5]
			end
		elseif (type(colorarg[5]) == "boolean") then
			touch = colorarg[5]
		elseif (type(colorarg[5]) == "string") then
			x1,y1,x2,y2 = colorarg[1],colorarg[2],colorarg[3],colorarg[4]
			s1 = colorarg[5]
			 
		end
	elseif (#colorarg>=6) then
		x1,y1,x2,y2 = colorarg[1],colorarg[2],colorarg[3],colorarg[4]
		s1 = colorarg[5]
		if(type(colorarg[6]) == "string") then
			s2 =colorarg[6]
		elseif (type(colorarg[6]) == "number") then

			if colorarg[6]>0 and colorarg[6]<1 then
				sim = colorarg[6]
			else
				dir = colorarg[6]
			end
		elseif (type(colorarg[6]) == "boolean") then
			touch = colorarg[6]
		end
		if (type(colorarg[7]) == "number") then
			 
			if colorarg[7]>0 and colorarg[7]<1 then
				sim = colorarg[7]
			else
				dir = colorarg[7]
			end
		elseif (type(colorarg[7]) == "boolean") then
			touch = colorarg[7]
		end
		if type(colorarg[8])== "number"then
			if colorarg[8]>0 and colorarg[8]<1 then
				sim = colorarg[8]
			else
				dir = colorarg[8]
			end
		elseif type(colorarg[8])== "boolean" then
			touch = colorarg[8] 
		end
		if #colorarg == 9 then
			touch = colorarg[9]
		end
		
	end
	
	  if type(colorarg[1])== "number" and type(colorarg[2])== "number"  and type(colorarg[3])== "string" then
		    ms("CmpColor")
			local x1=colorarg[1];local y1=colorarg[2];local s1=colorarg[3] 
			 if colorarg[4]==null then 
				sim=0.9 
			 end 
			 x = LuaAuxLib.CmpColor (x1,y1,s1,sim)	
		     if (x>-1) then
				find =true
				 
				if colorarg[4]~=false and type(colorarg[4])~= "number" then
					LuaAuxLib.Tap(x1,y1)
			 
				elseif type(colorarg[4])== "number" and type(colorarg[5])== "null" then
					LuaAuxLib.Tap(x1,y1)	 
				elseif type(colorarg[4])== "number" and colorarg[5]== true then
					LuaAuxLib.Tap(x1,y1)
				end
			 else
				find =false	  
		     end	
		  
		 do return find end 	 	
	  end 	
	
	 if type(colorarg[1])== "number" and type(colorarg[2])== "number"  and type(colorarg[3])== "null" then
				
			    local x1=colorarg[1];local y1=colorarg[2] 
			    x = LuaAuxLib.GetPixelColor (x1,y1,0)	
			    find =x
				do return find end 	       	
	  end  
	 
	tag = string.find(s1, "png")
	if tag then
		if y2==dir then
			dir=0
		end 
		ms("FindPicture") 
		if s2=="" then
			s2="000000"
		end  	
	

		x,y,z= LuaAuxLib.FindPicture(x1,y1,x2,y2,s1,s2,dir,sim) 
	 
		if (x>-1) then
			find=true
			if touch then
				LuaAuxLib.Tap(x,y)
			end	
		else
			find=false
		end
		do return find end
	else
	 
		 
		if (#colorarg<3) and (type(colorarg[1])~="string") or (type(colorarg[1])=="string" and type(colorarg[2])=="boolean") or (type(colorarg[1])=="string" and type(colorarg[2])=="number")  then
			
			local sub = string.match(s1,"(%w+)")
		    
			if string.len(tostring(sub)) == 6 then
				 ms("FindColor") 	
				x,y,z = LuaAuxLib.FindColor(x1,y1,x2,y2,s1,dir,sim)
				 
			 
				if (x>-1) then
					 find=true
					if touch then
						LuaAuxLib.Tap(x,y)
					end
				else
					find=false
				end
				do return find end
			else
				ms("CmpColorEx") 	
			
				if (LuaAuxLib.CmpColorEx(s1,sim)==1) then
					   find = true
					 
						x,y = string.match(s1,"(%d+)|(%d+)")
						 
						if type(colorarg[2])=="number" and colorarg[3]==true then
							LuaAuxLib.Tap(x,y)
						elseif type(colorarg[2])=="number" and type(colorarg[3])=="null" then
							LuaAuxLib.Tap(x,y)					
						end
					 
				else 
					find = false
				end
				do return find end
			end
		else
			 
			if (#colorarg==3 and type(colorarg[3])=="boolean") or (#colorarg==4 and type(colorarg[4])=="boolean") or (#colorarg==1 and type(colorarg[1])=="string") then
				 
				 local findok=true
				 local sub = string.sub(s1,1,6)	
				 local p
				 
				 for p=1,6,1 do 
					 
					 if string.sub(tostring(sub),p,p)=="|" then   
						 
						findok=false
						break
					 end  
				 end
			
				if findok==true and type(colorarg[2])~="string" then
					 ms("FindColor2") 
					x,y,z = LuaAuxLib.FindColor(x1,y1,x2,y2,s1,dir,sim)	 
				  
					if (x>-1) then
						 
						find=true
						if touch then
							LuaAuxLib.Tap(x,y)
						end
				    else
						find=false
					end
					do return find end
					
		  
				elseif type(colorarg[2])~="string" then
					ms("CmpColorEx2") 	 
					if (LuaAuxLib.CmpColorEx(s1,sim)==1) then
						find = true
						 
							x,y = string.match(s1,"(%d+)|(%d+)")
							if colorarg[3]==true or #colorarg==1 then 
								LuaAuxLib.Tap(x,y)
							end
						 
					else
						find = false
					end
					do return find end
				end
			end
			 
			if type(colorarg[6])== "string" or (type(colorarg[1])=="string" and type(colorarg[2])=="string") then
				ms("FindMultiColor") 
				x,y = LuaAuxLib.FindMultiColor(x1,y1,x2,y2,s1,s2,dir,sim)
			 
			 
				if (x>-1) then
				 
					find = true
					if touch then
						LuaAuxLib.Tap(x,y)
					end
				else
				 
					find = false
				end
			 
				do return find end	
				
			else
				if y2==dir then
					dir=0
				end 
				 
				 ms("FindColor3") 
				x,y,z = LuaAuxLib.FindColor(x1,y1,x2,y2,s1,dir,sim) 
			    
				if (x>-1) then
					find = true
					if touch then
						LuaAuxLib.Tap(x,y)
					end
				else
					find = false
				end
				do return find end
				
			end
			 
		end
		end
	end)
 
	local pos = {x1,y1,x2,y2,s1,s2,dir,sim}
	pos[9] = x
	pos[10] = y
	pos[11] = touch
	pos[12] = find

	return find
end
QMPlugin.Full=Full
function Full2(...)
	counter()		
	if ...==nil then
		return  
	end	 
	local touch ,find,dir,sim= true,false,0,0.9
	local colorarg,tag
	local x1,y1,x2,y2,s1,s2 =0,0,0,0,"",""

	if type(...) == "table" then
		colorarg = ...
	else
		colorarg = {...}
	end
	pcall(function ()	
	if #colorarg == 1 then
		s1 = colorarg[1]
	elseif( #colorarg == 2) then
		s1 =colorarg[1]
		if (type(colorarg[2]) == "string") then
			s2 =colorarg[2]
		elseif (type(colorarg[2]) =="number" ) then
			if colorarg[2]>0 and colorarg[2]<1 then
				sim = colorarg[2]
			else
				dir = colorarg[2]
			end
		elseif (type(colorarg[2]) == "boolean") then
			touch = colorarg[2]
		end
	elseif(#colorarg == 3) then
		s1 =colorarg[1];
		if(type(colorarg[2]) == "string") then
			s2 =colorarg[2]
		elseif (type(colorarg[2]) == "number") then
			if colorarg[2]>0 and colorarg[2]<1 then
				sim = colorarg[2]
			else
				dir = colorarg[2]
			end
		elseif (type(colorarg[2]) == "boolean") then
			touch = colorarg[2]
		end
		if (type(colorarg[3]) == "number") then
			if colorarg[3]>0 and colorarg[3]<1 then
				sim = colorarg[3]
			else
				dir = colorarg[3]
			end
		elseif (type(colorarg[3]) == "boolean") then
			touch = colorarg[3]
		end
	elseif (#colorarg>3 and #colorarg<6) then
		x1,y1,x2,y2 = 0,0,0,0
		s1 = colorarg[1]
		if(type(colorarg[2]) == "string") then
			s2 =colorarg[2]
		elseif (type(colorarg[2]) == "number") then
			if colorarg[2]>0 and colorarg[2]<1 then
				sim = colorarg[2]
			else
				dir = colorarg[2]
			end
		elseif (type(colorarg[2]) == "boolean") then
			touch = colorarg[2]
		end
		if (type(colorarg[3]) == "number") then
			if colorarg[3]>0 and colorarg[3]<1 then
				sim = colorarg[3]
			else
				dir = colorarg[3]
			end
		elseif (type(colorarg[3]) == "boolean") then
			touch = colorarg[3]
		end
		if (type(colorarg[4]) == "number") then
			if colorarg[4]>0 and colorarg[4]<1 then
				sim = colorarg[4]
			else
				dir = colorarg[4]
			end
		elseif (type(colorarg[4]) == "boolean") then
			touch = colorarg[4]
		end
		if (type(colorarg[5]) == "number") then
			if colorarg[5]>0 and colorarg[5]<1 then
				sim = colorarg[5]
			else
				dir = colorarg[5]
			end
		elseif (type(colorarg[5]) == "boolean") then
			touch = colorarg[5]
		elseif (type(colorarg[5]) == "string") then
			x1,y1,x2,y2 = colorarg[1],colorarg[2],colorarg[3],colorarg[4]
			s1 = colorarg[5]
			 
		end
	elseif (#colorarg>=6) then
		x1,y1,x2,y2 = colorarg[1],colorarg[2],colorarg[3],colorarg[4]
		s1 = colorarg[5]
		if(type(colorarg[6]) == "string") then
			s2 =colorarg[6]
		elseif (type(colorarg[6]) == "number") then

			if colorarg[6]>0 and colorarg[6]<1 then
				sim = colorarg[6]
			else
				dir = colorarg[6]
			end
		elseif (type(colorarg[6]) == "boolean") then
			touch = colorarg[6]
		end
		if (type(colorarg[7]) == "number") then
			 
			if colorarg[7]>0 and colorarg[7]<1 then
				sim = colorarg[7]
			else
				dir = colorarg[7]
			end
		elseif (type(colorarg[7]) == "boolean") then
			touch = colorarg[7]
		end
		if type(colorarg[8])== "number"then
			if colorarg[8]>0 and colorarg[8]<1 then
				sim = colorarg[8]
			else
				dir = colorarg[8]
			end
		elseif type(colorarg[8])== "boolean" then
			touch = colorarg[8] 
		end
		if #colorarg == 9 then
			touch = colorarg[9]
		end
		
	end
	
	  if type(colorarg[1])== "number" and type(colorarg[2])== "number"  and type(colorarg[3])== "string" then
			ms("CmpColor")
			local x1=colorarg[1];local y1=colorarg[2];local s1=colorarg[3] 
			 if colorarg[4]==null then 
				sim=0.9 
			 end 
			 x = LuaAuxLib.CmpColor (x1,y1,s1,sim)	
		     if (x>-1) then
			 
				
				if colorarg[4]~=false and type(colorarg[4])~= "number" then
					LuaAuxLib.Tap(x1,y1)
			 
				elseif type(colorarg[4])== "number" and type(colorarg[5])== "null" then
					LuaAuxLib.Tap(x1,y1)	 
				elseif type(colorarg[4])== "number" and colorarg[5]== true then
					LuaAuxLib.Tap(x1,y1)
				end
			 
				 
			    local t={x,nil,nil}
			    find =t	
				do return find end 	
		     end	
		    local t={-1,nil,nil}
			find =t	
			do return find end 	 	
	  end 	
	
	 if type(colorarg[1])== "number" and type(colorarg[2])== "number"  and type(colorarg[3])== "null" then
				
			    local x1=colorarg[1];local y1=colorarg[2] 
			    x = LuaAuxLib.GetPixelColor (x1,y1,0)	
			    find =x
				do return find end 	       	
	  end  
	 
	tag = string.find(s1, "png")
	if tag then
		if y2==dir then
			dir=0
		end 
		ms("FindPicture") 
		if s2=="" then
			s2="000000"
		end  		
		x,y,z= LuaAuxLib.FindPicture(x1,y1,x2,y2,s1,s2,dir,sim) 
		t={z,x,y}
		find = t
	 
		if (x>-1) then
			 
			if touch then
				LuaAuxLib.Tap(x,y)
			end	
	 
		end
		do return find end
	else
	 
		 
		if (#colorarg<3) and (type(colorarg[1])~="string") or (type(colorarg[1])=="string" and type(colorarg[2])=="boolean") or (type(colorarg[1])=="string" and type(colorarg[2])=="number")  then
			
			local sub = string.match(s1,"(%w+)")
		    
			if string.len(tostring(sub)) == 6 then
				ms("FindColor") 	
				x,y,z = LuaAuxLib.FindColor(x1,y1,x2,y2,s1,dir,sim)
				 
			    t={z,x,y} 
				find = t
				if (x>-1) then
				 
					if touch then
						LuaAuxLib.Tap(x,y)
					end
				else
				 
				end
				do return find end
			else
				ms("CmpColorEx") 	
				if (LuaAuxLib.CmpColorEx(s1,sim)==1) then
					 
					 
						x,y = string.match(s1,"(%d+)|(%d+)")
						 
						if type(colorarg[2])=="number" and colorarg[3]==true then
							LuaAuxLib.Tap(x,y)
						elseif type(colorarg[2])=="number" and type(colorarg[3])=="null" then
							LuaAuxLib.Tap(x,y)					
						end
						local t={true,x,y}
						find=t
					 
				else 
					 local t={false,-1,-1}
					 find=t
				end
				do return find end
			end
		else
			 
			if (#colorarg==3 and type(colorarg[3])=="boolean") or (#colorarg==4 and type(colorarg[4])=="boolean") or (#colorarg==1 and type(colorarg[1])=="string") then
				 
				 local findok=true
				 local sub = string.sub(s1,1,6)	
				 local p
				 
				 for p=1,6,1 do 
					 
					 if string.sub(tostring(sub),p,p)=="|" then   
						 
						findok=false
						break
					 end  
				 end
				if findok==true and type(colorarg[2])~="string" then
					ms("FindColor2") 
					x,y,z = LuaAuxLib.FindColor(x1,y1,x2,y2,s1,dir,sim)	 
					
				    t={z,x,y} 
					find = t
					if (x>-1) then
						 
						 
						if touch then
							LuaAuxLib.Tap(x,y)
						end
				    else
						 
					end
					do return find end
					
		  
				elseif type(colorarg[2])~="string" then
					ms("CmpColorEx2") 	 
					if (LuaAuxLib.CmpColorEx(s1,sim)==1) then
							
						x,y = string.match(s1,"(%d+)|(%d+)")
	
						if colorarg[3]==true or #colorarg==1 then 
							LuaAuxLib.Tap(x,y)
						end

						t={true,x,y} 
					    find = t
						
						
					else
						 
						t={false,-1,-1} 
					    find = t
					end
					do return find end
				end
			end
			 
			if type(colorarg[6])== "string" or (type(colorarg[1])=="string" and type(colorarg[2])=="string") then
				ms("FindMultiColor") 
				x,y = LuaAuxLib.FindMultiColor(x1,y1,x2,y2,s1,s2,dir,sim)
				
			 
				if (x>-1) then
					t={true,x,y}
					 
					if touch then
						LuaAuxLib.Tap(x,y)
					end
				else
					t={false,x,y}	
					 
				end
				find=t
				do return find end	
				
			else
				if y2==dir then
					dir=0
				end 
				 
				ms("FindColor3") 
				x,y,z = LuaAuxLib.FindColor(x1,y1,x2,y2,s1,dir,sim)
				 
			    t={z,x,y} 
				find = t
				if (x>-1) then
					 
					if touch then
						LuaAuxLib.Tap(x,y)
					end	 
				end
				do return find end
				
			end
			 
		end
		end
	end)
 
	local pos = {x1,y1,x2,y2,s1,s2,dir,sim}
	pos[9] = x
	pos[10] = y
	pos[11] = touch
	pos[12] = find

	return find
end
QMPlugin.Full2=Full2
function FullUB(data,click)
	local i
	if data==nil then return(false) end	 	
	local find=false
	for ii=1,#data do 
		local t=data[ii]
		if click==false then
			if t[#t]~=false then t[#t+1]=false	end		 
		end  
		if Full(t) then 
			find=true break 
		end	
	end 
	if find then return true else return false end 
 
end 
QMPlugin.FullUB=FullUB
function FullUB2(data,click)
	local i
	local ok={-1}
	if data==nil then return(false) end	 	
	local find=false
	for ii=1,#data do 
		local t=data[ii]
		if click==false then
			if t[#t]~=false then t[#t+1]=false	end		 
		end  
		ok=Full2(t) 
	 	
		 
		if ok[1]~=-1 and ok[1]~=false then 
			 
			return(ok)
		end 	
	end 
	 
	return(ok)
end 
QMPlugin.FullUB2=FullUB2
function FullTM(data,TM)
	if data==nil then return(false) end	
	if TM==nil or TM=="" or TM==0 then TM=5 end
	for i=1,TM do
		sleep()	 
		if Full(data) then 
			 return true
		end  		
	end 
	return false
end 
QMPlugin.FullTM=FullTM
function FullTM2(data,TM)
	local OK
	if data==nil then return(false) end	
	if TM==nil or TM=="" or TM==0 then TM=5 end
	for i=1,TM do
		sleep()	 
		OK=Full2(data)   
		if OK[1]~=-1 and OK[1]~=false then 
			return OK
		end  			
	end 
	return OK
end 
QMPlugin.FullTM2=FullTM2
function FullUBTM(data,TM,click)
	if data==nil then return(false) end	
	if TM==nil or TM=="" or TM==0 then TM=5 end
	for i=1,TM do
		sleep()	 
		if FullUB(data,click) then 
			 return true
		end  		
	end 
	return false
end 
QMPlugin.FullUBTM=FullUBTM
function FullUBTM2(data,TM,click)
	local OK 
	if data==nil then return(false) end	
	if TM==nil or TM=="" or TM==0 then TM=5 end
	for i=1,TM do
		sleep()	 
		OK=FullUB2(data,click)  
		 
		if  OK[1]~=-1 and OK[1]~=false then
			return OK
		end  		
	end 
	 
	return OK
end 
QMPlugin.FullUBTM2=FullUBTM2
function FullEX(data,TM)
	local T=1000
	if data==nil then return end
	if TM==nil or TM=="" or TM==0 then TM=5 end
	local find=false
	if Full(data) then 
		find=true  
	end		
	if find then
		for i=1,TM do 
			sleep()
			local ok=false
			if Full(data) then 
				ok=true  
			end	
			if ok==false then return true end 
		end 		
	end 		
	return false
end
QMPlugin.FullEX=FullEX
function FullEX2(data,TM)
	local T=1000,yes
	if data==nil then return end
	if TM==nil or TM=="" or TM==0 then TM=5 end
	local find=false
	yes=Full2(data)   
	if yes[1]==true then
		find=true 
	end 		
	if find then
		for i=1,TM do 
			sleep()
			local OK
			local GOOD=false 
			OK= Full2(data)   
			if OK[1]==true then
				GOOD=true  	
			end		
			if GOOD==false then return yes end 
		end 		
	end 	
	yes[1]=false
	return yes
end
QMPlugin.FullEX2=FullEX2
function FullUBEX(data,TM,click)
	local T=1000
	if data==nil then return end
	if TM==nil or TM=="" or TM==0 then TM=5 end
	local find=false
	for ii=1,#data do 
		local t=data[ii]
		if click==false then
			if t[#t]~=false then t[#t+1]=false	end		 
		end  
		if Full(t) then 
			find=true break 
		end	
	end 
			
	if find then
		for i=1,TM do 
			 
			sleep()
			local ok=false
			for ii=1,#data do 
				local t=data[ii]
				if click==false then
					if t[#t]~=false then t[#t+1]=false	end		 
				end  
				if Full(t) then 
					ok=true  
				end	
			end 
			if ok==false then return true end 
		end 		
	end 		
	return false
end
QMPlugin.FullUBEX=FullUBEX
function FullUBEX2(data,TM,click)
	local T=1000,good
	if data==nil then return end
	if TM==nil or TM=="" or TM==0 then TM=5 end
	local find=false
	for ii=1,#data do 
		local t=data[ii]
		if click==false then
			if t[#t]~=false then t[#t+1]=false	end		 
		end  
		good=Full2(t) 
		if good[1]~=-1 and good[1]~=false then 
			find=true break 
		end  	 
	end 
	local good2		
	if find then
		for i=1,TM do 
			 
			sleep()
			local ok=false
			for ii=1,#data do 
				local t=data[ii]
				if click==false then
					if t[#t]~=false then t[#t+1]=false	end		 
				end  
				good2 = Full2(t)  
				if good2[1]~=-1 and good2[1]~=false then 
					ok=true
				end    
			end 
			if ok==false then return good end 
		end 		
	end
	--good[1]=good[1] 		
	return good
end
QMPlugin.FullUBEX2=FullUBEX2
function QMPlugin.FullTMEX(data,TM)
	if FullTM(data,TM) and FullEX(data,TM) then
		return true
	else
		return false
	end
end 	
function QMPlugin.FullTMEX2(data,TM)
	local GOOD={-1}
	local OK = FullTM2(data,TM)  
    if  OK[1]~=-1 and OK[1]~=false then
		GOOD=FullEX2(data,TM) 
	end
	if  GOOD[1]~=-1 and GOOD[1]~=false then	
		return OK
	else
		--OK[1]=false
		return OK
	end
end 	
function QMPlugin.FullUBTMEX(data,TM,click)
	if FullUBTM(data,TM,click) and FullUBEX(data,TM,click) then
		return true
	else
		return false
	end
end 
function QMPlugin.FullUBTMEX2(data,TM,click)
	local GOOD={-1}
	local OK = FullUBTM2(data,TM,click)  
	if  OK[1]~=-1 and OK[1]~=false then
		GOOD=FullUBEX2(data,TM,click) 
	end
	if GOOD[1]~=-1 and GOOD[1]~=false then
		return OK
	else
		--OK[1]=false
		return OK
	end
end 
function sleep(tm)
    if tm==nil then tm=1000 end
	LuaAuxLib.KeepReleaseScreenSnapshot(0)  	
	LuaAuxLib.Sleep(tm)
end
function counter()
	LuaAuxLib.URL_OperationGet("http://monster.gostats.cn/bin/count/a_487697/t_5/i_1/counter.png", 3)
	counter = function() end
end
function ms(...)
     --LuaAuxLib.TracePrint(...)
     --LuaAuxLib.ShowMessage(...)  
end 


