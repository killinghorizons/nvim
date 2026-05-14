return {
        {
                "catgoose/nvim-colorizer.lua",
                name = "nvim-colorizer-catgoose",
                config = function()
                        -- require("colorizer").setup()
                        vim.keymap.set(
                                "n",
                                "<leader>cr",
                                "<cmd>ColorizerToggle<CR>",
                                { silent = true, desc = "Toggle Colorizer" }
                        )
                end,
        },
}
