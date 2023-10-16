return {
  "tomasky/bookmarks.nvim",
  -- not used defaults to $HOME/.bookmarks; using symlink as work around
  save_file = vim.fn.expand "$XDG_DATA_HOME/nvim/bookmarks",
  event = "VimEnter",
  config = function()
    require('bookmarks').setup({
      on_attach = function(bufnr)
        local bm = require("bookmarks")
        local map = vim.keymap.set
        map("n","mm",bm.bookmark_toggle) -- add or remove bookmark at current line
        map("n","ma",bm.bookmark_ann) -- add or edit mark annotation at current line
        map("n","mc",bm.bookmark_clean) -- clean all marks in local buffer
        map("n","mn",bm.bookmark_next) -- jump to next mark in local buffer
        map("n","mp",bm.bookmark_prev) -- jump to previous mark in local buffer
        map("n","ml",bm.bookmark_list) -- show marked file list in quickfix window
      end
    })
    local telescope = require("telescope")
    telescope.load_extension('bookmarks')
    list_bookmarks = function()
      telescope.extensions.bookmarks.list({}) -- need to pass in empty opts
    end
    vim.keymap.set("n", "<space>m", list_bookmarks)
  end
}
