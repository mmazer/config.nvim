vim.opt_local.shiftwidth = 2
vim.opt_local.softtabstop=2
vim.opt_local.wrap = true
vim.opt_local.suffixesadd = ".txt,.md"
vim.keymap.set({"n"}, "gz", function() vim.cmd(":normal vi]gf<CR>") end,
  {silent = true, buffer=true})
