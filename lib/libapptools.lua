-- Various tools related to applications --

local apptools = {}
local errors = require("liberrors")
local sandbox = require("security/sandbox")
--local installTools = require("apptools/install")

function apptools.run(has, app, ...)
  local sandboxedMetatable = sandbox.setupSandbox(has)
  sandbox.runWithSandbox(sandboxedMetatable, app, ...)
end
--[[
function apptools.installApp(pkg) -- App packages are just folders
  installTools.getInfo(pkg)
end
]]
