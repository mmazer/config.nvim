local M = {}

M.timestamp = function()
  return os.date("%Y-%m-%dT%H:%M:%S")
end

M.timestamp_utc = function()
  return os.date("!%Y-%m-%dT%H:%M:%S")
end

M.timestamp_id = function()
  return os.date("%Y%m%d%H%M%S")
end

M.datetime = function()
  return os.date("%Y-%m-%d %H:%M")
end

M.time = function()
  return os.date("%H:%M")
end

M.date = function()
  return os.date("%Y-%m-%d")
end

return M
