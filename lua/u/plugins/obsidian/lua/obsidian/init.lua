local snacks = require("snacks")
local libplug = require("u.libplug")

local M = {}
local options

local function get_obsidian_vault(opts)
  local vault = opts.vault or options.vault
  if not vault then
    vault = vim.g.obsidian_vault or vim.env.OBSIDIAN_VAULT
  end
  return vault
end

local function vim_paste(text)
  vim.api.nvim_paste(text, true, -1)
end

local function paste_link(file)
  local name = file:match("^(.+).md$")
  local link = string.format("[[%s]]", name)

  vim_paste(link)
end

M.goto = function()
  vim.cmd(":normal vi]gf<CR>")
end

M.setup = function(opts)
  options = opts or {}
  local keys = options.keys or {}
  libplug.setkeymap({ "n" }, keys)
end

M.links = function(opts)
  opts = opts or {}
  opts.title = "Obsidian - Files"
  snacks.picker.files({
    cwd = opts.cwd or get_obsidian_vault(opts),
    title = opts.title or " Obsidian Notes",
    confirm = function(picker, item)
      picker:close()
      paste_link(item.file)
    end
  })
end

return M
