" Based on cmd.vim from vimuiex by Marko Mahnič
" See https://vim.sourceforge.io/scripts/script.php?script_id=2606

if exists("g:autoloaded_qfpreview")
    finish
endif

let g:autoloaded_qfpreview = 1

function! qfpreview#show()
    let ln = line('.')
    let pos = getqflist()[ln-1]
    call qfpreview#open(pos['bufnr'], pos['lnum'])
endfunc

function! qfpreview#open(bufnr, line)
    let ln = a:line
    if ln < 1
        let ln = 1
    endif
    let fname = a:bufnr
    if type(fname) == type(0) " number
        let fname = bufname(fname)
    endif
    if fname == '%'
        let fname = bufname('%')
    endif
    if fname == ''
        return
    endif

    let cwnr = winnr() " current window
    let buflisted = buflisted(a:bufnr)

    exec 'pedit ' . '+' . ln . ' ' . fname
    silent! wincmd P
    setlocal cursorline
    if !buflisted
        setlocal bufhidden=delete
        setlocal nobuflisted        " don't list this buffer
        setlocal noswapfile         " don't create swap file for this buffer
        setlocal readonly           " make this buffer readonly
        setlocal nofoldenable       " disable folding
    endif
    exec cwnr . 'wincmd w'
endfunc
