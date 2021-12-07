if exists("g:loaded_zettel")
  finish
endif
let g:loaded_zettel = 1

if !exists("g:zettel_id_regex")
  let g:zettel_id_regex = "\\d\\{14}"
endif

if !exists("g:zettel_ext")
  let g:zettel_ext = "md"
endif

let g:zettel_id_regex = "\\d\\{14}"

function zettel#index()
  execute ":e "..g:zettelkasten.. "/index."..g:zettel_ext
endfunction

function zettel#uid()
  return strftime("%Y%m%d%H%M%S")
endfunction

function zettel#new(path, ...)
  let filename = printf("%s/%s-%s.%s",
        \ a:path, zettel#uid(), join(a:000, "-"), g:zettel_ext)
  execute ":e "..filename
endfunction

function zettel#file_from_link(link)
  let globexpr = "**/*"..a:link.."*."..g:zettel_ext
  let files = globpath(g:zettelkasten, globexpr, 0, 1)
  if empty(files)
    return ""
  endif
  return files[0]
endfunction

function zettel#edit_link(link)
  let file = zettel#file_from_link(a:link)
  if empty(file)
    echom "no file found for link "..a:link
  endif
  execute ":e "..file
endfunction

function zettel#parse_id(filename)
  return matchstr(a:filename, g:zettel_id_regex, 0)
endfunction

function zettel#preview_link(link)
  let file = zettel#file_from_link(a:link)
  if empty(file)
    echom "no file found for link "..a:link
  endif
  let cwnr = winnr()
  let cwid = winwidth(cwnr)
  let pwid = cwid / 2
  execute 'setlocal previewheight='.. pwid
  execute ":vertical rightb pedit "..file
endfunction

function zettel#make_link(link,...)
  let lnk = "[["..a:link.."]]"
  if !empty(a:000)
    let lnk = lnk.." "..join(a:000, " ")
  endif
  return lnk
endfunction

function zettel#find_tags(...)
    let search_re = "\'tags:\\s+.*\\#("..join(a:000, "|")..")\'"
    execute ":GrepperRg "..search_re
endfunction
