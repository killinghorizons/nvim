-- diagnostic signs
local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- inline diagnostics (virtual text)
vim.diagnostic.config {
    virtual_text = {
        prefix = "●",
        spacing = 2,
    },
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
}

local on_attach = function(client, bufnr)
    client.server_capabilities.semanticTokensProvider = nil
    local buf_opts = { noremap = true, silent = true, buffer = bufnr }

    vim.keymap.set("n", "gd", "<cmd>Trouble lsp_definitions toggle<cr>", buf_opts)
    vim.keymap.set("n", "gi", "<cmd>Trouble lsp_implementations toggle<cr>", buf_opts)
    vim.keymap.set("n", "gr", "<cmd>Trouble lsp_references toggle<cr>", buf_opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, buf_opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, buf_opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, buf_opts)

    vim.keymap.set("n", "<leader>fm", function()
        vim.lsp.buf.format { async = true }
    end, buf_opts)
end

-- Setup capabilities at module level so go.nvim can access it
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)

return {
    -- Mason: portable package manager for LSP servers, linters, formatters
    {
        "mason-org/mason.nvim",
        opts = {},
    },

    -- Bridge between mason and lspconfig: auto-install + auto-enable servers
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = {
            "mason-org/mason.nvim",
            "neovim/nvim-lspconfig",
        },
        opts = {
            ensure_installed = {
                "basedpyright",
                "ruff",
                "lua_ls",
                "clangd",
                "rust_analyzer",
                "stylua",
                "vtsls",
                "html",
                "cssls",
                "emmet_language_server"
            },
            -- Automatically call vim.lsp.enable() for installed servers.
            -- Servers managed by wrapper plugins are excluded.
            -- automatic_enable = {
            --     exclude = {
            --         "ts_ls", -- managed by typescript-tools.nvim
            --     },
            -- },
        },
    },

    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "saghen/blink.cmp",
            "ray-x/lsp_signature.nvim",
            "onsails/lspkind.nvim",
        },
        config = function()
            -- Apply shared defaults to every server
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

            -- The "Native Preview" server (tsgo)
            -- vim.lsp.config("tsgo", {
            --     cmd = { "tsgo", "--lsp", "--stdio" },
            --     filetypes = {
            --         "javascript",
            --         "javascriptreact",
            --         "typescript",
            --         "typescriptreact",
            --     },
            --     root_markers = { "tsconfig.json", "package.json", ".git" },
            -- })

            -- Enable it
            -- vim.lsp.enable "tsgo"
            vim.lsp.config("emmet_language_server", {
                filetypes = { "css", "html", "javascriptreact", "less", "sass", "scss", "typescriptreact" },
            })

            -- React / Next.js (Better alternative to ts_ls)
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
                root_markers = { "tailwind.config.js", "tailwind.config.ts", "postcss.config.js" },
            })

            -- ESLint (Crucial for Next.js projects)
            vim.lsp.config("eslint", {
                on_attach = function(client, bufnr)
                    -- Enable auto-fix on save for ESLint
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        buffer = bufnr,
                        command = "EslintFixAll",
                    })
                end,
            })

            -- rust
            vim.lsp.config("rust_analyzer", {
                filetypes = { "rust" },
                root_markers = { "Cargo.toml", "rust-project.json" },
                settings = {
                    ["rust-analyzer"] = { checkOnSave = { command = "clippy" } },
                },
            })

            -- python
            vim.lsp.config("basedpyright", {
                -- install = {
                --     enabled = false,
                -- },
                -- cmd = { "basedpyright-langserver", "--stdio" },
                filetypes = { "python" },
                root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", ".git" },
                settings = {
                    basedpyright = {
                        analysis = {
                            typeCheckingMode = "basic",
                            autoSearchPaths = true,
                            useLibraryCodeForTypes = true,
                            -- Disable diagnostics that Ruff handles better
                            ignore = { "*" }, -- Use this if you only want Ruff's linter
                            -- OR just disable specific things:
                            -- diagnosticMode = "openFilesOnly",e,
                        },
                    },
                },
            })

            -- Shells
            vim.lsp.config("bash-language-server", {
                filetypes = { "bash", "sh", "zsh" },
            })

            -- lua
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

            -- c/c++
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
                    fallbackFlags = {
                        "-std=c++20",
                    },
                },
                -- Important for Windows/Clangd compatibility:
                capabilities = {
                    offsetEncoding = { "utf-16" },
                },
                filetypes = { "c", "cpp" },
                root_markers = { ".clangd" },
            })
        end,
    },
}
