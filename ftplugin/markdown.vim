setlocal sw=2
setlocal sts=2
setlocal suffixesadd=.txt,.md

if executable("remarkable")
    command! Marked :call vlib#start_async("remarkable", expand("%"))
elseif executable("retext")
    command! Marked :call vlib#start_async("retext", expand("%"))
elseif executable("marked")
    command! Marked :call vlib#start_async("marked", expand("%"))
else
    command! Marked :echo "no markdown viewer found (retext,remarkable)"
endif

map <buffer> <leader>p :Marked<CR>

