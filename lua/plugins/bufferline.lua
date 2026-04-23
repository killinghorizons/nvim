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
                mode = "buffers", -- use "tabs" for actual vim tabs
                separator_style = "thin", -- options: "slant" | "slope" | "thick" | "thin"
                show_buffer_close_icons = true,
                show_close_icon = true,
                always_show_bufferline = true,
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
