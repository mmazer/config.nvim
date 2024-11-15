return {
  dir = "~/workspace/k8s.nvim",
  config = function()
    require("kubectl").setup()
  end
}
