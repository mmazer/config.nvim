return {
  "hedyhli/outline.nvim",
  lazy = true,
  cmd = { "Outline", "OutlineOpen" },
  keys = {
    { "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
  },
  opts = {
    providers = {
      priority = { 'lsp', 'markdown', 'treesitter' },
    },
  },
  event = "VeryLazy",
  dependencies = {
    'epheien/outline-treesitter-provider.nvim'
  }
}
