return {
  dir = "~/.config/nvim/lua/u/plugins/obsidian",
  dependencies = {
    "nvim-telescope/telescope.nvim"
  },
  config = function()
    require("obsidian").setup()
  end
}
