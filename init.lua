local configs = {
  "env",
  "settings",
  "keymap",
  "statusline",
  "plugin",
  "abbreviations",
  "colors",
  "commands",
  "autocmds",
  "terminal",
  "filetypes"
}

for _, cfg in ipairs(configs) do
  local path = "u.config." .. cfg
  local ok, err = pcall(require, path)
  if not ok then
    print("Error loading configuration " .. path .. ": " .. err)
  end
end

local site_config = vim.env.VIMDATA .. "/site/lua/site.lua"
if vim.fn.filereadable(site_config) ~= 0 then
  require "site"
end
