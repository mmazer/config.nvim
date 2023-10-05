return {
  { "hrsh7th/nvim-cmp",
    config = function()
      vim.g.u_completion_enabled = true
      -- require before setup otherwise reference to `cmp.mapping` will fail
      local cmp = require("cmp")
      cmp.setup({
        -- https://github.com/hrsh7th/nvim-cmp/issues/261#issuecomment-929790943
        enabled = function()
          return vim.g.u_completion_enabled
        end,
        mapping = {
          ["<Tab>"] = cmp.mapping.select_next_item({behavior=cmp.SelectBehavior.Insert}),
          ["<S-Tab>"] = cmp.mapping.select_prev_item({behavior=cmp.SelectBehavior.Insert}),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        },
        sources = cmp.config.sources({
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

      nmap("coa", "<cmd>lua require('u').fn.toggle_completion()<cr>")
    end
  },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" }
}
