if !exists('g:zettel_dir')
  let g:zettel_dir=$VIMDATA."/zettelkasten/"
endif
command! -nargs=1 NewZettel :execute ":e" g:zettel_dir . strftime("%Y%m%d%H%M") . "-<args>.md"
