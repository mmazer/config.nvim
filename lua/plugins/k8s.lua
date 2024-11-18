return {
  "mmazer/k8s.nvim",
  config = function()
    require("kubectl").setup()
    vim.keymap.set({"n"}, "<leader>k", ":Kubectl<CR>", {silent=true})
  end
}
