setlocal sw=2
setlocal sts=2
set foldmethod=indent

autocmd!  BufWritePre * :call vlib#strip()
