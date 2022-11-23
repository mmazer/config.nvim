if !exists('g:zettelkasten')
  let g:zettelkasten=$XDG_DATA_HOME.."/zettelkasten"
endif

if !exists('g:zettelkasten_notes')
  " for now trailing slash is required
  let g:zettelkasten_notes=g:zettelkasten.."/notes"
endif

if !exists('g:zettelkasten_inbox')
  " for now trailing slashe is required
  let g:zettelkasten_inbox=g:zettelkasten.."/inbox"
endif

nnoremap <leader>zz :call zettel#index()<cr>
nnoremap gz :call zettel#edit_link(expand('<cword>'))<cr>

command! -nargs=+ ZInbox call zettel#new(g:zettelkasten_inbox, <f-args>)
command! -nargs=+ ZNew call zettel#new(g:zettelkasten_notes, <f-args>)
command! ZRefs execute ":GrepperRg \"\\["..expand("<cword>").. "\""
command! ZBacklinks execute ":GrepperRg \"\\["..zettel#parse_id(expand("%:t")).."\""
command! -nargs=? Zlink :let @z=zettel#make_link(zettel#parse_id(expand("%:t")), <f-args>)
command! -nargs=+ Ztags call zettel#find_tags(<f-args>)

augroup zettel
  au!
  autocmd FileType markdown nnoremap <buffer> <return> :call zettel#edit_link(expand('<cword>'))<cr>
  autocmd FileType markdown nnoremap <leader>zf <cmd>lua require("telescope").extensions.zettel.paste_link()<cr>
  autocmd FileType markdown inoremap <space>zf <cmd>lua require("telescope").extensions.zettel.paste_link()<cr>
  autocmd FileType markdown nnoremap <leader>zp :call zettel#preview_link(expand('<cword>'))<cr>
  autocmd FileType markdown inoremap <silent> <leader>zi <C-R>=zettel#parse_id(expand("%:t"))<cr>
  autocmd FileType markdown nnoremap <silent> [z :call search("[\\d\\{14}")<cr>
  autocmd FileType markdown nnoremap <silent> ]z :call search("[\\d\\{14}", "b")<cr>
augroup END


