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
            },
            -- Automatically call vim.lsp.enable() for installed servers.
            -- Servers managed by wrapper plugins are excluded.
            automatic_enable = {
                exclude = {
                    "ts_ls", -- managed by typescript-tools.nvim
                },
            },
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

            -- rust
            vim.lsp.config("rust_analyzer", {
                settings = {
                    ["rust-analyzer"] = { checkOnSave = { command = "clippy" } },
                },
            })

            -- python
            vim.lsp.config("basedpyright", {
                install = {
                    enabled = false,
                },
                cmd = { "basedpyright-langserver", "--stdio" },
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
    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {},
    },
}
