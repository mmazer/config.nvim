return {
  "mhinz/vim-grepper",
  config = function()
    local g = vim.g
    local nmap = require("u.nvim").nmap
    local xmap = require("u.nvim").xmap

    g["grepper"] = { tools = { "rg", "git" }}

    nmap("<leader>g", ":GrepperRg<space>")
    nmap("gs",  "<plug>(GrepperOperator)")
    xmap("gs",  "<plug>(GrepperOperator)")
    nmap("<leader>w",  ":Grepper -tool rg -cword -highlight -noprompt -nojump -switch<cr>")
  end

}
