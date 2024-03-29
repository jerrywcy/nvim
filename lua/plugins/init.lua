print("loading lazy.nvim")
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local lazy_cmd = require("lazy.view.config").commands
local lazy_keys = {
	{ cmd = "install", key = "i" },
	{ cmd = "update", key = "u" },
	{ cmd = "sync", key = "s" },
	{ cmd = "clean", key = "cl" },
	{ cmd = "check", key = "ch" },
	{ cmd = "log", key = "l" },
	{ cmd = "restore", key = "rs" },
	{ cmd = "profile", key = "p" },
}
for _, v in ipairs(lazy_keys) do
	lazy_cmd[v.cmd].key = v.key
	lazy_cmd[v.cmd].key_plugin = v.key
end

require("lazy").setup({
	-- require("plugins.configs.vim-arduino"),
	-- require("plugins.configs.auto-save"),
	require("plugins.configs.autocomplete").config,
	-- require("plugins.configs.breadcrumb"),
	-- require("plugins.configs.coc"),
	require("plugins.configs.cokeline"),
	require("plugins.configs.coman"),
	require("plugins.configs.competitest"),
	require("plugins.configs.conform"),
	require("plugins.configs.copilot"),
	require("plugins.configs.dadbod"),
	require("plugins.configs.debugger"),
	require("plugins.configs.dropbar"),
	require("plugins.configs.fzf"),
	require("plugins.configs.gitsigns"),
	require("plugins.configs.hlchunks"),
	-- require("plugins.configs.hover"),
	require("plugins.configs.im-select"),
	require("plugins.configs.lspconfig").config,
	require("plugins.configs.lualine"),
	require("plugins.configs.mason"),
	require("plugins.configs.markdown"),
	require("plugins.configs.neodev"),
	require("plugins.configs.neogen"),
	require("plugins.configs.neotest"),
	require("plugins.configs.nvim-colorizer"),
	require("plugins.configs.nvim-comment"),
	require("plugins.configs.nvim-nio"),
	require("plugins.configs.nvim-notify"),
	require("plugins.configs.nvim-r"),
	require("plugins.configs.nvim-scrollbar"),
	require("plugins.configs.nvim-surround"),
	require("plugins.configs.nvim-tree"),
	require("plugins.configs.nvim-treesitter"),
	require("plugins.configs.nvim-ufo"),
	require("plugins.configs.octo"),
	require("plugins.configs.rainbow-delimiters"),
	require("plugins.configs.search"),
	require("plugins.configs.suda"),
	require("plugins.configs.tabout"),
	require("plugins.configs.telescope").config,
	require("plugins.configs.toggleterm"),
	require("plugins.configs.tokyonight"),
	require("plugins.configs.ultimate-autopair"),
	require("plugins.configs.ultisnips"),
	require("plugins.configs.undotree"),
	require("plugins.configs.venv"),
	require("plugins.configs.vim-visual-multi"),
	require("plugins.configs.which-key"),
	require("plugins.configs.wilder"),
	require("plugins.configs.wildfire"),
	require("plugins.configs.yanky"),
	require("plugins.configs.yuck"),

	{
		"mfussenegger/nvim-lint",
	},

	{
		"mfussenegger/nvim-dap",
	},

	{
		"wakatime/vim-wakatime",
	},
})
