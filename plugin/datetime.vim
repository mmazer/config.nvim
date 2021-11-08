if exists("g:loaded_datetime")
  finish
endif
let g:loaded_datetime = 1

command! Date :call datetime#date()

iab ddt <C-r>=datetime#datetime()<ESC>
iab dts <C-r>=datetime#short_date()<ESC>

