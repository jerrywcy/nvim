return {
	"lewis6991/gitsigns.nvim",
	config = function()
		require("gitsigns").setup({
			signs = {
				add = { hl = "GitSignsAdd", text = "▎", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
				change = {
					hl = "GitSignsChange",
					text = "░",
					numhl = "GitSignsChangeNr",
					linehl = "GitSignsChangeLn",
				},
				delete = { hl = "GitSignsDelete", text = "_", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
				topdelete = {
					hl = "GitSignsDelete",
					text = "▔",
					numhl = "GitSignsDeleteNr",
					linehl = "GitSignsDeleteLn",
				},
				changedelete = {
					hl = "GitSignsChange",
					text = "▒",
					numhl = "GitSignsChangeNr",
					linehl = "GitSignsChangeLn",
				},
				untracked = { hl = "GitSignsAdd", text = "┆", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
			},
		})

		local mappings = {
			n = {
				["<leader>g-"] = { ":Gitsigns prev_hunk" },
				["<leader>g="] = { ":Gitsigns next_hunk" },
				["<leader>gb"] = { ":Gitsigns blame_line" },
				["<leader>gr"] = { ":Gitsigns reset_hunk" },
				["<S-h>"] = { ":Gitsigns preview_hunk_inline" },
			},
		}

		require("core.utils").load_mappings(mappings, { noremap = true, silent = true })
	end,
}
