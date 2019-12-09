-- Init system --

local log, setTextColor, getTextColor = ...

local function printStylized(...)
  local args = {...}
  for i=1, #args, 1 do
    if type(args[i]) == "number" then
      setTextColor(args[i])
    elseif type(args[i]) == "string" then
      write(args[i])
    end
  end
  write("\n")
end

print("")

printStylized(colors.white, "Welcome to ", colors.lightBlue, "oc-cc-kernel", colors.white, "!")

print("")
sleep(0.2)

log("Reading configuration from /etc/init.conf")
local ok, err = loadfile("/etc/init.conf")
