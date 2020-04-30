nnoremap q: <nop>
nnoremap Q :qa<CR>

" Command Mode {{{
nmap <space><space> :

" avoid the escape key - remember <C-[> also maps to Esc
inoremap kj <ESC>`^

" Better mark jumping (line + col)
nnoremap <expr> ' printf('`%c zz', getchar())

" For wrapped lines, navigate normally
noremap  <buffer> <silent> k gk
noremap  <buffer> <silent> j gj
noremap  <buffer> <silent> 0 g0
noremap  <buffer> <silent> $ g$

" preserve J - join lines
nnoremap <space>j J
nnoremap J        L
noremap  H        ^
nnoremap gh       ^
noremap  L        $
nnoremap gl       $
vnoremap L        g_

" move to middle of text line
nnoremap gm :call cursor(0, virtcol('$')/2)<CR>

" manage windows and tabs
nnoremap W <C-w>

" window navigation consistent with term mode mappings
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap th  :tabfirst<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap td  :tabclose<CR>

" center after next/previous change
nnoremap ]c ]czz
nnoremap [c [czz

" center window when moving to next search match
nnoremap n  nzzzv
nnoremap N  Nzzzv
nnoremap *  *zz
nnoremap #  #zz
nnoremap g* g*zz
nnoremap g# g#zz

nnoremap <C-o> <C-o>zz

" toggle case of words
"
nnoremap [w gUiw
nnoremap ]w guiw

" disable these mappings which open next/previous file
noremap <space>] <nop>
noremap <space>[ <nop>

" reselect visual block after indent
vnoremap < <gv
vnoremap > >gv

" Use ,d (or ,dd or ,dj or 20,dd) to delete a line without adding it to the
" yanked stack (also, in visual mode)
nnoremap <silent> ,d "_d
vnoremap <silent> ,d "_d

" Quick yanking to the end of the line
nnoremap Y y$

" writing files
nnoremap g!       :e!<CR>
nnoremap ;w :w<CR>
nnoremap <space>w :w<CR>
nnoremap <space>W :w!<CR>

" close quick fix and location list
nnoremap qq :cclose<CR>
nnoremap ql :lclose<CR>
nnoremap qp :pclose<CR>

" command mode
cnoremap <C-A>  <Home>
cnoremap <C-E>  <End>
cnoremap <C-K>  <C-U>

cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

" goto buffer
nnoremap gob :ls<CR>:b
nnoremap <space>B :b#<CR>

nnoremap goe :enew<CR>
nnoremap gov    :e $MYVIMRC<CR>

" show length of words or visual selection
nnoremap <C-_> :echo 'word' expand('<cword>') 'has length' strlen(expand('<cword>'))<CR>
vnoremap <C-_> "-y:echo 'text' @- 'has length' strlen(@-)<CR>

" Source lines - from Steve Losh
vnoremap X y:execute @@<cr>:echo 'Sourced selection.'<cr>
nnoremap X ^vg_y:execute @@<cr>:echo 'Sourced line.'<cr>

" end lines with semicolons
inoremap ;]       <C-\><C-O>:call vlib#preserve("s/\\s\*$/;/")<CR>
nnoremap <space>; :call vlib#preserve("s/\\s\*$/;/")<CR>

" end lines with commas
inoremap ,]       <C-\><C-O>:call vlib#preserve("s/\\s\*$/,/")<CR>
nnoremap <space>, :call vlib#preserve("s/\\s\*$/,/")<CR>

nnoremap <leader>d :bd<cr>
nnoremap <leader>D :bd!<cr>
nnoremap <space>d :bp \| bd #<CR>

" For quick one line expressions in command mode
nnoremap <space>x   :<C-R>=
