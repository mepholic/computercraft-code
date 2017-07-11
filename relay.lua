-- init
term.clear()
term.setCursorPos(1,1)

local cpu_label = os.getComputerLabel()
local owner, ident = string.match(cpu_label, "(%a+)-(.+)")

print("Starting wireless/wired relay ".. ident .."!")
sleep(0.5)

-- specify modems here
local wireless = peripheral.wrap("right")
local wired = peripheral.wrap("bottom")

-- open ports here
wireless.open(10)

-- relay here
while true do
   local event, side, rxchan, txchan, msg, dist = os.pullEvent("modem_message")

   if side == "right" then
      print("WAN->LAN | RX: ".. rxchan .. " | TX: ".. txchan .." | MSG: ".. msg)
      wired.transmit(rxchan, txchan, msg)
   elseif side == "bottom" then
      print("LAN->WAN | RX: ".. rxchan .. " | TX: ".. txchan .." | MSG: ".. msg)
      wireless.transmit(rxchan, txchan, msg)
   else
      print("wat")
   end
end
