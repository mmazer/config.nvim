return {
  dir = "~/.config/nvim/lua/u/plugins/obsidian",
  dependencies = {
    "nvim-telescope/telescope.nvim"
  },
  config = function()
    local telescope = require("telescope")
    telescope.load_extension("obsidian")
  end
}
