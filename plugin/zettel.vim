command! -nargs=1 NewZettel :execute ":e" g:zettelkasten . strftime("%Y%m%d%H%M") . "-<args>.md"
