local has_telescope, telescope = pcall(require, "telescope")

if not has_telescope then
  error "This plugin requires telescope.nvim (https://github.com/nvim-telescope/telescope.nvim)"
end

local obsidian = require("obsidian")

return telescope.register_extension{
  setup = obsidian.setup,
  exports = { paste_link = obsidian.paste_link }
}
