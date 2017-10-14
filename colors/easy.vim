" Based on https://github.com/saalaa/ancient-colors.vim

hi clear

if exists('syntax_on')
   syntax reset
endif

set background=light

let g:colors_name = 'easy'

" Basic styling
hi Normal     guifg=#000000 guibg=#eeeeee ctermfg=0   ctermbg=238

hi Identifier guifg=#000000 guibg=NONE    gui=BOLD    ctermfg=0     ctermbg=NONE
hi Constant   guifg=#000000 guibg=NONE    ctermfg=0   ctermbg=NONE
hi Function   guifg=#000000 guibg=NONE    ctermfg=0   ctermbg=NONE
hi Title      guifg=#000000 guibg=NONE    ctermfg=0   ctermbg=NONE

" Selection
hi Visual     guifg=#000000 guibg=#cccccc ctermfg=0   ctermbg=188
hi Cursor     guifg=#ffffff guibg=#000000 ctermfg=231 ctermbg=0

" Strings
hi String     guifg=#3F7F5F guibg=NONE    ctermfg=53  ctermbg=NONE
hi Special    guifg=#5F005F guibg=NONE    ctermfg=53  ctermbg=NONE
hi Directory  guifg=#5F005F guibg=NONE    ctermfg=53  ctermbg=NONE

" Comments
hi Comment    guifg=#808080 guibg=NONE    ctermfg=65  ctermbg=NONE
hi Todo       guifg=#000000 guibg=NONE    ctermfg=0   ctermbg=NONE

" Structure
hi Statement  guifg=#00007F guibg=NONE    ctermfg=18  ctermbg=NONE
hi PreProc    guifg=#00007F guibg=NONE    ctermfg=18  ctermbg=NONE
hi Type       guifg=#00007F guibg=NONE    gui=NONE    ctermfg=18    ctermbg=NONE

" Default styles
hi Search     guifg=#000000 guibg=#ffff00 ctermfg=0   ctermbg=226
hi NonText    guifg=#ff0000 guibg=NONE    ctermfg=196 ctermbg=NONE

hi LineNr       guifg=#aaaaaa guibg=NONE  ctermfg=8   ctermbg=NONE
hi StatusLine   guifg=#000000 guibg=#cccccc gui=NONE  ctermfg=188   ctermbg=0   cterm=NONE
hi StatusLineNC guifg=#ffffff guibg=#cccccc gui=NONE  ctermfg=188   ctermbg=8 cterm=None
hi VertSplit    guifg=#cccccc guibg=#cccccc ctermfg=188   ctermbg=188

hi CursorLine   guifg=#000000 guibg=#cccccc ctermfg=0     ctermbg=188 cterm=NONE

" Gutter column
hi SignColumn   guifg=#aaaaaa guibg=NONE    ctermfg=8     ctermbg=NONE

hi ColorColumn  guibg=#dddddd

" NERDTree
hi link NERDTreeDir NERDTreeDirSlash

" Ensure lint errors and warnings use correct bg
" See https://github.com/w0rp/ale/issues/249
highlight clear ALEErrorSign
highlight clear ALEWarningSign
