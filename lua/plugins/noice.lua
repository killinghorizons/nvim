return {
    "folke/noice.nvim",
    opts = {
        presets = {
            lsp_doc_border = true,
        },
        ---@class NoiceConfigViews
        -- views = {
        --     notify = {
        --         backend = "notify_send",
        --     },
        -- },
        routes = {
            {
                filter = {
                    event = "notify",
                    find = "No information available",
                },
                opts = { skip = true },
            },
            {
                filter = {
                    event = "lsp",
                    find = "snyk",
                },
                opts = { skip = true },
            },
        },
    },
    -- {
    --     "rcarriga/nvim-notify",
    --     opts = {
    --         timeout = 5000,
    --     },
    -- },
}
