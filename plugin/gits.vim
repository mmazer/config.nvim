if exists("g:loaded_gits")
  finish
endif

let g:loaded_gits= 1

command! GdiffBuf :call gits#diff_buf()

command! Gindex :call gits#diff_index()

command! Gworking :call gits#diff_working()

command! Gincoming :call gits#incoming()

command! Goutgoing :call gits#outgoing()

command! Gtags :call gits#tags()

command! -nargs=1 Gshow call gits#show(<f-args>)

command! -nargs=1 Ghelp call gits#help(<f-args>)

command! GitStat :call gits#status()
