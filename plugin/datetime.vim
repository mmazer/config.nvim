if exists("g:loaded_datetime")
  finish
endif
let g:loaded_datetime = 1

command! Date :call datetime#date()

iab dts <c-r>=datetime#datetime()<esc>
iab ddt <c-r>=datetime#short_date()<esc>
