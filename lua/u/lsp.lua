local fn = require("u.fn")
local M = {}

M.diagnostic_count = function()
  local WARN = vim.diagnostic.severity.WARN
  local ERR = vim.diagnostic.severity.ERROR
  local warnings = vim.diagnostic.get(0, { severity = WARN })
  local errors = vim.diagnostic.get(0, { severity = ERR })
  local num_warn = fn.table_keynum(warnings)
  local num_err = fn.table_keynum(errors)

  return num_warn, num_err
end

return M
