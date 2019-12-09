-- Init system --

local log = ...
local lib = "/lib/"

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

if not ok then
  error("Could not load /etc/init.conf")
end

local apis = ok()

for i=1, #apis, 1 do
  log("Loading " .. apis[i])
  local ok, err = loadfile(lib .. apis[i])
  if not ok then log("WARNING: Could not load " .. apis[i] .. " from " .. lib .. apis[i])
  else setfenv(ok, _G); ok() end
end
