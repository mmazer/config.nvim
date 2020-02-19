if !exists('g:run_black_on_save')
  let g:run_black_on_save = 0
endif

let g:black_linelength=120

function! PyFormat()
    if g:run_black_on_save
        exec ':Black'
    endif
endfun

augroup BlackFormat
    autocmd!
    autocmd BufWritePre *.py call PyFormat()
    autocmd! FileType python nmap <buffer> <leader>f :Black<CR>
augroup END
