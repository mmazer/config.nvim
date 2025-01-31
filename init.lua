local configs = {
  "env",
  "settings",
  "keymap",
  "statusline",
  "plugin",
  "abbreviations",
  "colors",
  "commands",
  "autocmds",
  "lsp",
  "terminal"
}

for _, cfg in ipairs(configs) do
  require("u.config."..cfg)
end

local site_config = vim.env.VIMDATA.."/site/lua/site.lua"
if vim.fn.filereadable(site_config) ~= 0 then
  require "site"
end
