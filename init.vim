runtime init.d/env.vim
let $MYVIMRC="$XDG_CONFIG_HOME/nvim/init.vim"

" }}}

" === Variables === {{{
"
" }}}

" === Plugins === {{{
call plug#begin($XDG_DATA_HOME.'/nvim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug 'junegunn/fzf.vim'

Plug 'dyng/ctrlsf.vim'

Plug 'mhinz/vim-grepper'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'tpope/vim-fugitive'

Plug 'junegunn/gv.vim'

Plug 'tpope/vim-unimpaired'

Plug 'tpope/vim-surround'

Plug 'tpope/vim-commentary'

Plug 'SirVer/ultisnips'

Plug 'preservim/tagbar'

Plug 'dense-analysis/ale'

Plug 'scrooloose/nerdtree'

Plug 'ericpruitt/tmux.vim', { 'rtp': 'vim'}

Plug 'christoomey/vim-tmux-navigator'

Plug 'mattn/calendar-vim'

Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

Plug 'vimwiki/vimwiki'

" colorschemes
Plug 'sainnhe/gruvbox-material'

if has('nvim')
    Plug 'kassio/neoterm'
endif

Plug 'lambdalisue/suda.vim'

" Languages
Plug 'hashivim/vim-terraform'
Plug 'fatih/vim-go/'
Plug 'pearofducks/ansible-vim'
Plug 'avakhov/vim-yaml'
Plug 'psf/black', { 'branch': 'stable' }
Plug 'leafgarland/typescript-vim'

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

runtime init.d/gui.vim

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

let loaded_netrwPlugin = 1

" }}}
" === Settings ===
runtime! settings/*.vim

if filereadable($XDG_DATA_HOME.'/nvim/site.vim')
    source $XDG_DATA_HOME/nvim/site.vim
endif
