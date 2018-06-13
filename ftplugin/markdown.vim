setlocal sw=2
setlocal sts=2
setlocal suffixesadd=.txt,.md

function! PreviewMarkdown()
    if executable("marked")
        exec ":silent !marked \"%\"" | redraw!
    else
        echo "Marked application not found"
    endif
endfunction
map <buffer> <leader>p :call PreviewMarkdown()<CR>
command! Marked :call PreviewMarkdown()

autocmd BufWritePre * if &filetype == 'markdown'
                      \ | call vlib#preserve_wrapper(function('datetime#update_modified_time'))
                      \ |
