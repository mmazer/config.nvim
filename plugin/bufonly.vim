command! -nargs=? -complete=buffer -bang Bonly
    \ :call bufonly#delete_others('<args>', '<bang>')
command! -nargs=? -complete=buffer -bang BOnly
    \ :call bufonly#delete_others('<args>', '<bang>')
command! -nargs=? -complete=buffer -bang Bufonly
    \ :call bufonly#delete_others('<args>', '<bang>')
command! -nargs=? -complete=buffer -bang BufOnly
    \ :call bufonly#delete_others('<args>', '<bang>')
