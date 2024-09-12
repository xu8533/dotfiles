return {
  "smoka7/hop.nvim",
  event = "VeryLazy",
  opts = {
    keys = "asdghklqwertyuiopzxcvbnmfj",
    quit_key = "<ESC>",
    case_insensitive = false,
    create_hl_autocmd = false, -- 使用hop自带高亮色
    multi_windows = true, -- 多个窗口同时启用
    uppercase_labels = true,
    jump_on_sole_occurrence = false,
  },
  keys = {
    { "hl", "<cmd>HopLine<CR>", desc = "Hop line beginne motion" },
    { "hs", "<cmd>HopLineStart<CR>", desc = "Hop line start motion" },
    { "hv", "<cmd>HopVertical<CR>", desc = "Hop vertical motion" },
    { "hw", "<cmd>HopWord<CR>", desc = "Hop word motion" },
    { "hn", "<cmd>HopNodes<CR>", desc = "Hop treesitter nodes motion" },
    { "hp", "<cmd>HopPattern<CR>", desc = "Hop pattern motion" },
    -- { "h1c", "<cmd>HopChar1<CR>", desc = "Hop one char motion" },
    -- { "h2c", "<cmd>HopChar2<CR>", desc = "Hop two char motion" },
    { "hcl", "<cmd>HopWordCurrentLine<CR>", desc = "Hop current line motion" },
  },
  dependencies = {
    "AstroNvim/astrocore",
    opts = {
      mappings = {
        n = {
          ["<A-s>"] = { function() require("hop").hint_words() end, desc = "Hop hint words" },
          -- ["<S-s>"] = { function() require("hop").hint_lines() end, desc = "Hop hint lines" },
        },
        v = {
          ["s"] = { function() require("hop").hint_words { extend_visual = true } end, desc = "Hop hint words" },
          -- ["<S-s>"] = {
          --   function() require("hop").hint_lines { extend_visual = true } end,
          --   desc = "Hop hint lines",
          -- },
        },
      },
    },
  },
  specs = {
    {
      "catppuccin",
      optional = true,
      ---@type CatppuccinOptions
      opts = { integrations = { hop = true } },
    },
  },
}
