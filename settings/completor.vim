let g:completor_auto_trigger = 0
let g:completor_gocode_binary = '~/go/bin/gocode'

inoremap <expr> <Tab> pumvisible() ? "<C-N>" : "<C-R>=completor#do('complete')<CR>"

function! ToggleAutoComplete()
    if g:completor_auto_trigger == 1
        let g:completor_auto_trigger = 0
    else
        let g:completor_auto_trigger = 1
    endif

    echo 'auto-completion '.(g:completor_auto_trigger ? 'on' : 'off')
endfunction

nnoremap <silent> coa :call ToggleAutoComplete()<CR>
