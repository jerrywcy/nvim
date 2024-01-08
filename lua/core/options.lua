local opt = vim.opt
local g = vim.g

if g.neovide then
    vim.o.guifont = "FiraCode Nerd Font"
    g.neovide_cursor_vfx_mode = "railgun"
end

if vim.g.neovide then
    vim.keymap.set('n', '<C-s>', ':w<CR>')      -- Save
    vim.keymap.set('v', '<C-c>', '"+y')         -- Copy
    vim.keymap.set('n', '<C-v>', '"+P')         -- Paste normal mode
    vim.keymap.set('v', '<C-v>', '"+P')         -- Paste visual mode
    vim.keymap.set('c', '<C-v>', '<C-R>+')      -- Paste command mode
    vim.keymap.set('i', '<C-v>', '<ESC>l"+Pli') -- Paste insert mode
end

-- Allow clipboard copy paste in neovim
vim.api.nvim_set_keymap('', '<C-v>', '+p<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('!', '<C-v>', '<C-R>+', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<C-v>', '<C-R>+', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-v>', '<C-R>+', { noremap = true, silent = true })

opt.laststatus = 3
opt.showmode = false

opt.title = true
opt.clipboard = "unnamedplus"
opt.cursorline = true

-- Indenting
opt.expandtab = true
opt.shiftwidth = 4
opt.smartindent = true
opt.tabstop = 4
opt.softtabstop = 4

opt.fillchars = { eob = " " }
opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"

-- Numbers
opt.number = true
opt.numberwidth = 2
opt.ruler = false
opt.relativenumber = true

-- disable nvim intro
-- opt shortmess:append "sI"

opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.timeoutlen = 400
opt.undofile = true

-- interval for writing swap file to disk, also used by gitsigns
opt.updatetime = 250

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append("<>[]hl")

g.mapleader = " "

opt.fdm = "indent"
