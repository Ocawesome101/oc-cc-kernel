-- An elegant way of handling errors, from a more civilized age.... --

local errors = {}

local function baseError(msg)
  local oldcolor = getTextColor()
  setTextColor(colors.red)
  write("err: " .. msg .. "\n")
  setTextColor(oldcolor)
end

function errors.notFoundError(obj)
  baseError(obj .. " not found")
end

function errors.accessDeniedError()
  baseError("Access denied")
end

function errors.fileNotFoundError(file)
  notFoundError(file or "File")
end

function errors.programNotFoundError(program)
  notFoundError(program or "Program")
end

return errors
