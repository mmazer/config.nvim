" Generated by Inspiration at Sweyla
" http://inspiration.sweyla.com/code/seed/188093/

set background=light

hi clear

if exists("syntax_on")
  syntax reset
endif

" Set environment to 256 colours
set t_Co=256

let colors_name = "inspiration188093"

if version >= 700
  hi CursorLine     guibg=#FFFBF8 ctermbg=231
  hi CursorColumn   guibg=#FFFBF8 ctermbg=231
  hi MatchParen     guifg=#51C47D guibg=#FFFBF8 gui=bold ctermfg=78 ctermbg=231 cterm=bold
  hi Pmenu          guifg=#000000 guibg=#C8C8C8 ctermfg=16 ctermbg=251
  hi PmenuSel       guifg=#000000 guibg=#00C4B0 ctermfg=16 ctermbg=43
endif

" Background and menu colors
hi Cursor           guifg=NONE guibg=#000000 ctermbg=16 gui=none
hi Normal           guifg=#000000 guibg=#FFFBF8 gui=none ctermfg=16 ctermbg=231 cterm=none
hi NonText          guifg=#000000 guibg=#F0ECE9 gui=none ctermfg=16 ctermbg=255 cterm=none
hi LineNr           guifg=#000000 guibg=#E6E2DF gui=none ctermfg=16 ctermbg=254 cterm=none
hi StatusLine       guifg=#000000 guibg=#CCF0E9 gui=italic ctermfg=16 ctermbg=254 cterm=italic
hi StatusLineNC     guifg=#000000 guibg=#D7D3D0 gui=none ctermfg=16 ctermbg=252 cterm=none
hi VertSplit        guifg=#000000 guibg=#E6E2DF gui=none ctermfg=16 ctermbg=254 cterm=none
hi Folded           guifg=#000000 guibg=#FFFBF8 gui=none ctermfg=16 ctermbg=231 cterm=none
hi Title            guifg=#00C4B0 guibg=NONE	gui=bold ctermfg=43 ctermbg=NONE cterm=bold
hi Visual           guifg=#6C5FC4 guibg=#C8C8C8 gui=none ctermfg=62 ctermbg=251 cterm=none
hi SpecialKey       guifg=#65FF0C guibg=#F0ECE9 gui=none ctermfg=82 ctermbg=255 cterm=none
"hi DiffChange       guibg=#FFFCAD gui=none ctermbg=229 cterm=none
"hi DiffAdd          guibg=#D8D5FA gui=none ctermbg=189 cterm=none
"hi DiffText         guibg=#FFC8FA gui=none ctermbg=225 cterm=none
"hi DiffDelete       guibg=#FFBCBA gui=none ctermbg=217 cterm=none


" Syntax highlighting
hi Comment guifg=#00C4B0 gui=none ctermfg=43 cterm=none
hi Constant guifg=#65FF0C gui=none ctermfg=82 cterm=none
hi Number guifg=#65FF0C gui=none ctermfg=82 cterm=none
hi Identifier guifg=#00FFAC gui=none ctermfg=49 cterm=none
hi Statement guifg=#51C47D gui=none ctermfg=78 cterm=none
hi Function guifg=#00B99B gui=none ctermfg=36 cterm=none
hi Special guifg=#00B8C4 gui=none ctermfg=38 cterm=none
hi PreProc guifg=#00B8C4 gui=none ctermfg=38 cterm=none
hi Keyword guifg=#51C47D gui=none ctermfg=78 cterm=none
hi String guifg=#6C5FC4 gui=none ctermfg=62 cterm=none
hi Type guifg=#00D649 gui=none ctermfg=41 cterm=none
hi pythonBuiltin guifg=#00FFAC gui=none ctermfg=49 cterm=none
hi TabLineFill guifg=#C4BCE3 gui=none ctermfg=251 cterm=none
