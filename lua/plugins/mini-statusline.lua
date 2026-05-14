return {
        "nvim-mini/mini.statusline",
        version = false,
        config = function()
                local noirbuddy_statusline = require("noirbuddy.plugins.mini-statusline")

                require("mini.statusline").setup({
                        content = {
                                active = noirbuddy_statusline.active,
                                inactive = noirbuddy_statusline.inactive,
                        },
                })
        end,
}
