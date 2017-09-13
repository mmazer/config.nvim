set laststatus=2
set statusline+=%{status#mode()}
set statusline+=\ %{status#branch()}
set statusline+=\ %f
set statusline+=%(\ %R%M%)      "modified flag
set statusline+=%{&paste?'\ [paste]':''}
set statusline+=\ %{status#current_tag()}
set statusline+=\ %{status#lint()}
set statusline+=%=
set statusline+=\ %{status#whitespace()}
set statusline+=\ %y      "filetype
set statusline+=\ %{&ff}  "file format
set statusline+=%{status#fenc()} " file encoding
set statusline+=\ %{&expandtab?'spaces':'tabs'}
set statusline+=\ %5.l/%L\:%-3.c\    "cursor line/total lines:column
set statusline+=\ #%n

command! ToggleCurrentTag :call status#toggle_current_tag()

"recalculate the trailing whitespace warning when idle, and after saving
augroup statusline_whitespace
    autocmd CursorHold,BufWritePost * unlet! b:statusline_whitespace
augroup END
