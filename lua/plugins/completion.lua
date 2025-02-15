return {
  {
    "hrsh7th/nvim-cmp",
    config = function()
      vim.g.u_completion_enabled = true
      -- require before setup otherwise reference to `cmp.mapping` will fail
      local cmp = require("cmp")
      local has_words_before = function()
        if vim.api.nvim_get_option_value("buftype", { buf = 0 }) == "prompt" then return false end
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
      end
      cmp.setup({
        mapping = {
          ["<Tab>"] = vim.schedule_wrap(function(fallback)
            if cmp.visible() and has_words_before() then
              cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
            else
              fallback()
            end
          end),
        },
      })
      cmp.setup({
        -- https://github.com/hrsh7th/nvim-cmp/issues/261#issuecomment-929790943
        enabled = function()
          return vim.g.u_completion_enabled
        end,
        mapping = {
          ["<Tab>"] = vim.schedule_wrap(function(fallback)
            if cmp.visible() and has_words_before() then
              cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
            else
              fallback()
            end
          end),
          ["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        },
        sources = cmp.config.sources({
          { name = "copilot" },
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "path" },
        }),
      })
      local nmap = require("u.nvim").nmap
      local u = require("u")
      u.fn.toggle_completion = function()
        if vim.g.u_completion_enabled then
          vim.g.u_completion_enabled = false
        else
          vim.g.u_completion_enabled = true
        end
        print(string.format("completion enabled=%s", vim.g.u_completion_enabled))
      end

      nmap("coc", "<cmd>lua require('u').fn.toggle_completion()<cr>")
    end
  },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" }
}
