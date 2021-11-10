local finders = require "telescope.finders"
local pickers = require "telescope.pickers"
local config = require("telescope.config").values
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"
local entry_display = require "telescope.pickers.entry_display"
local file = require('lib.file')

local M = {}

local commands_file

local function default_file()
    xdg_data_home = os.getenv('XDG_DATA_HOME') 
    if not xdg_data_home then
        error('XDG_DATA_HOME environment variable must be set')
    end
    return xdg_data_home..'/nvim/nvim_commands'
end

local function assert_file_readable(path)
    if not file.is_readable(path) then
        error(string.format("vim commands file not found: %s", path))
    end
end

local function load_commands(path)
    local commands = {}
    for line in io.lines(path) do
        if line ~= nil and line ~= '' then
            table.insert(commands, line)
        end
    end
    return commands
end

M.setup = function(ext_config, config)
    ext_config = ext_config or {}
    commands_file = ext_config.commands_file or default_file()
    assert_file_readable(commands_file)
end

M.commands = function(opts)
    opts = opts or {}
    if not commands_file then
        M.setup()
    end
    local cmds = load_commands(commands_file)
    pickers.new(opts, {
        prompt_tile = "Select an nvim command",
        results_tile = "Commands",
        finder =  finders.new_table {
            results = cmds,
            entry_maker = function(entry) 
                return {
                    value = entry,
                    display = entry,
                    ordinal = entry
                }
             end
        },
        sorter = config.generic_sorter(opts),
        attach_mappings = function(prompt_bufnr, map)
            actions.select_default:replace(function()
                actions.close(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                local cmd = selection.value
                print(string.format("executing command: %s", cmd))
                vim.cmd(cmd)
            end)
            return true
        end
    }):find()
end

return M
