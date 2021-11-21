local u = require 'u'
local map = u.nvim.map
local nmap = u.nvim.nmap
local vmap = u.nvim.vmap
local imap = u.nvim.imap
local tmap = u.nvim.tmap

nmap( '<leader>q', ':qa<cr>')
nmap( 'Q!', ':qa!<cr>')
nmap( '<space><space>', ':')

map('i', 'kj', '<esc>')

nmap('<space>w', ':w<cr>')

-- manage windows and tabs
nmap( 'W', '<c-w>')

-- window navigation consistent with term mode mappings
nmap( '<C-h>', '<C-w>h')
nmap( '<C-j>', '<C-w>j')
nmap( '<C-k>', '<C-w>k')
nmap( '<C-l>', '<C-w>l')

nmap('<space>j', 'J')

-- move to middle of line
nmap( 'gm', ":call cursor(0, virtcol('$')/2)<cr>")
nmap( 'gh', '^')
nmap( 'gl', '$')

nmap( 'Y', 'y$')

-- quick one line expressions
nmap( '<space>x', ':<c-r>=')

-- close quickfix, location list and preview
nmap( 'qq', ':cclose<cr>', {silent = true})
nmap( 'ql', ':lclose<cr>', {silent = true})
nmap( 'qp', ':pclose<cr>', {silent = true})

-- buffers
nmap( 'gob', ':ls<cr>')
nmap( '<space>B', ':b#<cr>')
nmap( '<leader>d', ':bd<cr>')
nmap('<space>d', ':bp | bd #<cr>', {silent=true})

-- search
-- Use Perl/Ruby style regex patterns
-- See http://briancarper.net/blog/448/
nmap( '/', '/\\v')
vmap('/', '/\\v')

-- toggle case of words
nmap( '[w', 'gUiw')
nmap( ']w', 'guiw')

-- end line with semicolon
imap(';]', '<C-\\><C-O>:call vlib#preserve("s/$/;/")<cr>', {silent = true})
nmap('<space>;',  ':call vlib#preserve("s/$/;/")<CR>', {silent = true})

-- end line with comma
imap(',]', '<C-\\><C-O>:call vlib#preserve("s/$/,/")<cr>', {silent = true})
nmap('<space>,',  ':call vlib#preserve("s/$/,/")<CR>', {silent = true})

-- clipboard
-- copy and paste to system clipboard
vmap('<C-c>', '"+y')
vmap('C-x>', '"+c')
vmap('<c-v>', 'c<esc>"+pa')
imap('<c-v>', '<esc>"+pa')

-- terminal
tmap('<m-[>', '<c-\\><c-n>')

-- folding
nmap('<space>z', 'za')
vmap('<space>z', 'za')

-- refocus fold under cursor - from Steve Losh
nmap(',z', 'zMzvzz')

-- source vimscript visual selection or line - from Steve Losh
vmap('X', "y:execute @@<cr>:echo 'Sourced selection.'<cr>")
nmap('X', "^vg_y:execute @@<cr>:echo 'Sourced line.'<cr>")


map("", '<C-g>', ':call indent_guide#toggle()<cr>')
nmap('<leader>b', ':Bonly<cr>')
