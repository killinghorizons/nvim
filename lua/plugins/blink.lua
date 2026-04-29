return {
    "saghen/blink.cmp",
    dependencies = {
        "rafamadriz/friendly-snippets",
        "nvim-tree/nvim-web-devicons",
    },
    version = "v1.*",
    opts = {
        -- Keymaps: 'fallback' is the new keyword for 'fallback_to_mappings'
        keymap = {
            preset = "super-tab",
            ["<C-p>"] = { "select_prev", "fallback" },
            ["<C-n>"] = { "select_next", "fallback" },
            -- 'select_and_accept' was renamed to 'accept' in v1.0
            ["<Enter>"] = { "accept", "fallback" },
        },

        appearance = {
            use_nvim_cmp_as_default = true,
            nerd_font_variant = "mono",
            kind_icons = {
                Function = "󰊕",
                Method = "󰊕",
                Variable = "󰆦",
                -- ... Blink has defaults for all of these,
                -- but you can override them here.
            },
        },

        signature = { enabled = true },

        completion = {
            -- Controls how the completion menu behaves
            list = {
                selection = {
                    preselect = false,
                    auto_insert = true,
                },
                max_items = 10,
            },

            -- Controls the appearance of the menu
            menu = {
                enabled = true,
                scrollbar = false,
                draw = {
                    -- This defines the layout of the completion items
                    columns = { { "kind_icon" }, { "label", "label_description", gap = 1 } },
                },
            },

            -- Documentation is now nested under completion
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 500,
                window = { border = "rounded" },
            },
        },

        -- Sources API slightly changed; 'default' is still the main array
        sources = {
            default = { "lsp", "path", "snippets", "buffer" },
        },
    },
    -- Ensures your sources are merged properly if you extend them elsewhere
    opts_extend = { "sources.default" },
}
