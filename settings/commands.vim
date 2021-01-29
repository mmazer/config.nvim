command! Strip :call vlib#preserve("%s/\\s\\+$//e")
nnoremap =S :Strip<CR>
command! Json :set ft=json | %!python3 -m json.tool
cab json Json
