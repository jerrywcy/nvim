return {
    {
        "kevinhwang91/nvim-hlslens",
        dependencies = {
            "kevinhwang91/nvim-ufo",
        },
        config = function()
            require("hlslens").setup({
                -- Enable nvim-hlslens automatically
                auto_enable        = true,
                -- When `incsearch` option is on and enable_incsearch is true, add lens
                -- for the current matched instance
                enable_incsearch   = true,
                -- If calm_down is true, clear all lens and highlighting When the cursor is
                -- out of the position range of the matched instance or any texts are changed
                calm_down          = false,
                -- Only add lens for the nearest matched instance and ignore others
                nearest_only       = false,
                -- When to open the floating window for the nearest lens.
                -- 'auto': floating window will be opened if room isn't enough for virtual text;
                -- 'always': always use floating window instead of virtual text;
                -- 'never': never use floating window for the nearest lens
                nearest_float_when = "auto",
                -- Winblend of the nearest floating window. `:h winbl` for more details
                float_shadow_blend = 50,
                -- Priority of virtual text, set it lower to overlay others.
                -- `:h nvim_buf_set_extmark` for more details
                virt_priority      = 100,
                -- Hackable function for customizing the lens. If you like hacking, you
                -- should search `override_lens` and inspect the corresponding source code.
                -- There's no guarantee that this function will not be changed in the future. If it is
                -- changed, it will be listed in the CHANGES file.
                -- @param render table an inner module for hlslens, use `setVirt` to set virtual text
                -- @param splist table (1,1)-indexed position
                -- @param nearest boolean whether nearest lens
                -- @param idx number nearest index in the plist
                -- @param relIdx number relative index, negative means before current position,
                --                       positive means after
                override_lens      = nil,
            })

            local function nN(char)
                local ok, winid = hlslens.nNPeekWithUFO(char)
                if ok and winid then
                    -- Safe to override buffer scope keymaps remapped by ufo,
                    -- ufo will restore previous buffer keymaps before closing preview window
                    -- Type <CR> will switch to preview window and fire `trace` action
                    vim.keymap.set('n', '<CR>', function()
                        local keyCodes = api.nvim_replace_termcodes('<Tab><CR>', true, false, true)
                        api.nvim_feedkeys(keyCodes, 'im', false)
                    end, { buffer = true })
                end
            end
            vim.keymap.set({ 'n', 'x' }, 'n', function() nN('n') end)
            vim.keymap.set({ 'n', 'x' }, 'N', function() nN('N') end)

            local mappings = {
                n = {
                    -- { 'n',  [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]] },
                    -- { 'N',  [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]] },
                    ['*'] = { [[*<Cmd>lua require('hlslens').start()<CR>]] },
                    ['#'] = { [[#<Cmd>lua require('hlslens').start()<CR>]] },
                    ['g*'] = { [[g*<Cmd>lua require('hlslens').start()<CR>]] },
                    ['g#'] = { [[g#<Cmd>lua require('hlslens').start()<CR>]] },
                }
            }
            local opts = { noremap = true, silent = true }
            require("core.utils").load_mappings(mappings, opts)
        end
    },
    {
        "pechorin/any-jump.vim",
        config = function()
            local mappings = {
                n = {
                    ['<leader>j'] = { "<Cmd>AnyJump<CR>" },
                    ["<leader>ab"] = { "<cmd>AnyJumpBack<CR>" },
                    ["<leader>al"] = { "<cmd>AnyJumpLastResults<CR>" },
                },
                x = {
                    ["<leader>j"] = { "<Cmd>AnyJumpVisual<CR>" },
                }
            }
            require("core.utils").load_mappings(mappings)

            local g                                         = vim.g
            -- Show line numbers in search rusults
            g.any_jump_list_numbers                         = 0
            -- Auto search references
            g.any_jump_references_enabled                   = 1
            -- Auto group results by filename
            g.any_jump_grouping_enabled                     = 0
            -- Amount of preview lines for each search result
            g.any_jump_preview_lines_count                  = 5
            -- Max search results, other results can be opened via [a]
            g.any_jump_max_search_results                   = 10
            -- Prefered search engine: rg or ag
            g.any_jump_search_prefered_engine               = 'rg'
            -- Search results list styles:
            -- - 'filename_first'
            -- - 'filename_last'
            g.any_jump_results_ui_style                     = 'filename_first'
            -- Any-jump window size & position options
            g.any_jump_window_width_ratio                   = 0.6
            g.any_jump_window_height_ratio                  = 0.6
            g.any_jump_window_top_offset                    = 4
            -- Customize any-jump colors with extending default color scheme:
            -- g.any_jump_colors = { "help": "Comment" }
            -- Or override all default colors
            g.any_jump_colors                               = {
                plain_text = "Comment",
                preview = "Comment",
                preview_keyword = "Operator",
                heading_text = "Function",
                heading_keyword = "Identifier",
                group_text = "Comment",
                group_name = "Function",
                more_button = "Operator",
                more_explain = "Comment",
                result_line_number = "Comment",
                result_text = "Statement",
                result_path = "String",
                help = "Comment"
            }
            -- Disable default any-jump keybindings (default: 0)
            g.any_jump_disable_default_keybindings          = 1
            -- Remove comments line from search results (default: 1)
            g.any_jump_remove_comments_from_results         = 1
            -- Custom ignore files
            -- default is: ['*.tmp', '*.temp']
            g.any_jump_ignored_files                        = { '*.tmp', '*.temp' }
            -- Search references only for current file type
            -- (default: false, so will find keyword in all filetypes)
            g.any_jump_references_only_for_current_filetype = 0
            -- Disable search engine ignore vcs untracked files
            -- (default: false, search engine will ignore vcs untracked files)
            g.any_jump_disable_vcs_ignore                   = 0
        end
    }
}
