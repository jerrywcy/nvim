return {
	"Pocco81/auto-save.nvim",
	config = function()
		require("auto-save").setup({
			trigger_events = { "BufLeave" },
		})
	end,
}
