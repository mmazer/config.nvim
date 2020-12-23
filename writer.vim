runtime! init.d/env.vim

call plug#begin($XDG_DATA_HOME.'/nvim/plugged')
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" colorschemes
Plug 'sainnhe/gruvbox-material'
call plug#end()

colorscheme gruvbox-material-ext

autocmd VimEnter * silent!  Goyo 80
