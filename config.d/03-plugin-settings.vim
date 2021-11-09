" =deoplete
" Only enable deoplete when InsertEnter see :h deoplete
let g:deoplete#enable_at_startup = 0
autocmd InsertEnter * call deoplete#enable()

let g:enable_auto_completion = get(g:, 'enable_auto_completion', 0)

 call deoplete#custom#option({
     \ 'auto_complete': g:enable_auto_completion
 \ })

inoremap <silent><expr> <C-Space>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ deoplete#manual_complete()

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

function! ToggleAutoComplete()
    if g:enable_auto_completion == 1
        let g:enable_auto_completion=0
        call deoplete#custom#option({
            \ 'auto_complete': 0
        \ })
    else
        let g:enable_auto_completion=1
        call deoplete#custom#option({
            \ 'auto_complete': 1
        \ })
    endif

    echo 'auto-completion '.(g:enable_auto_completion ? 'on' : 'off')
endfunction

nnoremap <silent> coa :call ToggleAutoComplete()<CR>

" =fugitive
nnoremap <space>gs :Git<CR>
nnoremap <space>gb :Git blame<CR>
nnoremap <space>gc :Git commit -v -q <CR>
nnoremap <space>gd :Gdiffsplit<CR>
nnoremap <space>ge :Gedit<CR>
nnoremap <space>gl :Gclog<CR>
nnoremap <space>gr :Gread<CR>
nnoremap <space>gw :Gwrite<CR>
nnoremap <space>gp :Ggrep<CR>

cab glog Glog

" Simple way to turn off Gdiff splitscreen
" works only when diff buffer is focused
" https://gist.github.com/radmen/5048080
command! Gdoff diffoff | q | Gedit

command! Glast :Gclog -n 8 --
cab glast Glast

augroup Fugitive
    autocmd!
    autocmd BufRead fugitive\:* xnoremap <buffer> dp :diffput<CR>|xnoremap <buffer> do :diffget<CR>
    autocmd FilterWritePre * if &diff | nnoremap <buffer> dc :Gdoff<CR> | nnoremap <buffer> du :diffupdate<CR> | endif
    autocmd BufNewFile,BufRead fugitive://* set bufhidden=delete
augroup END

" =grepper
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

" =nerdtree
let NERDChristmasTree=1
let NERDTreeWinSize=35
let NERDTreeDirArrows=1
let NERDTreeIgnore=['\.pyc$']
let NERDTreeMinimalUI=1
let NERDTreeAutoDeleteBuffer=1
let NERDTreeHijackNetrw=0

nnoremap <silent> <space>nc :NERDTreeCWD<CR>
nnoremap <silent> <space>nr :exe 'NERDTree '.vutils#root_dir() \| wincmd w<CR>
nnoremap <silent> <space>nf :NERDTreeFind<CR>
nnoremap <silent> <C-n>     :NERDTreeToggle \| wincmd w<CR>
nnoremap <silent> -         :NERDTree %:p:h \| wincmd w<CR>

" =suda
let g:suda#prefix = 'sudo://'

" =vimwiki
" Disabble <TAB> bindings
let g:vimwiki_key_mappings = { 'table_mappings': 0, }
" set g:vimwiki_list in local site settings

" =vista
nnoremap <silent> cot :Vista<CR>
