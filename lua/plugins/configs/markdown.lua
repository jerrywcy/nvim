return {
    {
        "ixru/nvim-markdown",
        setup = function()
            vim.g.vim_markdown_conceal = 2
            vim.g.vim_markdown_toc_autofix = 1
            vim.g.vim_markdown_emphasis_multiline = 0
            vim.g.vim_markdown_math = 1
            vim.g.vim_markdown_frontmatter = 1
            -- vim.g.vim_markdown_toml_frontmatter=1
            -- vim.g.vim_markdown_json_frontmatter=1
        end,
    },
    {
        'jakewvincent/mkdnflow.nvim',
        -- rocks = 'luautf8', -- Ensures optional luautf8 dependency is installed
        config = function()
            require('mkdnflow').setup({
                modules = {
                    bib = true,
                    buffers = true,
                    conceal = true,
                    cursor = true,
                    folds = true,
                    links = true,
                    lists = true,
                    maps = true,
                    paths = true,
                    tables = true,
                    yaml = false
                },
                filetypes = { md = true, rmd = true, markdown = true },
                create_dirs = true,
                perspective = {
                    priority = 'first',
                    fallback = 'current',
                    root_tell = false,
                    nvim_wd_heel = false,
                    update = false
                },
                wrap = false,
                bib = {
                    default_path = nil,
                    find_in_root = true
                },
                silent = false,
                links = {
                    style = 'markdown',
                    name_is_source = false,
                    conceal = false,
                    context = 0,
                    implicit_extension = nil,
                    transform_implicit = false,
                    transform_explicit = function(text)
                        text = text:gsub(" ", "-")
                        text = text:lower()
                        text = os.date('%Y-%m-%d_') .. text
                        return (text)
                    end
                },
                new_file_template = {
                    use_template = false,
                    placeholders = {
                        before = {
                            title = "link_title",
                            date = "os_date"
                        },
                        after = {}
                    },
                    template = "# {{ title }}"
                },
                to_do = {
                    symbols = { ' ', '-', 'X' },
                    update_parents = true,
                    not_started = ' ',
                    in_progress = '-',
                    complete = 'X'
                },
                tables = {
                    trim_whitespace = true,
                    format_on_move = true,
                    auto_extend_rows = false,
                    auto_extend_cols = false
                },
                yaml = {
                    bib = { override = false }
                },
                mappings = {
                    MkdnEnter = { { 'n', 'v' }, '<CR>' },
                    MkdnTab = false,
                    MkdnSTab = false,
                    MkdnNextLink = { 'n', '<Tab>' },
                    MkdnPrevLink = { 'n', '<S-Tab>' },
                    MkdnNextHeading = { 'n', ']]' },
                    MkdnPrevHeading = { 'n', '[[' },
                    MkdnGoBack = { 'n', '<BS>' },
                    MkdnGoForward = { 'n', '<Del>' },
                    MkdnCreateLink = false,                                      -- see MkdnEnter
                    MkdnCreateLinkFromClipboard = { { 'n', 'v' }, '<leader>p' }, -- see MkdnEnter
                    MkdnFollowLink = false,                                      -- see MkdnEnter
                    MkdnDestroyLink = { 'n', '<M-CR>' },
                    MkdnTagSpan = { 'v', '<M-CR>' },
                    MkdnMoveSource = { 'n', '<F2>' },
                    MkdnYankAnchorLink = { 'n', 'yaa' },
                    MkdnYankFileAnchorLink = { 'n', 'yfa' },
                    MkdnIncreaseHeading = { 'n', '+' },
                    MkdnDecreaseHeading = { 'n', '-' },
                    MkdnToggleToDo = { { 'n', 'v' }, '<C-Space>' },
                    MkdnNewListItem = false,
                    MkdnNewListItemBelowInsert = { 'n', 'o' },
                    MkdnNewListItemAboveInsert = { 'n', 'O' },
                    MkdnExtendList = false,
                    MkdnUpdateNumbering = { 'n', '<leader>nn' },
                    MkdnTableNextCell = { 'i', '<Tab>' },
                    MkdnTablePrevCell = { 'i', '<S-Tab>' },
                    MkdnTableNextRow = false,
                    MkdnTablePrevRow = { 'i', '<M-CR>' },
                    MkdnTableNewRowBelow = { 'n', '<leader>ir' },
                    MkdnTableNewRowAbove = { 'n', '<leader>iR' },
                    MkdnTableNewColAfter = { 'n', '<leader>ic' },
                    MkdnTableNewColBefore = { 'n', '<leader>iC' },
                    MkdnFoldSection = { 'n', '<leader>f' },
                    MkdnUnfoldSection = { 'n', '<leader>F' }
                }
            })
        end
    },
    -- {
    --     "toppair/peek.nvim",
    --     build = "deno task --quiet build:fast",
    --     config = function()
    --         require('peek').setup({
    --             auto_load = true,          -- whether to automatically load preview when
    --             -- entering another markdown buffer
    --             close_on_bdelete = true,   -- close preview window on buffer delete
    --             syntax = true,             -- enable syntax highlighting, affects performance
    --             theme = 'dark',            -- 'dark' or 'light'
    --             update_on_change = true,
    --             app = 'webview',           -- 'webview', 'browser', string or a table of strings
    --             -- explained below
    --             filetype = { 'markdown' }, -- list of filetypes to recognize as markdown
    --             -- relevant if update_on_change is true
    --             throttle_at = 200000,      -- start throttling when file exceeds this
    --             -- amount of bytes in size
    --             throttle_time = 'auto',    -- minimum amount of time in milliseconds
    --             -- that has to pass before starting new render
    --         })
    --     end
    -- },
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
        config = function()
            vim.cmd([[
            " set to 1, nvim will open the preview window after entering the Markdown buffer
            " default: 0
            let g:mkdp_auto_start = 0

            " set to 1, the nvim will auto close current preview window when changing
            " from Markdown buffer to another buffer
            " default: 1
            let g:mkdp_auto_close = 1

            " set to 1, Vim will refresh Markdown when saving the buffer or
            " when leaving insert mode. Default 0 is auto-refresh Markdown as you edit or
            " move the cursor
            " default: 0
            let g:mkdp_refresh_slow = 0

            " set to 1, the MarkdownPreview command can be used for all files,
            " by default it can be use in Markdown files only
            " default: 0
            let g:mkdp_command_for_global = 0

            " set to 1, the preview server is available to others in your network.
            " By default, the server listens on localhost (127.0.0.1)
            " default: 0
            let g:mkdp_open_to_the_world = 0

            " use custom IP to open preview page.
            " Useful when you work in remote Vim and preview on local browser.
            " For more details see: https://github.com/iamcco/markdown-preview.nvim/pull/9
            " default empty
            let g:mkdp_open_ip = ''

            " specify browser to open preview page
            " for path with space
            " valid: `/path/with\ space/xxx`
            " invalid: `/path/with\\ space/xxx`
            " default: ''
            let g:mkdp_browser = 'chromium'

            " set to 1, echo preview page URL in command line when opening preview page
            " default is 0
            let g:mkdp_echo_preview_url = 0

            " a custom Vim function name to open preview page
            " this function will receive URL as param
            " default is empty
            let g:mkdp_browserfunc = ''

            " options for Markdown rendering
            " mkit: markdown-it options for rendering
            " katex: KaTeX options for math
            " uml: markdown-it-plantuml options
            " maid: mermaid options
            " disable_sync_scroll: whether to disable sync scroll, default 0
            " sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
            "   middle: means the cursor position is always at the middle of the preview page
            "   top: means the Vim top viewport always shows up at the top of the preview page
            "   relative: means the cursor position is always at relative positon of the preview page
            " hide_yaml_meta: whether to hide YAML metadata, default is 1
            " sequence_diagrams: js-sequence-diagrams options
            " content_editable: if enable content editable for preview page, default: v:false
            " disable_filename: if disable filename header for preview page, default: 0
            let g:mkdp_preview_options = {
                \ 'mkit': {},
                \ 'katex': {},
                \ 'uml': {},
                \ 'maid': {},
                \ 'disable_sync_scroll': 0,
                \ 'sync_scroll_type': 'middle',
                \ 'hide_yaml_meta': 1,
                \ 'sequence_diagrams': {},
                \ 'flowchart_diagrams': {},
                \ 'content_editable': v:false,
                \ 'disable_filename': 0,
                \ 'toc': {}
                \ }

            " use a custom Markdown style. Must be an absolute path
            " like '/Users/username/markdown.css' or expand('~/markdown.css')
            let g:mkdp_markdown_css = ''

            " use a custom highlight style. Must be an absolute path
            " like '/Users/username/highlight.css' or expand('~/highlight.css')
            let g:mkdp_highlight_css = ''

            " use a custom port to start server or empty for random
            let g:mkdp_port = ''

            " preview page title
            " ${name} will be replace with the file name
            let g:mkdp_page_title = '「${name}」'

            " use a custom location for images
            " let g:mkdp_images_path = /home/user/.markdown_images

            " recognized filetypes
            " these filetypes will have MarkdownPreview... commands
            let g:mkdp_filetypes = ['markdown']

            " set default theme (dark or light)
            " By default the theme is defined according to the preferences of the system
            let g:mkdp_theme = 'dark'

            " combine preview window
            " default: 0
            " if enable it will reuse previous opened preview window when you preview markdown file.
            " ensure to set let g:mkdp_auto_close = 0 if you have enable this option
            let g:mkdp_combine_preview = 0

            " auto refetch combine preview contents when change markdown buffer
            " only when g:mkdp_combine_preview is 1
            let g:mkdp_combine_preview_auto_refresh = 1
            ]])
        end
    },
    {
        "RRethy/vim-illuminate",
        config = function()
            -- default configuration
            require('illuminate').configure({
                -- providers: provider used to get references in the buffer, ordered by priority
                providers = {
                    'lsp',
                    'treesitter',
                    'regex',
                },
                -- delay: delay in milliseconds
                delay = 100,
                -- filetype_overrides: filetype specific overrides.
                -- The keys are strings to represent the filetype while the values are tables that
                -- supports the same keys passed to .configure except for filetypes_denylist and filetypes_allowlist
                filetype_overrides = {},
                -- filetypes_denylist: filetypes to not illuminate, this overrides filetypes_allowlist
                filetypes_denylist = {
                    'dirbuf',
                    'dirvish',
                    'fugitive',
                },
                -- filetypes_allowlist: filetypes to illuminate, this is overridden by filetypes_denylist
                -- You must set filetypes_denylist = {} to override the defaults to allow filetypes_allowlist to take effect
                filetypes_allowlist = {},
                -- modes_denylist: modes to not illuminate, this overrides modes_allowlist
                -- See `:help mode()` for possible values
                modes_denylist = {},
                -- modes_allowlist: modes to illuminate, this is overridden by modes_denylist
                -- See `:help mode()` for possible values
                modes_allowlist = {},
                -- providers_regex_syntax_denylist: syntax to not illuminate, this overrides providers_regex_syntax_allowlist
                -- Only applies to the 'regex' provider
                -- Use :echom synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
                providers_regex_syntax_denylist = {},
                -- providers_regex_syntax_allowlist: syntax to illuminate, this is overridden by providers_regex_syntax_denylist
                -- Only applies to the 'regex' provider
                -- Use :echom synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
                providers_regex_syntax_allowlist = {},
                -- under_cursor: whether or not to illuminate under the cursor
                under_cursor = true,
                -- large_file_cutoff: number of lines at which to use large_file_config
                -- The `under_cursor` option is disabled when this cutoff is hit
                large_file_cutoff = nil,
                -- large_file_config: config to use for large files (based on large_file_cutoff).
                -- Supports the same keys passed to .configure
                -- If nil, vim-illuminate will be disabled for large files.
                large_file_overrides = nil,
                -- min_count_to_highlight: minimum number of matches required to perform highlighting
                min_count_to_highlight = 1,
                -- should_enable: a callback that overrides all other settings to
                -- enable/disable illumination. This will be called a lot so don't do
                -- anything expensive in it.
                should_enable = function(bufnr) return true end,
                -- case_insensitive_regex: sets regex case sensitivity
                case_insensitive_regex = false,
            })
        end
    }
}
