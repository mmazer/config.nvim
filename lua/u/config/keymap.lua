vim.keymap.set({"n"}, "<leader>q", ":qa<cr>")
vim.keymap.set({"n"}, "Q!", ":qa!<cr>")
vim.keymap.set({"n"}, "<space><space>", ":")
vim.keymap.set({"i"}, "kj", "<esc>")
vim.keymap.set({"n"}, "<space>s", ":update<cr>")

-- manage windows and tabs
vim.keymap.set({"n"}, "W", "<C-W>")

-- window navigation consistent with term mode mappings
vim.keymap.set({"n"}, "<C-h>", "<C-w>h")
vim.keymap.set({"n"}, "<C-j>", "<C-w>j")
vim.keymap.set({"n"}, "<C-k>", "<C-w>k")
vim.keymap.set({"n"}, "<C-l>", "<C-w>l")

vim.keymap.set({"n"}, "<space>j", "J")

-- move to middle of line
vim.keymap.set({"n"}, "gm", ":call cursor(0, virtcol('$')/2)<cr>")
vim.keymap.set({"n"}, "gh", "^")
vim.keymap.set({"n"}, "gl", "$")

vim.keymap.set({"n"}, "Y", "y$")

-- quick one line expressions
vim.keymap.set({"n"}, "<space>x", ":<C-r>=")

-- buffers
vim.keymap.set({"n"}, "gob", ":ls<cr>")
vim.keymap.set({"n"}, "<space>B", ":b#<cr>")

-- close the current buffer but preserve split

vim.keymap.set({"n"}, "<leader>d", ":bp <bar> bd! #<cr>")
vim.keymap.set({"n"}, "<leader>D",  ":bd!<cr>")

-- clipboard
-- copy and paste to system clipboard
vim.keymap.set({"v"}, "<C-c>", "\"+y")
vim.keymap.set({"v"}, "<C-x>", "\"+c")
vim.keymap.set({"v"}, "<c-p>", "c<esc>\"+pa")
vim.keymap.set({"i"}, "<c-p>", "<esc>\"+pa")

-- reselect visual block after indent
vim.keymap.set({"v"}, "<", "<gv")
vim.keymap.set({"v"}, ">", ">gv")

-- toggle case of words
vim.keymap.set({"n"}, "[w", "gUiw")
vim.keymap.set({"n"}, "]w", "guiw")

-- close quickfix, location list and preview
vim.keymap.set({"n"}, "qq", ":cclose<cr>", {silent=true})
vim.keymap.set({"n"}, "ql", ":lclose<cr>", {silent=true})
vim.keymap.set({"n"}, "qp", ":pclose<cr>", {silent=true})

-- terminal
vim.keymap.set({"t"}, "<C-]>", "<C-\\><C-n>")

--- delete all buffers and reopen current
vim.keymap.set({"n"}, "<leader>b", ":update <bar> %bd <bar> e# <bar> '\"<cr>", { silent = true })

vim.keymap.set({""}, "<C-g>", ":call indent_guide#toggle()<cr>", {silent=true})

-- end line with semicolon
vim.keymap.set({"i"}, ";]", "<C-\\><C-O>:call vlib#preserve('s/$/;/')<cr>", {silent = true})
vim.keymap.set({"n"}, "<space>;",  ":call vlib#preserve('s/$/;/')<cr>", {silent = true})

-- end line with comma
vim.keymap.set({"i"}, ",]", "<C-\\><C-O>:call vlib#preserve('s/$/,/')<cr>", {silent = true})
vim.keymap.set({"n"}, "<space>,",  ":call vlib#preserve('s/$/,/')<cr>", {silent = true})

vim.keymap.set({"n"}, "<leader>f", ":echom expand('%:p').':'.line('.')<cr>", {silent=true})
vim.keymap.set({"n"}, "<leader>y", ":let @+=expand('%:p').':'.line('.')<cr>", {silent=true})

-- tab navigation
vim.keymap.set({"n"}, "th", ":tabfirst<CR>")
vim.keymap.set({"n"}, "tk", ":tabnext<CR>")
vim.keymap.set({"n"}, "tj", ":tabprev<CR>")
vim.keymap.set({"n"}, "tl", ":tablast<CR>")
