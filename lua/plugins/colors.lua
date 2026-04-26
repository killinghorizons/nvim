function ColorMyPencils(color)
    color = color or "rose-pine-moon"
    vim.cmd.colorscheme(color)
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
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
    {
        "ellisonleao/gruvbox.nvim",
        name = "gruvbox",
        priority = 1000,
        config = function()
            require("gruvbox").setup {
                terminal_colors = true, -- add neovim terminal colors
                undercurl = true,
                underline = false,
                bold = true,
                italic = {
                    keywords = true,
                    strings = false,
                    emphasis = false,
                    comments = true,
                    operators = false,
                    folds = false,
                },
                strikethrough = true,
                invert_selection = false,
                invert_signs = false,
                invert_tabline = false,
                invert_intend_guides = false,
                inverse = true, -- invert background for search, diffs, statuslines and errors
                contrast = "hard", -- can be "hard", "soft" or empty string
                palette_overrides = {},
                overrides = {},
                dim_inactive = false,
                transparent_mode = true,
            }
            vim.o.background = "dark" -- or "light" for light mode
            vim.cmd [[colorscheme gruvbox]]
        end,
    },
}
