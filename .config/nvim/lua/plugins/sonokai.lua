return {
  {
    -- {
    --   "AstroNvim/astroui",
    --   ---@type AstroUIOpts
    --   opts = {
    --     colorscheme = "sonokai",
    --   },
    -- },
    "sainnhe/sonokai",
    lazy = true,
    init = function()
      vim.g.sonokai_style = "andromeda"
      -- vim.g.sonokai_style = "espresso"
      -- vim.g.sonokai_style = "default"
      -- vim.g.sonokai_style = "atlantis"
      -- vim.g.sonokai_style = "shusia"
      -- vim.g.sonokai_style = "maia"
      vim.g.sonokai_better_performance = 1
    end,
  },
}