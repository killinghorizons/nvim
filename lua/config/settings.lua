vim.o.termguicolors = true
-- Make sure netrw is disabled
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

-- Use an indentation of 4 spaces.
vim.o.sw = 4
vim.o.ts = 4
vim.o.softtabstop = 4
vim.o.et = true
vim.o.si = true

-- Highlight current line
vim.o.cursorline = false

-- Show line numbers.
vim.wo.number = true
vim.wo.relativenumber = true

-- Enable mouse mode.
vim.o.mouse = "a"

-- Wrap long lines at words.
vim.o.linebreak = false

-- Use rounded borders for floating windows.
vim.o.winborder = "rounded"

-- Sync clipboard between the OS and Neovim.
vim.o.clipboard = "unnamedplus"

-- Save undo history.
vim.o.swapfile = false
vim.o.backup = false
vim.o.undofile = true

-- Enable project-local configuration.
vim.o.exrc = true

-- Case insensitive searching UNLESS /C or the search has capitals.
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default.
vim.wo.signcolumn = "yes"

-- Update times and timeouts.
vim.o.timeout = true
vim.opt.timeoutlen = 1000
vim.o.updatetime = 250
-- vim.o.timeoutlen = 300
vim.o.ttimeoutlen = 10

-- Status line.
vim.o.laststatus = 3
vim.o.cmdheight = 0
-- vim.o.cmdheight = 1

-- Folding.
vim.o.foldcolumn = "1"
vim.o.foldlevelstart = 99
vim.wo.foldtext = ""

vim.o.laststatus = 300
