return {
    {
        "vague-theme/vague.nvim",
    },
    {
        "ellisonleao/gruvbox.nvim",
    },
    {
        "oskarnurm/koda.nvim",
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
        "rebelot/kanagawa.nvim",
        config = function()
            vim.cmd([[colorscheme kanagawa]])
        end,
    },
}
