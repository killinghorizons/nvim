return {
    "folke/noice.nvim",
    -- commit = "d9328ef903168b6f52385a751eb384ae7e906c6f", -- https://github.com/folke/noice.nvim/issues/921#issuecomment-2253363579
    opts = {
        presets = {
            lsp_doc_border = true,
        },
        ---@class NoiceConfigViews
        -- views = {
        --   notify = {
        --     backend = "notify_send",
        --   },
        -- },
        -- https://github.com/folke/noice.nvim/discussions/364
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
}
