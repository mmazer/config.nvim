if exists('g:NERDTree')
    call NERDTreeAddKeyMap({
        \ 'key': '<C-o>',
        \ 'callback': 'NERDTreeExecuteFile',
        \ 'override': 1,
        \ 'scope': 'all',
        \ 'quickhelpText': 'Open in system editor or view'})
endif
