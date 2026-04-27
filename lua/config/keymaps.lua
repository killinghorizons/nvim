-- Cycle through buffers with Tab and Shift-Tab
vim.keymap.set("n", "<Tab>", "<cmd>bn<cr>", { desc = "Next Buffer" })
vim.keymap.set("n", "<S-Tab>", "<cmd>bp<cr>", { desc = "Prev Buffer" })

-- Force close (ignore unsaved changes)
-- vim.keymap.set("n", "<leader>bd", "<cmd>bdelete!<cr>", { desc = "Force Delete Buffer" })
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")

-- Indent while remaining in visual mode.
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

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
vim.keymap.set("n", "ss", ":split<Return>")
vim.keymap.set("n", "sv", ":vsplit<Return>")
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- Move window
vim.keymap.set("n", "sh", "<C-w>h")
vim.keymap.set("n", "sk", "<C-w>k")
vim.keymap.set("n", "sj", "<C-w>j")
vim.keymap.set("n", "sl", "<C-w>l")

-- Resize window
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase height" })
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease height" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -4<CR>", { desc = "Narrower" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +4<CR>", { desc = "Wider" })

-- Copy all to clipboard
vim.keymap.set("n", "<leader>ya", ":%y+<CR>", { desc = "Copy whole file to clipboard" })

vim.keymap.set("x", "<leader>p", [["_dP]])

-- LOL
vim.keymap.set("n", "<Up>", "<c-w>k")
vim.keymap.set("n", "<Down>", "<c-w>j")
vim.keymap.set("n", "<Left>", "<c-w>h")
vim.keymap.set("n", "<Right>", "<c-w>l")
