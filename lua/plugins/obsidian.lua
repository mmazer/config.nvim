return {
  dir = "~/.config/nvim/lua/u/plugins/obsidian",
  opts = {
    keys = {
      { "gn", function() require("obsidian").goto() end },
      { "<leader>nl", function() require("obsidian").links() end },
      { "<leader>nl", function() require("obsidian").links() end },
      { "<C-n>", function() require("obsidian").links() end, mode = {"i"} },
      { "<leader>dn", function() require("obsidian").daily() end },
    }

  }
}
