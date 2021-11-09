local user_command = require('lib.nvim').user_command
user_command('Json :set ft=json | %!python3 -m json.tool')
user_command('Strip :call vlib#preserve("%s/\\\\s\\\\+$//e")')

