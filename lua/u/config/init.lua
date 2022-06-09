_UserConfig = _UserConfig or {}

local M = {}
local config = _UserConfig

function M.set(key, value)
  config[key] = value
end

function M.get(key, default)
  local value = config[key]
  if value == nil then
    value = default
  end
  return value
end

function M.toggle(key)
  if not M.exists(key) then return end

  local val = M.get(key)
  if val then
    M.set(key, false)
  else
    M.set(key, true)
  end
end

function M.setdefault(key, value)
  if not M.exists(key) then
    M.set(key, value)
  end
  return M.get(key)
end

function M.remove(key)
  config[key] = nil
end

function M.exists(key)
  return config[key] ~= nil
end

return M
