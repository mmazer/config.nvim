autocmd BufWritePre * if &filetype == 'text'
                      \ | call vlib#preserve_wrapper(function('datetime#update_modified_time'))
                      \ |
