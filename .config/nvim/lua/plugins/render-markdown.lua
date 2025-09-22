return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      anti_conceal = {
        disabled_modes = { "n" },
        ignore = {
          bullet = true, -- render bullet in insert mode
          head_border = true,
          head_background = true,
        },
      },
      bullet = {
        icons = {
          {
            "",
            "",
          },
        },
      },
      callout = {
        note = {
          rendered = "󰅾 Notary",
          quote_icon = "█",
        },
      },
      checkbox = {
        unchecked = {
          icon = "󰄱",
          highlight = "RenderMarkdownCodeFallback",
          scope_highlight = "RenderMarkdownCodeFallback",
        },
        checked = {
          icon = "󰄵",
          highlight = "RenderMarkdownUnchecked",
          scope_highlight = "RenderMarkdownUnchecked",
        },
        custom = {
          question = {
            raw = "[?]",
            rendered = "",
            highlight = "RenderMarkdownError",
            scope_highlight = "RenderMarkdownError",
          },
          todo = {
            raw = "[>]",
            rendered = "󰦖",
            highlight = "RenderMarkdownInfo",
            scope_highlight = "RenderMarkdownInfo",
          },
          canceled = {
            raw = "[-]",
            rendered = "",
            highlight = "RenderMarkdownCodeFallback",
            scope_highlight = "@text.strike",
          },
          important = {
            raw = "[!]",
            rendered = "",
            highlight = "RenderMarkdownWarn",
            scope_highlight = "RenderMarkdownWarn",
          },
          favorite = {
            raw = "[~]",
            rendered = "",
            highlight = "RenderMarkdownMath",
            scope_highlight = "RenderMarkdownMath",
          },
        },
      },
      code = {
        -- 常规设置
        width = "block",
        min_width = 80,
        -- 边框
        border = "thin",
        left_pad = 1,
        right_pad = 1,
        -- 语言信息
        position = "right",
        language_icon = true,
        language_name = true,
        -- avoid making headings ugly
        highlight_inline = "RenderMarkdownCodeInfo",
      },
      completions = {
        blink = { enabled = true },
        lsp = { enabled = true },
      },
      dash = { width = 20 },
      heading = {
        position = "inline",
        sign = false,
        border = true,
        border_virtual = true,
        icons = { "󰼏 ", "󰼐 ", "󰼑 ", "󰼒 ", "󰼓 ", "󰼔 " },
      },
      indent = {
        enabled = true,
        skip_level = 0,
        skip_heading = true,
      },
      latex = { bottom_pad = 1 },
      link = {
        wiki = { icon = " ", highlight = "RenderMarkdownWikiLink", scope_highlight = "RenderMarkdownWikiLink" },
        image = "󰋵 ",
        email = " ",
        hyperlink = "󰌷 ",
        custom = {
          python = { pattern = "%.py$", icon = "󰌠 " },
          github = { pattern = "github", icon = " " },
          gitlab = { pattern = "gitlab", icon = "󰮠 " },
          youtube = { pattern = "youtube", icon = " " },
          cern = { pattern = "cern.ch", icon = " " },
        },
      },
      pipe_table = {
        alignment_indicator = "─",
        border = { "╭", "┬", "╮", "├", "┼", "┤", "╰", "┴", "╯", "│", "─" },
      },
      sign = { enabled = false },
      win_options = { concealcursor = { rendered = "nvc" } },
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
