function _G.lsp_statusline()
  local WARN = vim.diagnostic.severity.WARN
  local ERR = vim.diagnostic.severity.ERROR
  local warnings = vim.diagnostic.get(0, { severity= WARN })
  local errors = vim.diagnostic.get(0, { severity = ERR })
  local num_warn = table.getn(warnings)
  local num_err = table.getn(errors)

  if num_warn == 0 and num_err == 0 then
    return "✓"
  end

  return string.format("✗ W:%d E:%d", num_warn, num_err)
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
