local actions = require "telescope.actions"
local actions_state = require "telescope.actions.state"

local M = {}
local zettelkasten

local function get_filename(entry)
  return entry.filename:match("[^/]*.$")
end

local function get_zettelkasten()
  local zk = zettelkasten
  if not zk then
    zk = vim.g.zettelkasten or vim.env.ZETTELKASTEN
  end
  return zk
end

local function normalize_name(text)
  local str = text:gsub("-", " ")
  str = str:gsub("%a", string.upper, 1)
  return str
end

local function vim_paste(text)
  vim.api.nvim_paste(text, true, -1)
end

local function paste_link(entry, opts)
  local filename = get_filename(entry)
  local id, name = filename:match("^(%d+)-(.+).md$")
  local link = string.format("[[%s]] %s", id, normalize_name(name))

  vim_paste(link)
end

M.setup = function(ext_config, config)
  ext_config = ext_config or {}
  zettelkasten = ext_config.zettelkasten
end

M.paste_link = function(opts)
  opts = opts or {}
  opts.prompt_title = "Zettel - Files"
  opts.cwd = get_zettelkasten()
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
