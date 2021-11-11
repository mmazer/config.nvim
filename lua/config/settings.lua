local opt = vim.opt
local env = vim.env

opt.directory=env.VIMCACHE..'/swap'
opt.undodir=env.VIMCACHE..'/undo'
opt.backupdir=env.VIMCACHE..'/backup'

opt.syntax = 'on'
opt.backup = true
opt.swapfile = false
opt.shortmess='aTIoO'
opt.list = true
opt.number = true
opt.ruler = true
opt.cursorline = true
opt.title = true
opt.hidden = true
opt.modeline = true
opt.showmatch = true
opt.scrolloff = 2
opt.wildmenu = true
opt.wildmode = 'list:longest'
opt.showcmd = false
opt.expandtab = true
opt.shiftwidth = 4
opt.softtabstop = 4
opt.wrap = false
opt.linebreak = false
opt.textwidth = 0
opt.autoread = true
opt.laststatus = 2
opt.encoding = 'utf-8'
opt.inccommand = 'split'
opt.listchars  = { tab = '┆ ' , trail = '·', nbsp = '¬',extends = '›', precedes = '‹'}
opt.splitbelow = true
opt.splitright = true
opt.foldenable = false
opt.ffs= {'unix', 'mac'}
opt.ff='unix'

-- completion
opt.completeopt = { 'longest', 'menuone','preview' }
