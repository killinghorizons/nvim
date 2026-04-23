return {
    "stevearc/oil.nvim",
    opts = {},
    dependencies = { { "nvim-mini/mini.icons", opts = {} } },
    lazy = false,
    config = function()
        local oil = require "oil"
        oil.setup()
        vim.keymap.set("n", "-", oil.toggle_float, {})
    end,
}
