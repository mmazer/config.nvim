setlocal sw=2
setlocal sts=2
setlocal foldmethod=indent

autocmd!  BufWritePre * :call vlib#strip()
