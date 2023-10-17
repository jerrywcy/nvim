local M = {}
local merge_tb = vim.tbl_deep_extend

M.load_mappings = function(mappings, mapping_opt)
    local set = vim.keymap.set
    for mode, mode_values in pairs(mappings) do
        local default_opts = merge_tb("force", { mode = mode }, mapping_opt or {})
        for keybind, mapping_info in pairs(mode_values) do
            local opts = merge_tb("force", default_opts, mapping_info.opts or {})

            mapping_info.opts, opts.mode = nil, nil
            opts.desc = mapping_info[2]

            set(mode, keybind, mapping_info[1], opts)
        end
    end
end

M.load_user_commands = function(commands, command_opt)
    local usercmd = vim.api.nvim_create_user_command
    for command_name, command_info in pairs(commands) do
        local opts = merge_tb("force", command_info.opts or {}, command_opt or {})
        local command = command_info[1]
        opts.desc = command_info[2]

        usercmd(command_name, command, opts)
    end
end

M.plugin_loaded = function(plugin_name)
    local loaded, plugin = pcall(require, plugin_name)
    return loaded
end

return M
