function! calendar#month(...)
    let cmd = '!ncal -hbA 2'
    if a:0 == 1 && a:1 != ''
        let cmd = cmd . ' -m '.a:1
    endif
    15new
    setlocal bufhidden=delete buftype=nofile noswapfile nowrap
    file __Calendar
    silent exec 'read '.cmd
    silent call vlib#strip()
    nnoremap <buffer> qc :bw!<cr>
    wincmd p
endfunction

function! calendar#year(...)
    let cmd = '!ncal -hby'
    if a:0 == 1 && a:1 != ''
        let cmd = cmd . ' -y '.a:1
    endif
    new
    setlocal bufhidden=delete buftype=nofile noswapfile nowrap
    file __Calendar
    silent exec 'read '.cmd
    silent call vlib#strip()
    nnoremap <buffer> qc :bw!<cr>
    wincmd p
endfunction
