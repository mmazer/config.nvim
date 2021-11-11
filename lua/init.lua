-- Resources:
-- https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua/
-- https://github.com/nanotee/nvim-lua-guide
-- https://www.imaginaryrobots.net/2021/04/17/converting-vimrc-to-lua
-- https://www.2n.pl/blog/how-to-write-neovim-plugins-in-lua
-- https://github.com/VonHeikemen/dotfiles/tree/master/my-configs/neovim
-- https://github.com/jdhao/nvim-config
-- https://github.com/nvim-lua/kickstart.nvim

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


