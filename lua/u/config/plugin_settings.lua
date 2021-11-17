local g = vim.g
local u = require 'u'
local nmap = u.nvim.nmap
local xmap = u.nvim.xmap
local user_command = u.nvim.user_command

-- nvimtree
-- These will be moved to setup() eventually by plugin developer
g['nvim_tree_show_icons'] = {
  git = 0,
  folders = 1,
  files = 0,
  folder_arrows = 1
}
g['nvim_tree_icons'] = {
  default = '.',
  symlink = 's',
  folder =  {
    arrow_open = "",
    arrow_closed = "",
    default = "▶",
    open = "▼",
    empty = "▶",
    empty_open = "▼",
    symlink = "s",
    symlink_open = "",
  }
}

nmap('-', ":lua require('nvim-tree').toggle()<cr>", {silent = true})
nmap('<space>nf', ':NvimTreeFindFile<cr>', {silent = true})

-- vista
nmap('<space>v',  ':Vista!!<CR>', {silent = true})

-- fugitive
nmap('<space>gs', ':Git<CR>')
nmap('<space>gb', ':Git blame<CR>')
nmap('<space>gc', ':Git commit -v -q <CR>')
nmap('<space>gd', ':Gdiffsplit<CR>')
nmap('<space>gr', ':Gread<CR>')
nmap('<space>gw', ':Gwrite<CR>')

-- grepper
g['grepper'] = { tools = { 'rg', 'git' }}

nmap('<leader>g', ':GrepperRg<space>')
nmap('gs',  '<plug>(GrepperOperator)')
xmap('gs',  '<plug>(GrepperOperator)')
nmap('<leader>w',  ':Grepper -tool rg -cword -highlight -noprompt -nojump -switch<cr>')

user_command('-nargs=* GrepBufDir :Grepper -dir file -tool rg -highlight -nojump -noprompt -query <args>')

-- telescope
require('telescope').setup {
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    }
  }
}
-- load telescope extensions
require('telescope').load_extension('fzf')
require('telescope').load_extension('nvim_commands')
require('telescope').load_extension('favourites')

nmap('<space>f', "<cmd>lua require('telescope.builtin').find_files()<cr>")
nmap('<space>g', "<cmd>lua require('telescope.builtin').live_grep()<cr>")
nmap('<space>b', "<cmd>lua require('telescope.builtin').buffers()<cr>")
nmap('<space>h', "<cmd>lua require('telescope.builtin').help_tags()<cr>")
nmap('<space>k', "<cmd>lua require('telescope.builtin').keymaps()<cr>")
nmap('<space>m', "<cmd>lua require('telescope.builtin').man_pages()<cr>")
nmap('<space>r', "<cmd>lua require('telescope.builtin').oldfiles()<cr>")
nmap('<space>v', "<cmd>lua require('telescope').extensions.favourites.favourite_files()<cr>")
nmap('<space>x', "<cmd>lua require('telescope').extensions.nvim_commands.commands()<cr>")


-- toggleterm
require("toggleterm").setup{
  -- size can be a number or function which is passed the current terminal
  size = 20,
  open_mapping = [[<c-t>]],
  hide_numbers = true, -- hide the number column in toggleterm buffers
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 1, -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
  start_in_insert = true,
  insert_mappings = true, -- whether or not the open mapping applies in insert mode
  persist_size = true,
  direction = 'float',
  close_on_exit = true, -- close the terminal window when the process exits
  float_opts = {
    -- The border key is *almost* the same as 'nvim_open_win'
    -- see :h nvim_open_win for details on borders however
    -- the 'curved' border is a custom border type
    -- not natively supported but implemented in this plugin.
    border = 'single',
    winblend = 3,
    highlights = {
      border = "Normal",
      background = "Normal",
    }
  }
}

-- cmp
local cmp = require'cmp'
u.opt.completion_enabled = true

cmp.setup({
  -- https://github.com/hrsh7th/nvim-cmp/issues/261#issuecomment-929790943
  enabled = function()
    return u.opt.completion_enabled
  end,
  mapping = {
    ["<Tab>"] = cmp.mapping.select_next_item({behavior=cmp.SelectBehavior.Insert}),
    ["<S-Tab>"] = cmp.mapping.select_prev_item({behavior=cmp.SelectBehavior.Insert}),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'buffer' },
      { name = 'path' },
      { name = 'ultisnips' },
  }),
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["UltiSnips#Anon"](args.body)
    end,
  },
})

u.fn.toggle_completion = function()
  if u.opt.completion_enabled then
      u.opt.completion_enabled = false
  else
      u.opt.completion_enabled = true
  end
end

nmap('coa', '<cmd>lua require("u").fn.toggle_completion()<cr>')