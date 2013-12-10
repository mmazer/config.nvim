set nocompatible

" disable before calling vundle
filetype off
syntax off

" Bundles {{{1
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'altercation/vim-colors-solarized'
Bundle 'benmills/vimux'
Bundle 'bling/vim-airline'
Bundle 'gmarik/vundle'
Bundle 'elzr/vim-json'
Bundle 'epeli/slimux'
Bundle 'kablamo/vim-git-log'
Bundle 'kien/ctrlp.vim'
Bundle 'tacahiroy/ctrlp-funky'
Bundle 'tpope/vim-characterize'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-dispatch'
Bundle 'nelstrom/vim-markdown-folding'
Bundle 'mattn/emmet-vim'
Bundle 'mattn/ctrlp-mark'
Bundle 'mattn/ctrlp-register'
Bundle 'mileszs/ack.vim'
" 2013-10-08 - disabled because it causes serious typing lags in JavaScipt
" buffers
"Bundle 'pangloss/vim-javascript'
Bundle 'groenewege/vim-less'
Bundle 'ap/vim-css-color'
Bundle 'Yggdroot/indentLine'
Bundle 'Raimondi/delimitMate'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'derekwyatt/vim-scala'
Bundle 'mattn/webapi-vim'
Bundle 'mattn/gist-vim'
Bundle 'dhruvasagar/vim-railscasts-theme'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'Shougo/neocomplete.vim'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'
Bundle 'honza/vim-snippets'
Bundle 'davidoc/taskpaper.vim'

filetype plugin indent on
syntax on

" Basic Settings {{{1
set ruler
set number "see augroup linenumber
set cursorline " highlight current line

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
set backupdir=$HOME/.vim_backup//
set directory=$HOME/.vim_swp//

" enable '%' command jump to matching HTML tags and if/else/endif in Vim
" scripts
runtime macros/matchit.vim

" spelling
set spelllang=en
set spellfile=~/.vim/spell/spellfile.en.add

" Reduce delays waiting for multi-key combinations when running in tmux
" tmux needs `set -s escape-time 0` for these to work
set ttimeout timeout ttimeoutlen=125

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
    set background=dark
    colorscheme railscasts
    if has('mac')
        set guifont=Literation\ Mono\ Powerline:h12
        set antialias
        "set clipboard=unnamedplus "use + register for system clipboard
    elseif has('win32')
        set guifont=Monaco:h8
    endif
    set guioptions-=T " remove tool bar
    set guioptions-=r " remove right-hand scroll bar
    set guioptions-=L " remove left-hand scroll bar
    set lines=90
    set columns=145
else
    set t_Co=256
    let g:solarized_termtrans=1
    let g:solarized_termcolors=256
    set background=dark
    colorscheme railscasts

endif

" Status Line {{{1
" Status line handled by vim-airline
 set laststatus=2
" set statusline=\ %{fugitive#statusline()}\|
" set statusline+=\ %f\|
" set statusline+=\ %{Fenc()}\ \|
" set statusline+=\ %{&ff}\ \| "file format
" set statusline+=%=
" set statusline+=\ %h      "help file flag
" set statusline+=\ %(\|[%R%M\|%)      "modified flag
" set statusline+=\ %y      "filetype
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=\ #%n
" set statusline+=\ %l/%LL   "cursor line/total lines
" set statusline+=\ Col\:%c,     "cursor column
" set statusline+=\ %P    "percent through file


" Key Bindings {{{1

"keep original motion: repeat latest f, t, F or T in opposite direction
noremap ,, ,
let mapleader = ","
let g:mapleader = ","

" One less key to press for commands
"keep original motion: repeat latest f, t, F or T
noremap ;; ;
nnoremap ; :

" Better mark jumping (line + col)
nnoremap ' `

" for toggling paste mode in terminal
set pastetoggle=<F5>

" For wrapped lines, navigate normally
noremap  <buffer> <silent> k gk
noremap  <buffer> <silent> j gj
noremap  <buffer> <silent> 0 g0
noremap  <buffer> <silent> $ g$

" Move to end of line in insert mode
inoremap <C-]> <C-o>$

" Fast saving and quitting
noremap <Leader>w :w!<CR>
noremap <Leader>q :q!<CR>
noremap W :w!<CR>
noremap <silent> Q :q!<CR>

" Quick edit of this file - path only supported in 7.4+
nmap <silent> <Leader>ev :e ~/.vim/vimrc<CR>
nmap <silent> <Leader>rv :so ~/.vim/vimrc<CR>

" Buffer shortcuts
nmap <leader>d :bd<CR>
noremap \l :ls<CR>:b
nnoremap gb :buffers<CR>:b

" removing search match highlighting
nmap <leader><space> :noh<CR>

