local signs = { ERROR = " ", WARN = " ", HINT = "󰠠 ", INFO = " " }
vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = signs.ERROR,
            [vim.diagnostic.severity.WARN] = signs.WARN,
            [vim.diagnostic.severity.HINT] = signs.HINT,
            [vim.diagnostic.severity.INFO] = signs.INFO,
        },
    },
    virtual_text = {
        prefix = "●",
        spacing = 2,
    },
    underline = true,
    update_in_insert = false,
    severity_sort = true,
})

local on_attach = function(client, bufnr)
    -- Only disable semantic tokens for servers known to conflict
    if client.name == "lua_ls" then
        client.server_capabilities.semanticTokensProvider = nil
    end

    local buf_opts = { noremap = true, silent = true, buffer = bufnr }

    vim.keymap.set("n", "gd", "<cmd>Trouble lsp_definitions toggle<cr>", buf_opts)
    vim.keymap.set("n", "gi", "<cmd>Trouble lsp_implementations toggle<cr>", buf_opts)
    vim.keymap.set("n", "gr", "<cmd>Trouble lsp_references toggle<cr>", buf_opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, buf_opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, buf_opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, buf_opts)
    vim.keymap.set("n", "<leader>fm", function()
        vim.lsp.buf.format({ async = true })
    end, buf_opts)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)

return {
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "saghen/blink.cmp",
        },
        config = function()
            vim.lsp.config("*", {
                capabilities = capabilities,
            })

            local attach_group = vim.api.nvim_create_augroup("dotfiles-lsp-attach", { clear = true })

            vim.api.nvim_create_autocmd("LspAttach", {
                group = attach_group,
                callback = function(args)
                    local client = vim.lsp.get_client_by_id(args.data.client_id)
                    if not client then
                        return
                    end
                    on_attach(client, args.buf)
                end,
            })

            -- React / Next.js
            vim.lsp.config("vtsls", {
                filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
                settings = {
                    typescript = {
                        suggest = { completeFunctionCalls = true },
                        updateImportsOnRename = "always",
                    },
                },
            })

            -- HTML
            vim.lsp.config("html", {
                filetypes = { "html", "javascriptreact", "typescriptreact" },
                embeddedLanguages = { css = true, javascript = true },
            })

            -- CSS / SCSS
            vim.lsp.config("cssls", {
                filetypes = { "css", "scss", "less" },
                settings = {
                    css = { validate = true },
                    scss = { validate = true },
                    less = { validate = true },
                },
            })

            -- Tailwind CSS
            vim.lsp.config("tailwindcss", {
                filetypes = {
                    "html",
                    "javascriptreact",
                    "typescriptreact",
                    "vue",
                    "svelte",
                    "css",
                    "scss",
                },
                root_markers = {
                    "tailwind.config.js",
                    "tailwind.config.ts",
                    "postcss.config.js",
                },
            })

            -- Rust
            vim.lsp.config("rust_analyzer", {
                filetypes = { "rust" },
                root_markers = { "Cargo.toml", "rust-project.json" },
                settings = {
                    ["rust-analyzer"] = { checkOnSave = { command = "clippy" } },
                },
            })

            -- Python
            vim.lsp.config("basedpyright", {
                filetypes = { "python" },
                root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", ".git" },
                settings = {
                    basedpyright = {
                        analysis = {
                            typeCheckingMode = "basic",
                            autoSearchPaths = true,
                            useLibraryCodeForTypes = true,
                            ignore = { "*" },
                        },
                    },
                },
            })

            -- Lua
            vim.lsp.config("lua_ls", {
                settings = {
                    Lua = {
                        runtime = { version = "LuaJIT" },
                        diagnostics = { globals = { "vim" } },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true),
                            checkThirdParty = false,
                        },
                        telemetry = { enable = false },
                    },
                },
            })

            -- C / C++
            local clangd_caps = vim.tbl_deep_extend("force", capabilities, {
                offsetEncoding = { "utf-16" },
            })
            vim.lsp.config("clangd", {
                cmd = {
                    "clangd",
                    "--background-index",
                    "--clang-tidy",
                    "--header-insertion=iwyu",
                    "--completion-style=detailed",
                    "--function-arg-placeholders=false",
                    "--fallback-style=none",
                },
                init_options = {
                    usePlaceholders = true,
                    completeUnimported = true,
                    clangdFileStatus = true,
                    fallbackFlags = { "-std=c++20" },
                },
                capabilities = clangd_caps,
                filetypes = { "c", "cpp" },
                root_markers = { ".clangd" },
            })
        end,
    },
}
