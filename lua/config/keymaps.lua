-- Cycle through buffers
vim.keymap.set("n", "<Tab>", "<cmd>bn<cr>", { silent = true, desc = "Next Buffer" })
vim.keymap.set("n", "<S-Tab>", "<cmd>bp<cr>", { silent = true, desc = "Prev Buffer" })

-- Clear search highlight
vim.keymap.set("n", "<leader>h", "<cmd>nohlsearch<CR>", { silent = true, desc = "Clear search highlight" })

-- Indent while remaining in visual mode
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Make U opposite to u
vim.keymap.set("n", "U", "<C-r>", { desc = "Redo" })

-- Keep cursor centered while scrolling and searching
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Next result" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous result" })

-- Select all
vim.keymap.set("n", "<C-a>", "gg<S-v>G", { desc = "Select all" })

-- Window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { silent = true, desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { silent = true, desc = "Move to lower window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { silent = true, desc = "Move to upper window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { silent = true, desc = "Move to right window" })

-- Arrow keys for window navigation (normal mode)
vim.keymap.set("n", "<Left>", "<C-w>h", { silent = true, desc = "Move to left window" })
vim.keymap.set("n", "<Down>", "<C-w>j", { silent = true, desc = "Move to lower window" })
vim.keymap.set("n", "<Up>", "<C-w>k", { silent = true, desc = "Move to upper window" })
vim.keymap.set("n", "<Right>", "<C-w>l", { silent = true, desc = "Move to right window" })

-- Split window
vim.keymap.set("n", "<leader>sh", "<cmd>split<CR>", { silent = true, desc = "Split horizontal" })
vim.keymap.set("n", "<leader>sv", "<cmd>vsplit<CR>", { silent = true, desc = "Split vertical" })
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { silent = true, desc = "Close current split" })

-- Resize window
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<CR>", { silent = true, desc = "Increase height" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<CR>", { silent = true, desc = "Decrease height" })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -4<CR>", { silent = true, desc = "Decrease width" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +4<CR>", { silent = true, desc = "Increase width" })

-- Clipboard
vim.keymap.set("n", "<leader>ya", ":%y+<CR>", { silent = true, desc = "Copy whole file to clipboard" })
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste without yanking" })

vim.keymap.set("n", "<leader>v", function()
        if vim.o.background == "light" then
                vim.o.background = "dark"
        else
                vim.o.background = "light"
        end
end, { noremap = true, silent = true })
