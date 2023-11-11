command! -nargs=* Helm :Shell helm <args>
command! -nargs=* Hlist :Shell helm list <args>
command! -nargs=* Hsearch :Shell helm search repo <args>
command! -nargs=* Hstat :Shell helm status <args>
command! -nargs=* Hvals :Shell helm get values <args>
command! -nargs=* Hman :Shell helm get manifest <args>
command! -nargs=* Hhist :Shell helm history <args>

