vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("kh/yank_highlight", { clear = true }),
    desc = "Highlight on yank",
    callback = function()
        vim.hl.on_yank { higroup = "Visual" }
    end,
})
