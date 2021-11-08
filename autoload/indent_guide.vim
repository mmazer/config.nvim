" Basic indent guides
" Use conceal chars based on https://github.com/thaerkh/vim-indentguides
"
if exists("g:autoloaded_indent_guide")
  finish
endif

let g:autoloaded_indent_guide = 1

let g:indentguide_char = get(g:, 'indentguide_char', '┆')

function! indent_guide#toggle()
    if exists('b:indent_guides')
        unlet b:indent_guides
        silent! syntax clear IndentGuideSpace
        silent! syntax clear IndentGuide
    else
        exe 'syntax match IndentGuideSpace /^\ \+/ containedin=ALL contains=IndentGuide keepend'
        exe printf('syntax match IndentGuide /\ \{%i}\zs \ze/ contained conceal cchar=', &l:shiftwidth - 1) . g:indentguide_char
        setlocal concealcursor=inc
        setlocal conceallevel=1
        hi! link Conceal Special
        let b:indent_guides = 1
    endif
endfunction

