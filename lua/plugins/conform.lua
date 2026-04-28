-- Formatting.
return {
    {
        "stevearc/conform.nvim",
        event = "BufWritePre",
        keys = {
            {
                "<leader>F",
                function()
                    require("conform").format { async = true, lsp_fallback = true }
                end,
                mode = { "n", "v" },
                desc = "Format buffer",
            },
        },
        opts = {
            notify_on_error = false,
            notify_no_formatters = false,
            formatters_by_ft = {
                c = { name = "clangd", timeout_ms = 500, lsp_format = "prefer" },
                cpp = { name = "clangd", timeout_ms = 500, lsp_format = "prefer" },
                go = { name = "gopls", timeout = 500, lsp_format = "prefer" },
                javascriptreact = { "prettier", name = "dprint", timeout_ms = 500, lsp_format = "fallback" },
                json = { "prettier", name = "dprint", timeout_ms = 500, lsp_format = "fallback" },
                jsonc = { "prettier", name = "dprint", timeout_ms = 500, lsp_format = "fallback" },
                less = { "prettier" },
                lua = { "stylua" },
                markdown = { "prettier", name = "dprint", timeout_ms = 500, lsp_format = "fallback" },
                rust = { name = "rust_analyzer", timeout_ms = 500, lsp_format = "prefer" },
                css = { "prettier" },
                scss = { "prettier" },
                sh = { "shfmt" },
                typescript = { "prettier", name = "dprint", timeout_ms = 500, lsp_format = "fallback" },
                typescriptreact = { "prettier", name = "dprint", timeout_ms = 500, lsp_format = "fallback" },
                yaml = { "prettier" },
                -- python = { "ruff", timeout_ms = 500, lsp_format = "fallback" },
                python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
                -- For filetypes without a formatter:
                ["_"] = { "trim_whitespace", "trim_newlines" },
            },
            format_on_save = function()
                -- Skip formatting if triggered from my special save command.
                if vim.g.skip_formatting then
                    vim.g.skip_formatting = false
                    return nil
                end

                -- Stop if we disabled auto-formatting.
                if not vim.g.autoformat then
                    return nil
                end

                return {}
            end,
            formatters = {
                -- Require a Prettier configuration file to format.
                prettier = { require_cwd = true },
            },
        },
        init = function()
            -- Use conform for gq.
            vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

            -- Start auto-formatting by default (and disable with my ToggleFormat command).
            vim.g.autoformat = true
        end,
    },
}
