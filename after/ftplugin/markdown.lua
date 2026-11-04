vim.opt_local.shiftwidth = 2
vim.opt_local.softtabstop=2
vim.opt_local.wrap = true
vim.opt_local.suffixesadd = ".txt,.md"
vim.opt_local.spell = true

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
