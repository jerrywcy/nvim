local present, formatter = pcall(require,"formatter")

print("Formatter loaded")

vim.api.nvim_create_augroup("FormatAutoGroup",{ clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*",
    callback = function()
        vim.cmd "FormatWrite"
        print("Formatted")
    end,
    group = "FormatAutoGroup",
})

local options = {
    logging = true,
    log_level = vim.log.levels.WARN,
    filetype = {
        lua = require("formatter.filetypes.lua").luaformatter(),

        ["*"] = {
            require "formatter.filetypes.any"
        },
    },
}
