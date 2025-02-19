return {
  {
    "akinsho/bufferline.nvim",
    keys = {
      { "<leader>bb", "<Cmd>BufferLinePick<CR>", desc = "pick buffer" },
    },
    opts = {
      options = {
        always_show_bufferline = true,
        separator_style = "slant",
        -- separator_style = "padded_slant",
        -- separator_style = "slope",
        -- separator_style = "padded_slope",
        indicator = {
          style = "underline",
        },
        hover = {
          enabled = true,
          delay = 200,
          reveal = { "close" },
        },
      },
    },
  },
}
