function! ctrlp#funky#html#filters()
  let filters = [
        \ { 'pattern': '\v<id>\=',
        \   'formatter': ['\m\C^[\t ]*', '', ''] }
  \ ]
  return filters
endfunction
