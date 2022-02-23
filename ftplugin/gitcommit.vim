setlocal cursorline
setlocal spell

autocmd!  BufWritePre * :call vlib#strip()
