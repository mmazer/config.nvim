return {
  "mmazer/k8s.nvim",
  config = function()
    require("kubectl").setup({
      resource_specs = {
        backendconfigs={shortnames={"becfg"}},
        frontendconfigs={shortnames={"fecfg"}},
        sealedsecrets={},
        datadogmetrics={shortnames={"ddm"}},
        helmcharts={},
        helmreleases={shortnames={"hr"}},
        helmrepositories={shortnames={"helmrepo"}},
        kustomizations={shortnames={"ks"}},
        managedcertificates={shortnames={"mc"}},
      }
    })
    vim.keymap.set({"n"}, "<leader>k", ":Kubectl<CR>", {silent=true})
    vim.cmd("cab kube Kubectl")
  end
}
