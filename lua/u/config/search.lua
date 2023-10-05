local opt = vim.opt
local u_nvim = require("u.nvim")

-- search
opt.incsearch = true
opt.hlsearch = true
opt.ignorecase = true
opt.smartcase = true  -- case sensitive if search term contains upppecase letter

-- search
-- Use Perl/Ruby style regex patterns
-- See http://briancarper.net/blog/448/
u_nvim.nmap( "/", "/\\v")
u_nvim.vmap("/", "/\\v")


