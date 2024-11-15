return {
  "mmazer/k8s.nvim",
  config = function()
    require("kubectl").setup()
  end
}
