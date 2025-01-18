return {
    "stevearc/oil.nvim",
    config = function()
        require("oil").setup({
          keymaps = {
            ["<BS>"] = "actions.parent",
            ["<C-h>"] = false,
            ["<C-l>"] = false,
            ["<C-f>"] = "actions.refresh",
            ["<C-t>"] = false,
            ["<leader>o"] = "<CMD>silent exec '!open ' . expand('%:p')[6:]<CR>",
          }
        })
        vim.keymap.set({"n"}, "-", "<CMD>Oil<CR>", {silent = true})
    end
}
