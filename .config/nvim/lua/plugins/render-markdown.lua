return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      bullet = {
        icons = {
          {
            "",
            "",
          },
        },
      },
      code = {
        sign = false,
        width = "block",
        right_pad = 1,
      },
      callout = {
        note = {
          rendered = "󰅾 Notary",
          quote_icon = "█",
        },
      },
      checkbox = {
        enabled = true,
        unchecked = { icon = "✘ " },
        checked = {
          icon = " ",
          scope_highlight = "@markup.strikethrough",
        },
        custom = {
          todo = { rendered = "󰄯 " },
          important = {
            raw = "[~]",
            rendered = "󰓎 ",
            highlight = "DiagnosticWarn",
          },
        },
      },
      dash = { width = 20 },
      heading = {
        position = "inline",
        sign = false,
        border = true,
        border_virtual = true,
        icons = { "󰼏 ", "󰎨 ", "󰎫 ", "󰎲", "󰎯", "󰎴" },
      },
      indent = {
        enabled = true,
        skip_level = 0,
        skip_heading = true,
      },
      latex = { bottom_pad = 1 },
      link = {
        image = "󰋵 ",
        email = " ",
        hyperlink = "󰌷 ",
        custom = {
          python = {
            pattern = "%.py$",
            icon = "󰌠 ",
          },
        },
      },
      sign = { enabled = false },
    },
    ft = { "markdown", "norg", "rmd", "org", "codecompanion" },
    config = function(_, opts)
      require("render-markdown").setup(opts)
      Snacks.toggle({
        name = "Render Markdown",
        get = function()
          return require("render-markdown.state").enabled
        end,
        set = function(enabled)
          local m = require("render-markdown")
          if enabled then
            m.enable()
          else
            m.disable()
          end
        end,
      }):map("<leader>um")
    end,
  },
}
