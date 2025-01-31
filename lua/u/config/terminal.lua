local user_command = require("u.nvim").user_command
user_command("Vterm :vsplit term://zsh")
user_command("Hterm :split term://zsh")
vim.keymap.set({"t"}, "<C-]>", "<C-\\><C-n>")
