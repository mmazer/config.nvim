local user_command = require("u.nvim").user_command
user_command("Json :set ft=json | %!python3 -m json.tool")
user_command("Strip :call vlib#strip()")
user_command("Bpath :echo expand('%:p')")
user_command("Yaml :set ft=yaml")

