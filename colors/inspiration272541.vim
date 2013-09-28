" Generated by Inspiration at Sweyla
" http://inspiration.sweyla.com/code/seed/272541/

set background=light

hi clear

if exists("syntax_on")
  syntax reset
endif

" Set environment to 256 colours
set t_Co=256

let colors_name = "inspiration272541"

if version >= 700
  hi CursorLine     guibg=#FEFCFF ctermbg=231
  hi CursorColumn   guibg=#FEFCFF ctermbg=231
  hi MatchParen     guifg=#B80AE9 guibg=#FEFCFF gui=bold ctermfg=128 ctermbg=231 cterm=bold
  hi Pmenu          guifg=#000000 guibg=#C8C8C8 ctermfg=16 ctermbg=251
  hi PmenuSel       guifg=#000000 guibg=#DD09AC ctermfg=16 ctermbg=163
endif

" Background and menu colors
hi Cursor           guifg=NONE guibg=#000000 ctermbg=16 gui=none
hi Normal           guifg=#000000 guibg=#FEFCFF gui=none ctermfg=16 ctermbg=231 cterm=none
hi NonText          guifg=#000000 guibg=#EFEDF0 gui=none ctermfg=16 ctermbg=255 cterm=none
hi LineNr           guifg=#000000 guibg=#E5E3E6 gui=none ctermfg=16 ctermbg=254 cterm=none
hi StatusLine       guifg=#000000 guibg=#F7CBEE gui=italic ctermfg=16 ctermbg=225 cterm=italic
hi StatusLineNC     guifg=#000000 guibg=#D6D4D7 gui=none ctermfg=16 ctermbg=188 cterm=none
hi VertSplit        guifg=#000000 guibg=#E5E3E6 gui=none ctermfg=16 ctermbg=254 cterm=none
hi Folded           guifg=#000000 guibg=#FEFCFF gui=none ctermfg=16 ctermbg=231 cterm=none
hi Title            guifg=#DD09AC guibg=NONE	gui=bold ctermfg=163 ctermbg=NONE cterm=bold
hi Visual           guifg=#CA3B46 guibg=#C8C8C8 gui=none ctermfg=167 ctermbg=251 cterm=none
hi SpecialKey       guifg=#C03B8F guibg=#EFEDF0 gui=none ctermfg=132 ctermbg=255 cterm=none
"hi DiffChange       guibg=#FEFCB2 gui=none ctermbg=229 cterm=none
"hi DiffAdd          guibg=#D7D5FF gui=none ctermbg=189 cterm=none
"hi DiffText         guibg=#FEC9FF gui=none ctermbg=225 cterm=none
"hi DiffDelete       guibg=#FEBDBF gui=none ctermbg=217 cterm=none


" Syntax highlighting
hi Comment guifg=#DD09AC gui=none ctermfg=163 cterm=none
hi Constant guifg=#C03B8F gui=none ctermfg=132 cterm=none
hi Number guifg=#C03B8F gui=none ctermfg=132 cterm=none
hi Identifier guifg=#945C7C gui=none ctermfg=96 cterm=none
hi Statement guifg=#B80AE9 gui=none ctermfg=128 cterm=none
hi Function guifg=#8D6090 gui=none ctermfg=96 cterm=none
hi Special guifg=#FF0A41 gui=none ctermfg=197 cterm=none
hi PreProc guifg=#FF0A41 gui=none ctermfg=197 cterm=none
hi Keyword guifg=#B80AE9 gui=none ctermfg=128 cterm=none
hi String guifg=#CA3B46 gui=none ctermfg=167 cterm=none
hi Type guifg=#8B4938 gui=none ctermfg=95 cterm=none
hi pythonBuiltin guifg=#945C7C gui=none ctermfg=96 cterm=none
hi TabLineFill guifg=#E9AEB5 gui=none ctermfg=181 cterm=none

