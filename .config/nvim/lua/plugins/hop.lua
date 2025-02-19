return {
  "smoka7/hop.nvim",
  opts = {
    case_insensitive = false,
    create_hl_autocmd = false, -- 使用hop自带高亮色
    multi_windows = true, -- 多个窗口同时启用
    match_mappings = { "zh", "zh_sc" },
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
    { "hP", "<cmd>HopPasteChar1<CR>", desc = "Hop paste without motion" },
    { "hpl", "<cmd>HopPasteChar1CurrentLine<CR>", desc = "Hop paste currentline without motion" },
    -- { "h1c", "<cmd>HopChar1<CR>", desc = "Hop one char motion" },
    -- { "h2c", "<cmd>HopChar2<CR>", desc = "Hop two char motion" },
    { "hcl", "<cmd>HopWordCurrentLine<CR>", desc = "Hop current line motion" },
  },
}
