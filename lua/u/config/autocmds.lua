vim.cmd [[
augroup Cursorline
    autocmd WinEnter    * set cursorline
    autocmd WinLeave    * set nocursorline
    autocmd InsertEnter * set nocursorline
    autocmd InsertLeave * set cursorline
augroup END
]]

vim.cmd [[
augroup ModifiedTime
  autocmd BufWritePre * call vlib#preserve_wrapper(function('datetime#update_modified_time'))
augroup END
]]

vim.cmd [[
augroup Checktime
    autocmd CursorHold * checktime
    autocmd BufWinEnter * checktime
augroup END
]]

vim.cmd [[
augroup Jinja2
    autocmd BufNewFile,BufRead *yaml.j2 set ft=yaml
augroup END
]]
