local M = {}

local function get_command()
    local expand = vim.fn.expand
    local filetype = vim.bo.filetype

    if filetype == "cpp" then
        return string.format("g++ '%s' -Wall -o '%s' && '%s'", expand("%:p"), expand("%:p:r"), expand("%:p:r"))
    elseif filetype == "python" then
        return string.format("python '%s'", expand("%:p"))
    elseif filetype == "rust" then
        return string.format("cd '%s' && cargo run", expand("%:p:h"))
    end

    error("Unknown file type: " .. filetype)
end

M.run = function()
    local command = get_command()

    local present, toggleterm = pcall(require, "toggleterm.terminal")
    if not present then
        error("Unable to start Toggleterm")
        return
    end

    vim.cmd("w")

    local Terminal = toggleterm.Terminal
    local terminal = Terminal:new({ cmd = command, close_on_exit = false })

    terminal:toggle()
end

return M
