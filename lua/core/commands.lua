_run = require("core.run").run
_check = require("core.check").check

local commands = {
    ["Run"] = { "lua _run()", "Run Current Code" },
    ["EditSnippets"] = { "CocCommand snippets.editSnippets", "Edit Coc snippets" },
    ["Reload"] = { "source ~/.config/nvim/init.lua" },
    ["Check"] = { "lua _check()", "Check Current Code" }
}

require("core.utils").load_user_commands(commands)

vim.cmd("autocmd FileType cpp let b:coc_pairs_disabled = ['<']")
