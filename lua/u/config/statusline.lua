local diagnostic_count = require'u.lsp'.diagnostic_count
local api = vim.api

function _G.lsp_statusline()
  local warn, err = diagnostic_count()

  if warn == 0 and err == 0 then
    return "✓"
  end

  return string.format("✗ W:%d E:%d", warn, err)
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

statusline_augroup = api.nvim_create_augroup("Statusline", {clear = true})
api.nvim_create_autocmd({"CursorHold", "BufWritePost" }, {
  command = "unlet! b:statusline_whitespace",
  group = statusline_augroup
})
