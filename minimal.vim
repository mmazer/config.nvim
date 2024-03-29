set nocompatible
set number
set scrolloff=999
set wildmenu
set wildmode=list:longest
set shortmess=aTIoO
set laststatus=0
set noshowmode

filetype plugin indent on
syntax on
set background="dark"

" basic mappings
nnoremap <silent> Q :qa!<CR>
nnoremap <space>w :w<CR>
nnoremap <space>W :w!<CR>
inoremap kj <esc>

set incsearch
set hlsearch
set ignorecase
set smartcase   "case sensitive if search term contains upppecase letter

if executable('rg')
    set grepprg=rg\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow
    set grepformat=%f:%l:%c:%m
endif

" Use Perl/Ruby style regex patterns
" See http://briancarper.net/blog/448/
nnoremap / /\v
vnoremap / /\v

set showmatch

" reselect visual block after indent
vnoremap < <gv
vnoremap > >gv

" make it easier to work with some text objects
vnoremap ir i]
vnoremap ar a]
vnoremap ia i>
vnoremap aa a>
onoremap ir i]
onoremap ar a]
onoremap ia i>
onoremap aa a>

set hidden
set splitbelow
set splitright

" manage windows
nnoremap W <C-w>

" window navigation consistent with term mode mappings
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" toggle case of words
nnoremap [w gUiw
nnoremap ]w guiw
