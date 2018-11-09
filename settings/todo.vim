if empty($MY_TODO)
    let $MY_TODO='$XDG_DATA_HOME/todo.txt'
endif

command! Todo   :exec 'edit' $MY_TODO
nnoremap got    :Todo<CR>
