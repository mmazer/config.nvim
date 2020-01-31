let g:grepper = {
    \ 'tools': ['rg', 'git']
    \ }

nnoremap <leader>g :GrepperRg<space>
nmap gs  <plug>(GrepperOperator)
xmap gs  <plug>(GrepperOperator)
nnoremap <leader>w :Grepper -tool rg -cword -highlight -noprompt -nojump -switch<cr>
cab greprg GrepperRg

command! -nargs=* GrepBufDir :Grepper -dir file -tool rg -highlight -nojump -noprompt -query <args>
cnoreabbrev gbdir GrepBufDir


