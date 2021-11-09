set directory=$VIMCACHE/swap,~/,/tmp
set backupdir=$VIMCACHE//backup,~/,/tmp
set undodir=$VIMCACHE/undo,~/,/tmp

filetype plugin indent on
syntax on

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
set inccommand=split
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

" disable netrw
let g:loaded_netrw     = 1
let loaded_netrwPlugin = 1

" =search
set incsearch
set hlsearch
set ignorecase
set smartcase   "case sensitive if search term contains upppecase letter

if executable('rg')
    set grepprg=rg\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow
    set grepformat=%f:%l:%c:%m
    let g:ackprg = 'rg --vimgrep'
endif

" =folding
set foldmethod=syntax                   "fold based on indent
set foldnestmax=2                       "deepest fold is 10 levels
set nofoldenable                        "don't fold by default
let g:xml_syntax_folding=1              "enable xml folding

" =completion
set completeopt=longest,menuone,preview

