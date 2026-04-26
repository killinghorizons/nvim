-- Highlight, edit, and navigate code.
return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        dependencies = {
            {
                "nvim-treesitter/nvim-treesitter-context",
                opts = {
                    -- Avoid the sticky context from growing a lot.
                    -- max_lines = 3,
                    -- Match the context lines to the source code.
                    -- multiline_threshold = 1,
                    -- Disable it when the window is too small.
                    -- min_window_height = 20,
                    max_lines = 3, -- How many lines the window should span. Values <= 0 mean no limit.
                    min_window_height = 0, -- Minimum editor window height to enable context.
                    line_numbers = true,
                    multiline_threshold = 1, -- Maximum number of lines to show for a single context
                    trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded.
                },
                keys = {
                    {
                        "[c",
                        function()
                            -- Jump to previous change when in diffview.
                            if vim.wo.diff then
                                return "[c"
                            else
                                vim.schedule(function()
                                    require("treesitter-context").go_to_context()
                                end)
                                return "<Ignore>"
                            end
                        end,
                        desc = "Jump to upper context",
                        expr = true,
                    },
                },
            },
        },
        build = ":TSUpdate",
        config = function(_, opts)
            require("nvim-treesitter").setup(opts)

            -- Make sure that the following are installed:
            require("nvim-treesitter").install {
                "c",
                "cpp",
                "python",
                "rust",
                "bash",
                "zsh",
                "gitcommit",
                "html",
                "css",
                "scss",
                "javascript",
                "json",
                "lua",
                "markdown",
                "markdown_inline",
                "query",
                "rasi",
                "regex",
                "tsx",
                "vim",
                "vimdoc",
                "toml",
                "yaml",
            }
        end,
    },
}
