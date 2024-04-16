return {
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      return require("astrocore").extend_tbl(opts, {
        lsp = {
          signature = { enabled = false },
        },
      })
    end,
  },
}
