return {
  "mmazer/k8s.nvim",
  config = function()
    require("kubectl").setup({
      user_commands = {
        failedsched = {"get", "events","--field-selector", "reason=FailedScheduling"},
        kustomizevents = {"get", "events","--field-selector", "involvedObject.kind=Kustomization"},
        podowner = {"get", "pod", "--all-namespaces", "-o", "custom-columns=NAME:.metadata.name,CONTROLLER:.metadata.ownerReferences[].kind,NAMESPACE:.metadata.namespace"},
        unhealthy = {"get", "events", "--field-selector", "reason=Unhealthy"}
      },
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
