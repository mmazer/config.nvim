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

set runtimepath+=$XDG_CONFIG_HOME/nvim,$XDG_CONFIG_HOME/nvim/after,$VIM,$VIMRUNTIME
