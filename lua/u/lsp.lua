local M = {}

M.diagnostic_count = function()
  local WARN = vim.diagnostic.severity.WARN
  local ERR = vim.diagnostic.severity.ERROR
  local warnings = vim.diagnostic.get(0, { severity= WARN })
  local errors = vim.diagnostic.get(0, { severity = ERR })
  local num_warn = table.getn(warnings)
  local num_err = table.getn(errors)

  return num_warn, num_err
end

return M
