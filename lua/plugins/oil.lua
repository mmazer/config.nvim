return {
    "stevearc/oil.nvim",
    config = function()
        require("oil").setup({
          keymaps = {
            ["<BS>"] = "actions.parent",
          }
        })
        local nmap = require("u.nvim").nmap
        nmap("-", ":Oil<CR>")
    end
}
