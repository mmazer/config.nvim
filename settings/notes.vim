if empty($NOTESDIR)
    let $NOTESDIR='$XDG_DATA_HOME/notes'
endif

if empty($MY_NOTES)
    let $MY_NOTES='$NOTESDIR/note.txt'
endif

if empty($MY_TIL)
    let $MY_TIL='$NOTESDIR/til.txt'
endif

command! Notes  :exec 'edit' $MY_NOTES
nnoremap gon    :Notes<CR>
command! Til    :exec 'edit' $MY_TIL
