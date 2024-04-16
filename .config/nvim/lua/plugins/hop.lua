return {
  "phaazon/hop.nvim",
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
    -- { "hc", "<cmd>HopChar1<CR>", desc = "Hop one char motion" },
    { "hl", "<cmd>HopLine<CR>", desc = "Hop line beginne motion" },
    { "hs", "<cmd>HopLineStart<CR>", desc = "Hop line start motion" },
    { "hv", "<cmd>HopVertical<CR>", desc = "Hop vertical motion" },
    { "hw", "<cmd>HopWord<CR>", desc = "Hop word motion" },
    -- { "hcc", "<cmd>HopChar2<CR>", desc = "Hop two char motion" },
    { "hcl", "<cmd>HopWordCurrentLine<CR>", desc = "Hop current line motion" },
  },
}
