setlocal sw=2
setlocal sts=2
setlocal fdm=indent

autocmd!  BufWritePre * :call vlib#strip()
