" Only enable deoplete when InsertEnter see :h deoplete
let g:deoplete#enable_at_startup = 0
autocmd InsertEnter * call deoplete#enable()

call deoplete#custom#option({
    \ 'auto_complete': g:enable_auto_completion
\ })

inoremap <silent><expr> <C-Space>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ deoplete#manual_complete()

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

function! ToggleAutoComplete()
    if g:enable_auto_completion == 1
        let g:enable_auto_completion=0
        call deoplete#custom#option({
            \ 'auto_complete': 0
        \ })
    else
        let g:enable_auto_completion=1
        call deoplete#custom#option({
            \ 'auto_complete': 1
        \ })
    endif

    echo 'auto-completion '.(g:enable_auto_completion ? 'on' : 'off')
endfunction

nnoremap <silent> coa :call ToggleAutoComplete()<CR>
