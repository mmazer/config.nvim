if exists("g:loaded_qfpreview")
  finish
endif

let g:loaded_qfpreview = 1

autocmd FileType qf nnoremap <buffer> p :call qfpreview#show()<CR>
