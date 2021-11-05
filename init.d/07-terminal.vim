" general terminal bindings

tnoremap <C-x> <C-\><C-n>
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

" neoterm
let g:neoterm_size=''
nnoremap <silent> tn :Tnew<CR>
nnoremap <silent> tv :vertical Tnew<CR>
nnoremap <silent> ts :belowright Tnew<CR>
nnoremap <silent> to :Topen<CR>
nnoremap <silent> tc :Tclose<CR>
nnoremap <silent> <leader>l :TREPLSendLine<CR>
vnoremap <silent> <leader>l :TREPLSendSelection<CR>
nnoremap tt :T<space>

command! VTnew :vertical Tnew
command! HTnew :belowright Tnew


