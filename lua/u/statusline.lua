-- See https://elianiva.my.id/post/neovim-lua-statusline
local M = {}

M.git_branch = function()
  local branch = ''
  if vim.fn['fugitive#head'] then
    branch = vim.call('fugitive#head', 7)
    branch = '⎇ '..branch
  end
  return branch
end

return M
