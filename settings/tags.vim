command! Rtags :Dispatch! /usr/local/bin/ctags --extra=+f -R
cab rtags Rtags
nnoremap <leader>T :Rtags<cr>
