return {
    "stevearc/conform.nvim",
    optional = true,
    opts = function(_, opts)
        opts.formatters_by_ft = {
            kdl = { "kdlfmt" },
            perl = { "perltidy" },
        }
    end,
}
