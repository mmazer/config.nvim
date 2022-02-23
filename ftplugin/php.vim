setlocal sw=8
setlocal sts=0
setlocal noexpandtab

autocmd!  BufWritePre * :call vlib#strip()
