map <buffer> <leader>p :!pydoc <cword><CR>
command! Black :!black %

let b:ale_fixers = ['black']
let b:ale_fix_on_save = 1
