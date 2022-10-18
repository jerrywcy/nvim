local loaded, treesitter = pcall(require,"nvim-treesitter")
if not loaded then
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
