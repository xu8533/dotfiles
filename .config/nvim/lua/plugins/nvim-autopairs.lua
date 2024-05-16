return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  opts = {
    fast_wrap = {
      map = "<M-e>",
      chars = { "{", "[", "(", '"', "'" },
      pattern = [=[[%'%"%>%]%)%}%,]]=],
      end_key = "$",
      before_key = "h",
      after_key = "l",
      cursor_pos_before = true,
      keys = "qwertyuiopzxcvbnmasdfghjkl",
      manual_position = true,
      check_comma = true,
      highlight = "PmenuSel",
      highlight_grey = "LineNr",
    },
  },
  config = function() require "config.nvim-autopairs" end,
}
