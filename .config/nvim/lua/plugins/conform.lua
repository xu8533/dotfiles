return {
    "stevearc/conform.nvim",
    optional = true,
    opts = function(_, opts)
        opts.formatters_by_ft = {
            kdl = { "kdlfmt" },
            perl = { "perltidy" },
            typst = { "typstyle", lsp_format = "prefer" },
        }
        opts.formatters = {
            kdlfmt = {
                append_args = { "--kdl-version", "v1" },
            }
        }
    end,
}
