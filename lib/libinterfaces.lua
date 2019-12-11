-- A few miscellaneous interfacing utilities --

local errors = require("liberrors")

function dofile(file)
  local ok, err = loadfile(file)
  if ok then setfenv(ok, _G); return ok() else
  errors.error(err) end
end

function tcopy(tbl)
  local rtn = {}
  for k,v in pairs(tbl) do
    rtn[k] = v
  end
  return rtn
end
