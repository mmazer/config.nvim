" === Plugins === {{{
call plug#begin($VIMDATA.'/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug 'junegunn/fzf.vim'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'deoplete-plugins/deoplete-lsp'

Plug 'mhinz/vim-grepper'

Plug 'tpope/vim-fugitive'

Plug 'junegunn/gv.vim'

Plug 'tpope/vim-unimpaired'

Plug 'tpope/vim-surround'

Plug 'tpope/vim-commentary'

Plug 'SirVer/ultisnips'

Plug 'neovim/nvim-lspconfig'

Plug 'scrooloose/nerdtree'

Plug 'ericpruitt/tmux.vim', { 'rtp': 'vim'}

Plug 'christoomey/vim-tmux-navigator'

Plug 'vimwiki/vimwiki'

Plug 'liuchengxu/vista.vim'

" colorschemes
Plug 'sainnhe/gruvbox-material'
Plug 'tanvirtin/monokai.nvim'

if has('nvim')
    Plug 'kassio/neoterm'
endif

Plug 'lambdalisue/suda.vim'

" Languages
Plug 'pearofducks/ansible-vim'
Plug 'hashivim/vim-terraform'
Plug 'fatih/vim-go/'

call plug#end()
"}}}
