setlocal sw=2
setlocal sts=2
setlocal fdm=indent
setlocal cursorcolumn

autocmd!  BufWritePre * :call vlib#strip()
