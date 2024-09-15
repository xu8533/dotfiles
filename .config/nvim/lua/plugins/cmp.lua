return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    { "hrsh7th/cmp-nvim-lua", lazy = true }, -- add cmp-nvim-lua as dependency of cmp
    { "hrsh7th/cmp-calc", lazy = true }, -- add cmp-cacl as dependency of cmp
    { "kdheepak/cmp-latex-symbols", lazy = true }, -- add cmp-latex-symbols as dependency of cmp
    { "nat-418/cmp-color-names.nvim", lazy = true },
  },
  opts = function(_, opts)
    local cmp, astro = require "cmp", require "astrocore"
    local sources = {}

    for source_plugin, source in pairs {
      ["cmp-nvim-lua"] = { name = "nvim_lua", priority = 800 }, -- add lua source
      ["cmp-calc"] = { name = "calc", priority = 850 }, -- add calc source
      ["cmp-latex-symbols"] = {
        name = "latex_symbols",
        priority = 800,
        option = { strategy = 0 },
      }, -- add latex symbols source
      ["cmp-color-names"] = { name = "color_names", priority = 850 },
    } do
      if astro.is_available(source_plugin) then table.insert(sources, source) end
    end
    if not opts.mapping then opts.mapping = {} end
    if not opts.completion then opts.completion = {} end
    opts.completion = {
      -- 自动选中第一条
      completeopt = "menu,menuone,noinsert",
    }
    if not opts.preselect then opts.preselect = {} end
    opts.preselect = cmp.PreselectMode.Item
    if not opts.sources then opts.sources = {} end
    table.insert(opts.sources, sources)
    -- opts.sources = cmp.config.sources {
    --   { name = "nvim_lsp", priority = 1000 },
    --   { name = "luasnip", priority = 750 },
    --   { name = "buffer", priority = 500 },
    --   { name = "path", priority = 250 },
    --   { name = "nvim_lua", priority = 800 }, -- add lua source
    --   { name = "calc", priority = 850 }, -- add calc source
    --   { name = "color_names", priority = 850 },
    --   {
    --     name = "latex_symbols",
    --     priority = 800,
    --     option = { strategy = 0 },
    --   }, -- add latex symbols source
    -- }
  end,
}
