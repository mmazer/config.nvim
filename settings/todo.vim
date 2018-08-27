if empty($MY_TODO)
    let $MY_TODO='$HOME/.todo'
endif

command! Todo   :exec 'edit' $MY_TODO
nnoremap got    :Todo<CR>
