local nvim_lsp = require 'lspconfig'
local u = require 'u'
local nmap = u.nvim.nmap
local diagnostic_count = u.lsp.diagnostic_count

function PrintLspDiagnostics(opts, bufnr, line_nr, client_id)
  local warn, err = diagnostic_count()
  local diagnostic_message = ""
  diagnostic_message = diagnostic_message .. string.format("Warning(s): %d Error(s): %d", warn, err)
  vim.api.nvim_echo({{diagnostic_message, "Normal"}}, false, {})
end

-- general config
vim.diagnostic.config({
  virtual_text = false,
  underline = true,
  signs = true,
  update_in_insert = false
})

nmap("<space>d", "<cmd>lua vim.diagnostic.open_float()<cr>")

local on_attach = function(client, bufnr)

  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  buf_set_keymap('n', 'dl', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  buf_set_keymap('n', 'dg', '<cmd>lua PrintLspDiagnostics()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
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

-- nvim_lsp["gopls"].setup {
--   on_attach = on_attach,
--   cmd = {"gopls", "serve"},
--     settings = {
--       gopls = {
--         analyses = {
--           unusedparams = true,
--         },
--         staticcheck = true,
--       },
--     },
-- }

-- bash-language-server
nvim_lsp['bashls'].setup {
  on_attach = on_attach
}

