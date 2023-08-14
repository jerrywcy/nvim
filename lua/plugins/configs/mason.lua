return {
	"williamboman/mason-lspconfig.nvim",
	lazy = false,
	dependencies = {
		{ "williamboman/mason.nvim", build = ":MasonUpdate" },
	},
	config = function()
		require("mason").setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
				keymaps = {
					toggle_server_expand = "<CR>",
					install_server = "i",
					update_server = "u",
					check_server_version = "c",
					update_all_servers = "U",
					check_outdated_servers = "C",
					uninstall_server = "X",
					cancel_installation = "<C-c>",
				},
			},
		})
		require("mason-lspconfig").setup({
			ensure_installed = { "lua_ls" },
			automatic_installation = true,
		})
	end,
}
