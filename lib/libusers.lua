-- User management. --

local errors = require("liberrors")

local username = "system"
local userid = -1

local root_password = ":(){:|:&}" -- Shhh, don't tell anyone!

users = {}

local function authenticate(user, password)
  local users = loadfile("/etc/userdata/users.lua")()
  local passwords = loadfile("/etc/userdata/passwords.lua")()

  for i=1, #users, 1 do
    if users[i] == user and passwords[i] == password then
      userid = i
      return true -- We're in!
    end
  end

  if user == "root" and password == root_password then
    userid = 0
    return true
  end
  
  errors.accessDeniedError()
  return false -- Better luck next time
end

function users.user()
  return username
end

function users.uid()
  return userid
end

function users.login(user,password)
  if authenticate(user, password) then
    username = user
    return true
  else
    return false
  end
end

function users.homeDir()
  if username ~= "root" then
    return "/home/" .. username
  else
    return "/root"
  end
end

function users.logout()
  username = ""
  userid = -3
end
