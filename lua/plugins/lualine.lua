return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        -- Custom function to get active LSP clients
        local function lsp_client_name()
            local msg = "No LSP"
            local buf_ft = vim.api.nvim_get_option_value("filetype", { buf = 0 })
            local clients = vim.lsp.get_clients { bufnr = 0 }
            if next(clients) == nil then
                return msg
            end
            local client_names = {}
            for _, client in ipairs(clients) do
                table.insert(client_names, client.name)
            end
            return "  " .. table.concat(client_names, "|")
        end

        require("lualine").setup {
            options = {
                theme = "auto",
                component_separators = { left = "│", right = "│" },
                section_separators = { left = "", right = "" },
                globalstatus = true, -- High-end look: one bar across the whole screen
                disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } },
            },
            sections = {
                lualine_a = { { "mode", separator = { left = "", right = "" }, right_padding = 2 } },
                lualine_b = { "branch", "diff", "diagnostics" },
                lualine_c = {
                    { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
                    { "filename", path = 1, symbols = { modified = " ●", readonly = " 󰌾" } },
                },
                lualine_x = {
                    {
                        lsp_client_name,
                        color = { gui = "bold" },
                    },
                    "encoding",
                    "fileformat",
                },
                lualine_y = { "progress" },
                lualine_z = {
                    { "location", separator = { left = "", right = "" }, left_padding = 2 },
                },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { "filename" },
                lualine_x = { "location" },
                lualine_y = {},
                lualine_z = {},
            },
        }
    end,
}
