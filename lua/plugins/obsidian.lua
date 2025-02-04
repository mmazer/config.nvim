return {
  dir = "~/.config/nvim/lua/u/plugins/obsidian",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim"
  },
  config = function()
    require("obsidian").setup()
  end
}
