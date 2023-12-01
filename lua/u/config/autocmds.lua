local api = vim.api

cursor_line_augroup = api.nvim_create_augroup("CursorLine", {clear = true})
api.nvim_create_autocmd({"WinEnter", "InsertLeave" }, {
  command = "set cursorline",
  group = cursor_line_augroup
})

strip_trailing_whitespace = api.nvim_create_augroup("StripTrailingWhiteSpace", {clear=true})
api.nvim_create_autocmd({"BufWritePre"}, {
  command = ":call vlib#strip()",
  group = strip_trailing_whitespace
})

api.nvim_create_autocmd({"WinLeave", "InsertEnter"}, {
  command = "set nocursorline",
  group = cursor_line_augroup
})

modified_augroup = api.nvim_create_augroup("ModifiedTime", {clear = true})
api.nvim_create_autocmd("BufWritePre", {
  command = "call vlib#preserve_wrapper(function('datetime#update_modified_time'))",
  group = modified_augroup
})

checktime_augroup = api.nvim_create_augroup("Checktime", {clear = true})
api.nvim_create_autocmd({"CursorHold", "BufWinEnter"}, {
  command = "checktime",
  group = checktime_augroup
})

jinja2_augroup = api.nvim_create_augroup("Jinja2", {clear = true})
api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  pattern = "*yaml.j2",
  command = "set ft=yaml",
  group = jinja2_augroup
})

helm_augroup = api.nvim_create_augroup("Helm", {clear = true})
api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  pattern = "*.tpl",
  command = "set ft=gohtmltmpl",
  group = helm_augroup
})
