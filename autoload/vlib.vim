if exists("g:autoloaded_vlib")
  finish
endif

let g:autoloaded_vlib = 1

" Save last search and cursor position before executing a command
" http://technotales.wordpress.com/2010/03/31/preserve-a-vim-function-that-keeps-your-state/
function! vlib#preserve(command)
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

function! vlib#strip()
    call vlib#preserve("%s/\\s\\+$//e")
endfunction

" Same as preserve but wraps function ref
function! vlib#preserve_wrapper(funcref)
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
function! vlib#root_dir()
    let cph = expand('%:p:h', 1)
    if cph =~ '^.\+://' | retu | en
    for mkr in g:root_dir_markers
        let wd = call('find'.(mkr =~ '/$' ? 'dir' : 'file'), [mkr, cph.';'])
        if wd != '' | let &acd = 0 | brea | en
    endfo
    return fnameescape(wd == '' ? cph : substitute(wd, mkr.'$', '.', ''))
endfunction

function! vlib#cd_rootdir()
    exe ':lcd '.vlib#root_dir()
endfunction

function! vlib#syntax()
    return synIDattr(synID(line("."),col("."),1),"name")
endfunction

function! vlib#toggle_et()
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
function! vlib#run_shell_command(cmdline)
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
    let bufname = 'shell:'.a:cmdline
    let bufnum = bufnr(bufname)
    if bufnum == -1
        enew
        setlocal buftype=nofile noswapfile nowrap
        " Add mapping to re-run shell command using existing buffer
        exec 'map <buffer> <silent> <C-r> :%!'.expanded_cmdline.'<CR>'
        exec 'map <buffer> <silent> <C-d> :bw<CR>'
        silent exec 'file '.bufname
    else
        exec ':buffer '.bufnum
    endif
    silent execute '%! '. expanded_cmdline
    1
endfunction

function! vlib#browse(...)
    if a:0 < 1
        let uri = shellescape(matchstr(getline("."), '[a-z]*:\/\/[^ >,;\|\]\)\"]*'), 1)
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
            silent exec "!xdg-open ".uri
        else
            echo "OpenURI not supported on this system"
        endif
        exec ":redraw!"
    else
        echo "No URI found in line."
    endif
endfunction

function vlib#trim_trailing_lines()
  let last_line = line('$')
  let last_nonblank = prevnonblank(last_line)
  if last_line > 0 && last_nonblank != last_line
    silent! execute last_nonblank + 1 . ',$delete _'
  endif
endfunction

function vlib#has_gui()
    if has('gui_running')
        return 1
    elseif has('gui_vimr')
        return 1
    else
        return 0
    endif
endfunction

function! vlib#start_async(...)
    let cmd = join(a:000)
    call jobstart(cmd,  { 'on_exit': { j,d,e ->execute('echom "command '.cmd.' finished with exit status '.d.'"', '')}})
endfunction


