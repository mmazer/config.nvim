return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = false },
    indent = { enabled = false },
    input = { enabled = false },
    picker = { enabled = true },
    notifier = { enabled = false },
    quickfile = { enabled = true },
    scroll = { enabled = false },
    statuscolumn = { enabled = false },
    words = { enabled = false },
    dashboard = {
      sections = {
        { section = "header" },
        { section = "keys"},
        function()
          local snacks = require("snacks")
          local in_git = snacks.git.get_root() ~= nil
          local cmds = {
            {
              title = "Remotes",
              cmd = "git remotes",
              key = "b",
              action = function()
                snacks.gitbrowse()
              end,
              height = 5
            },
            {
              icon = " ",
              title = "Log",
              cmd = "git log --pretty=format:'%cd %h %s (%an)' --date=short -3",
              height = 7,
            },
            {
              icon = " ",
              title = "Open PRs",
              cmd = "gh pr list -L 5",
              key = "P",
              action = function()
                vim.fn.jobstart("gh pr list --web", { detach = true })
              end,
              height = 7,
            },
            {
              icon = " ",
              title = "Git Status",
              cmd = "git --no-pager diff --stat -B -M -C",
              height = 10,
            },
          }
          return vim.tbl_map(function(cmd)
            return vim.tbl_extend("force", {
              pane = 2,
              section = "terminal",
              enabled = in_git,
              padding = 1,
              ttl = 5 * 60,
              indent = 3,
            }, cmd)
          end, cmds)
        end,
        { section = "startup" },
      },
    },
    terminal = {
      keys = {
        q = "hide"
      }
    }
  },
  keys = function()
    local snacks = require("snacks")
    local indent_guides = false

    local toggle_indent_guides = function()
      if indent_guides == true then
        snacks.indent.disable()
        indent_guides = false
      else
        snacks.indent.enable()
        indent_guides = true
      end
    end

    return {
      {"<leader>b", function() snacks.picker.buffers({hidden=true,nofile=true, unloaded=false}) end },
      {"<leader>db", function() snacks.bufdelete() end },
      {"<leader>do", function() snacks.bufdelete.other() end },
      {"<leader>di", function() snacks.dim() end },
      {"<leader>i", function() toggle_indent_guides() end },
      {"<leader>e", function() snacks.picker.explorer() end },
      {"<leader>f", function() snacks.picker.files() end },
      {"<leader>gl", function() snacks.picker.git_log() end, desc = "Git Log" },
      {"<leader>lg", function() snacks.lazygit() end, desc = "Lazygit" },
      {"<leader>r", function() snacks.picker.recent() end },
      {"<leader>t", function() snacks.terminal() end },
      {"<leader>/", function() snacks.picker.grep() end },
      { "<leader><space>", function() snacks.picker.smart() end, desc = "Smart Find Files" },
    }
  end
}
