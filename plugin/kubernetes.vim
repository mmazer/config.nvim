command! -nargs=* Kube :Shell kubectl <args>
cab kube Kube
command! -nargs=* Kdel :Shell kubectl delete <args>
cab kdel Kdel
command! -nargs=* Kget :Shell kubectl get <args>
command! -nargs=* Kgety :Shell kubectl get -o yaml <args>
cab kget Kget
cab kgety Kgety
command! -nargs=* Kdesc :Shell kubectl describe <args>
cab kdesc Kdesc
command! -nargs=1 Kpod :Shell kubectl get -o yaml pod/<args>
command! -nargs=* Kpods :Shell kubectl get po --show-labels <args>
command  -nargs=* KSvc :Shell kubectl get svc --show-labels <args>
command  -nargs=* Knodes :Shell kubectl get nodes --show-labels <args>
cab knodes Knodes
command  -nargs=1 Knodepods :Shell kubectl get pods -o wide --field-selector spec.nodeName=<args>
command  -nargs=* Krons :Shell kubectl get cronjobs --show-labels <args>
command  -nargs=* Kjobs :Shell kubectl get jobs --show-labels <args>
command  -nargs=* Kexpl :Shell kubectl explain <args>
cab kexpl Kexpl
command  -nargs=* KubeApi :Shell kubectl api-resources <args>
cab kapi KubeApi
command Kver :Shell kubectl version -o yaml
command -nargs=* Kapply exec ':Shell kubectl apply -f '. expand("%:p")
cab kapply Kapply
