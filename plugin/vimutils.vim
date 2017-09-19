if exists("g:loaded_vimutils")
  finish
endif

let g:loaded_vimutils = 1

if !exists("g:root_dir_markers")
    let g:root_dir_markers = ['.git/', '.hg/', '.svn/', '.top', '.project']
endif

command! Syntax    :echo vimutils#syntax()
command! Cdr :silent call vimutils#cd_rootdir()

nnoremap gto       :Cdr<CR>:pwd<CR>
nnoremap coe       :call vimutils#toggle_et()<CR>

command! -complete=shellcmd -nargs=+ Shell call vimutils#run_shell_command(<q-args>)
cab shell Shell
nnoremap <leader>r :Shell<space>

noremap gou :call vimutils#browse()<CR>
