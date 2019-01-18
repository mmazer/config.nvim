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
"
" }}}

" === Plugins === {{{
call plug#begin($XDG_DATA_HOME.'/vim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug 'junegunn/fzf.vim'

Plug 'dyng/ctrlsf.vim'

Plug 'mhinz/vim-grepper'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

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

Plug 'ericpruitt/tmux.vim', { 'rtp': 'vim'}

Plug 'christoomey/vim-tmux-navigator'

Plug 'mattn/calendar-vim'

if has('nvim')
    Plug 'kassio/neoterm'
endif

" Languages
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'hashivim/vim-terraform'
Plug 'fatih/vim-go/'
Plug 'pearofducks/ansible-vim'
Plug 'avakhov/vim-yaml'
Plug 'hashivim/vim-vagrant'

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
set listchars=tab:┆\ ,trail:·,nbsp:¬,extends:›,precedes:‹
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
    set guifont=Hack:h14
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

set title

set hidden
set splitbelow
set splitright

set completeopt=longest,menuone,preview
set showmatch
set previewheight=20

" }}}
" === Settings ===
runtime! settings/*.vim

if filereadable($XDG_DATA_HOME.'/vim/site.vim')
    source $XDG_DATA_HOME/vim/site.vim
endif
