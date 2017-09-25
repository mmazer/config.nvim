let g:fzf_tags_command = 'ctags --extra=+f -R'
let g:fzf_bookmarks = $XDG_DATA_HOME.'/fzf/vim_bookmarks'

function! s:bookmarks_sink(line)
  let parts = split(a:line, '\s\+')
  execute 'silent e' parts[1]
endfunction

command! Bookmarks call fzf#run({
            \ 'source': 'cat '.g:fzf_bookmarks,
            \ 'sink':    function('s:bookmarks_sink')
            \ })

command! -bang -nargs=* Rg call fzf#vim#grep('rg --column --line-number --no-heading --color=always '.shellescape(<q-args>),
            \ 1,
            \ <bang>0 ? fzf#vim#with_preview('up:60%') : fzf#vim#with_preview('right:50%:hidden', '?'),
            \ <bang>0)
cab rg Rg

nmap <space> [fzf]
nnoremap <silent> [fzf]b :Buffers<cr>
nnoremap <silent> [fzf]c :BCommits<CR>
nnoremap <silent> [fzf]C :Commits<CR>
nnoremap <silent> [fzf]f :Files<CR>
nnoremap <silent> [fzf]g :GitFiles<CR>
nnoremap <silent> [fzf]G :GitFiles?<CR>
nnoremap <silent> [fzf]h :History:<CR>
nnoremap <silent> [fzf]/ :History/<CR>
nnoremap <silent> [fzf]l :Lines<CR>
nnoremap <silent> [fzf]L :BLines<CR>
nnoremap <silent> [fzf]m :Marks<CR>
nnoremap <silent> [fzf]o :Bookmarks<cr>
nnoremap <silent> [fzf]r :History<CR>
nnoremap <silent> [fzf]s :Snippets<CR>
nnoremap <silent> [fzf]t :BTags<cr>
nnoremap <silent> [fzf]T :Tags<CR>
