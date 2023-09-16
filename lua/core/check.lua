local M = {}

local Terminal = require("toggleterm.terminal").Terminal

local doctest_terminal = Terminal:new({
    cmd = "source ./venv/bin/activate && python3 -m doctest " .. vim.fn.expand("%:p"),
    dir = vim.fn.getcwd(),
    direction = "float",
    float_opts = {
        border = "curved",
    },
    -- function to run on opening the terminal
    on_open = function(term)
        vim.cmd("startinsert!")
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>",
            { noremap = true, silent = true })
    end,
    -- function to run on closing the terminal
    on_close = function(term)
        vim.cmd("startinsert!")
    end,
})

local pythonTA_terminal = Terminal:new({
    cmd = "source ./venv/bin/activate && python3 -m python_ta " .. vim.fn.expand("%:p"),
    dir = vim.fn.getcwd(),
    direction = "float",
    float_opts = {
        border = "curved",
    },
    -- function to run on opening the terminal
    on_open = function(term)
        vim.cmd("startinsert!")
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>",
            { noremap = true, silent = true })
    end,
    -- function to run on closing the terminal
    on_close = function(term)
        vim.cmd("startinsert!")
    end,
})

local checkers = {
    python = {
        doctest = function()
            doctest_terminal:toggle()
        end,
        pythonTA = function()
            pythonTA_terminal:toggle()
        end,
    },
}

local get_keys = function(tab)
    local keys = {}
    for key, _ in pairs(tab) do
        table.insert(tab, key)
    end
    return keys
end

local get_available_checkers = function(filetype)
    if checkers[filetype] == nil then
        return nil
    else
        return get_keys(checkers[filetype])
    end
end

local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local opts = require("telescope.themes").get_dropdown {}

local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

M.check = function()
    print("start!")
    local filetype = vim.bo.filetype
    local available_checkers = get_available_checkers(filetype)
    print(filetype)
    print(vim.inspect(checkers["python"]))
    if available_checkers == nil then
        return
    end

    pickers.new(opts, {
        prompt_title = "checkers",
        finder = finders.new_table {
            results = available_checkers
        },
        sorter = conf.generic_sorter(opts),
        attach_mappings = function(prompt_bufnr, map)
            actions.select_default:replace(
                function()
                    actions.close(prompt_bufnr)
                    local selection = action_state.get_selected_entry()
                    checkers[filetype][selection[1]]()
                end
            )
            return true
        end,
    }):find()
end

return M
