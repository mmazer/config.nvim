setlocal sw=2
setlocal sts=2
setlocal foldmethod=manual

autocmd!  BufWritePre * :call vlib#strip()
autocmd BufEnter *.json :syn sync maxlines=200 | let b:statusline_ignore_whitespace=1
map <buffer> <leader>p :%!python -m json.tool<CR>

