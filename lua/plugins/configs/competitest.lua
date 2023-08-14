return {
	"xeluxee/competitest.nvim",
	requires = "MunifTanjim/nui.nvim",
	config = function()
		require("competitest").setup({
			template_file = "~/Templates/template.$(FEXT)",
		})
	end,
}
