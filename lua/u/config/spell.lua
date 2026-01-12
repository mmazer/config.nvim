local opt = vim.opt
local spell_dir = vim.fn.stdpath("data") .. "/site/spell"

if vim.fn.isdirectory(spell_dir) == 0 then
    vim.fn.mkdir(spell_dir, "p")
end

opt.spellfile = spell_dir.."/en.utf-8.add"
