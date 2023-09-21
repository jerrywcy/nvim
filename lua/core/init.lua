require("core.options")
require("core.mappings")

if next(vim.fn.argv()) == nil then
    vim.api.nvim_create_autocmd("VimEnter", { command = "NvimTreeToggle", })
    vim.api.nvim_create_autocmd("VimEnter", { command = "Telescope project", })
end

local uv = vim.loop

local function file_exists(path)
    local stat = uv.fs_stat(path)
    return stat and stat.type == 'file'
end

-- if not file_exists('platform-specific.lua') then
--    local file = io.open("platform-specific.lua")
--    file:write("-- Put platform specific things here")
--    file:close()
-- end
