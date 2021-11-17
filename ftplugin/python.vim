map <buffer> <leader>p :!pydoc <cword><CR>

setlocal formatprg=black\ -q\ -

map <buffer> <leader>f ggVGgq<C-o><C-o>
autocmd BufWritePre *.py execute ':Black'

