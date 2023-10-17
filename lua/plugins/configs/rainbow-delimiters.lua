local highlight = {
    "RainbowRed",
    "RainbowYellow",
    "RainbowBlue",
    "RainbowOrange",
    "RainbowGreen",
    "RainbowViolet",
    "RainbowCyan",
}

return {
    "HiPhish/rainbow-delimiters.nvim",
    setup = function()
        local rainbow = require("rainbow-delimiters")

        require("rainbow-delimiters.setup").setup {
            strategy = {
                -- Use global strategy by default
                [''] = rainbow.strategy['global'],
                -- Use local for HTML
                html = rainbow.strategy['local'],
                -- Pick the strategy for LaTeX dynamically based on the buffer size
                latex = function()
                    -- Disabled for very large files, global strategy for large files,
                    -- local strategy otherwise
                    if vim.fn.line('$') > 10000 then
                        return nil
                    elseif vim.fn.line('$') > 1000 then
                        return rainbow.strategy['global']
                    end
                    return rainbow.strategy['local']
                end

            },
            query = {
                [''] = 'rainbow-delimiters',
                lua = 'rainbow-blocks',
                latex = 'rainbow-blocks',
                javascript = "rainbow-delimiters-react",
                tsx = "rainbow-parens",
                verilog = 'rainbow-blocks',
            },
            highlight = highlight,
        }
    end
}
