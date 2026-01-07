return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
  keys = {
    { "yom", function() require("render-markdown").toggle() end,  desc = "Toggle render markdown" },
  }
}
