if exists("g:loaded_fugit")
  finish
endif

let g:loaded_fugit= 1

command! GdiffBuf :call fugit#diff_buf()

command! Gindex :call fugit#diff_index()

command! Gworking :call fugit#diff_working()

command! Gincoming :call fugit#incoming()

command! Goutgoing :call fugit#outgoing()

command! Gtags :call fugit#tags()

command! -nargs=1 Gshow call fugit#show(<f-args>)

command! -nargs=1 Ghelp call fugit#help(<f-args>)

command! Fugit :call fugit#status()
