local u = require "u"
local map = u.nvim.map
local nmap = u.nvim.nmap
local vmap = u.nvim.vmap
local imap = u.nvim.imap
local tmap = u.nvim.tmap

nmap( "<leader>q", ":qa<cr>")
nmap( "Q!", ":qa!<cr>")
nmap( "<space><space>", ":")

map("i", "kj", "<esc>")

nmap("<space>w", ":w<cr>")

-- manage windows and tabs
nmap( "W", "<c-w>")

-- window navigation consistent with term mode mappings
nmap( "<C-h>", "<C-w>h")
nmap( "<C-j>", "<C-w>j")
nmap( "<C-k>", "<C-w>k")
nmap( "<C-l>", "<C-w>l")

nmap("<space>j", "J")

-- move to middle of line
nmap( "gm", ":call cursor(0, virtcol('$')/2)<cr>")
nmap( "gh", "^")
nmap( "gl", "$")

nmap( "Y", "y$")

-- quick one line expressions
nmap( "<space>x", ":<c-r>=")

-- close quickfix, location list and preview
nmap( "qq", ":cclose<cr>", {silent = true})
nmap( "ql", ":lclose<cr>", {silent = true})
nmap( "qp", ":pclose<cr>", {silent = true})

-- buffers
nmap( "gob", ":ls<cr>")
nmap( "<space>B", ":b#<cr>")
-- close the current buffer but preserve split
nmap( "<leader>d", ":bp <bar> bd #<CR>")
nmap("<leader>D",  ":bd!<cr>")

-- clipboard
-- copy and paste to system clipboard
vmap("<C-c>", "\"+y")
vmap("C-x>", "\"+c")
vmap("<c-p>", "c<esc>\"+pa")
imap("<c-p>", "<esc>\"+pa")

-- reselect visual block after indent
vmap("<", "<gv")
vmap(">", ">gv")

-- toggle case of words
nmap( "[w", "gUiw")
nmap( "]w", "guiw")

-- close quickfix, location list and preview
nmap( "qq", ":cclose<cr>", {silent = true})
nmap( "ql", ":lclose<cr>", {silent = true})
nmap( "qp", ":pclose<cr>", {silent = true})

-- terminal
tmap("<m-[>", "<c-\\><c-n>")

-- quick one line expressions
nmap( "<space>x", ":<c-r>=")

--- delete all buffers and reopen current
nmap("<leader>b", ":update <bar> %bd <bar> e# <bar> '\"<CR>", { silent = true })

map("", "<C-g>", ":call indent_guide#toggle()<cr>")


-- end line with semicolon
imap(";]", "<C-\\><C-O>:call vlib#preserve('s/$/;/')<CR>", {silent = true})
nmap("<space>;",  ":call vlib#preserve('s/$/;/')<CR>", {silent = true})

-- end line with comma
imap(",]", "<C-\\><C-O>:call vlib#preserve('s/$/,/')<cr>", {silent = true})
nmap("<space>,",  ":call vlib#preserve('s/$/,/')<CR>", {silent = true})

local function print_buffer_path()
  local path, linenum = require("u.buffer").get_file_line()
  print(path..":"..linenum)
end

vim.keymap.set({"n"}, "<leader>f", print_buffer_path, {silent=false})
