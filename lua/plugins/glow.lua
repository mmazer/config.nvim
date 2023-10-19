return {
  "ellisonleao/glow.nvim",
  config = function()
    require("glow").setup({
      width_ratio = 0.90,
      height_ratio = 0.90
    })
  end,
  cmd = "Glow"
}

