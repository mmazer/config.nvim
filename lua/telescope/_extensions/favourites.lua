local has_telescope, telescope = pcall(require, "telescope")

if not has_telescope then
  error "This plugin requires telescope.nvim (https://github.com/nvim-telescope/telescope.nvim)"
end

local favourites = require 'telescope._extensions.favourites.main'

return telescope.register_extension{
  setup = favourites.setup,
  exports = { favourite_files = favourites.files }
}

