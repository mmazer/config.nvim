local snacks = require("snacks")
local date = require("u.date")
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

local function paste_link(file)
  local filename = vim.fs.basename(file)
  local name = filename:match("^(.+).md$")
  local link = string.format("[[%s]]", name)
  vim.api.nvim_paste(link, true, -1)
end

M.goto = function()
  vim.cmd(":normal vi]gf<CR>")
end

M.daily = function(opts)
  opts = opts or options
  local vault = get_obsidian_vault(opts)
  local daily_dir = opts.daily
  if not daily_dir then
    daily_dir = vim.g.obsidian_daily or vim.env.OBSIDIAN_DAILY or "daily"
  end
  local daily_note = string.format("%s/%s/%s.md", vault, daily_dir, date.date())
  vim.cmd(":edit "..daily_note)

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
