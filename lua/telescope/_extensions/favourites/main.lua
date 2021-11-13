local finders = require 'telescope.finders'
local pickers = require 'telescope.pickers'
local config = require('telescope.config').values
local actions = require 'telescope.actions'
local action_state = require 'telescope.actions.state'
local entry_display = require 'telescope.pickers.entry_display'
local u = require 'u'

local M = {}

local favourite_files

local function default_favourite_files()
  xdg_data_home = os.getenv('XDG_DATA_HOME') 
  if not xdg_data_home then
    error('XDG_DATA_HOME environment variable must be set')
  end
  return xdg_data_home..'/nvim/favourite_files'
end

local function parse_favourite(line)
  local title, path = line:match("^(.+)%s+(.+)$")
  return {
    title = title,
    path = path,
  }
end

local function get_favourite_files(path)
  local favourites = {}
  local is_readable = u.file.is_readable(favourite_files)

  u.nvim.assert(is_readable, "favourites file not found or not readable: %s", favourite_files)
  for line in io.lines(path) do
    if line ~= nil and line ~= '' then
      fav = parse_favourite(line)
      table.insert(favourites, fav)
    end
  end
  return favourites
end

M.setup = function(ext_config, config)
  ext_config = ext_config or {}
  favourite_files = ext_config.favourite_files or default_favourite_files()
end

M.files = function(opts)
  opts = opts or {}
  if not favourite_files then
    M.setup()
  end
  local files = get_favourite_files(favourite_files)
  pickers.new(opts, {
    prompt_tile = "Select a file",
    results_tile = "Files",
    finder =  finders.new_table {
      results = files,
      entry_maker = function(entry) 
        return {
          value = entry.path,
          display = entry.title,
          ordinal = entry.title
        }
      end
    },
    sorter = config.generic_sorter(opts),
    previewer = config.file_previewer(opts),
    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        local file = selection.value
        vim.cmd('silent e '..file)
      end)
      return true
    end
  }):find()
end

return M
