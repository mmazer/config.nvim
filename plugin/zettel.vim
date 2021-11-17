if !exists('g:zettel_dir')
  let g:zettel_dir=$XDG_DATA_HOME."/pkm/zk/"
endif
command! -nargs=1 NewZettel :execute ":e" g:zettel_dir . strftime("%Y%m%d%H%M") . "-<args>.md"
