setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null

autocmd!  BufWritePre * :call vlib#strip()
