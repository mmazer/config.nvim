if exists("g:loaded_vlib")
  finish
endif

let g:loaded_vlib = 1

if !exists("g:root_dir_markers")
    let g:root_dir_markers = ['.git/', '.top', '.project', '.nvimroot']
endif

command! Syntax    :echo vlib#syntax()
command! Cdr :silent call vlib#cd_rootdir()

nnoremap gto       :Cdr<CR>:pwd<CR>
nnoremap coe       :call vlib#toggle_et()<CR>

command! -complete=shellcmd -nargs=+ Shell call vlib#run_shell_command(<q-args>)
