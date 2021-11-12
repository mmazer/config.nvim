local g = vim.g

local disabled_plugins = {
  'netrw',
  'netrwPlugin',
  'zipPlugin',
  'tarPlugin',
  'gzipPlugin',
  'fzfExt'
}

for _, plug in ipairs(disabled_plugins) do
  g['loaded_'..plug] = 1
end

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()

  use {"wbthomason/packer.nvim", opt = true}

  use 'tpope/vim-fugitive'

  use 'tpope/vim-unimpaired'

  use 'tpope/vim-surround'

  use 'tpope/vim-commentary'

  use 'hrsh7th/cmp-nvim-lsp'

  use 'hrsh7th/cmp-buffer'
  
  use 'hrsh7th/cmp-path'

  use 'hrsh7th/cmp-cmdline'

  use 'hrsh7th/nvim-cmp'

  use 'mhinz/vim-grepper'

  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  use {
    'kyazdani42/nvim-tree.lua',
    config = function() require'nvim-tree'.setup {} end
  }

  use 'neovim/nvim-lspconfig'

  use 'liuchengxu/vista.vim'

  use 'tanvirtin/monokai.nvim'

  use 'christoomey/vim-tmux-navigator'

  use 'akinsho/toggleterm.nvim'

end)
