function ColorMyPencils(color)
    color = color or "rose-pine-moon"
    vim.o.background = "dark"
    vim.cmd.colorscheme(color)
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
    -- {
    --     "oskarnurm/koda.nvim",
    --     lazy = false, -- make sure we load this during startup if it is your main colorscheme
    --     priority = 1000, -- make sure to load this before all the other start plugins
    --     -- Set the variants to use when auto-switching based on vim.o.background
    --     styles = {
    --         functions = { bold = true },
    --         keywords = { italic = true },
    --         comments = { italic = true },
    --         strings = {},
    --         constants = {}, -- includes numbers, booleans
    --     },
    --     config = function()
    --         require("koda").setup { transparent = false }
    --         -- Valid values: 'dark', 'light', 'moss', 'glade'
    --         vim.cmd "colorscheme koda-dark"
    --         vim.o.background = "dark"
    --     end,
    -- },
    {
        "phha/zenburn.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd "colorscheme zenburn"
        end,
    },
    -- {
    --     "sainnhe/everforest",
    --     lazy = false,
    --     priority = 1000,
    --     transparent_mode = false,
    --     config = function()
    --         vim.g.everforest_enable_italic = true
    --         vim.g.everforest_background = "hard"
    --         vim.g.everforest_transparent_background = true
    --         vim.o.background = "dark"
    --         vim.cmd.colorscheme "everforest"
    --     end,
    -- },
    -- {
    --     "rose-pine/neovim",
    --     name = "rose-pine",
    --     config = function()
    --         require("rose-pine").setup {
    --             disable_background = true,
    --             styles = {
    --                 italic = true,
    --             },
    --         }
    --         ColorMyPencils()
    --     end,
    -- },
    -- {
    --     "ellisonleao/gruvbox.nvim",
    --     name = "gruvbox",
    --     priority = 1000,
    --     config = function()
    --         require("gruvbox").setup {
    --             terminal_colors = true, -- add neovim terminal colors
    --             undercurl = true,
    --             underline = false,
    --             bold = true,
    --             italic = {
    --                 keywords = true,
    --                 strings = false,
    --                 emphasis = false,
    --                 comments = true,
    --                 operators = false,
    --                 folds = false,
    --             },
    --             strikethrough = true,
    --             invert_selection = false,
    --             invert_signs = false,
    --             invert_tabline = false,
    --             invert_intend_guides = false,
    --             inverse = true, -- invert background for search, diffs, statuslines and errors
    --             contrast = "hard", -- can be "hard", "soft" or empty string
    --             palette_overrides = {},
    --             overrides = {},
    --             dim_inactive = false,
    --             transparent_mode = true,
    --         }
    --         vim.o.background = "dark" -- or "light" for light mode
    --         vim.cmd [[colorscheme gruvbox]]
    --     end,
    -- },
    -- {
    --     "metalelf0/black-metal-theme-neovim",
    --     lazy = false,
    --     priority = 1000,
    --     config = function()
    --         require("black-metal").setup {
    --             -- optional configuration
    --             --
    --             -- Can be one of: bathory | burzum | dark-funeral | darkthrone | emperor | gorgoroth | immortal | impaled-nazarene | khold | marduk | mayhem | nile | taake | thyrfing | venom | windir
    --             theme = "mayhem",
    --         }
    --         require("black-metal").load()
    --     end,
    -- },
}
