return {
    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = "nvim-tree/nvim-web-devicons",
        event = "VeryLazy",
        keys = {
            { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
            { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
            { "<leader>bp", "<cmd>BufferLinePick<cr>", desc = "Buffer Pick" },
            { "<leader>bc", "<cmd>BufferLinePickClose<cr>", desc = "Buffer Pick Close" },
        },
        opts = {
            options = {
                close_command = function(bufnr)
                    require("mini.bufremove").delete(bufnr, false)
                end,
                mode = "buffers", -- use "tabs" for actual vim tabs
                show_buffer_close_icons = false,
                show_close_icon = false,
                truncate_names = false,
                indicator = { style = "underline" },
                separator_style = "slope",
                offsets = {
                    {
                        filetype = "neo-tree",
                        text = "File Explorer",
                        text_align = "left",
                        separator = true,
                    },
                },
            },
        },
    },
}
