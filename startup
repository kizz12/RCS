function init() --begin RCS
	os.pullEvent = os.pullEventRaw
	term.clear()
	auth=0
	print'Welcome to the Reactor Control System v1.0.0'
	sleep(.25)
	--init tabs
	debugSh=multishell.getCurrent()
	multishell.setTitle(debugSh, "Debug")

	--call ui
	print'Launching UI...'
	runUI=multishell.launch({}, "UI")
	multishell.setTitle(runUI, "Reactor UI")
	multishell.setFocus(runUI)
	print'UI Active'

	--call engine
	print'Launching Engine...'
	runEngine=multishell.launch({}, "Engine")
	multishell.setTitle(runEngine, "Reactor Engine")
	print'Engine Active!'
end
--active monitoring notification
function monitorSys()
	while true do
		term.setCursorPos(1,7)
		print'Monitoring RCS.'
		sleep(1)
		term.setCursorPos(1,7)
		print'Monitoring RCS..'
		sleep(1)
		term.setCursorPos(1,7)
		print'Monitoring RCS...'
		sleep(1)
		term.setCursorPos(1,7)
		term.clearLine()
	end
end

function getAuth() --detect auth level
	while true do
	local authEvent, authLevel = os.pullEvent( "sysAuth" )
	auth=authLevel
	sleep(.5)
	end
end

function listenForProb() --actively monitor for problems
	while true do
		if multishell.getCount()~=3 then --If tab lost or gained, reboot!
			ctdn=3
			while ctdn~=0 do
				cX,cY=term.getCursorPos()
				term.setCursorPos(1,cY+1)
				term.clearLine()
				multishell.setFocus(debugSh)
				print('System failure! Rebooting in '..ctdn..'...')
				ctdn=ctdn-1
				sleep(1)
			end
			os.reboot()
		end
		
		if auth==1 then --If admin logs in notify
		cX,cY=term.getCursorPos()
		term.setCursorPos(1,cY)
		term.clearLine()
		print'System admin successfully logged in.'
		auth=-1
		end
		if auth==-2 then
		cX,cY=term.getCursorPos()
		term.setCursorPos(1,cY+1)
		term.clearLine()
		print'System admin successfully logged out.'
		auth=0
		end
		sleep(1)
	end
end	
init()
parallel.waitForAll(monitorSys,getAuth,listenForProb)
