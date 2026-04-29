-- lua/plugins/rose-pine.lua
return {
    {

        "rose-pine/neovim",
        name = "rose-pine",
        -- config = function()
        -- vim.cmd "colorscheme rose-pine"
        -- end,
    },
    {
        "vague-theme/vague.nvim",
        config = function()
            vim.cmd "colorscheme vague"
        end,
    },
}
