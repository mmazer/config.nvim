command! Rtags :Dispatch! ctags --extra=+f -R
cab rtags Rtags
nnoremap <leader>T :Rtags<cr>
