local fn = vim.fn
local packer_path=fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"

local is_first_time_use = function() 
	return fn.empty(fn.glob(packer_path)) > 0
end

local clone_packer = function()
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1e222a" })
	print "Cloning packer ..."
	fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', packer_path})
end

local install_and_config_plugins = function()
	vim.cmd "packadd packer.nvim"
    require "plugins"
    vim.cmd "PackerSync"
end

local packer_complete = function()
	vim.api.nvim_create_autocmd("User", {
		pattern = "PackerComplete",
		callback = function()
			vim.cmd "bw | silent! MasonInstallAll" -- close packer window
			require("packer").loader("nvim-treesitter")
        end
    })
end

local initialize = function()
	clone_packer()
	install_and_config_plugins()
	-- packer_complete()
end

if is_first_time_use() == true then
	initialize()
end
