local function Colors(name, bg, config)
    vim.schedule(function()
        if config then
            config()
        end
        vim.cmd.colorscheme(name)
        vim.opt.background = bg or "dark"
    end)
end

Colors("seoulbones")

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
        "andreypopp/vim-colors-plain",
    },
    {
        "sainnhe/everforest",
    },
    {
        "phha/zenburn.nvim",
    },
    {
        "aktersnurra/no-clown-fiesta.nvim",
    },
    {
        "datsfilipe/vesper.nvim",
    },
    {
        "zenbones-theme/zenbones.nvim",
        -- Optionally install Lush. Allows for more configuration or extending the colorscheme
        -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
        -- In Vim, compat mode is turned on as Lush only works in Neovim.
        dependencies = "rktjmp/lush.nvim",
    },
    {
        "ramojus/mellifluous.nvim",
    },
    {
        "shaunsingh/seoul256.nvim",
    },
    {
        "sainnhe/gruvbox-material",
    },
    {
        "andreasvc/vim-256noir",
    },
    {
        "ntk148v/komau.vim",
    },
    {
        "jesseleite/noirbuddy.nvim",
        dependencies = {
            { "tjdevries/colorbuddy.nvim" },
        },
    },
}
