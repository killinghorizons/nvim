return {
    {
        "vague-theme/vague.nvim",
    },
    {
        "ellisonleao/gruvbox.nvim",
    },
    {
        "oskarnurm/koda.nvim",
        config = function()
            vim.cmd([[colorscheme koda]])
        end,
    },
    {
        "sainnhe/everforest",
    },
    {
        "phha/zenburn.nvim",
    },
    {
        "datsfilipe/vesper.nvim",
    },
    {
        "shaunsingh/seoul256.nvim",
    },
    {
        "sainnhe/gruvbox-material",
    },
    {
        "jesseleite/noirbuddy.nvim",
        dependencies = {
            { "tjdevries/colorbuddy.nvim" },
        },
    },
    {
        "nickkadutskyi/jb.nvim",
        -- lazy = false,
        -- priority = 1000,
        -- opts = {},
        -- config = function()
        --     -- require("jb").setup({transparent = true})
        --     vim.cmd("colorscheme jb")
        -- end,
    },
    {
        "rebelot/kanagawa.nvim",
        -- config = function()
        --     require("kanagawa").setup({
        --         compile = false,
        --         undercurl = true,
        --         commentStyle = { italic = true },
        --         keywordStyle = { italic = true },
        --         statementStyle = { bold = true },
        --         theme = "wave",
        --     })
        --     vim.opt.background = "dark"
        --     vim.cmd([[colorscheme kanagawa]])
        -- end,
    },
    -- {
    --     "scottmckendry/cyberdream.nvim",
    --     lazy = false,
    --     priority = 1000,
    --     config = function()
    --         require("cyberdream").setup({
    --             -- Set light or dark variant
    --             variant = "default", -- use "light" for the light variant. Also accepts "auto" to set dark or light colors based on the current value of `vim.o.background`
    --
    --             -- Enable transparent background
    --             transparent = true,
    --
    --             -- Reduce the overall saturation of colours for a more muted look
    --             saturation = 1, -- accepts a value between 0 and 1. 0 will be fully desaturated (greyscale) and 1 will be the full color (default)
    --
    --             -- Enable italics comments
    --             italic_comments = true,
    --
    --             -- Replace all fillchars with ' ' for the ultimate clean look
    --             hide_fillchars = false,
    --
    --             -- Apply a modern borderless look to pickers like Telescope, Snacks Picker & Fzf-Lua
    --             borderless_pickers = false,
    --
    --             -- Set terminal colors used in `:terminal`
    --             terminal_colors = true,
    --
    --             -- Improve start up time by caching highlights. Generate cache with :CyberdreamBuildCache and clear with :CyberdreamClearCache
    --             cache = false,
    --
    --             -- Disable or enable colorscheme extensions
    --             extensions = {
    --                 telescope = true,
    --                 notify = true,
    --                 mini = true,
    --             },
    --         })
    --         vim.cmd([[colorscheme cyberdream]])
    --     end,
    -- },
    {
        "craftzdog/solarized-osaka.nvim",
        -- lazy = true,
        -- priority = 1000,
        -- opts = function()
        --     return {
        --         transparent = true,
        --     }
        -- end,
        -- config = function(_, opts)
        --     require("solarized-osaka").setup(opts)
        --     vim.cmd([[colorscheme solarized-osaka]])
        -- end,
    },
}
