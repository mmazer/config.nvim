autocmd! User GoyoEnter nested call writer#goyo_enter()
autocmd! User GoyoLeave nested call writer#goyo_leave()

nnoremap gw :Goyo 80<cr>
nnoremap  W! :Goyo!<cr>
