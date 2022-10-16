local plugins = {

    {
        "wbthomason/packer.nvim",
        cmd = {
            "PackerSnapshot",
            "PackerSnapshotRollback",
            "PackerSnapshotDelete",
            "PackerInstall",
            "PackerUpdate",
            "PackerSync",
            "PackerClean",
            "PackerCompile",
            "PackerStatus",
            "PackerProfile",
            "PackerLoad",
        },
        config = function()
            require "plugins"
        end,
    },

    {
        "nvim-treesitter/nvim-treesitter",
        module = "nvim-treesitter",
        setup = function()
            require("core.utils").on_file_open("nvim-treesitter")
        end,
        cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSEnable", "TSDisable", "TSModuleInfo" },
        run = ":TSUpdate",
        config = function()
            require "plugins.configs.nvim-treesitter"
        end,
    },

    {
        "williamboman/mason.nvim",
        cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
        config = function()
            require "plugins.configs.mason"
        end,
    },

    {
        "neovim/nvim-lspconfig",
    },

    {
        "williamboman/mason-lspconfig.nvim",
    },

    {
        "mfussenegger/nvim-lint",
    },

    {
        "mhartington/formatter.nvim",
        cmd = { "Format", "FormatLock", "FormatWrite", "FormatWriteLock" },
        config = function()
            require "plugins.configs.formatter"
        end,
    },

    {
        "mfussenegger/nvim-dap",
    },

    {
        "neoclide/coc.nvim",
        branch = "release",
    },

    {
        "folke/tokyonight.nvim",
    },

    {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = function()
            require "plugins.configs.lualine"
        end
    },

    {
        "noib3/nvim-cokeline",
        requires = {'kyazdani42/nvim-web-devicons'},
        config = function()
            require "plugins.configs.cokeline"
        end
    },

}
local present, packer = pcall(require,"packer")

if present then
    vim.cmd("packadd packer.nvim")

    local init_options = require "plugins.configs.packer_init"

    packer.init(init_options)
    packer.startup { plugins }
end
