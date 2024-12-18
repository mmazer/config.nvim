return {
  "akinsho/toggleterm.nvim",
  config = function()
    require("toggleterm").setup{
      -- size can be a number or function which is passed the current terminal
      size = function(term)
        if term.direction == "horizontal" then
              return 15
            elseif term.direction == "vertical" then
              return vim.o.columns * 0.5
         end
      end,
      open_mapping = [[<c-t>]],
      hide_numbers = true, -- hide the number column in toggleterm buffers
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 1, -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
      start_in_insert = true,
      insert_mappings = true, -- whether or not the open mapping applies in insert mode
      persist_size = true,
      direction = "vertical",
      close_on_exit = true, -- close the terminal window when the process exits
    }
    local keymap = vim.keymap
    keymap.set({"n"}, "ts", ":ToggleTerm direction=horizontal<CR>")
    keymap.set({"n"}, "tv", ":ToggleTerm direction=vertical<CR>")
  end
}
