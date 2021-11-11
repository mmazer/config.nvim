local set_buf_keymap = vim.api.nvim_buf_set_keymap
local set_keymap = vim.api.nvim_set_keymap
local nvim_command = vim.api.nvim_command

local M = {}

M.map = function(mode, keys, mapping, opts)
  -- get the extra options
  local options = {noremap = true}
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end

  -- basic support for buffer-scoped keybindings
  local buffer = options.buffer
  options.buffer = nil

  if buffer then
    set_buf_keymap(0, mode, keys, mapping, options)
  else
    set_keymap(mode, keys, mapping, options)
  end
end

M.nmap = function(keys, mapping, opts)
  M.map('n', keys, mapping, opts)
end

M.xmap = function(keys, mapping, opts)
  M.map('x', keys, mapping, opts)
end

M.vmap = function(keys, mapping, opts)
  M.map('v', keys, mapping, opts)
end

M.imap = function(keys, mapping, opts)
  M.map('i', keys, mapping, opts)
end

M.user_command = function(command)
  local cmd = 'command!'..command
  nvim_command(cmd)
end

M.source_vim = function(file)
  local cmd = 'source '..file
  vim.cmd(cmd)
end

M.assert = function(condition, message, ...)
  if condition then
    return
  end
  error(message, ...)
end

return M
