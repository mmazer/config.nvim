function! Calendar()
    15new
    setlocal bufhidden=delete buftype=nofile noswapfile nowrap
    file __Calendar
    silent read !ncal -hbA 2
    silent call vlib#strip()
    nnoremap <buffer> q :bw!<cr>
    wincmd p
endfunction
command! Cal :call Calendar()
