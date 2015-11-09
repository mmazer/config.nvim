" Based on monokai

" Maintainer:  Damien Gombault <desintegr@gmail.com>
" WWW:         http://desintegr.googlecode.com/svn/config/vim/colors/monokai.vim
" Last Change: 2008 Feb 27
" Version:     0.1.3

set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "chocolate"

hi Normal guifg=#F8F8F2 guibg=#272822  gui=NONE ctermfg=231 ctermbg=16 cterm=NONE

" Main highlight groups
hi Cursor guifg=NONE guibg=fg gui=NONE ctermfg=NONE ctermbg=fg cterm=NONE
"hi CursorIM
"hi CursorColumn
hi CursorLine guifg=NONE guibg=#3E3D32 gui=NONE ctermfg=NONE ctermbg=59 cterm=NONE
hi Directory guifg=#66D9EF guibg=NONE         gui=none ctermfg=81 ctermbg=NONE cterm=none
hi ErrorMsg guifg=#F92672 guibg=bg         gui=none ctermfg=197 ctermbg=bg cterm=none
hi VertSplit guifg=#3B3A32 guibg=bg         gui=none ctermfg=59 ctermbg=bg cterm=none
hi Folded guifg=#75715E guibg=bg         gui=none ctermfg=95 ctermbg=bg cterm=none
hi FoldColumn guifg=#75715E guibg=#3E3D32         gui=none ctermfg=95 ctermbg=59 cterm=none
hi SignColumn guifg=#FFFFFF guibg=NONE         gui=bold ctermfg=231 ctermbg=NONE cterm=bold
hi IncSearch guifg=bg guibg=#E6DB74         gui=none ctermfg=bg ctermbg=186 cterm=none
hi LineNr guifg=#75715E guibg=#3E3D32         gui=none ctermfg=95 ctermbg=59 cterm=none
hi MatchParen guifg=fg guibg=bg         gui=bold ctermfg=fg ctermbg=bg cterm=bold
hi ModeMsg guifg=NONE guibg=NONE         gui=none ctermfg=NONE ctermbg=NONE cterm=none
hi MoreMsg guifg=#66D9EF guibg=NONE         gui=none ctermfg=81 ctermbg=NONE cterm=none
hi NonText guifg=#3B3A32 guibg=NONE         gui=none ctermfg=59 ctermbg=NONE cterm=none
hi Pmenu guifg=fg guibg=#3E3D32         gui=NONE ctermfg=fg ctermbg=59 cterm=NONE
hi PmenuSel guifg=fg guibg=bg         gui=NONE ctermfg=fg ctermbg=bg cterm=NONE
hi PmenuSbar guifg=NONE guibg=bg         gui=NONE ctermfg=NONE ctermbg=bg cterm=NONE
hi PmenuThumb guifg=fg guibg=NONE         gui=NONE ctermfg=fg ctermbg=NONE cterm=NONE
hi Question guifg=#A6E22E guibg=NONE         gui=none ctermfg=148 ctermbg=NONE cterm=none
hi Search guifg=bg guibg=#E6DB74         gui=none ctermfg=bg ctermbg=186 cterm=none
hi SpecialKey guifg=#3B3A32 guibg=NONE         gui=none ctermfg=59 ctermbg=NONE cterm=none
hi SpellBad guifg=NONE guibg=NONE         gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi SpellCap guifg=NONE guibg=NONE         gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
"hi SpellLocal
hi SpellRare guifg=NONE guibg=NONE         gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi StatusLine guifg=fg guibg=#3E3D32         gui=none ctermfg=fg ctermbg=59 cterm=none
hi StatusLineNC guifg=#75715E guibg=#3E3D32         gui=none ctermfg=95 ctermbg=59 cterm=none
hi TabLine guifg=#75715E guibg=#3E3D32         gui=none ctermfg=95 ctermbg=59 cterm=none
hi TabLineFill guifg=fg guibg=#3E3D32         gui=none ctermfg=fg ctermbg=59 cterm=none
hi TabLineSel guifg=fg guibg=#3E3D32         gui=none ctermfg=fg ctermbg=59 cterm=none
hi Title guifg=#F92672 guibg=NONE         gui=none ctermfg=197 ctermbg=NONE cterm=none
hi Visual guifg=NONE guibg=#49483E         gui=none ctermfg=NONE ctermbg=59 cterm=none

