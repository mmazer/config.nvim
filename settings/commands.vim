command! Strip :call vlib#preserve("%s/\\s\\+$//e")
nnoremap =S :Strip<CR>
