if exists('g:autoloaded_fugit')
  finish
endif
let g:autoloaded_fugit= 1

function! fugit#diff_buf()
    let fname = expand('%')
    new
    exec "r! git diff ".printf('%s', fname)
    :normal ggdd
    setlocal ft=diff bt=nofile bh=wipe nobl noswf ro
    nnoremap <buffer> qw :bw<cr>
endfunction

function! fugit#diff_index()
    new
    r !git diff -w --cached
    :normal ggdd
    setlocal ft=diff bt=nofile bh=wipe nobl noswf ro
    nnoremap <buffer> qw :bw<cr>
endfunction

function! fugit#diff_working()
    new
    r !git diff -w
    :normal ggdd
    setlocal ft=diff bt=nofile bh=wipe nobl noswf ro
    nnoremap <buffer> qw :bw<cr>
endfunction

function! fugit#incoming()
    new
    r !git log --pretty=oneline --abbrev-commit --graph ..@{u}
    setlocal ft=git bt=nofile bh=wipe nobl noswf ro
    nnoremap <buffer> qw :bw<cr>
endfunction

function! fugit#outgoing()
    new
    r !git log --pretty=oneline --abbrev-commit --graph @{u}..
    setlocal ft=git bt=nofile bh=wipe nobl noswf ro
    nnoremap <buffer> qw :bw<cr>
endfunction

function! fugit#tags()
    new
    r !git log --oneline --decorate --tags --no-walk
    :normal ggdd
    setlocal ft=git bt=nofile bh=wipe nobl noswf ro
    nnoremap <buffer> qw :bw<cr>
endfunction

function! fugit#show(object)
    new
    execute "r !git show ".a:object
    :normal ggdd
    setlocal ft=git bt=nofile bh=wipe nobl noswf ro
    nnoremap <buffer> qw :bw<cr>
endfunction

function! fugit#help(command)
    new
    execute "r !git help " . a:command
    :normal ggdd
    setlocal ft=man bt=nofile bh=wipe nobl noswf ro
    nnoremap <buffer> qw :bw<cr>
endfunction

function! fugit#status()
    let sfile = tempname()
    silent execute ':!git status -sb > '. sfile.' 2>&1'
    silent execute ':pedit! '.sfile
    " switch to preview window
    wincmd P
    setlocal ft=git bt=nofile bh=wipe nobl noswf ro
    " switch back to previous window
    wincmd p
endfunction
