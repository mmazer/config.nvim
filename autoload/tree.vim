if exists("g:loaded_tree")
  finish
endif
let g:loaded_tree = 1

if !exists('g:tree_default_options')
  let g:tree_default_options = '-n -F --noreport'
endif

if !exists('g:tree_cmd')
  let g:tree_cmd = 'tree'
endif

function tree#dir(opts)
  if empty(a:opts)
    let cmd = printf('%s %s %s',
      \ g:tree_cmd, g:tree_default_options, fnameescape(getcwd()))
  else
    let cmd = printf('%s %s %s',
      \ g:tree_cmd, g:tree_default_options, a:opts)
  endif
  execute ':Shell '. cmd
endfunction

function tree#bufdir()
  let path = expand('%:p:h')
  call tree#dir(path)
endfunction

function tree#root_dir()
  let path = vlib#root_dir()
  if empty(path)
    echom 'no root dir found for ' . g:root_dir_markers
    return
  endif
  call tree#dir(path)
endfunction
