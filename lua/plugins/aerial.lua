return {
  "stevearc/aerial.nvim",
  dependencies = {
     "nvim-treesitter/nvim-treesitter",
     "nvim-tree/nvim-web-devicons"
  },
  config = function()
    local nmap = require("u.nvim").nmap
    require("aerial").setup()
    require("telescope").load_extension("aerial")
    nmap("<space>a", "<cmd>lua require('telescope').extensions.aerial.aerial()<cr>")
    nmap("coa", ":AerialToggle<CR>")
  end
}
