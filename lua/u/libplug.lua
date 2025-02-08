local libfile = require("u.file")
local assert = require("u.nvim").assert
local M = {}


M.setkeymap = function(mode, map)
  for _, keymap in ipairs(map) do
    vim.keymap.set(mode, keymap[1], keymap[2])
  end
end

M.datafile = function(path)
  local xdg_data_home = os.getenv("XDG_DATA_HOME")
  if not xdg_data_home then
    error("XDG_DATA_HOME environment variable must be set")
  end
  local file = xdg_data_home .. "/" .. path
  local is_readable = libfile.is_readable(file)
  assert(is_readable, "XDG data file not found or not readable: %s", file)
  return file
end

return M
