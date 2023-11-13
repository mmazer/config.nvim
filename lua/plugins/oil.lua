return {
    "stevearc/oil.nvim",
    config = function()
        require("oil").setup({
          keymaps = {
            ["<BS>"] = "actions.parent",
            ["<C-h>"] = false,
            ["<C-l>"] = false,
          }
        })
        local nmap = require("u.nvim").nmap
        nmap("-", ":Oil<CR>")
    end
}
