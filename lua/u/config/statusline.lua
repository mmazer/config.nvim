function _G.lsp_statusline()
  local warnings = vim.lsp.diagnostic.get_count(0, "Warning")
  local errors = vim.lsp.diagnostic.get_count(0, "Error")
  if warnings == 0 and errors == 0 then
    return "✓"
  end

  return string.format("✗ W:%d E:%d", warnings, errors)
end

vim.opt.laststatus = 2

local statusline = "%{status#mode()}"
statusline = statusline.." %{status#branch()}"
statusline = statusline.." %f"
statusline = statusline.."%( %R%M%)      "
statusline = statusline.."%{&paste?' [paste]':''}"
statusline = statusline.." %{v:lua.lsp_statusline()}"
statusline = statusline.."%="
statusline = statusline.." %{status#whitespace()}"
statusline = statusline.." %y"
statusline = statusline.." %{&ff}"
statusline = statusline.."%{status#fenc()}"
statusline = statusline.." %{&expandtab?'spaces':'tabs'}"
statusline = statusline.." %5.l,%-3.c "
statusline = statusline.." #%n"

vim.opt.statusline = statusline
vim.cmd [[
augroup statusline_whitespace
    autocmd CursorHold,BufWritePost * unlet! b:statusline_whitespace
augroup END
]]
