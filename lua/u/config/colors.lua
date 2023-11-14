vim.cmd("syntax enable")
vim.opt.termguicolors=true
local term_theme=vim.env.TERM_THEME
if (term_theme == nil or term_theme == '') then
    term_theme = "dark"
end
local color_schemes={
    light = "catppuccin-latte",
    dark = "catppuccin-mocha"
}
local scheme = color_schemes[term_theme]
if (scheme ~=  nil) then
  vim.cmd("colorscheme "..scheme)
else
  print("no colorscheme found for theme: "..term_theme)
end
