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

            -- Rust
            vim.lsp.config("rust_analyzer", {
                filetypes = { "rust" },
                root_markers = { "Cargo.toml", "rust-project.json" },
                settings = {
                    ["rust-analyzer"] = { check = { command = "clippy" } },
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
                },
                capabilities = clangd_caps,
                filetypes = { "c", "cpp" },
                root_markers = { ".clangd", "compile_commands.json", ".git" },
            })
        end,

        -- JavaScript / TypeScript
        vim.lsp.config("tsgo", {
            cmd = { "tsgo", "--lsp", "--stdio" },
            filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
            root_dir = function(bufnr, on_dir)
                local root_markers = { { "package-lock.json", "yarn.lock", "pnpm-lock.yaml" }, { ".git" } }
                local project_root = vim.fs.root(bufnr, root_markers) or vim.fn.getcwd()
                on_dir(project_root)
            end,
        }),

        -- CSS
        vim.lsp.config("cssls", {
            cmd = { "vscode-css-language-server", "--stdio" },
            filetypes = { "css", "scss", "less" },
            settings = {
                css = { validate = true },
                scss = { validate = true },
                less = { validate = true },
            },
        }),

        -- HTML
        vim.lsp.config("html", {
            cmd = { "vscode-html-language-server", "--stdio" },
            filetypes = { "html" },
            embeddedLanguages = { css = true, javascript = true },
        }),

        -- Shells
        vim.lsp.config("bashls", {
            cmd = { "bash-language-server", "start" },
            filetypes = { "bash", "sh", "zsh" },
        }),

        -- TOML
        vim.lsp.config("taplo", {
            cmd = { "taplo", "lsp", "stdio" },
            filetypes = { "toml" },
            settings = {
                taplo = {
                    configFile = { enabled = true },
                    schema = {
                        enabled = true,
                        catalogs = { "https://www.schemastore.org/api/json/catalog.json" },
                        cache = {
                            memoryExpiration = 60,
                            diskExpiration = 600,
                        },
                    },
                },
            },
        }),

        -- Stylint not in mason
        -- Install with: npm i -g stylelint-lsp
        vim.lsp.config("stylelint_lsp", {
            cmd = { "stylelint-lsp", "--stdio" },
            filetypes = { "css", "less", "scss" },
            root_markers = { ".stylelintrc", ".stylelintrc.js", ".stylelintrc.json", "stylelint.config.js" },
            settings = {
                stylelintplus = {
                    validateOnSave = true,
                    validateOnType = false,
                },
            },
        }),
        vim.lsp.enable("stylelint_lsp"),
        --
    },
}
