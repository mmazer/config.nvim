set termguicolors
if !empty($NVIM_COLORSCHEME)
    exe 'colorscheme '.$NVIM_COLORSCHEME
else
    colorscheme gruvbox-material-ext
endif
