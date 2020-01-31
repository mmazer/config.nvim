setlocal sw=2
setlocal sts=2
setlocal suffixesadd=.txt,.md

if executable("retext")
    command! Marked :call vlib#start_async("retext", expand("%"))
else
    command! Marked :echo "No suitable application found to preview Markdown"
endif

map <buffer> <leader>p :Marked<CR>

