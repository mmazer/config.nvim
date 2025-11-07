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
        { section = "keys" },
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
              title = "Open Issues",
              cmd = "gh issue list -L 3",
              key = "i",
              action = function()
                vim.fn.jobstart("gh issue list --web", { detach = true })
              end,
              icon = " ",
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
    local dimmed = false

    local toggle_indent_guides = function()
      if indent_guides == true then
        snacks.indent.disable()
        indent_guides = false
      else
        snacks.indent.enable()
        indent_guides = true
      end
    end

    local toggle_dim = function()
      if dimmed == true then
        snacks.dim.disable()
        dimmed = false
      else
        snacks.dim.enable()
        dimmed = true
      end
    end

    return {
      { "<space>b",       function() snacks.picker.buffers({ hidden = true, nofile = true, unloaded = false }) end },
      { "<space>db",      function() snacks.bufdelete() end },
      { "<space>do",      function() snacks.bufdelete.other() end },
      { "<space>di",      function() toggle_dim() end },
      { "<space>D",       function() snacks.dashboard() end },
      { "<space>i",       function() toggle_indent_guides() end },
      { "<space>e",       function() snacks.picker.explorer() end },
      { "<space>f",       function() snacks.picker.files() end },
      { "<space>gl",      function() snacks.picker.git_log() end, },
      { "<space>ll",      function() snacks.picker.lines() end, },
      { "<space>lg",      function() snacks.lazygit() end, },
      { "<space>ls",      function() snacks.picker.lsp_symbols() end, },
      { "<space>lw",      function() snacks.picker.lsp_worskpace_symbols() end, },
      { "<space>r",       function() snacks.picker.recent() end },
      { "<space>t",       function() snacks.terminal() end },
      { "<space>tb",      function() snacks.terminal("/bin/zsh", { cwd = vim.fn.expand("%:p:h") }) end },
      { "<space>/",       function() snacks.picker.grep() end },
      { "<leader>a", function() snacks.picker.smart() end, },
    }
  end
}
