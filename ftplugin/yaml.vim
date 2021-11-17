setlocal sw=2
setlocal sts=2
setlocal fdm=indent

autocmd BufWritePost *.yaml,*.yml :Neomake
