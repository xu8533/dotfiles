return {
  {
    "NvChad/nvim-colorizer.lua",
    opts = function(_, opts)
      opts.filetypes = {
        "*",
        html = { mode = "foreground" },
        cmp_docs = { always_update = true },
        "!vim",
        "!lazy",
      }
      opts.user_default_options = {
        names = true,
        RRGGBBAA = true,
        AARRGGBB = true,
        rgb_fn = true,
        css = true,
        css_fn = true,
        tailwind = true,
        mode = "background",
      }
    end,
  },
}