" Source lines - from Steve Losh
vnoremap <leader>S y:execute @@<cr>:echo 'Sourced selection.'<cr>
nnoremap <leader>S ^vg_y:execute @@<cr>:echo 'Sourced line.'<cr>

" Use the arrows to something useful
map <right> :bn<cr>
map <left> :bp<cr>

map <leader>bn :bn<CR>
map <leader>bp :bp<CR>

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

" Window navigation
" use ctrl-h/j/k/l to switch between splits
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

set splitbelow
set splitright

" Tab navigation
" http://vim.wikia.com/wiki/Alternative_tab_navigation
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

" Slimux keys
map <Leader>s :SlimuxREPLSendLine<CR>
vmap <Leader>s :SlimuxREPLSendSelection<CR>

" Custom Slimux commands
command! GrailsStop :SlimuxShellRun stop-app
command! GrailsRun :SlimuxShellRun run-app

" Quick and easy scratch pad
nnoremap <Leader>sc :e ~/.vim/data/vim-scratch.txt<CR>

" File Types {{{1
set encoding=utf-8
set ffs=unix,dos,mac "Default file types

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

augroup json_files
    autocmd FileType json set ft=javascript.json
    autocmd filetype json set foldmethod=syntax
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

"vim-airline
let g:airline_powerline_fonts = 1

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

" emmet {{{2
let g:user_emmet_leader_key = '\'
let g:user_emmet_expandabbr_key = '<C-e>'
let g:user_emmet_settings = {
\ 'html' : {
\    'indentation' : '  '
\ },
\}

" NERDTree {{{2

let NERDTreeWinSize=35
let NERDTreeQuitOnOpen=1
let NERDTreeShowBookmarks=0
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1
let NERDTreeChDirMode=2 "vim current directory follows NERDTree

nmap <silent> <C-T> :NERDTreeToggle<CR>;
let NERDTreeIgnore=['.class$[[file]]', '.DS_Store$[[file]]', 'CVS[[dir]]']

" vim-gist {{{2
let g:gist_show_privates = 1

" easybuffer {{{2
nmap <Leader>eb :EasyBuffer<cr>

" indentLine {{{2
let g:indentLine_enabled=0
nnoremap ti :IndentLinesToggle<CR>

" Syntastic {{{2
let g:syntastic_javascript_checkers=['jshint']
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_always_populate_loc_list=1

let g:syntastic_stl_format = '[Syntax: %E{Errors: %fe #%e}%B{, }%W{Warnings: %fw #%w}]'

let g:syntastic_mode_map = { 'mode': 'active',
            \ 'passive_filetypes': ['html'] }

" Neocomplete {{{2
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup=1
let g:neocomplete#disable_auto_complete=1
let g:neocomplete#enable_auto_select=1
let g:neocomplete#min_keyword_length=3

inoremap <C-P> <C-X><C-U>

function! ToggleComplete()
    if g:neocomplete#disable_auto_complete == 1
        let g:neocomplete#disable_auto_complete=0
    else
        let g:neocomplete#disable_auto_complete=1
    endif
endfunction
nnoremap tc :call ToggleComplete()<CR>

" Commands {{{1
command! Marked :silent exe "!open -a Marked.app '%:p'" |  redraw!
command! ShowChars set list listchars=tab:▸–,trail:·,nbsp:¬

" Simple way to turn off Gdiff splitscreen
" works only when diff buffer is focused
" https://gist.github.com/radmen/5048080
command! Gdoff diffoff | q | Gedit

" Show hunks to be committed
function! GitDiffCached()
    enew
    r ! git diff --cached
    set ft=diff
endfunction
command! Gdiffcached :call GitDiffCached()
command! StripWh :call StripTrailingWhitespace()

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

function! Fenc()
    if &fenc !~ "^$\|utf-8" || &bomb
        return &fenc . (&bomb ? "-bom" : "" )
    else
        return "none"
    endif
endfun

function! OpenURI ()
    " 2011-01-21 removed colon ':' from regexp to allow for port numbers in URLs
    " original regexp: [a-z]*:\/\/[^ >,;:]*
    let s:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;\)\"]*')
    echo s:uri
    if s:uri != ""
        if has('win32')
            exec ":silent !start chrome \"" . escape(s:uri,"%") . "\""
        elseif has('mac')
            exec ":silent !open \"" . escape(s:uri,"%") . "\""
        endif
    else
        echo "No URI found in line."
    endif
endfunction
map \u :call OpenURI ()<CR>

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

" Toggle line wrapping
" http://www.charlietanksley.net/philtex/my-vimrc-file/
noremap <silent> <leader>tw :call ToggleWrap()<cr>
function! ToggleWrap()
    if &wrap
        echo "Wrap OFF"
        setlocal nowrap
        set virtualedit=all
    else
        echo "Wrap ON"
        setlocal wrap linebreak nolist
        set virtualedit=
        setlocal display+=lastline
    endif
endfunction

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

