if exists("g:autoloaded_datetime")
  finish
endif
let g:autoloaded_datetime = 1

if !exists('g:timestamp_format')
    let g:timestamp_format = '%Y-%m-%dT%H:%M:%S %z'
endif

function! datetime#timestamp()
    return strftime(g:timestamp_format)
endfun

function! datetime#datetime()
    return strftime("%Y-%m-%d %H:%M")
endfun

function! datetime#short_date()
    return strftime("%Y-%m-%d")
endfun

function! datetime#date()
    echo strftime('%a %d %b %Y %H:%M:%S Week %W')
endfunction

function! datetime#update_modified_time()
    let lines = line('$')
    if lines >  5
      let lines = 5
    endif

    try
      execute ':1,'..lines..
          \ 's/\<\%([Mm]odified\|[Ll]ast-modified\)\>\:\s\zs.*/\=datetime#timestamp()/g'
    catch
    endtry
endfunction
