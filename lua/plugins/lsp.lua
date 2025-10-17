return {
  "neovim/nvim-lspconfig",
  config = function()
    local fn = require("u.fn")
    local diagnostic_count = require("u.lsp").diagnostic_count

    vim.diagnostic.config({
      virtual_text = false,
      underline = true,
      signs = true,
      update_in_insert = false
    })

    local print_lsp_diagnostics = function()
      local warn, err = diagnostic_count()
      local diagnostic_message = ""
      diagnostic_message = diagnostic_message .. string.format("Warning(s): %d Error(s): %d", warn, err)
      vim.api.nvim_echo({ { diagnostic_message, "Normal" } }, false, {})
    end

    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(ev)
        local bufnr = ev.buf
        local keymap = vim.keymap.set
        local lsp = vim.lsp
        local opts = { silent = true }
        local function opt(desc, others)
          return vim.tbl_extend("force", opts, { desc = desc }, others or {})
        end

        vim.api.nvim_set_option_value('omnifunc', 'v:lua.vim.lsp.omnifunc', { buf = bufnr })

        keymap('n', 'dl', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
        keymap('n', 'df', vim.diagnostic.open_float, opt("Open Dignostics Float"))
        keymap('n', 'dg', print_lsp_diagnostics, opt("Print LSP Diagnostics"))
        keymap('n', 'gd', lsp.buf.definition, opt("Go to Definition"))
        keymap('n', 'K', lsp.buf.hover, opt("Show LSP Hover"))
        keymap('n', 'gr', lsp.buf.references, opt("Show References"))
        keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
        keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
      end,
    })
    --- Python Language Server
    vim.lsp.config("pylsp", {
      flags = {
        debounce_text_changes = 150,
      },
      settings = {
        pylsp = {
          configurationSources = { "flake8" },
          plugins = {
            flake8 = { enabled = true }, -- configured by .flake8 in project directory
            pylint = { enabled = false },
            pycodestyle = { enabled = false },
            pyflakes = { enabled = false },
            mccabe = { enabled = false }
          }
        }
      }
    })
    vim.lsp.enable({ "pylsp" })

    --- Go
    vim.lsp.config("gopls", {
      settings = {
        gopls = {
          analyses = {
            unusedparams = true,
          },
          staticcheck = true,
          gofumpt = true,
        },
      },
    })
    vim.lsp.enable("gopls")

    -- see https://github.com/golang/tools/blob/master/gopls/doc/vim.md#neovim-install
    local autocmd = vim.api.nvim_create_autocmd
    autocmd("BufWritePre", {
      pattern = "*.go",
      callback = function()
        local params = vim.lsp.util.make_range_params()
        params.context = { only = { "source.organizeImports" } }
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
        vim.lsp.buf.format({ async = false })
      end
    })

    --- lua
    vim.api.nvim_create_autocmd({ "BufWritePre" }, {
      pattern = { "*.lua" },
      callback = function()
        vim.lsp.buf.format()
      end,
    })

    -- yaml-language-server https://github.com/redhat-developer/yaml-language-server
    vim.lsp.config("yamlls", {
      settings = {
        yaml = { keyOrdering = false },
      }
    })
    vim.lsp.enable({ "yamlls" })

    -- bash language server
    vim.lsp.config("bashls", {
      filetypes = { "sh", "zsh" }
    })
    vim.lsp.enable("bashls")

    vim.lsp.enable({ "terraformls" })

    vim.api.nvim_create_autocmd({ "BufWritePre" }, {
      pattern = { "*.tf", "*.tfvars" },
      callback = function()
        vim.lsp.buf.format()
      end,
    })
  end
}
