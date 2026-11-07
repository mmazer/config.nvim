vim.opt_local.shiftwidth = 2
vim.opt_local.softtabstop=2
vim.opt_local.textwidth = 80
vim.opt_local.wrap = true
vim.opt_local.suffixesadd = ".txt,.md"
vim.opt_local.spell = false

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  command = "call vlib#preserve_wrapper(function('datetime#update_modified_time'))",
})

if vim.fn.executable('mk') == 1 then
  vim.api.nvim_create_user_command("Marked", function()
    vim.system({ "mk", vim.fn.expand("%") }, {}, function(obj)
      if obj.code ~= 0 then
        vim.schedule(function()
          print("error calling mk")
        end)
      end
    end)
  end, {})
end
