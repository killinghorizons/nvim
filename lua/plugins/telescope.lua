return {
    {
        {
            "nvim-telescope/telescope-ui-select.nvim",
        },
    },
    {
        "nvim-telescope/telescope.nvim",

        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            defaults = {
                layout_strategy = "horizontal",
                layout_config = { prompt_position = "top" },
            },
        },

        config = function()
            require("telescope").setup {
                defaults = {
                    file_ignore_patterns = { "%.exe", "%.pyc", "%.o", "node_modules/", ".git/" },
                    vimgrep_arguments = {
                        "rg",
                        "--color=never",
                        "--no-heading",
                        "--with-filename",
                        "--line-number",
                        "--column",
                        "--smart-case",
                        "--trim",
                        "--glob=!{.git/*,node_modules/*,target/*,build/*,*.exe,*.pyc,*.o}",
                    },
                },
                pickers = {
                    find_files = {
                        find_command = { "rg", "--files", "--glob", "!{.git/*,node_modules/*,*.exe}" },
                    },
                },
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {},
                    },
                },
            }

            local builtin = require "telescope.builtin"
            vim.keymap.set("n", "<C-p>", builtin.find_files, {})
            vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
            vim.keymap.set("n", "<Space>fh", builtin.help_tags, {})
            vim.keymap.set("n", "<leader>vh", builtin.help_tags, {})
            require("telescope").load_extension "ui-select"
        end,
    },
}
