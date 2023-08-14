return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons", -- optional, for file icons
	},
	tag = "nightly", -- optional, updated every week. (see issue #1193)
	config = function()
		local g = vim.g

		-- disable netrw at the very start of your init.lua (strongly advised)
		g.loaded_netrw = 1
		g.loaded_netrwPlugin = 1

		require("nvim-tree").setup({
			sort_by = "case_sensitive",
			view = {
				adaptive_size = true,
				mappings = {
					list = {
						{ key = "u", action = "dir_up" },
					},
				},
			},
			renderer = {
				group_empty = true,
			},
			filters = {
				dotfiles = true,
			},
		})

		local mappings = {
			n = {
				["tt"] = { "<cmd> NvimTreeToggle <CR>", "Toggle NvimTree" },
			},
		}

		require("core.utils").load_mappings(mappings)

		-- vim.cmd("NvimTreeToggle")
	end,
}
