return {
  {
    "folke/snacks.nvim",
    opts = {
      animate = {
        easing = "circle",
        fps = 30, -- frames per second. Global setting for all animations
      },
      dashboard = {
        enabled = false,
      },
      bigfile = { enabled = true },
      dim = { enabled = true },
      explorer = { enabled = true },
      input = { enabled = true },
      indent = {
        char = "┇",
        hl = {
          "SnacksIndent1",
          "SnacksIndent2",
          "SnacksIndent3",
          "SnacksIndent4",
          "SnacksIndent5",
          "SnacksIndent6",
          "SnacksIndent7",
          "SnacksIndent8",
        },
        enabled = true,
        indent = {
          enabled = false,
        },
        chunk = {
          enabled = true,
          hl = "SnacksIndentChunk", ---@type string|string[] hl group for chunk scopes
          char = {
            -- corner_top = "┌",
            -- corner_bottom = "└",
            corner_top = "╭",
            corner_bottom = "╰",
            horizontal = "─",
            vertical = "│",
            arrow = ">",
          },
        },
        scope = {
          enabled = true, -- enable highlighting the current scope
          char = "┇",
          underline = false, -- underline the start of the scope
          only_current = false, -- only show scope in the current window
          hl = "SnacksIndentScope", ---@type string|string[] hl group for scopes
        },
      },
      lazygit = { enabled = true },
      notifier = { enabled = true },
      picker = { enabled = true },
      quickfile = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = true },
      statuscolumn = { enabled = false },
      terminal = { enabled = true },
      toggle = { enabled = true },
      win = { enabled = true },
      words = { enabled = true },
      zen = { enabled = true },
    },
  },
}
