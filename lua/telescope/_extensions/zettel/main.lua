local actions = require 'telescope.actions'
local actions_state = require 'telescope.actions.state'

local M = {}
local zettelkasten

local function default_zettelkasten()
  zk = vim.g.zettelkasten or vim.env.ZETTELKASTEN
  return zk
end

local function get_filename(entry)
  return entry.filename:match("[^/]*.$")
end

local function normalize_text(text)
  local str = text:gsub("-", " ")
  str = str:gsub("%a", string.upper, 1)
  return str
end

local function vim_paste(text)
  vim.api.nvim_paste(text, true, -1)
end

local function paste_link(entry)
  local filename = get_filename(entry)
  local id, title = filename:match("^(%d+)-(.+).md$")
  local link = string.format("[[%s]] %s", id, normalize_text(title))
  vim_paste(link)
end

M.setup = function(ext_config, config)
  ext_config = ext_config or {}
  zettelkasten = ext_config.zettelkasten or default_zettelkasten()
end

M.find_zettels = function(opts)
  if not zettelkasten then
    M.setup()
  end
  opts = opts or {}
  opts.prompt_title = "Zettel - Files"
  opts.cwd = zettelkasten
  opts.attach_mappings = function(prompt_bufnr, map)
    local paste = function()
      actions.close(prompt_bufnr)
      local entry = actions_state.get_selected_entry()
      paste_link(entry, opts)
    end
     map("i", "<CR>", paste)
     map("n", "<CR>", paste)
     return true
  end
  require("telescope.builtin").find_files(opts)
end

return M
