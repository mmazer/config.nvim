local M = {}

M.is_readable = function(path)
  local f = io.open(path, "r")
  if f then
    io.close(f)
    return true
  else
    return false
  end
end

M.is_writable = function(path)
  local f = io.open(path, "w")
  if f then
    io.close(f)
    return true
  else
    return false
  end
end

return M
