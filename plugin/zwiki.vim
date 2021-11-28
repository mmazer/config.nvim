if !exists('g:zwiki_dir')
  let g:zwiki_dir=$XDG_DATA_HOME."/zwiki"
endif

if !exists('g:zwiki_zettel_dir')
  " for now trailing slash is required
  let g:zwiki_zettel_dir=g:zwiki_dir."/zk/"
endif
if !exists('g:zwiki_inbox')
  " for now trailing slashe is required
  let g:zwiki_inbox=g:zwiki_dir."/in/"
endif

nnoremap <leader>zz :call zwiki#open_zwiki_index()<cr>
nnoremap gz :call zwiki#edit_link(expand('<cword>'))<cr>

command! -nargs=1 ZInbox :execute ":e" g:zwiki_inbox . zwiki#uid() . "-<args>.md"
command! -nargs=1 ZNew :execute ":e" g:zwiki_zettel_dir . zwiki#uid() . "-<args>.md"
command! ZRefs execute ":GrepperRg \"\\[" . expand("<cword>") . "\""
command! ZBacklinks execute ":GrepperRg \"\\[" . zwiki#parse_id(expand("%:t")) . "\""
command! -nargs=? Zlink :let @z=zwiki#make_link(zwiki#parse_id(expand("%:t")), <q-args>)

augroup zwiki
  au!
  autocmd FileType markdown nnoremap <buffer> <return> :call zwiki#edit_link(expand('<cword>'))<cr>
  autocmd FileType markdown nnoremap <buffer> <leader>zp :call zwiki#preview_link(expand('<cword>'))<cr>
  autocmd FileType markdown inoremap <buffer> <leader>zi <C-R>=zwiki#parse_id(expand("%:t"))<cr>
augroup END
