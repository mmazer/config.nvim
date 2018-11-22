" disable these mappings which open next/previous file
noremap <space>] <nop>
noremap <space>[ <nop>

" show length of words or visual selection
nnoremap <C-_> :echo 'word' expand('<cword>') 'has length' strlen(expand('<cword>'))<CR>
vnoremap <C-_> "-y:echo 'text' @- 'has length' strlen(@-)<CR>
