local configs = {
  'env',
  'settings',
  'plugins',
  'plugin_settings',
  'lsp',
  'keymaps',
  'commands',
  'statusline',
  'colors',
  'autocmds',
  'abbreviations'
}

for _, cfg in ipairs(configs) do
  require('u.config.'..cfg)
end

local site_config = vim.env.VIMDATA..'/site/lua/site.lua'
if vim.fn.filereadable(site_config) ~= 0 then
  require 'site'
end
