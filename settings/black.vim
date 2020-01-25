let g:black_linelength=120

augroup BlackFormat
    autocmd!
    autocmd BufWritePre *.py execute ':Black'
    autocmd! FileType python nmap <buffer> <leader>f :Black<CR>
augroup END
