return {
  dir = "~/.config/nvim/lib/kubectl",
  config = function()
    require("kubectl").setup()
  end
}
