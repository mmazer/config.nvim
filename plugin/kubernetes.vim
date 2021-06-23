command! -nargs=* Kube :Shell kubectl <args>
command! -nargs=* Kget :Shell kubectl get <args>
cab kget Kget
command! -nargs=* Kdesc :Shell kubectl describe <args>
cab kdesc Kdesc
command! -nargs=* KubePods :Shell kubectl get po --show-labels <args>
command  -nargs=* KubeSvc :Shell kubectl get svc --show-labels <args>
command  -nargs=* KubeNodes :Shell kubectl get nodes --show-labels <args>
command  -nargs=* Krons :Shell kubectl get cronjobs --show-labels <args>
command  -nargs=* Kjobs :Shell kubectl get jobs --show-labels <args>
command  -nargs=* Kexpl :Shell kubectl explain <args>
cab kexpl Kexpl
