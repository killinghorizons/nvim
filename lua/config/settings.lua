-- Terminal colors
vim.opt.termguicolors = true

-- Disable netrw (required for nvim-tree or similar)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Indentation: 4 spaces
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Line numbers
vim.opt.number = false
vim.opt.relativenumber = false

-- Mouse support
vim.opt.mouse = "a"

-- Rounded borders for floating windows
vim.opt.winborder = "rounded"

-- Sync clipboard with OS
vim.opt.clipboard = "unnamedplus"

-- No swap/backup, but keep undo history
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

-- Allow project-local config (.nvim.lua)
vim.opt.exrc = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Sign column always visible
vim.opt.signcolumn = "yes"

-- Timings
vim.opt.timeout = true
vim.opt.timeoutlen = 500
vim.opt.ttimeoutlen = 10
vim.opt.updatetime = 300

-- Status line (0 = hidden)
vim.opt.laststatus = 3
vim.opt.cmdheight = 1

-- Cursor line
vim.opt.cursorline = false
