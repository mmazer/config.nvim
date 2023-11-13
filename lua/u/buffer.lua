local M = {}

M.get_line_num = function()
  local cursor = vim.api.nvim_win_get_cursor(0)
  return cursor[1]
end

M.get_file_path = function()
  return vim.fn.expand("%:p")
end

M.get_file_line = function()
  return M.get_file_path(), M.get_line_num()
end

return M
