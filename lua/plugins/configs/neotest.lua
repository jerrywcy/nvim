if not require("core.utils").plugin_loaded("neotest") then
	return
end

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
