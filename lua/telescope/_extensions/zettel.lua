local has_telescope, telescope = pcall(require, "telescope")

if not has_telescope then
  error "This plugin requires telescope.nvim (https://github.com/nvim-telescope/telescope.nvim)"
end

local zettel = require 'telescope._extensions.zettel.main'

return telescope.register_extension{
  setup = zettel.setup,
  exports = { find_zettels = zettel.find_zettels }
}

