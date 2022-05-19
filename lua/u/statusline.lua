-- See https://elianiva.my.id/post/neovim-lua-statusline
local M = {}

M.git_branch = function()
  local branch = ''
  if vim.fn['FugitiveHead'] then
    branch = vim.call('FugitiveHead')
    branch = '⎇ '..branch
  end
  return branch
end

return M
