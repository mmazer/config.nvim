let g:fzf_tags_command = 'ctags --extra=+f -R'
let g:fzf_bookmarks = $XDG_DATA_HOME.'/fzf/vim_bookmarks'

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

function! s:bookmarks_sink(line)
  let parts = split(a:line, '\s\+')
  execute 'silent e' parts[1]
endfunction

command! Bookmarks call fzf#run(fzf#wrap({
            \ 'source': 'cat '.g:fzf_bookmarks,
            \ 'sink':    function('s:bookmarks_sink')
            \ }))

command! -bang -nargs=* Rg call fzf#vim#grep('rg --column --line-number --no-heading --color=always '.shellescape(<q-args>),
            \ 1,
            \ <bang>0 ? fzf#vim#with_preview('up:60%') : fzf#vim#with_preview('right:50%:hidden', '?'),
            \ <bang>0)
cab rg Rg

nnoremap <silent> <space>b :Buffers<cr>
nnoremap <silent> <space>c :BCommits<CR>
nnoremap <silent> <space>C :Commits<CR>
nnoremap <silent> <space>f :Files<CR>
nnoremap <silent> <space>g :GitFiles<CR>
nnoremap <silent> <space>G :GitFiles?<CR>
nnoremap <silent> <space>h :History:<CR>
nnoremap <silent> <space>/ :History/<CR>
nnoremap <silent> <space>l :Lines<CR>
nnoremap <silent> <space>L :BLines<CR>
nnoremap <silent> <space>m :Marks<CR>
nnoremap <silent> <space>o :Bookmarks<cr>
nnoremap <silent> <space>r :History<CR>
nnoremap <silent> <space>s :Snippets<CR>
nnoremap <silent> <space>t :BTags<cr>
nnoremap <silent> <space>T :Tags<CR>
