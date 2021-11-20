if exists("g:loaded_zwiki")
  finish
endif
let g:loaded_zwiki = 1

if !exists("g:zwiki_id_regex")
  let g:zwiki_id_regex = "\\d\\{14}"
endif

let g:zwiki_id_regex = "\\d\\{14}"

function zwiki#open_zwiki_index()
  execute ":e " . g:zwiki_dir . "/index.md"
endfunction

function zwiki#uid()
  return strftime("%Y%m%d%H%M%S")
endfunction

function zwiki#file_from_link(link)
  let files = globpath(g:zwiki_dir, "**/*".a:link."*.md", 0, 1)
  if empty(files)
    return ""
  endif
  return files[0]
endfunction

function zwiki#edit_link(link)
  let file = zwiki#file_from_link(a:link)
  if empty(file)
    echom "no file found for link " . a:link
  endif
  execute ":e ".file
endfunction

function zwiki#parse_id(filename)
  return matchstr(a:filename, g:zwiki_id_regex, 0)
endfunction

function zwiki#preview_link(link)
  let file = zwiki#file_from_link(a:link)
  if empty(file)
    echom "no file found for link " . a:link
  endif
  let cwnr = winnr()
  let cwid = winwidth(cwnr)
  let pwid = cwid / 2
  execute 'setlocal previewheight=' . pwid
  execute ":vertical rightb pedit ".file
endfunction

