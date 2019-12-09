-- Provide methids to lock certain files away from regular users --

local errors = require("liberrors")
local oldfs = fs

local protected = {"/etc/", "/lib/", "/bin/"}

function fs.protected()
  return protected
end

function fs.isProtected(file)
  for i=1, #protected, 1 do
    if file:find(protected[i]) == 1 then
      return true
    end
  end

  return false
end

local function userCanAccess(file)
  if fs.isProtected(file) then
    if users.user() == ("root" or "system") and users.uid() == (0 or -1) then
      return true
    else
      return false
    end
  else
    return true
  end
end

function fs.open(file, mode)
  if not userCanAccess(file) then
    errors.accessDeniedError()
    return false
  end

  return oldfs.open(file, mode)
end

function fs.delete(file)
  if not userCanAccess(file) then
    errors.accessDeniedError()
    return false
  end

  return oldfs.delete(file)
end

function fs.isReadOnly(file)
  if not userCanAccess(file) then
    return true
  end

  return oldfs.isReadOnly(file)
end

function fs.copy(file, dest)
  if userCanAccess(file) and userCanAccess(dest) then
    return oldfs.copy(file, dest)
  else
    errors.accessDeniedError()
    return false
  end
end
