return {
  { "tpope/vim-fugitive",
    config = function()
      local nmap = require("u.nvim").nmap
      nmap("<space>gs", ":Git<CR>")
      nmap("<space>gb", ":Git blame<CR>")
      nmap("<space>gc", ":Git commit -v -q <CR>")
      nmap("<space>gd", ":Gdiffsplit<CR>")
      nmap("<space>gr", ":Gread<CR>")
      nmap("<space>gw", ":Gwrite<CR>")
      -- Not converted to Lua since the Fugitive events seem to raise an error: "unexpected event`
      vim.cmd [[
        autocmd User FugitiveTree,FugitiveBlob nnoremap <buffer> <bs> :edit %:h<cr>
      ]]
      local create_user_command = require("u.nvim").create_user_command
      create_user_command("Gworking", "Git diff -w", {})
      create_user_command("GDiffBuf", "Git diff -w %", {})
      vim.cmd("cab git Git")
    end
  },
  { "tpope/vim-rhubarb" },
  { "junegunn/gv.vim" }
}
