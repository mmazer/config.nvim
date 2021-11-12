local env = vim.env
local stdpath = vim.fn.stdpath

env.VIMDATA = stdpath('data')
env.VIMCACHE = stdpath('cache')
env.VIMCONFIG = stdpath('config')
env.VIMCONFIGSDIR = stdpath('config')..'/config.d'
