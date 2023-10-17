return {
    "petertriho/nvim-scrollbar",
    dependencies = {
        "kevinhwang91/nvim-hlslens",
        "lewis6991/gitsigns.nvim",
    },
    config = function()
        vim.cmd([[
            augroup scrollbar_search_hide
                autocmd!
                autocmd CmdlineLeave : lua require('scrollbar.handlers.search').handler.hide()
            augroup END
        ]])

        require("scrollbar.handlers.gitsigns").setup()
    end
}
