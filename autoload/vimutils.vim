if exists("g:autoloaded_vimutils")
  finish
endif

let g:autoloaded_vimutils = 1

" Save last search and cursor position before executing a command
" http://technotales.wordpress.com/2010/03/31/preserve-a-vim-function-that-keeps-your-state/
function! vimutils#preserve(command)
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    execute a:command
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

" Same as preserve but wraps function ref
function! vimutils#preserve_wrapper(funcref)
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    call a:funcref()
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

" Taken from ctrlp help file
function! vimutils#root_dir()
    let cph = expand('%:p:h', 1)
    if cph =~ '^.\+://' | retu | en
    for mkr in g:root_dir_markers
        let wd = call('find'.(mkr =~ '/$' ? 'dir' : 'file'), [mkr, cph.';'])
        if wd != '' | let &acd = 0 | brea | en
    endfo
    return fnameescape(wd == '' ? cph : substitute(wd, mkr.'$', '.', ''))
endfunction

function! vimutils#cd_rootdir()
    exe ':lcd '.vimutils#root_dir()
endfunction

function! vimutils#syntax()
    return synIDattr(synID(line("."),col("."),1),"name")
endfunction

function! vimutils#toggle_et()
  if &expandtab
    set shiftwidth=8
    set softtabstop=0
    set noexpandtab
    echo "using tabs"
  else
    set shiftwidth=4
    set softtabstop=4
    set expandtab
    echo "using spaces"
  endif
endfunction

" Quick way to run shell commands and capture output in split
" See http://vim.wikia.com/wiki/Display_output_of_shell_commands_in_new_window
function! vimutils#run_shell_command(cmdline)
    let isfirst = 1
    let words = []
    for word in split(a:cmdline)
        if isfirst
            let isfirst = 0  " don't change first word (shell command)
        else
            if word[0] =~ '\v[%#<]'
                let word = expand(word)
            endif
            let word = shellescape(word, 1)
        endif
        call add(words, word)
    endfor
    let expanded_cmdline = join(words)
    botright new
    setlocal buftype=nofile noswapfile nowrap
    silent execute '$read !'. expanded_cmdline
    exec 'file shell:' . fnameescape(a:cmdline)
    1
endfunction

function! vimutils#browse(...)
    if a:0 < 1
        let uri = shellescape(matchstr(getline("."), '[a-z]*:\/\/[^ >,;\)\"]*'), 1)
    else
        let uri = a:1
    endif
    if uri != ""
        echo uri

        if has('win32')
            silent exec "!cmd /C start /min ".uri
        elseif has('mac')
            silent exec "!open ".uri
        elseif has('unix')
            silent "!firefox ".uri
        else
            echo "OpenURI not supported on this system"
        endif
        exec ":redraw!"
    else
        echo "No URI found in line."
    endif
endfunction

"trip trailing empty newlines
function vimutils#trim_trailing_lines()
  let last_line = line('$')
  let last_nonblank = prevnonblank(last_line)
  if last_line > 0 && last_nonblank != last_line
    silent! execute last_nonblank + 1 . ',$delete _'
  endif
endfunction

