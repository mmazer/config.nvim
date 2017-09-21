if empty($INFOBASE_HOME)
    let $INFOBASE_HOME='$XDG_DATA_HOME/infobase'
endif

if empty($MY_TODO)
    let $MY_TODO='$INFOBASE_HOME/todo.txt'
endif

if empty($MY_NOTES)
    let $MY_NOTES='$INFOBASE_HOME/note.txt'
endif

if empty($MY_TIL)
    let $MY_TIL='$INFOBASE_HOME/til.txt'
endif

command! Notes  :exec 'edit' $MY_NOTES
nnoremap gon    :Notes<CR>
command! Todo   :exec 'edit' $MY_TODO
nnoremap got    :Todo<CR>
command! Til    :exec 'edit' $MY_TIL
