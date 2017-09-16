if !exists('g:auto_completion_enabled')
    let g:auto_completion_enabled = 1
endif

function! ToggleAutoComplete()
    if g:auto_completion_enabled == 1
        call completor#disable()
        let g:auto_completion_enabled = 0
    else
        call completor#enable()
        let g:auto_completion_enabled = 1
    endif

    echo 'auto-completion '.(g:auto_completion_enabled ? 'on' : 'off')
endfunction
nnoremap <silent> coa :call ToggleAutoComplete()<CR>
