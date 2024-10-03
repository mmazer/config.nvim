local user_command = require("u.nvim").user_command
user_command("Json :set ft=json | %!python3 -m json.tool")
user_command("Strip :call vlib#strip()")
user_command("Bpath :echo expand('%:p')")
user_command("Yaml :set ft=yaml")
-- Used in place of GBrowse
vim.cmd([[ command! -nargs=1 Browse silent exec '!open "<args>"' ]])
vim.cmd([[command! LocalTerm let s:term_dir=expand('%:p:h') | below new | call termopen([&shell], {'cwd': s:term_dir }) ]])
vim.cmd([[command! Dos2Unix :%s/\r//g ]])
