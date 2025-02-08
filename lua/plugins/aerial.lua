return {
  "stevearc/aerial.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons"
  },
  config = function()
    local nmap = require("u.nvim").nmap
    require("aerial").setup()
    nmap("coa", ":AerialToggle<CR>")
  end
}
