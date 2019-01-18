let g:LanguageClient_serverCommands = {
    \ 'python': ['pyls'],
    \ 'sh': ['bash-language-server', 'start'],
    \ }

nnoremap <silent> gol :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> <C-d> :call LanguageClient#textDocument_definition()<CR>

autocmd BufEnter __LanguageClient__ set filetype=text
