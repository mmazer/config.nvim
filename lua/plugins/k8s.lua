return {
  "mmazer/k8s.nvim",
  config = function()
    require("kubectl").setup({
      resource_specs = {
        sealedsecrets={},
        datadogmetrics={shortnames={"ddmetrics"}},
        helmcharts={},
        helmreleases={shortnames={"hr"}},
        helmrepositories={shortnames={"helmrepo"}},
        kustomizations={shortnames={"ks"}}
      }
    })
    vim.keymap.set({"n"}, "<leader>k", ":Kubectl<CR>", {silent=true})
    vim.cmd("cab kube Kubectl")
  end
}
