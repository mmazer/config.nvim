set termguicolors
if !empty($NVIM_COLORSCHEME)
    exe 'colorscheme '.$NVIM_COLORSCHEME
else
    colorscheme monokai_pro
endif

if has('gui_running')
    set guifont=Hack:h14
    set guioptions-=T " remove tool bar
    set guioptions-=r " remove right-hand scroll bar
    set guioptions-=L " remove left-hand scroll bar
    set lines=90
    set columns=145
endif
