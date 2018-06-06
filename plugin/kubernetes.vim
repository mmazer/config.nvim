command! -nargs=* Kube :Shell kubectl <args>
cab kube Kube
command! -nargs=* Klist :Shell kubectl get <args>
cab klist Klist
command! -nargs=* Kshow :Shell kubectl describe <args>
cab kshow Kshow
command! -nargs=* KubePods :Shell kubectl get po --show-labels <args>
command  -nargs=* KubeSvc :Shell kubectl get svc --show-labels <args>
command  -nargs=* KubeNodes :Shell kubectl get nodes --show-labels <args>
command  -nargs=* Krons :Shell kubectl get cronjobs --show-labels <args>
command  -nargs=* Kjobs :Shell kubectl get jobs --show-labels <args>
command  -nargs=* Kexpl :Shell kubectl explain <args>
cab kexpl Kexpl
