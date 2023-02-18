_run = require("core.run").run

local commands = {
	["Run"] = { "lua _run()", "Run Current Code" },
	["EditSnippets"] = { "CocCommand snippets.editSnippets", "Edit Coc snippets" },
}

require("core.utils").load_user_commands(commands)

vim.cmd("autocmd FileType cpp let b:coc_pairs_disabled = ['<']")
