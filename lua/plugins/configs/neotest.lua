if not require("core.utils").plugin_loaded("neotest") then
	return
end

return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"antoinemadec/FixCursorHold.nvim",
		"rouge8/neotest-rust",
		"haydenmeade/neotest-jest",
		"marilari88/neotest-vitest",
		"nvim-neotest/neotest-vim-test",
		"vim-test/vim-test",
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-rust"),
				require("neotest-vitest"),
				require("neotest-jest"),
				require("neotest-vim-test")({
					ignore_filetypes = { "javascript", "rust" },
				}),
			},
		})

		local mappings = {
			n = {
				["<leader>t"] = { '<cmd>lua require("neotest").summary.toggle()<CR>', "Toggle Neotest summary panel" },
			},
		}
	end,
}
