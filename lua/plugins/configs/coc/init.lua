return {
	"neoclide/coc.nvim",
	branch = "release",
	config = function()
		local coc_path = "plugins.configs.coc/"
		require(coc_path .. "extensions")
		require(coc_path .. "options")
		require(coc_path .. "mappings")
		require(coc_path .. "commands")
	end,
}
