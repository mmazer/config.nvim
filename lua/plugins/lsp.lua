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

    local on_attach = function(_, bufnr)
      local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

      -- Enable completion triggered by <c-x><c-o>
      vim.api.nvim_set_option_value('omnifunc', 'v:lua.vim.lsp.omnifunc', {buf=bufnr})

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
    --- Go
    lspconfig["gopls"].setup {
      on_attach = on_attach,
      settings = {
          gopls = {
            analyses = {
              unusedparams = true,
            },
            staticcheck = true,
            gofumpt = true,
          },
        },
    }
    -- see https://github.com/golang/tools/blob/master/gopls/doc/vim.md#neovim-install
    local autocmd = vim.api.nvim_create_autocmd
    autocmd("BufWritePre", {
      pattern = "*.go",
      callback = function()
        local params = vim.lsp.util.make_range_params()
        params.context = {only = {"source.organizeImports"}}
        -- buf_request_sync defaults to a 1000ms timeout. Depending on your
        -- machine and codebase, you may want longer. Add an additional
        -- argument after params if you find that you have to write the file
        -- twice for changes to be saved.
        -- E.g., vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
        local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
        for cid, res in pairs(result or {}) do
          for _, r in pairs(res.result or {}) do
            if r.edit then
              local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
              vim.lsp.util.apply_workspace_edit(r.edit, enc)
            end
          end
        end
        vim.lsp.buf.format({async = false})
      end
    })

    -- yaml-language-server https://github.com/redhat-developer/yaml-language-server
    lspconfig["yamlls"].setup {
      on_attach = on_attach,
      settings = {
        yaml = { keyOrdering = false },
      }
    }

    -- bash language server
    lspconfig["bashls"].setup {
      filetypes = { "sh", "zsh" }
    }

    -- terraform language server
    lspconfig['terraformls'].setup{
      on_attach = on_attach
    }
    vim.api.nvim_create_autocmd({"BufWritePre"}, {
      pattern = {"*.tf", "*.tfvars"},
      callback = function()
        vim.lsp.buf.format()
      end,
    })
  end
}
