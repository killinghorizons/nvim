return {

    {
        "mason-org/mason.nvim",
        opts = {
            -- Formatters/linters go here, not in mason-lspconfig
            ensure_installed = {
                "stylua",
                "ruff",
                "rustfmt",
                "prettierd",
                "clang-format",
            },
        },
    },

    -- Bridge between mason and lspconfig
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = {
            "mason-org/mason.nvim",
            "neovim/nvim-lspconfig",
        },
        opts = {
            ensure_installed = {
                "basedpyright",
                "ruff",
                "lua_ls",
                "rust_analyzer",
                "clangd",
                "tsgo",
                "cssls",
                "bashls",
                "taplo",
                "yamlls",
            },
        },
    },
}
