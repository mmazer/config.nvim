runtime! init.d/env.vim

call plug#begin($XDG_DATA_HOME.'/nvim/plugged')
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" colorschemes
Plug 'sainnhe/gruvbox-material'
call plug#end()

set termguicolors
colorscheme gruvbox-material-ext

runtime settings/goyo.vim
autocmd VimEnter * silent!  Goyo 80
autocmd VimLeave *  silent! Goyo
