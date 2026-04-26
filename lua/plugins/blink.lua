return {
    "saghen/blink.cmp",
    dependencies = {
        "rafamadriz/friendly-snippets",
        "nvim-tree/nvim-web-devicons", -- Optional for file icons
        "onsails/lspkind.nvim", --optional icons
    },
    -- use a release tag to download pre-built binaries
    version = "1.*",
    opts = {
        signature = { enabled = true },
        completion = {
            list = {
                selection = { preselect = false, auto_insert = true },
            },
        },
        documentation = { auto_show = true },
        menu = {
            scrollbar = false,
            draw = {
                gap = 2,
                columns = {
                    { "kind_icon", "kind", gap = 1 },
                    { "label", "label_description", gap = 1 },
                },
            },
        },
        cmdline = { enabled = false },
        keymap = {
            preset = "super-tab",
            ["<C-p>"] = { "select_prev", "fallback_to_mappings" },
            ["<C-n>"] = { "select_next", "fallback_to_mappings" },
            ["<Tab>"] = { "select_next", "fallback_to_mappings" },
            ["<S-Tab>"] = { "select_prev", "fallback_to_mappings" },
            ["<Return>"] = { "select_and_accept", "fallback_to_mappings" },
        },
        appearance = {
            nerd_font_variant = "mono",
            kind_icons = require("icons").symbol_kinds,
        },
        sources = {
            default = { "lsp", "path", "snippets", "buffer" },
        },
        fuzzy = { implementation = "prefer_rust_with_warning" },
    },
    opts_extend = { "sources.default" },
}
