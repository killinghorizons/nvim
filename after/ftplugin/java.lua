-- ~/.config/nvim/ftplugin/java.lua
local jdtls = require("jdtls")

local config = {
  cmd = { vim.fn.stdpath("data") .. "/mason/packages/jdtls/bin/jdtls" },
  root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", "mvnw", "pom.xml", ".git" }, { upward = true })[1]),
  capabilities = require("blink.cmp").get_lsp_capabilities(vim.lsp.protocol.make_client_capabilities()),
}

jdtls.start_or_attach(config)
