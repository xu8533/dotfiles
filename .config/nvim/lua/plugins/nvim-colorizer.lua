return {
  "catgoose/nvim-colorizer.lua",
  event = "VeryLazy",
  keys = {
    { "<localleader>uc", "<cmd>ColorizerAttachToBuffer<cr>", desc = "Color highlighter enable" },
    { "<localleader>ut", "<cmd>ColorizerToggle<cr>", desc = "Color highlighter toggle" },
  },
  cmd = {
    "ColorizerAttachToBuffer",
    "ColorizerToggle",
  },
  opts = {
    lazy_load = true,
    user_default_options = {
      -- names_custom = false, -- Custom names to be highlighted: table|function|false
      RGB = true, -- #RGB hex codes
      RGBA = true, -- #RGBA hex codes
      RRGGBB = true, -- #RRGGBB hex codes
      RRGGBBAA = true, -- #RRGGBBAA hex codes
      AARRGGBB = true, -- 0xAARRGGBB hex codes
      rgb_fn = true, -- CSS rgb() and rgba() functions
      -- hsl_fn = false, -- CSS hsl() and hsla() functions
      -- css = true, -- Enable all CSS *features*:
      -- names, RGB, RGBA, RRGGBB, RRGGBBAA, AARRGGBB, rgb_fn, hsl_fn
      -- css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
      -- Tailwind colors.  boolean|'normal'|'lsp'|'both'.  True sets to 'normal'
      tailwind = true, -- Enable tailwind colors
      tailwind_opts = { -- Options for highlighting tailwind names
        update_names = false, -- When using tailwind = 'both', update tailwind names from LSP results.  See tailwind section
      },
      -- parsers can contain values used in `user_default_options`
      sass = { enable = true, parsers = { "css" } }, -- Enable sass colors
      xterm = true, -- Enable xterm 256-color codes (#xNN, \e[38;5;NNNm)
      -- Highlighting mode.  'background'|'foreground'|'virtualtext'
      mode = "background", -- Set the display mode
    },
    -- user_commands = { "ColorizerToggle", "ColorizerReloadAllBuffers" },
    names_custom = function()
      local colors = require("kanagawa.colors").setup({ theme = "dragon" })
      return colors.palette
    end,
    filetypes = {
      "*", -- Highlight all files, but customize some others.
      cmp_docs = { always_update = true },
    },
  },
  -- config = function()
  --   require("config.colorizer")
  -- end,
}
