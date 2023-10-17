return {
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
                { '*',  [[*<Cmd>lua require('hlslens').start()<CR>]] },
                { '#',  [[#<Cmd>lua require('hlslens').start()<CR>]] },
                { 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]] },
                { 'g#', [[g#<Cmd>lua require('hlslens').start()<CR>]] },
            }
        }
        local opts = { noremap = true, silent = true }
        require("core.utils").load_mappings(mappings, opts)
    end
}
