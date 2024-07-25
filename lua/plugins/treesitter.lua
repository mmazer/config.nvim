return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  opts = {
    sync_install = false,
    highlight = { enable = false },
    ensure_installed = {
      "vimdoc",
      "luadoc",
      "vim",
      "lua",
      "markdown"
    },
  },
}
