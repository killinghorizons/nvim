-- Pretty bufferline.
return {
    {
        "akinsho/bufferline.nvim",
        event = "VeryLazy",
        opts = {
            options = {
                show_close_icon = false,
                show_buffer_close_icons = false,
                truncate_names = false,
                indicator = { style = "underline" },
                separator_style = "slope",
                close_command = function(bufnr)
                    require("mini.bufremove").delete(bufnr, false)
                end,
                diagnostics = "nvim_lsp",
                diagnostics_indicator = function(_, _, diag)
                    local icons = require("icons").diagnostics
                    local indicator = (diag.error and icons.ERROR .. " " or "") .. (diag.warning and icons.WARN or "")
                    return vim.trim(indicator)
                end,
            },
        },
    },
}
