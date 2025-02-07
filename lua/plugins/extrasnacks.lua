return {
  dir = "~/.config/nvim/lua/u/plugins/extrasnacks",
  opts = {
    keys = {
      { "<leader>v", function() require("extrasnacks").favourites() end },
      { "<leader>c", function() require("extrasnacks").commands() end },
    }
  }
}
