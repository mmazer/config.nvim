return {
  "L3MON4D3/LuaSnip",
  -- follow latest release.
  version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
  -- install jsregexp (optional!).
  build = "make install_jsregexp",
  config = function()
    require("luasnip.loaders.from_snipmate").lazy_load()
    local ls = require("luasnip")
    local keymap = vim.keymap
    keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
    keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = true})
    keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent = true})

    keymap.set({"i", "s"}, "<C-E>", function()
      if ls.choice_active() then
        ls.change_choice(1)
      end
    end, {silent = true})
  end
}
