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
    "lukas-reineke/indent-blankline.nvim",
    dependencies = {
        {
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
    },
    main = "ibl",
    opts = {},
    config = function()
        local hooks = require "ibl.hooks"
        -- create the highlight groups in the highlight setup hook, so they are reset
        -- every time the colorscheme changes
        hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
            vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
            vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
            vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
            vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
            vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
            vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
            vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
        end)


        require("ibl").setup {
            scope = {
                highlight = highlight,
                show_exact_scope = true,
            }
        }

        hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
    end,
}
