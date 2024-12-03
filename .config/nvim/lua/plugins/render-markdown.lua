return {
  "MeanderingProgrammer/render-markdown.nvim",
  opts = {
    preset = "obsidian",
    quote = { repeat_linebreak = true },
    code = {
      position = "right",
      width = "block",
      right_pad = 10,
    },
    indent = {
      enabled = true,
      skip_heading = true,
    },
    heading = {
      -- width = "block",
      left_pad = 2,
      right_pad = 4,
      border = true,
      icons = { "󰼏 ", "󰎨 " },
      min_width = 30,
      width = { "full", "block", "full", "block" },
      border_virtual = true,
    },
    overrides = {
      buftype = {
        nofile = {
          code = { left_pad = 0, right_pad = 0 },
        },
      },
    },
  },
}
