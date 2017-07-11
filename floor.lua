term.clear()
term.setCursorPos(1,1)

local cpu_label = os.getComputerLabel()
local owner, eid, level = string.match(cpu_label, "(%a+)-e(%d)f(%d)")

level = tonumber(level)

print("Starting up Elevator ".. eid .." Level ".. level .."!")
 
local modem = peripheral.wrap("back")
modem.open(10)
 
while true do
   local event, side, rxChan, txChan,
   msg, rxDist = os.pullEvent("modem_message")
 
   if rxChan == 10 and txChan == 9249 then
      if msg == level then
	 print("Activating level ".. level ..".")
	 redstone.setOutput("left", true)
      else
	 print("Deactivating level ".. level ..".")
	 redstone.setOutput("left", false)
      end
   end
end
