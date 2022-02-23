command! -nargs=1 ErlMan :Shell erl -man <args>
autocmd!  BufWritePre * :call vlib#strip()
