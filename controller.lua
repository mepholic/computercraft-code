local cpu_label = os.getComputerLabel()
local owner, eid, ctlr = string.match(cpu_label, "(%a+)-e(%d)c(%d)")

print("Starting up Elevator ".. eid .." Controller ".. ctlr .."!")
sleep(3)

local modem = peripheral.wrap("top")

function reset_term ()
   term.clear()
   term.setCursorPos(1,1)
end

while true do
   -- Print terminal and read user input
   reset_term()
   print("Floor Number: ")
   print("---------------------------------------------------")
   print("0: Living Quarters & Storage")
   print("1: Tree Farm, Power Generation, Bulk Quarry Intake")
   print("2: Rail Station")
   print("3: Bulk Storage")
   print("4: ")
   print("5: ")
   print("6: ")
   print("7: ")
   print("8: ")
   term.setCursorPos(15, 1)
   local dest = read()

   -- Process user input
   if tonumber(dest) ~= nil and dest >= 0 then
      reset_term()
      print("Activating elevator floor ".. dest ..".")
      modem.transmit(10, 9249, dest)
      sleep(5)
   else
      reset_term()
      print("Invalid floor specified!")
      sleep(5)
   end
end
