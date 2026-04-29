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
                -- Web
                javascript = { "prettierd" },
                typescript = { "prettierd" },
                javascriptreact = { "prettierd" },
                typescriptreact = { "prettierd" },
                css = { "prettierd" },
                scss = { "prettierd" },
                less = { "prettierd" },
                html = { "prettierd" },
                json = { "prettierd" },
                jsonc = { "prettierd" },
                -- Snake
                python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
                -- C
                c = { "clangd" },
                cpp = { "clangd" },
                -- Rust (Note: rust_analyzer is usually an LSP, not a standalone formatter)
                rust = { "rust_analyzer" },
                -- Markup
                markdown = { "prettier" },
                yaml = { "prettier" },
                -- Lua
                lua = { "stylua" },
                -- Shells
                sh = { "shfmt" },
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

                return { timeout_ms = 500, lsp_fallback = true }
            end,
        },
        init = function()
            vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
            vim.g.autoformat = true
        end,
    },
}
