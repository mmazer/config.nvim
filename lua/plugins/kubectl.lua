return {
  dir = "~/.config/nvim/lua/u/plugins/kubectl",
  config = function()
    require("kubectl").setup()
  end
}
