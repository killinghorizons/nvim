-- function ColorMyPencils(color)
-- color = color or "solarized-osaka"
-- vim.cmd.colorscheme(color)
-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
-- vim.api.nvim_set_hl(0, 'TelescopeNormal', { bg = 'none' })
-- vim.api.nvim_set_hl(0, 'TelescopeBorder', { bg = 'none' })
-- vim.api.nvim_set_hl(0, 'TelescopePromptTitle', { bg = 'none' })
-- vim.api.nvim_set_hl(0, 'TelescopePromptBorder', { bg = 'none' })
-- vim.api.nvim_set_hl(0, 'TelescopePreviewTitle', { bg = 'none' })
-- vim.api.nvim_set_hl(0, 'TelescopeResultsTitle', { bg = 'none' })
-- vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "NONE" })
-- vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "NONE" })
-- end

return {
    {
        "sainnhe/everforest",
        lazy = false,
        priority = 1000,
        transparent_mode = false,
        config = function()
            vim.g.everforest_enable_italic = true
            vim.g.everforest_background = "hard"
            vim.g.everforest_transparent_background = false
            vim.o.background = "dark"
            vim.cmd.colorscheme "everforest"
        end,
    },
    -- {
    --     "craftzdog/solarized-osaka.nvim",
    --     lazy = true,
    --     priority = 1000,
    --     styles = {
    --         floats = "transparent", -- style for floating windows
    --         sidebars = "transparent", -- style for sidebars, see below
    --     },
    --     opts = function()
    --         return {
    --             transparent = true,
    --         }
    --     end,
    -- },
    -- {
    --     "rose-pine/neovim",
    --     name = "rose-pine",
    --     config = function()
    --         require('rose-pine').setup({
    --             enable = {
    --                 terminal = true,
    --                 legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
    --                 migrations = true,        -- Handle deprecated options automatically
    --             },
    --             dim_inactive_windows = false,
    --             extend_background_behind_borders = true,
    --             disable_background = true,
    --             styles = {
    --                 bold = true,
    --                 italic = false,
    --                 transparency = true,
    --             },
    --         })
    --         ColorMyPencils();
    --     end
    -- },
    -- {
    --     "navarasu/onedark.nvim",
    --     priority = 1000,
    --     -- Main options --
    --     style = 'dark',
    --     transparent = false,
    --     term_colors = true,
    --     ending_tildes = false,
    --     cmp_itemkind_reverse = false,
    --     code_style = {
    --         comments = 'italic',
    --         keywords = 'italic',
    --         functions = 'none',
    --         strings = 'none',
    --         variables = 'none'
    --     },
    --     -- Lualine options --
    --     lualine = {
    --         transparent = false,
    --     },
    --
    --     -- Custom Highlights --
    --     colors = {},
    --     highlights = {},
    --
    --     -- Plugins Config --
    --     diagnostics = {
    --         darker = true,
    --         undercurl = true,
    --         background = true,
    --     },
    --     config = function()
    --         require('onedark').setup {
    --             style = 'darker'
    --         }
    --         ColorMyPencils()
    --     end
    -- }
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
    --             inverse = true,    -- invert background for search, diffs, statuslines and errors
    --             contrast = "hard", -- can be "hard", "soft" or empty string
    --             palette_overrides = {},
    --             overrides = {},
    --             dim_inactive = false,
    --             transparent_mode = false,
    --         }
    --         vim.o.background = "dark" -- or "light" for light mode
    --         vim.cmd [[colorscheme gruvbox]]
    --     end,
    -- },
}
