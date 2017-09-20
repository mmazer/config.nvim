set nocompatible

" === Environment === {{{

if empty($XDG_CACHE_HOME)
    let $XDG_CACHE_HOME='$HOME/.cache'
endif

if empty($XDG_CONFIG_HOME)
    let $XDG_CONFIG_HOME='$HOME/.config'
endif

if empty($XDG_DATA_HOME)
    let $XDG_DATA_HOME='$HOME/.local/share'
endif

set directory=$XDG_CACHE_HOME/vim/swap,~/,/tmp
set backupdir=$XDG_CACHE_HOME/vim/backup,~/,/tmp
set undodir=$XDG_CACHE_HOME/vim/undo,~/,/tmp
if !has('nvim')
    " Using $XDG_CACHE_HOME home for viminfo doesn't work in vim 8
    set viminfo+=n$HOME/.cache/vim/viminfo
endif

set runtimepath+=$XDG_CONFIG_HOME/vim,$XDG_CONFIG_HOME/vim/after,$VIM,$VIMRUNTIME
let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc"

" }}}

" === Variables === {{{
let g:scratch_file                = $XDG_DATA_HOME.'/scratch.txt'

" }}}

" === Plugins === {{{
call plug#begin($XDG_DATA_HOME.'/vim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug 'junegunn/fzf.vim'

Plug 'dyng/ctrlsf.vim'

Plug 'mhinz/vim-grepper'

Plug 'maralla/completor.vim'

Plug 'tpope/vim-fugitive'

Plug 'tpope/vim-unimpaired'

Plug 'tpope/vim-dispatch'

Plug 'tpope/vim-surround'

Plug 'tpope/vim-commentary'

Plug 'SirVer/ultisnips'

Plug 'majutsushi/tagbar'

Plug 'w0rp/ale'

Plug 'scrooloose/nerdtree'

Plug 'airblade/vim-gitgutter'

" Languages
Plug 'davidhalter/jedi-vim'
Plug 'hashivim/vim-terraform'

" Colors
Plug 'ajh17/Spacegray.vim'
Plug 'gregsexton/Gravity'

call plug#end()
"}}}

set list
set number
set scrolloff=2
set wildmenu
set wildmode=list:longest
set shortmess=aTIoO
set laststatus=2
set encoding=utf-8
set listchars=tab:▸\ ,trail:·,nbsp:¬,extends:›,precedes:‹
set wrap linebreak textwidth=0
set noshowcmd
set ruler

if exists('&inccommand')
  set inccommand=split
endif

filetype plugin indent on
syntax on

" === GUI === {{{
if has('gui_running')
    if has('mac')
        set guifont=Cousine:h13
    endif
    set guioptions-=T " remove tool bar
    set guioptions-=r " remove right-hand scroll bar
    set guioptions-=L " remove left-hand scroll bar
    set lines=90
    set columns=145
endif

" }}}
set expandtab
set shiftwidth=4
set softtabstop=4

set autoread
set ffs=unix,dos,mac "Default file types
set ff=unix " set initial buffer file format
set modeline

set noswapfile
set backup

set cursorline
let &colorcolumn="110"

" === Moving === {{{

" Better mark jumping (line + col)
nnoremap <expr> ' printf('`%c zz', getchar())

" For wrapped lines, navigate normally
noremap  <buffer> <silent> k gk
noremap  <buffer> <silent> j gj
noremap  <buffer> <silent> 0 g0
noremap  <buffer> <silent> $ g$

nnoremap K H
" preserve J
nnoremap <space>j J
nnoremap J        L
noremap  H        ^
nnoremap gh       ^
noremap  L        $
nnoremap gl       $
vnoremap L        g_

" move to middle of text line
nnoremap gm :call cursor(0, virtcol('$')/2)<CR>

" center after next/previous change
nnoremap ]c ]czz
nnoremap [c [czz

" center window when moving to next search match
nnoremap n  nzzzv
nnoremap N  Nzzzv
nnoremap *  *zz
nnoremap #  #zz
nnoremap g* g*zz
nnoremap g# g#zz

nnoremap <C-o> <C-o>zz

" reselect visual block after indent
vnoremap < <gv
vnoremap > >gv

" Use ,d (or ,dd or ,dj or 20,dd) to delete a line without adding it to the
" yanked stack (also, in visual mode)
nnoremap <silent> ,d "_d
vnoremap <silent> ,d "_d

" Quick yanking to the end of the line
nnoremap Y y$

" Copy and paste to system clipboard
vnoremap <C-c> "+yi
vnoremap <C-x> "+c
vnoremap <C-v> c<ESC>"+p
inoremap <C-v> <ESC>"+pa

"}}}
"
" Windows and buffers: {{{

set title

set hidden
set splitbelow
set splitright

set completeopt=longest,menuone,preview
set showmatch

" avoid the escape key - remember <C-[> also maps to Esc
inoremap kj <ESC>`^

" manage windows
nnoremap W <C-w>

" window navigation consistent with term mode mappings
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap th  :tabfirst<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap td  :tabclose<CR>

nnoremap <C-p> :b#<CR>
nnoremap <leader>d :bd<cr>
nnoremap <space>d :bp \| bd #<CR>

" goto buffer
nnoremap gob :ls<CR>:b
nnoremap B :ls<CR>:b

nnoremap goe :enew<CR>

" close quick fix and location list
nnoremap qq :cclose<CR>
nnoremap ql :lclose<CR>
nnoremap qp :pclose<CR>

"}}}

nmap <space><space> :
nnoremap q: <nop>
nnoremap Q :qa<CR>

nnoremap gov          :exec 'edit' $MYVIMRC<CR>
nnoremap gos          :exec 'edit' g:scratch_file<CR>

" Saving files
nnoremap g!       :e!<CR>
nnoremap <space>w :w<CR>
nnoremap <space>W :w!<CR>

" For quick one line expressions
nnoremap <space>x   :<C-R>=

" toggle case of words
nnoremap [w gUiw
nnoremap ]w guiw

" Source lines - from Steve Losh
vnoremap X y:execute @@<cr>:echo 'Sourced selection.'<cr>
nnoremap X ^vg_y:execute @@<cr>:echo 'Sourced line.'<cr>

" end lines with semicolons
inoremap ;]       <C-\><C-O>:call vimutils#preserve("s/\\s\*$/;/")<CR>
nnoremap <space>; :call vimutils#preserve("s/\\s\*$/;/")<CR>

" end lines with commas
inoremap ,]       <C-\><C-O>:call vimutils#preserve("s/\\s\*$/,/")<CR>
nnoremap <space>, :call vimutils#preserve("s/\\s\*$/,/")<CR>

command! Rtags :Dispatch! ctags --extra=+f -R
cab rtags Rtags
nnoremap <leader>T :Rtags<cr>

" === Settings ===
runtime! settings/*.vim

