set termguicolors
if !vlib#has_gui() && !empty($TERM_BG)
    let g:terminal_bg = 1
endif

if !empty($TERM_THEME)
    exe 'colorscheme '.$TERM_THEME
else
    colorscheme spaceterm
endif
