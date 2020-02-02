setlocal sw=2
setlocal sts=2
setlocal suffixesadd=.txt,.md

if executable("retext")
    command! Retext :call vlib#start_async("retext", expand("%"))
else
    command! Retext :echo "executable retext not found"
endif

command! Marked :vsplit term://pandoc -f markdown -t html % \| w3m -T text/html

map <buffer> <leader>p :Marked<CR>

