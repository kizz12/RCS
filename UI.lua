os.queueEvent("sysAuth", 0)
local function buildUI() --sets background
	backGround = window.create(term.current(),1,1,51,50)
	backGround.setBackgroundColor(colors.white)
	backGround.clear()
end

local function getAuth() --require login
	login = window.create(term.current(),15,7,20,3)
	login.setBackgroundColor(colors.orange)
	login.clear()
	login.setTextColor(colors.red)
	login.write("       Login  ")
	posx,posy=login.getCursorPos()
	login.setCursorPos(1,posy+1)
	login.write("Username:")
	local usern=read()
	local posx,posy=login.getCursorPos()
	login.setCursorPos(1,posy+1)
	login.write("Password:")
	local passwd=read("*")

	if (usern=="kizz" and passwd=="123") then
		login.clear()
		login.setCursorPos(1,1)
		login.write("     Success!  ")
		auth=1
		os.queueEvent("sysAuth", 1)
	end
	if (usern~="kizz" or passwd~="123") then
		login.clear()
		login.setCursorPos(1,1)
		login.write("     Failed!   ")
		auth=0
	end
	sleep(1)
	login.setVisible(false)
	if auth~=1 then
	os.reboot()
	end
	
end

local function buildMenu() --sets up options 
	backGround.redraw()
	men1 = window.create(term.current(),5,2,10,5)
	men1.setBackgroundColor(colors.blue)
	men1.clear()
	men1.setCursorPos(1,3)
	men1.write("  Stats")
	men2 = window.create(term.current(),16,2,10,5)
	men2.setBackgroundColor(colors.blue)
	men2.clear()
	men2.setCursorPos(1,3)
	men2.write("   Ctrl")
	men3 = window.create(term.current(),27,2,10,5)
	men3.setBackgroundColor(colors.blue)
	men3.clear()
	men3.setCursorPos(1,3)
	men3.write("  Alarms")
	men4 = window.create(term.current(),38,2,10,5)
	men4.setBackgroundColor(colors.blue)
	men4.clear()
	men4.setCursorPos(1,3)
	men4.write("  Logout")

	--sleep(10)
end

local function listenButton() --provides clickable buttons
	screen=0
	while true do
		local event, button, x, y = os.pullEvent( "mouse_click" )

		if x>=5 and x<=15 and y>=2 and y<=7 then --men1
		men1.setBackgroundColor(colors.green)
		men1.clear()
		screen=1
		return
		end
		if x>=16 and x<=26 and y>=2 and y<=7 then --men2
		men2.setBackgroundColor(colors.green)
		men2.clear()
		screen=2
		return
		end
		if x>=27 and x<=37 and y>=2 and y<=7 then --men3
		men3.setBackgroundColor(colors.green)
		men3.clear()
		screen=3
		return
		end
		if x>=38 and x<=48 and y>=2 and y<=7 then --men4
		men4.setBackgroundColor(colors.green)
		men4.clear()
		screen=4
		return
		end
	end
	
end

function processButton() --handles button function on click
	if screen==1 then
	print'AWEH YEA 1'
	end
	if screen==2 then
	print'AWEH YEA 2'
	end

	if screen==3 then
	print'AWEH YEA 3'
	end

	if screen==4 then
	--print'AWEH YEA 4'
	auth=0
	os.queueEvent("sysAuth", -2)
	buildUI()
	getAuth()
	
	end

end

buildUI()
getAuth()
while true do
buildMenu()
listenButton()
processButton()
sleep(1)
end
print'All done'
sleep(5)
