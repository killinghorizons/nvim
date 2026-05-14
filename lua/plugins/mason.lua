return {

    {
        "mason-org/mason.nvim",
        opts = {
            -- Formatters/linters go here, not in mason-lspconfig
            ensure_installed = { "stylua", "ruff", "rustfmt", "prettierd", "clang-format", "shfmt" },
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
                "clangd",
                "rust_analyzer",
                "vtsls",
                "eslint",
                "html",
                "cssls",
                "tailwindcss",
            },
        },
    },
}
