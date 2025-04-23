local disabled_plugins = {
  "zipPlugin",
  "tarPlugin",
  "gzipPlugin",
}

for _, plug in ipairs(disabled_plugins) do
  vim.g["loaded_"..plug] = 1
end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
  dev =  {
    path = "~/workspace",
    patterns = {"mmazer"},
    fallback = true
  },
  change_detection = {
    enabled = true,
    notify = false
  }
})
