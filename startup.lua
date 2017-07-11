term.clear()
term.setCursorPos(1,1)

local cpu_label = os.getComputerLabel()
local owner, ident = string.match(cpu_label, "(%a+)-(.+)")

print("Welcome to Network Boot Management System (NBMS)!")
sleep(0.5)

function is_ident(pattern)
   if string.match(ident, pattern) ~= nil then
      return true
   else
      return false
   end
end

function run(bootcode)
   shell.run("/disk/".. bootcode)
end

if is_ident("^e%df%d+$") then run("floor")
elseif is_ident("^e%dc%d+$") then run("controller")
elseif is_ident("^relay%d+$") then run("relay")
else
   print("Unable to detect boot type.")
   sleep(0.5)
end
