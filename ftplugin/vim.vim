setlocal fdm=marker
setlocal sw=2
setlocal sts=2

autocmd!  BufWritePre * :call vlib#strip()
