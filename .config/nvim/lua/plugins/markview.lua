-- For `plugins/markview.lua` users.
return {
    "OXY2DEV/markview.nvim",
    lazy = false,
    -- enabled = false,
    -- Completion for `blink.cmp`
    dependencies = { "saghen/blink.cmp" },
    config = function()
        require("config.markview")
    end,
    keys = {
        { "<leader>m", "<CMD>Markview<CR>", desc = "Toggles `markview` previews globally." },
    },
}
