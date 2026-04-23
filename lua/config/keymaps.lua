local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

-- Cycle through buffers with Tab and Shift-Tab
vim.keymap.set("n", "<Tab>", "<cmd>bn<cr>", { desc = "Next Buffer" })
vim.keymap.set("n", "<S-Tab>", "<cmd>bp<cr>", { desc = "Prev Buffer" })

-- Force close (ignore unsaved changes)
-- vim.keymap.set("n", "<leader>bd", "<cmd>bdelete!<cr>", { desc = "Force Delete Buffer" })

vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")

-- Open the package manager.
vim.keymap.set("n", "<leader>L", "<cmd>Lazy<cr>", { desc = "Lazy" })
vim.keymap.set("n", "<leader>M", "<cmd>Mason<cr>", { desc = "Mason" })

-- Indent while remaining in visual mode.
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Tab navigation.
vim.keymap.set("n", "<leader>tc", "<cmd>tabclose<cr>", { desc = "Close tab page" })
vim.keymap.set("n", "<leader>tn", "<cmd>tab split<cr>", { desc = "New tab page" })
vim.keymap.set("n", "<leader>to", "<cmd>tabonly<cr>", { desc = "Close other tab pages" })

-- Make U opposite to u.
vim.keymap.set("n", "U", "<C-r>", { desc = "Redo" })

-- Keeping the cursor centered.
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll downwards" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll upwards" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Next result" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous result" })

-- Select all
vim.keymap.set("n", "<C-a>", "gg<S-v>G")

-- Window naviguation
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

-- Split window
vim.keymap.set("n", "ss", ":split<Return>", opts)
vim.keymap.set("n", "sv", ":vsplit<Return>", opts)

-- Move window
vim.keymap.set("n", "sh", "<C-w>h")
vim.keymap.set("n", "sk", "<C-w>k")
vim.keymap.set("n", "sj", "<C-w>j")
vim.keymap.set("n", "sl", "<C-w>l")

-- Copy all to clipboard
vim.keymap.set("n", "<leader>ya", ":%y+<CR>", { desc = "Copy whole file to clipboard" })

vim.keymap.set("n", "<A-left>", "0", { desc = "Go start of line" })
vim.keymap.set("n", "<A-right>", "$", { desc = "Go end of line" })
vim.keymap.set("n", "<A-up>", "5k", { desc = "Move 5 lines up" })
vim.keymap.set("n", "<A-down>", "5j", { desc = "Move 5 lines down" })
