nnoremap <space>gs :Git<CR>
nnoremap <space>gb :Git blame<CR>
nnoremap <space>gc :Git commit -v -q <CR>
nnoremap <space>gd :Gdiffsplit<CR>
nnoremap <space>ge :Gedit<CR>
nnoremap <space>gl :Gclog<CR>
nnoremap <space>gr :Gread<CR>
nnoremap <space>gw :Gwrite<CR>
nnoremap <space>gp :Ggrep<CR>

cab glog Glog

" Simple way to turn off Gdiff splitscreen
" works only when diff buffer is focused
" https://gist.github.com/radmen/5048080
command! Gdoff diffoff | q | Gedit

command! Glast :Gclog -n 8 --
cab glast Glast

augroup Fugitive
    autocmd!
    autocmd BufRead fugitive\:* xnoremap <buffer> dp :diffput<CR>|xnoremap <buffer> do :diffget<CR>
    autocmd FilterWritePre * if &diff | nnoremap <buffer> dc :Gdoff<CR> | nnoremap <buffer> du :diffupdate<CR> | endif
    autocmd BufNewFile,BufRead fugitive://* set bufhidden=delete
augroup END
