local nvim_lsp = require 'lspconfig'

function PrintLspDiagnostics(opts, bufnr, line_nr, client_id)
  local warnings = vim.lsp.diagnostic.get_count(0, "Warning")
  local errors = vim.lsp.diagnostic.get_count(0, "Error")
  local diagnostic_message = ""
  diagnostic_message = diagnostic_message .. string.format("Warning(s): %d Error(s): %d", warnings, errors)
  vim.api.nvim_echo({{diagnostic_message, "Normal"}}, false, {})
end

-- customize diagnostic display
vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = false,
})

-- This setting is global and should be set only once
vim.o.updatetime = 250
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.lsp.diagnostic.show_line_diagnostics({focusable=false})]]

local on_attach = function(client, bufnr)

  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  buf_set_keymap('n', 'dl', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', 'dg', '<cmd>lua PrintLspDiagnostics()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
end

--- Python Language Server
nvim_lsp["pylsp"].setup {
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
  },
  settings = {
    pylsp = {
      configurationSources = { "flake8" }
    }
  }
}

nvim_lsp["solargraph"].setup {
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
  },
  settings = {
  }
}