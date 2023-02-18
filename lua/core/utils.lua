local M = {}
local autocmd = vim.api.nvim_create_autocmd
local merge_tb = vim.tbl_deep_extend

-- require("packer").loader(tb.plugins)
-- This must be used for plugins that need to be loaded just after a file
-- ex : treesitter, lspconfig etc
M.lazy_load = function(tb)
	autocmd(tb.events, {
		group = vim.api.nvim_create_augroup(tb.augroup_name, {}),
		callback = function()
			if tb.condition() then
				vim.api.nvim_del_augroup_by_name(tb.augroup_name)

				-- dont defer for treesitter as it will show slow highlighting
				-- This deferring only happens only when we do "nvim filename"
				if tb.plugin ~= "nvim-treesitter" then
					vim.defer_fn(function()
						require("packer").loader(tb.plugin)
						if tb.plugin == "nvim-lspconfig" then
							vim.cmd("silent! do FileType")
						end
					end, 0)
				else
					require("packer").loader(tb.plugin)
				end
			end
		end,
	})
end

-- load certain plugins only when there's a file opened in the buffer
-- if "nvim filename" is executed -> load the plugin after nvim gui loads
-- This gives an instant preview of nvim with the file opened

M.on_file_open = function(plugin_name)
	M.lazy_load({
		events = { "BufRead", "BufWinEnter", "BufNewFile" },
		augroup_name = "BeLazyOnFileOpen" .. plugin_name,
		plugin = plugin_name,
		condition = function()
			local file = vim.fn.expand("%")
			return file ~= "NvimTree_1" and file ~= "[packer]" and file ~= ""
		end,
	})
end

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
