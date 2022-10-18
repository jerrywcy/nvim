if not require("core.utils").plugin_loaded("nvim-treesitter") then
    return
end

local options = {
    ensure_installed = {
        "lua",
        "css",
        "scss",
        "html",
        "javascript",
        "typescript",
        "java",
        "cpp",
        "c",
        "json",
        "jsdoc",
        "markdown",
        "dockerfile",
        "latex",
        "svelte",
        "vue",
        "yaml",
    },

    highlight = {
        enable = true,
        use_languagetree = true,
    },

    indent = {
        enable = true,
    },
}

treesitter.setup(options)
