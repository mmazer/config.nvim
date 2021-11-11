local has_telescope, telescope = pcall(require, "telescope")

if not has_telescope then
  error "This plugin requires telescope.nvim (https://github.com/nvim-telescope/telescope.nvim)"
end

local nvim_commands = require 'telescope._extensions.nvim_commands.main'

return telescope.register_extension{
  setup = nvim_commands.setup,
  exports = { commands = nvim_commands.commands }
}

