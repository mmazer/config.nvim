return {
  "neovim/nvim-lspconfig",
  config = function()
    local lspconfig = require("lspconfig")
    -- general config
    vim.diagnostic.config({
      virtual_text = false,
      underline = true,
      signs = true,
      update_in_insert = false
    })

    local on_attach = function(client, bufnr)
      local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
      local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

      -- Enable completion triggered by <c-x><c-o>
      buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

      -- Mappings.
      local opts = { noremap=true, silent=true }

      buf_set_keymap('n', 'dl', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
      buf_set_keymap('n', 'df', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
      buf_set_keymap('n', 'dg', '<cmd>lua PrintLspDiagnostics()<CR>', opts)
      buf_set_keymap('n', 'F', '<cmd>lua vim.lsp.buf.format()<CR>', opts)
      buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
      buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
      buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
      buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
      buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    end

    --- Python Language Server
    lspconfig["pylsp"].setup {
      on_attach = on_attach,
      flags = {
        debounce_text_changes = 150,
      },
      settings = {
        pylsp = {
          configurationSources = { "flake8" },
          plugins = {
            flake8 = { enabled=true }, -- configured by .flake8 in project directory
            pylint = { enabled=false },
            pycodestyle = { enabled=false },
            pyflakes = { enabled=false },
            mccabe = { enabled=false }
          }
        }
      }
    }
  end
}
