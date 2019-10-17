if has("autocmd")
    augroup Preview
        autocmd!
        autocmd CompleteDone * pclose
    augroup END

    augroup Cursorline
        autocmd!
        autocmd WinEnter    * set cursorline
        autocmd WinLeave    * set nocursorline
        autocmd InsertEnter * set nocursorline
        autocmd InsertLeave * set cursorline
    augroup END

    augroup StripWhitespace
        autocmd!
        autocmd! FileType vim,css,scss,groovy,java,javascript,less,php,scala,
                    \typescript,python,ruby,rust,handlebars,html.handlebars,scheme,
                    \yaml autocmd BufWritePre <buffer> :%s/\s\+$//e
    augroup END

    augroup Checktime
        autocmd CursorHold * checktime
        autocmd BufWinEnter * checktime
    augroup END

    augroup FileTypes
        autocmd BufNewfile,BufRead *.tf set filetype=terraform
    augroup END

    autocmd BufWritePre * call vlib#preserve_wrapper(function('datetime#update_modified_time'))
endif
