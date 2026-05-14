-- Highlight, edit, and navigate code.
return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
        config = function(_, opts)
            require("nvim-treesitter").setup(opts)
            -- Make sure that the following are installed:
            require("nvim-treesitter").install({
                "c",
                "cpp",
                "python",
                "rust",
                "gitcommit",
                "html",
                "css",
                "scss",
                "javascript",
                "json",
                "lua",
                "markdown",
                "markdown_inline",
                "rasi",
                "tsx",
                "vim",
                "vimdoc",
                "toml",
                "yaml",
            })
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        branch = "main",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            -- Textobject selection
            local select = require("nvim-treesitter-textobjects.select")
            vim.keymap.set({ "x", "o" }, "af", function()
                select.select_textobject("@function.outer", "textobjects")
            end)
            vim.keymap.set({ "x", "o" }, "if", function()
                select.select_textobject("@function.inner", "textobjects")
            end)
            vim.keymap.set({ "x", "o" }, "ac", function()
                select.select_textobject("@class.outer", "textobjects")
            end)
            vim.keymap.set({ "x", "o" }, "ic", function()
                select.select_textobject("@class.inner", "textobjects")
            end)

            -- Textobject movement
            local move = require("nvim-treesitter-textobjects.move")
            local jumps = {
                ["]m"] = { query = "@function.outer", forward = true, start = true },
                ["]M"] = { query = "@function.outer", forward = true, start = false },
                ["]]"] = { query = "@class.outer", forward = true, start = true },
                ["]["] = { query = "@class.outer", forward = true, start = false },
                ["[m"] = { query = "@function.outer", forward = false, start = true },
                ["[M"] = { query = "@function.outer", forward = false, start = false },
                ["[["] = { query = "@class.outer", forward = false, start = true },
                ["[]"] = { query = "@class.outer", forward = false, start = false },
            }
            for key, opts in pairs(jumps) do
                local fn = opts.forward and (opts.start and move.goto_next_start or move.goto_next_end)
                    or (opts.start and move.goto_previous_start or move.goto_previous_end)
                vim.keymap.set({ "n", "x", "o" }, key, function()
                    fn(opts.query, "textobjects")
                end)
            end
        end,
    },
}
