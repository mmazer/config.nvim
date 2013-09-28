highlight ExtraWhitespace ctermbg=red guibg=red
autocmd Syntax *.js syn match ExtraWhitespace /\s\+$\| \+\ze\t/ containedin=ALL
