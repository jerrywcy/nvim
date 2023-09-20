local opt = { noremap = true, nowait = true }
local M = {}

M.config = {
    {
        "nvim-telescope/telescope.nvim",
        -- tag = '0.1.1',
        dependencies = {
            "nvim-lua/plenary.nvim",
            {
                "LukasPietzschmann/telescope-tabs",
                config = function()
                    local tstabs = require("telescope-tabs")
                    tstabs.setup({})
                    vim.keymap.set("n", "<c-t>", tstabs.list_tabs, {})
                end,
            },
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
            -- "nvim-telescope/telescope-ui-select.nvim",
            "stevearc/dressing.nvim",
            "tsakirist/telescope-lazy.nvim",
            "fannheyward/telescope-coc.nvim",
            "dimaportenko/telescope-simulators.nvim",
        },
        config = function()
            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<c-p>", builtin.find_files, opt)
            -- vim.keymap.set('n', '<c-f>', function()
            -- 	builtin.grep_string({ search = "" })
            -- end, m)
            vim.keymap.set("n", "<leader>rs", builtin.resume, opt)
            vim.keymap.set("n", "<c-w>", builtin.buffers, opt)
            -- vim.keymap.set("n", "<c-h>", builtin.oldfiles, opt)
            vim.keymap.set("n", "<c-_>", builtin.current_buffer_fuzzy_find, opt)
            vim.keymap.set("n", "z=", builtin.spell_suggest, opt)

            vim.keymap.set("n", "<leader>d", builtin.diagnostics, opt)
            -- vim.keymap.set('n', 'gd', builtin.lsp_definitions, m)
            -- vim.keymap.set('n', '<c-t>', builtin.lsp_document_symbols, {})
            vim.keymap.set("n", "gi", builtin.git_status, opt)
            -- vim.keymap.set("n", ":", builtin.commands, opt)

            local trouble = require("trouble.providers.telescope")

            local ts = require("telescope")
            local actions = require("telescope.actions")
            M.ts = ts
            ts.setup({
                defaults = {
                    vimgrep_arguments = {
                        "rg",
                        "--color=never",
                        "--no-heading",
                        "--with-filename",
                        "--line-number",
                        "--column",
                        "--fixed-strings",
                        "--smart-case",
                        "--trim",
                    },
                    layout_config = {
                        width = 0.9,
                        height = 0.9,
                    },
                    mappings = {
                        i = {
                            ["<C-h>"] = "which_key",
                            ["<C-u>"] = "move_selection_previous",
                            ["<C-e>"] = "move_selection_next",
                            ["<C-l>"] = "preview_scrolling_up",
                            ["<C-y>"] = "preview_scrolling_down",
                            ["<esc>"] = "close",
                        },
                    },
                    color_devicons = true,
                    prompt_prefix = "🔍 ",
                    selection_caret = " ",
                    path_display = { "truncate" },
                    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
                    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
                },
                pickers = {
                    buffers = {
                        show_all_buffers = true,
                        sort_lastused = true,
                        mappings = {
                            i = {
                                ["<c-d>"] = actions.delete_buffer,
                            },
                        },
                    },
                },
                extensions = {
                    fzf = {
                        fuzzy = true,
                        override_generic_sorter = true,
                        override_file_sorter = true,
                        case_mode = "smart_case",
                    },
                    command_palette = command_palette,
                },
            })
            require("dressing").setup({
                select = {
                    get_config = function(opts)
                        if opts.kind == "codeaction" then
                            return {
                                backend = "telescope",
                                telescope = require("telescope.themes").get_cursor(),
                            }
                        end
                    end,
                },
            })

            ts.load_extension("yank_history")
            ts.load_extension("lazy")
            ts.load_extension("coc")
            ts.load_extension("dap")
            ts.load_extension("telescope-tabs")
            ts.load_extension("fzf")
            ts.load_extension("simulators")
            ts.load_extension("commander")

            require("simulators").setup({
                android_emulator = false,
                apple_simulator = true,
            })
            -- ts.load_extension("ui-select")
            -- ts.load_extension("flutter")
            local tsdap = ts.extensions.dap
            vim.keymap.set("n", "<leader>'v", tsdap.variables, opt)
            vim.keymap.set("n", "<leader>'a", tsdap.commands, opt)
            vim.keymap.set("n", "<leader>'b", tsdap.list_breakpoints, opt)
            vim.keymap.set("n", "<leader>'f", tsdap.frames, opt)
        end,
    },
    {
        "FeiyouG/commander.nvim",
        dependencies = "nvim-telescope/telescope.nvim",
        config = function()
            require("commander").setup {
                -- Specify what components are shown in the prompt;
                -- Order matters, and components may repeat
                components = {
                    "DESC",
                    "KEYS",
                    "CMD",
                    "CAT",
                },

                -- Spcify by what components the commands is sorted
                -- Order does not matter
                sort_by = {
                    "DESC",
                    "KEYS",
                    "CMD",
                    "CAT",
                },

                -- Change the separator used to separate each component
                separator = " ",

                -- When set to true,
                -- The desc component will be populated with cmd if desc is empty or missing.
                auto_replace_desc_with_cmd = true,

                -- Default title of the prompt
                prompt_title = "Commander",

                integration = {
                    telescope = {
                        -- Set to true to use telescope instead of vim.ui.select for the UI
                        enable = true,
                        -- Can be any builtin or custom telescope theme
                        -- theme = theme,
                    },
                    lazy = {
                        -- Set to true to automatically add all key bindings set through lazy.nvim
                        enable = true,
                        -- Set to true to use plugin name as category for each keybinding added from lazy.nvim
                        set_plugin_name_as_cat = true
                    }
                }
            }
            local command_center = require("commander")
            vim.keymap.set("n", "<c-p>", ":Telescope commander<CR>", opt)
            command_center.add({
                {
                    desc = "Run Simulator",
                    cmd = "<CMD>Telescope simulators run<CR>",
                },
                {
                    desc = "Git diff",
                    cmd = "<CMD>Telescope git_status<CR>",
                },
            })
        end,
    },
}

return M
