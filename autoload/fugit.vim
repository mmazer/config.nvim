if exists('g:autoloaded_fugit')
  finish
endif
let g:autoloaded_fugit= 1

if !exists('g:fugit_split')
  let g:fugit_split = 'buf'
endif

function! s:fugit_win()
    if g:fugit_split ==? 'vert'
        vnew
    elseif g:fugit_split ==? 'buf'
        enew
    else
        new
    endif
endfunction

function! fugit#diff_buf()
    let fname = expand('%')
    call s:fugit_win()
    exec "r! git diff ".printf('%s', fname)
    :normal ggdd
    setlocal ft=diff bt=nofile bh=wipe nobl noswf ro
    nnoremap <buffer> qw :bw<cr>
endfunction

function! fugit#diff_index()
    call s:fugit_win()
    r !git diff -w --cached
    :normal ggdd
    setlocal ft=diff bt=nofile bh=wipe nobl noswf ro
    nnoremap <buffer> qw :bw<cr>
endfunction

function! fugit#diff_working()
    call s:fugit_win()
    r !git diff -w --cached
    r !git diff -w
    :normal ggdd
    setlocal ft=diff bt=nofile bh=wipe nobl noswf ro
    nnoremap <buffer> qw :bw<cr>
endfunction

function! fugit#incoming()
    call s:fugit_win()
    r !git log --pretty=oneline --abbrev-commit --graph ..@{u}
    setlocal ft=git bt=nofile bh=wipe nobl noswf ro
    nnoremap <buffer> qw :bw<cr>
endfunction

function! fugit#outgoing()
    call s:fugit_win()
    r !git log --pretty=oneline --abbrev-commit --graph @{u}..
    setlocal ft=git bt=nofile bh=wipe nobl noswf ro
    nnoremap <buffer> qw :bw<cr>
endfunction

function! fugit#tags()
    call s:fugit_win()
    r !git log --oneline --decorate --tags --no-walk
    :normal ggdd
    setlocal ft=git bt=nofile bh=wipe nobl noswf ro
    nnoremap <buffer> qw :bw<cr>
endfunction

function! fugit#show(object)
    call s:fugit_win()
    execute "r !git show ".a:object
    :normal ggdd
    setlocal ft=git bt=nofile bh=wipe nobl noswf ro
    nnoremap <buffer> qw :bw<cr>
endfunction

function! fugit#help(command)
    call s:fugit_win()
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
