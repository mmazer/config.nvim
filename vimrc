set nocompatible

" disable before calling vundle
filetype off
syntax off

" Bundles {{{1
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Color schemes {{{2
Bundle 'altercation/vim-colors-solarized'
Bundle 'junegunn/seoul256.vim'
Bundle 'dhruvasagar/vim-railscasts-theme'
Bundle 'gregsexton/Gravity'

" Features
Bundle 'benmills/vimux'
Bundle 'epeli/slimux'
Bundle 'gmarik/vundle'
Bundle 'mattn/emmet-vim'
Bundle 'kien/ctrlp.vim'
Bundle 'mattn/ctrlp-mark'
Bundle 'mattn/ctrlp-register'
Bundle 'rking/ag.vim'
Bundle 'mmazer/ctrlp-funky'
Bundle 'tpope/vim-characterize'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-dispatch'
Bundle 'tpope/vim-vinegar'
Bundle 'Raimondi/delimitMate'
Bundle 'scrooloose/syntastic'
Bundle 'mattn/webapi-vim'
Bundle 'mattn/gist-vim'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'Shougo/neocomplete.vim'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'
Bundle 'honza/vim-snippets'
Bundle 'justinmk/vim-gtfo.git'

" File types
Bundle 'derekwyatt/vim-scala'
Bundle 'pangloss/vim-javascript'
Bundle 'elzr/vim-json'
Bundle 'davidoc/taskpaper.vim'
Bundle 'nelstrom/vim-markdown-folding'
Bundle 'groenewege/vim-less'
Bundle 'ap/vim-css-color'

filetype plugin indent on
syntax on
" try to improve performance
syntax sync minlines=256

" Basic Settings {{{1
set ruler
set number "see augroup linenumber
set nocursorline " no cursor line by default for performance - toggle with unimpaired `coc`

" indentation: use 4 spaces and replace tabs
set expandtab
set shiftwidth=4
set softtabstop=4

" soft wrapping
set wrap linebreak textwidth=0

" make managing multiple buffers easier:
"  - current buffer (with unsaved modifications) can be placed in the
"    background without saving;
"  - when a background buffer becomes current again, marks and undo-history are
"    remembered.
set hidden

" reload files modified externally
set autoread

" completion
set completeopt=longest,menuone,preview

" wildmenu completion
set wildmenu
set wildmode=longest,list

set wildignore+=.hg,.git,.svn,CVS,target,.settings
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg
set wildignore+=*.class,*.jar,*.war,*.o,*.obj,*.exe,*.dll
set wildignore+=*.DS_Store
set wildignore+=*.orig      " merge resolution files

" backups
" 2012-09-26 - let's try no backups and no swaps
set nobackup
set noswapfile

" Use two path separators so the swap file name will be built from the complete
" path to the file with all path separators substituted to percent '%' signs.
" This will ensure file name uniqueness in the preserve directory.
set backupdir=$HOME/.var/vim/backup//
set directory=$HOME/.var/vim/swp//

" enable '%' command jump to matching HTML tags and if/else/endif in Vim
" scripts
runtime macros/matchit.vim

" spelling
set spelllang=en
set spellfile=~/.vim/spell/spellfile.en.add

" Reduce delays waiting for multi-key combinations when running in tmux
" tmux needs `set -s escape-time 0` for these to work
set ttimeout timeout ttimeoutlen=125

" disable bell/visual bell
set noeb vb t_vb=
au GUIEnter * set vb t_vb=

" Search {{{1
set incsearch
set hlsearch
set ignorecase
set smartcase   "case sensitive if search term contains upppecase letter

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv
if executable('ag')
    set grepprg=ag\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow
    set grepformat=%f:%l:%c:%m
    " use ag with ctrlp
    let g:ctrlp_user_command = 'ag %s -l --nocolor --follow -g ""'
    if !has('win32') 
        let g:ctrlp_use_caching = 0
    endif

endif

" start scrolling 2 lines from bottom
set scrolloff=2

" Tweak various messages and disable startup screen
set shortmess=aTItoO

" Folding {{{1
set foldmethod=syntax                   "fold based on indent
set foldnestmax=2                       "deepest fold is 10 levels
set nofoldenable                        "don't fold by default
let g:xml_syntax_folding=1              "enable xml folding
"
" Space to toggle folds.
nnoremap <Space>z za
vnoremap <Space>z za

" Refocus fold under cursor
" From Steve Losh
nnoremap ,z zMzvzz

set foldtext=CustomFoldText()

" GUI {{{1
if has("gui_running")
    set antialias
    if has('mac')
        set guifont=DejaVu\ Sans\ Mono:h12
        "set clipboard=unnamedplus "use + register for system clipboard
    elseif has('win32')
        set guioptions-=m " Remove menu bar to save space
        set guioptions+=a " Yank to system clipboard
        set guifont=DejaVu_Sans_Mono:h9
    endif
    set guioptions-=T " remove tool bar
    set guioptions-=r " remove right-hand scroll bar
    set guioptions-=L " remove left-hand scroll bar
    set lines=90
    set columns=145
else
    set t_Co=256
endif
"set background=dark
colorscheme railscasts
command! Light colorscheme gravity
command! Dark colorscheme railscasts

" Status Line {{{1
set laststatus=2
set statusline=%{Mode()}
set statusline+=%{&paste?'\ (paste)':'\ '}
set statusline+=\|
set statusline+=\ %{Branch()}
set statusline+=\ %f\:%n            "file name and buffer #
set statusline+=%(\[%R%M\]%)      "modified flag
set statusline+=\ %{SyntasticStatuslineFlag()}
set statusline+=%=
set statusline+=\ %y      "filetype
set statusline+=\ %{Fenc()} " file encoding
set statusline+=\[%{&ff}\]  "file format
set statusline+=\ \|\ LN\:%4.l/%-4.L\:%-3.c   "cursor line/total lines:column

" Key Bindings {{{1

"keep original motion: repeat latest f, t, F or T in opposite direction
noremap ,, ,
let mapleader = ","
let g:mapleader = ","

" One less key to press for commands
"keep original motion: repeat latest f, t, F or T
"noremap <leader>f ;
"nnoremap ; :
nnoremap g<space> :

" Better mark jumping (line + col)
nnoremap ' `

" preserve original motions that will be remapped below
nnoremap BB B
nnoremap EE E

" for toggling paste mode in terminal
" Can also use `yo` from `unimpaired`
set pastetoggle=<F5>
nnoremap <C-p> "+gP
inoremap <C-v> <esc>"+gPi
vnoremap <C-p> "+gP

" For wrapped lines, navigate normally
noremap  <buffer> <silent> k gk
noremap  <buffer> <silent> j gj
noremap  <buffer> <silent> 0 g0
noremap  <buffer> <silent> $ g$

" Move to end of line in insert mode
inoremap <C-]> <C-o>$

inoremap <C-SPACE> <C-o>

noremap <silent> Q :q!<CR>

" Quick edit of this file - path only supported in 7.4+
noremap Ev :e ~/.vim/vimrc<CR>
noremap So :so ~/.vim/vimrc<CR>

" Buffer shortcuts
" preserve original B motion
nnoremap Bd :bd<CR>
nnoremap Bg :ls<CR>:b
nnoremap Bl :ls<CR>
nnoremap Bw :w!<CR>
nnoremap Bs :w<CR>
nnoremap Bn :bn<CR>
nnoremap Bp :bp<CR>
nnoremap BP :b#<CR>

nnoremap gb :ls<CR>:b

" removing search match highlighting
nmap <leader><space> :noh<CR>

" Source lines - from Steve Losh
vnoremap X y:execute @@<cr>:echo 'Sourced selection.'<cr>
nnoremap X ^vg_y:execute @@<cr>:echo 'Sourced line.'<cr>

" Avoid the escape key - remember <C-[> also maps to Esc
"inoremap jj <ESC>`^
"inoremap jk <ESC>`^
inoremap kj <ESC>`^

" Prefer to use Perl/Ruby style regex patterns
" See http://briancarper.net/blog/448/
nnoremap / /\v
vnoremap / /\v

nnoremap <Leader>j J
" Easier to type, and I never use the default behavior.
nnoremap K H 
nnoremap J L 
noremap H ^
noremap L $
vnoremap L g_

" reselect visual block after indent
vnoremap < <gv
vnoremap > >gv

" Use ,d (or ,dd or ,dj or 20,dd) to delete a line without adding it to the
" yanked stack (also, in visual mode)
nnoremap <silent> <leader>d "_d
vnoremap <silent> <leader>d "_d

" Quick yanking to the end of the line
nnoremap Y y$

" manage windows
nnoremap W <C-w>

" navigation: use ctrl-h/j/k/l to switch between splits
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

set splitbelow
set splitright

" manage tabs
" navigation: http://vim.wikia.com/wiki/Alternative_tab_navigation
nnoremap th  :tabfirst<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnext<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>

" toggling following vim-unimpaired
nnoremap [of :setlocal foldcolumn=3<CR>
nnoremap ]of :setlocal foldcolumn=0<CR>

" Insert lines in normal mode
nmap <Leader>o i<CR><Esc>k$
nmap <Leader>O O<Esc>

" Swapping characters and words
" http://vim.wikia.com/wiki/Swapping_characters,_words_and_lines

" swap the current character with the next, without changing the cursor position
:nnoremap <silent> gc xph

" swap the current word with the next, without changing cursor position
:nnoremap <silent> gw "_yiw:s/\(\%#\w\+\)\(\W\+\)\(\w\+\)/\3\2\1/<CR><c-o><c-l>

" swap the current word with the previous, keeping cursor on current word
:nnoremap <silent> gl "_yiw?\w\+\_W\+\%#<CR>:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o><c-l>

" swap the current word with the next, keeping cursor on current word
:nnoremap <silent> gr "_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o>/\w\+\_W\+<CR><c-l>

" Open current buffer in Marked
:nnoremap <leader>M :silent !open -a Marked.app '%:p'<cr>

" Function mappings see ~/.vim/functions.vim
noremap <leader>c :call ToggleBackgroundColour()<CR>

" indent the whole file and return to original position
nmap <leader>if gg=G``

" Remove trailing space
nmap _$ :call StripTrailingWhitespace()<CR>

nmap _= :call Preserve("normal gg=G")<CR>

" Select (charwise) the contents of the current line, excluding indentation.
" Borrowed from Steve Losh https://bitbucket.org/sjl/dotfiles/src/tip/vim/vimrc
inoremap vv ^vg_

" set current working directory
nmap <leader>cd :call Setcwd()<cr>

" quick fix window
nnoremap gq :copen<CR>
nnoremap cq :cclose<CR>

nnoremap gl :llist<CR>
noremap cl :lclose<CR>

" end lines with semicolons
inoremap ;; <C-o>A;
nnoremap <Leader>; A;<esc>

nnoremap <Leader>rd :redraw!<CR>
noremap <C-U> :redraw!<CR>
command! Rd :redraw!

" Slimux keys
map <Leader>s :SlimuxREPLSendLine<CR>
vmap <Leader>s :SlimuxREPLSendSelection<CR>

" Custom Slimux commands
command! GrailsStop :SlimuxShellRun stop-app
command! GrailsRun :SlimuxShellRun run-app

" File Types {{{1
set encoding=utf-8
set ffs=unix,dos,mac "Default file types
set ff=unix " set initial buffer file format

" Autocommands {{{1

"augroup LineNumber 
"    autocmd FocusLost * :set number
"    autocmd InsertEnter * :set number
"    autocmd InsertLeave * :set relativenumber
"    autocmd CursorMoved * :set relativenumber
"augroup END

" Remove trailing whitespace
autocmd FileType css,groovy,java,javascript,less,php,scala autocmd BufWritePre <buffer> :%s/\s\+$//e

augroup javascript_files
    autocmd FileType javascript setlocal foldmethod=indent
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
augroup end

augroup vim_files
    autocmd filetype vim set foldmethod=marker
augroup end

augroup html_files
    "autocmd filetype html set ft=xml.html.javascript
    autocmd FileType html setlocal shiftwidth=2 softtabstop=2 tabstop=2 foldmethod=manual
    autocmd FileType setlocal autoindent
augroup end

augroup jsp_files
    autocmd filetype jsp set ft=jsp.html
    autocmd filetype jsp set foldmethod=manual
augroup end

augroup gsp_files
    autocmd FileType gsp set ft=gsp.html
    autocmd FileType gsp setlocal shiftwidth=2 softtabstop=2 tabstop=2 foldmethod=manual
augroup end

augroup java_files
    autocmd filetype java compiler maven
    autocmd FileType java setlocal foldmethod=syntax
    autocmd FileType java setlocal comments=sl:/**,mb:\ *,exl:\ */,sr:/*,mb:*,exl:*/,://
    " hide completion scatch window when using eclim
    autocmd FileType java setlocal completeopt-=preview
augroup end

augroup css_files
    autocmd FileType css setlocal  omnifunc=csscomplete#CompleteCSS
augroup end

augroup less_files
    autocmd FileType less setlocal omnifunc=csscomplete#CompleteCSS
augroup end

augroup jmeter_files
    autocmd! BufRead *.jtl setlocal ft=text
augroup end

augroup json_files
    "autocmd FileType json set ft=json
    "autocmd filetype json set foldmethod=syntax
    autocmd FileType json nnoremap <buffer> <Leader>fj :%!python -m json.tool<CR>
augroup end

augroup xml_files
    autocmd filetype xml setlocal foldmethod=syntax
augroup end

augroup taskpaper_files
    autocmd FileType taskpaper setlocal noexpandtab
augroup end

" Plugins {{{1
" load man page plugin shipped with Vim
runtime ftplugin/man.vim

" ctrlp
nmap <space> [ctrlp]
nnoremap <silent> [ctrlp]a :<C-u>CtrlPBookmarkDirAdd<cr>
nnoremap <silent> [ctrlp]b :<C-u>CtrlPBuffer<cr>
nnoremap <silent> [ctrlp]c :<C-u>CtrlPClearCache<cr>
nnoremap <silent> [ctrlp]d :<C-u>CtrlPDir<cr>
nnoremap <silent> [ctrlp]f :<C-u>CtrlP<cr>
nnoremap <silent> [ctrlp]m :<C-u>CtrlPMark<cr>
nnoremap <silent> [ctrlp]o :<C-u>CtrlPBookmarkDir<cr>
nnoremap <silent> [ctrlp]r :<C-u>CtrlPRegister<cr>
nnoremap <silent> [ctrlp]q :<C-u>CtrlPQuickFix<cr>
nnoremap <silent> [ctrlp]s :<C-u>CtrlPFunky<cr>


let g:ctrlp_extensions = ['quickfix', 'dir', 'undo', 'line', 'changes', 'mixed', 'bookmarkdir', 'funky', 'mark', 'register']
let g:ctrlp_match_window_bottom = 1 " Show at top of window
let g:ctrlp_working_path_mode = 'ra' " Smart path mode
let g:ctrlp_mru_files = 1 " Enable Most Recently Used files feature
let g:ctrlp_jump_to_buffer = 2 " Jump to tab AND buffer if already open
let g:ctrlp_match_window_reversed = 1
let g:ctrlp_root_markers = ['.top', '.project', '.ctrlp']
let g:ctrlp_follow_symlinks = 1

let g:ctrlp_custom_ignore = {
    \ 'dir':  'target\|node_modules\|.settings'
    \ }

" fugitive
nnoremap gs :Gstatus<CR>
" trying different mapping for fugitive
noremap Us :Gstatus<CR>
noremap Ud :Gdiff<CR>

" Simple way to turn off Gdiff splitscreen
" works only when diff buffer is focused
" https://gist.github.com/radmen/5048080
command! Gdoff diffoff | q | Gedit
nnoremap Uo :Gdoff<CR>

" emmet {{{2
let g:user_emmet_leader_key = '\'
let g:user_emmet_expandabbr_key = '<C-e>'
let g:user_emmet_settings = {
\ 'html' : {
\    'indentation' : '  '
\ },
\}

" netrw
let g:netrw_browse_split = 4
let g:netrw_liststyle=3
let g:netrw_winsize=20
nnoremap gd :Vex<CR> 

" vim-gist {{{2
let g:gist_show_privates = 1

" indentLine {{{2
"let g:indentLine_enabled=0
"nnoremap ti :IndentLinesToggle<CR>

" Syntastic {{{2
let g:syntastic_javascript_checkers=['jshint']
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_always_populate_loc_list=1

let g:syntastic_stl_format = '[Syntax: %E{Errors: %fe #%e}%B{, }%W{Warnings: %fw #%w}]'

let g:syntastic_mode_map = { 'mode': 'active',
            \ 'passive_filetypes': ['xml', 'html', 'java'] }

" Neocomplete {{{2
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup=1
let g:neocomplete#disable_auto_complete=1
let g:neocomplete#enable_auto_select=1
let g:neocomplete#min_keyword_length=3

inoremap <C-P> <C-X><C-U>
" http://stackoverflow.com/questions/2158305/is-it-possible-to-display-indentation-guides-in-vim
function! ToggleIndentGuides()
    if exists('b:indent_guides')
        call matchdelete(b:indent_guides)
        unlet b:indent_guides
    else
        let pos = range(1, &l:textwidth, &l:shiftwidth)
        call map(pos, '"\\%" . v:val . "v"')
        let pat = '\%(\_^\s*\)\@<=\%(' . join(pos, '\|') . '\)\s'
        let b:indent_guides = matchadd('CursorLine', pat)
    endif
endfunction
nnoremap ti :call ToggleIndentGuides()<CR>

function! ToggleComplete()
    if g:neocomplete#disable_auto_complete == 1
        let g:neocomplete#disable_auto_complete=0
    else
        let g:neocomplete#disable_auto_complete=1
    endif
endfunction
nnoremap tc :call ToggleComplete()<CR>

" Commands {{{1
command! Scratch :silent e ~/.var/vim/vim-scratch.txt 
nnoremap Es :Scratch<CR>

" http://robots.thoughtbot.com/faster-grepping-in-vim/
command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<Space>

command! Marked :silent exe "!open -a Marked.app '%:p'" |  redraw!
command! ShowChars set list listchars=tab:▸–,trail:·,nbsp:¬

" Git
" Show hunks to be committed
function! GitDiffCached()
    new
    r !git diff --cached
    setlocal ft=diff bt=nofile bh=wipe nobl noswf ro
    nnoremap <buffer> q :bw<cr>
endfunction
command! Gdiffcached :call GitDiffCached()
nnoremap Uc :Gdiffcached<CR>

function! GitIncoming()
    new
    r !git log --pretty=oneline --abbrev-commit --graph ..@{u}
    setlocal ft=git bt=nofile bh=wipe nobl noswf ro
    nnoremap <buffer> q :bw<cr>
endfunction
command! Gincoming :call GitIncoming()
nnoremap U[ :Gincoming<CR>

function! GitOutgoing() 
    new
    r !git log --pretty=oneline --abbrev-commit --graph @{u}..
    setlocal ft=git bt=nofile bh=wipe nobl noswf ro
    nnoremap <buffer> q :bw<cr>
endfunction
command! Goutgoing :call GitOutgoing()
nnoremap U] :Goutgoing<CR>

" Functions {{{1

" Taken from http://learnvimscriptthehardway.stevelosh.com/chapters/38.html
function! FoldColumnToggle()
    if &foldcolumn
        setlocal foldcolumn=0
    else
        setlocal foldcolumn=3
    endif
endfunction
nnoremap <Leader>tf :call FoldColumnToggle()<cr>

" Adapted from https://github.com/maciakl/vim-neatstatus 
function! Mode()
    "redraw
    if &ft ==? "help" 
        return "Help"
    endif

    if &ft ==? "diff"
        return "Diff"
    endif

    let l:mode = mode()
    
    if     mode ==# "n"  | return "NORMAL"
    elseif mode ==# "i"  | return "INSERT"
    elseif mode ==# "c"  | return "COMMAND"
    elseif mode ==# "!"  | return "SHELL"
    elseif mode ==# "R"  | return "REPLACE"
    elseif mode ==# "v"  | return "VISUAL"
    elseif mode ==# "V"  | return "V-LINE"
    elseif mode ==# ""   | return "V-BLOCK"
    else                 | return l:mode
    endif
endfunction

function! Branch()
    let branch = ''
    if !exists('*fugitive#head')
        return branch 
    endif

    let branch = fugitive#head(7)
    return empty(branch) ? '' : 'Git:'.branch
endfunction

function! Fenc()
    if &fenc !~ "^$\|utf-8" || &bomb
        return &fenc . (&bomb ? "-bom" : "" )
    else
        return "none"
    endif
endfun

function! OpenURI()
    " 2011-01-21 removed colon ':' from regexp to allow for port numbers in URLs
    " original regexp: [a-z]*:\/\/[^ >,;:]*
    let uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;\)\"]*')
    echo uri
    if uri != ""
        if has('win32')
            exec ":silent !cmd /C start /min " . escape(uri,"%")
        elseif has('mac')
            exec ":silent !open \"" . escape(s:uri,"%") . "\""
        endif
    else
        echo "No URI found in line."
    endif
endfunction
noremap gou :call OpenURI()<CR>

function! QuickLook()
    if has('mac')
        exec ":silent !ql \"%\""
    else
        echo "Quicklook not supported on this system"
    endif
endfunction
nnoremap ql :call QuickLook()<CR>

function! OpenCurrentDir()
    if has('mac')
        exec ":silent !open \"" . expand("%:p:h") . "\""
    else
        echo "OpenCurrentDir not supported on this system"
    endif
endfunction
map <leader>F :call OpenCurrentDir()<CR>

" Toggle background colour
" http://www.functor.be/wiki/index.php/VIM
function! ToggleBackgroundColour ()
    if (&background == 'light')
        set background=dark
        echo "background -> dark"
    else
        set background=light
        echo "background -> light"
    endif
endfunction

" Save last search and cursor position before executing a command
" http://technotales.wordpress.com/2010/03/31/preserve-a-vim-function-that-keeps-your-state/
function! Preserve(command)
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

function! StripTrailingWhitespace()
    call Preserve("%s/\\s\\+$//e")
endfunction
command! StripWh :call StripTrailingWhitespace()

" Taken from ctrlp help file
function! Setcwd()
    let cph = expand('%:p:h', 1)
    if cph =~ '^.\+://' | retu | en
    for mkr in ['.git/', '.hg/', '.svn/', '.bzr/', '_darcs/', '.vimprojects', '.project', '.ctrlp', '.top']
        let wd = call('find'.(mkr =~ '/$' ? 'dir' : 'file'), [mkr, cph.';'])
        if wd != '' | let &acd = 0 | brea | en
    endfo
    exe 'lc!' fnameescape(wd == '' ? cph : substitute(wd, mkr.'$', '.', ''))
endfunction
command! Setcwd :silent call Setcwd() | pwd
command! Cd :silent call Setcwd() | pwd

"http://www.gregsexton.org/2011/03/improving-the-text-displayed-in-a-fold/
function! CustomFoldText()
    "get first non-blank line
    let fs = v:foldstart
    while getline(fs) =~ '^\s*$' | let fs = nextnonblank(fs + 1)
    endwhile
    if fs > v:foldend
        let line = getline(v:foldstart)
    else
        let line = substitute(getline(fs), '\t', repeat(' ', &tabstop), 'g')
    endif

    let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
    let foldSize = 1 + v:foldend - v:foldstart
    let foldSizeStr = " " . foldSize . " lines "
    let foldLevelStr = repeat("+--", v:foldlevel)
    let lineCount = line("$")
    let foldPercentage = printf("[%.1f", (foldSize*1.0)/lineCount*100) . "%] "
    let marker = "»  "
    let expansionString = repeat(".", w - strwidth(marker.foldSizeStr.line.foldLevelStr.foldPercentage))
    return marker . line . expansionString . foldSizeStr . foldPercentage . foldLevelStr
endfunction

" TODO replace with simple iab <expr>
function! DateTimeStamp()
    return strftime("%H:%M-%m.%d.%Y")
endfun

function! ShortDate()
    return strftime("%Y-%m-%d")
endfun

" Abbreviations {{{1
:iab dts <c-r>=DateTimeStamp()<cr><esc>
:iab ddt <c-r>=ShortDate()<cr><esc>

if filereadable(glob("~/.vim/abbr.vim"))
    source ~/.vim/abbr.vim
endif

" Custom Colors {{{1
if filereadable(glob("~/.vim/addcolors.vim"))
  source ~/.vim/addcolors.vim
endif

