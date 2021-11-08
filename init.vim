let $VIMDATA = stdpath('data')
let $VIMCACHE = stdpath('cache')
let $VIMCONFIG = stdpath('config')
let $VIMPLUGINS = $VIMDATA.'/plugged'

let g:loaded_netrw     = 1
let loaded_netrwPlugin = 1

" }}}
"
runtime! init.d/*.vim

if filereadable($VIMDATA.'/site.vim')
    source $XDG_DATA_HOME/nvim/site.vim
endif

