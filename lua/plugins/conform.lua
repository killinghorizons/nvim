-- Formatting
return {
    {
        "stevearc/conform.nvim",
        event = "BufWritePre",
        keys = {
            {
                "<leader>F",
                function()
                    require("conform").format({ async = true, lsp_format = "fallback" })
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
                markdown = { "prettierd" },
                yaml = { "prettierd" },
                -- Python: ruff_fix
                python = { "ruff_format", "ruff_organize_imports" },
                -- C / C++
                c = { "clang_format" },
                cpp = { "clang_format" },
                -- Rust
                rust = { "rustfmt" },
                -- Lua
                lua = { "stylua" },
                -- Shell
                sh = { "shfmt" },
                -- Fallback for all other filetypes
                ["_"] = { "trim_whitespace", "trim_newlines" },
            },
            format_on_save = function()
                -- Skip formatting if triggered from special save command
                if vim.g.skip_formatting then
                    vim.g.skip_formatting = false
                    return nil
                end
                -- Skip if auto-formatting is disabled
                if not vim.g.autoformat then
                    return nil
                end
                return { timeout_ms = 500, lsp_format = "fallback" }
            end,
        },
        init = function()
            vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
            vim.g.autoformat = true
        end,
    },
}
