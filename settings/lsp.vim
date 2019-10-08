let g:LanguageClient_serverCommands = {
    \ 'python': ['pyls'],
    \ 'sh': ['bash-language-server', 'start'],
    \ 'dockerfile': ['docker-langserver','--stdio'],
    \ 'ruby': ['solargraph', 'stdio'],
    \ 'javascript': ['/home/mmazer/.yarn/bin/javascript-typescript-stdio'],
    \ 'typescript': ['/home/mmazer/.yarn/bin/javascript-typescript-stdio']
    \ }

nnoremap <silent> gol :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> <C-d> :call LanguageClient#textDocument_definition()<CR>

autocmd BufEnter __LanguageClient__ set filetype=text

let g:LanguageClient_autoStop=0
let g:LanguageClient_useVirtualText=0
let g:LanguageClient_diagnosticsList="Location"
