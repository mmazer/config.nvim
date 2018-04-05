command! -nargs=* Kube :Shell kubectl <args>
command! -nargs=* KubeList :Shell kubectl get <args>
command! -nargs=* KubeShow :Shell kubectl describe <args>
command! -nargs=* KubePods :Shell kubectl get po --show-labels <args>
command  -nargs=* KubeSvc :Shell kubectl get svc --show-labels <args>
command  -nargs=* KubeNodes :Shell kubectl get nodes --show-labels <args>
