local u = require "u"
local snacks = require("snacks")
local layouts = require("snacks.picker.config.layouts")

local M = {}

local function get_default_file(path)
  local xdg_data_home = os.getenv("XDG_DATA_HOME")
  if not xdg_data_home then
    error("XDG_DATA_HOME environment variable must be set")
  end
  local file = xdg_data_home .. "/" .. path
  local is_readable = u.file.is_readable(file)
  u.nvim.assert(is_readable, "default file not found or not readable: %s", file)
  return file
end

local function get_favourite_files(path)
  local favourites = {}
  local is_readable = u.file.is_readable(path)

  u.nvim.assert(is_readable, "favourites file not found or not readable: %s", path)
  for line in io.lines(path) do
    if line ~= nil and line ~= "" then
      local file, text = line:match("^(.+)|(.+)$")
      table.insert(favourites, { file = file, text = text })
    end
  end
  return favourites
end

local function is_comment(line)
  return string.find(line, "^#") ~= nil
end

local function get_saved_commands(path)
  local commands = {}
  for line in io.lines(path) do
    if line ~= nil and line ~= "" and not is_comment(line) then
      table.insert(commands, line)
    end
  end
  return commands
end

M.favourites = function(opts)
  opts = opts or {}
  local items = {}
  local file = opts.favourites_file or get_default_file("bookmarks/files")
  local favourites = get_favourite_files(file)
  local longest_name = 0
  for i, favourite in ipairs(favourites) do
    table.insert(items, {
      idx = i,
      score = i,
      text = favourite.text,
      file = vim.fn.expand(favourite.file)
    })
    longest_name = math.max(longest_name, #favourite.text)
  end
  local padding = longest_name + 10
  snacks.picker.pick({
    items = items,
    format = function(item)
      local ret = {}
      ret[#ret + 1] = { item.text, 'SnacksPickerLabel' }
      ret[#ret + 1] = { string.rep(" ", padding - #item.text), virtual = true }
      ret[#ret + 1] = { item.file, "SnacksPickerComment" }
      return ret
    end,
    confirm = function(picker, item)
      picker:close()
      vim.cmd.edit(item.file)
    end,
  })
end

M.commands = function(opts)
  opts = opts or {}
  local items = {}
  local file = opts.saved_commands or get_default_file("nvim/saved_commands")
  local commands = get_saved_commands(file)
  for i, command in ipairs(commands) do
    table.insert(items, {
      idx = i,
      score = i,
      text = command,
      file = file
    })
  end
  snacks.picker.pick({
    items = items,
    format = function(item)
      local ret = {}
      ret[#ret + 1] = { item.text, 'SnacksPickerLabel' }
      return ret
    end,
    confirm = function(picker, item)
      picker:close()
      vim.cmd(item.text)
    end,
    layout = vim.tbl_extend("force", layouts.telescope, { preview = false })
  })
end

M.setup = function(opts)
  opts = opts or {}
  local keys = opts.keys or {}
  for _, keymap in ipairs(keys) do
    vim.keymap.set({ "n" }, keymap[1], keymap[2])
  end
end

return M
