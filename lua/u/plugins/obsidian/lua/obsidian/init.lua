local actions = require "telescope.actions"
local actions_state = require "telescope.actions.state"

local M = {}
local obsidian_vault

local function get_filename(entry)
  return entry.filename:match("[^/]*.$")
end

local function get_obsidian_vault()
  local vault = obsidian_vault
  if not vault then
    vault = vim.g.obsidian_vault or vim.env.OBSIDIAN_VAULT
  end
  return vault
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
  local name = filename:match("^(.+).md$")
  local link = string.format("[[%s]]", normalize_name(name))

  vim_paste(link)
end

M.setup = function(ext_config, config)
  ext_config = ext_config or {}
  obsidian_vault = ext_config.obsidian_vault

  vim.keymap.set({"n"}, "gz",
    function() vim.cmd(":normal vi]gf<CR>") end,
    {silent = true})

  vim.keymap.set({"n"}, "<leader>zl",
    function() require("telescope").extensions.obsidian.paste_link() end,
     {silent = true})
end

M.paste_link = function(opts)
  opts = opts or {}
  opts.prompt_title = "Zettel - Files"
  opts.cwd = get_obsidian_vault()
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
  require("telescope.builtin").find_files(opts) end

return M
