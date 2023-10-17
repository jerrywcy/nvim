return {
    "petertriho/nvim-scrollbar",
    dependencies = {
        "kevinhwang91/nvim-hlslens",
        "lewis6991/gitsigns.nvim",
    },
    config = function()
        require("hlslens").setup({
            build_position_cb = function(plist, _, _, _)
                require("scrollbar.handlers.search").handler.show(plist.start_pos)
            end,
        })

        vim.cmd([[
            augroup scrollbar_search_hide
                autocmd!
                autocmd CmdlineLeave : lua require('scrollbar.handlers.search').handler.hide()
            augroup END
        ]])

        require("scrollbar.handlers.gitsigns").setup()
    end
}
