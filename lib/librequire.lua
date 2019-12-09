-- Require --

local requirePath = "/lib/"

function require(file)
  if not fs.exists(requirePath .. file .. ".lua") then
    error("Could not find " .. file .. " under " .. requirePath)
  end

  local ok, err = loadfile(requirePath .. file .. ".lua")

  if not ok then
    error(err)
    return nil
  end

  return ok()
end
