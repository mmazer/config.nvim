command! -nargs=* Kube :Shell kubectl <args>
cab kube Kube
command! -nargs=* KubeList :Shell kubectl get <args>
command! -nargs=* KubeShow :Shell kubectl describe <args>
cab kubeshow KubeShow
command! -nargs=* KubePods :Shell kubectl get po --show-labels <args>
command  -nargs=* KubeSvc :Shell kubectl get svc --show-labels <args>
command  -nargs=* KubeNodes :Shell kubectl get nodes --show-labels <args>
command  -nargs=* Krons :Shell kubectl get cronjobs --show-labels <args>
command  -nargs=* Kjobs :Shell kubectl get jobs --show-labels <args>
