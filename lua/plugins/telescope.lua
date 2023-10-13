return {
  {"nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim"
    },
    config = function()
      local telescope = require("telescope")
      telescope.setup {
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case"
          }
        }
      }
      telescope.load_extension("fzf")
      telescope.load_extension("favourites")
      telescope.load_extension("nvim_commands")

      local nmap = require("u.nvim").nmap
      nmap("<space>f", "<cmd>lua require('telescope.builtin').find_files()<cr>")
      nmap("<space>b", "<cmd>lua require('telescope.builtin').buffers()<cr>")
      nmap("<space>h", "<cmd>lua require('telescope.builtin').command_history()<cr>")
      nmap("<space>H", "<cmd>lua require('telescope.builtin').help_tags()<cr>")
      nmap("<space>m", "<cmd>lua require('telescope.builtin').man_pages()<cr>")
      nmap("<space>q", "<cmd>lua require('telescope.builtin').quickfix()<cr>")
      nmap("<space>r", "<cmd>lua require('telescope.builtin').oldfiles()<cr>")
      nmap("<space>v", "<cmd>lua require('telescope').extensions.favourites.favourite_files()<cr>")
      nmap("<space>c", "<cmd>lua require('telescope').extensions.nvim_commands.commands()<cr>")
    end
  },
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
}
