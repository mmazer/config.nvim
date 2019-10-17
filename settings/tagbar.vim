" Sort by order in file
let g:tagbar_sort=0
let g:tagbar_type_markdown = {
    \ 'ctagstype' : 'markdown',
    \ 'kinds' : [
        \ 'h:Headings'
    \ ]
\ }
let g:tagbar_type_typescript = {
    \ 'ctagstype' : 'typescript',
    \ 'kinds' : [
        \ 'C:Classes',
        \ 'N:Namespaces',
        \ 'f:functions',
        \ 'v:varlambdas',
        \ 'm:members',
        \ 'i:Interfaces',
        \ 't:types',
        \ 'e:enums',
        \ 'I:imports'
    \]
\ }

nnoremap cot :TagbarToggle<CR>
