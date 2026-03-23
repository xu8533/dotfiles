return {
    "catgoose/nvim-colorizer.lua",
    event = "VeryLazy",
    keys = {
        { "<localleader>uc", "<cmd>ColorizerAttachToBuffer<cr>", desc = "Color highlighter enable" },
        { "<localleader>ut", "<cmd>ColorizerToggle<cr>",         desc = "Color highlighter toggle" },
    },
    cmd = {
        "ColorizerAttachToBuffer",
        "ColorizerToggle",
    },
    config = function()
        require("config.colorizer")
    end,
}