" Diff
hi DiffAdd guifg=#e4e4e4 guibg=#519F50         gui=NONE ctermfg=188 ctermbg=71 cterm=NONE
hi DiffDelete guifg=#000000 guibg=#660000         gui=bold ctermfg=16 ctermbg=52 cterm=bold
hi DiffChange guifg=#FFFFFF guibg=#870087         gui=NONE ctermfg=231 ctermbg=90 cterm=NONE
hi DiffText guifg=#FFFFFF guibg=#FF0000         gui=bold ctermfg=231 ctermbg=196 cterm=bold

"hi VisualNOS
hi WarningMsg guifg=#F92672 guibg=NONE         gui=none ctermfg=197 ctermbg=NONE cterm=none
"hi WildMenu

"hi Menu
"hi ScrollBar
"hi Tooltip

" Color groups
hi Blue guifg=#66D9EF guibg=NONE         gui=none ctermfg=81 ctermbg=NONE cterm=none
hi Green guifg=#A6E22E guibg=NONE         gui=none ctermfg=148 ctermbg=NONE cterm=none
hi Grey guifg=#75715E guibg=NONE         gui=none ctermfg=95 ctermbg=NONE cterm=none
hi Orange guifg=#FD971F guibg=NONE         gui=none ctermfg=208 ctermbg=NONE cterm=none
hi Purple guifg=#AE81FF guibg=NONE         gui=none ctermfg=141 ctermbg=NONE cterm=none
hi Red guifg=#F92672 guibg=NONE         gui=none ctermfg=197 ctermbg=NONE cterm=none
hi White guifg=#F8F8F2 guibg=NONE         gui=none ctermfg=231 ctermbg=NONE cterm=none
hi Yellow guifg=#E6DB74 guibg=NONE         gui=none ctermfg=186 ctermbg=NONE cterm=none

hi BlueU guifg=#66D9EF guibg=NONE         gui=underline ctermfg=81 ctermbg=NONE cterm=underline

hi RedR guifg=fg guibg=#F92672         gui=none ctermfg=fg ctermbg=197 cterm=none
hi YellowR guifg=bg guibg=#FD971F         gui=none ctermfg=bg ctermbg=208 cterm=none

" Syntax highligh groups
hi! link Comment Grey
"
hi! link Constant Purple
hi! link String Yellow
hi! link Character    Yellow
"hi Number
"hi Boolean
"hi Float
"
hi! link Identifier   Green
"hi Function
"
hi! link Statement    Red
"hi Conditional
"hi Repeat
"hi Label
hi! link Operator     Green
"hi Keyword
"hi Exception
"
hi! link PreProc      Orange
"hi Include
"hi Define
"hi Macro
"hi PreCondit
"
hi! link Type         Blue
hi! link StorageClass Red
"hi Structure
"hi Typedef
"
hi! link Special      Grey
"hi SpecialChar
hi! link Tag          Green
"hi Delimiter
"hi SpecialComment
"hi Debug
"
hi! link Underlined   BlueU
"hi Ignore
hi! link Error        RedR
hi! link Todo         YellowR

" Language specific highligh groups
" C
hi link cStatement              Green
" C++
hi link cppStatement            Green
" CSS
hi link cssBraces               White
hi link cssFontProp             White
hi link cssColorProp            White
hi link cssTextProp             White
hi link cssBoxProp              White
hi link cssRenderProp           White
hi link cssAuralProp            White
hi link cssRenderProp           White
hi link cssGeneratedContentProp White
hi link cssPagingProp           White
hi link cssTableProp            White
hi link cssUIProp               White
hi link cssFontDescriptorProp   White
" Java
hi link javaStatement           Green
" Ruby
hi link rubyClassVariable       White
hi link rubyControl             Green
hi link rubyGlobalVariable      White
hi link rubyInstanceVariable    White

" taskpaper
hi link taskpaperProject        Yellow
