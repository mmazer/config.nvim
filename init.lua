local configs = {
  'env',
  'settings',
  'plugins',
  'plugin_settings',
  'lsp',
  'keymaps',
  'commands',
  'statusline',
  'colors'
}

for _, cfg in ipairs(configs) do
  require('config.'..cfg)
end

local site_config = vim.env.VIMDATA..'/site/lua/site.lua'
if vim.fn.filereadable(site_config) then
  require('site')
end


