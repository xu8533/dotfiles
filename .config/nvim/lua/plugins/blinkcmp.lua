return {
  {
    "saghen/blink.cmp",
    optional = true,
    dependencies = { "codeium.nvim", "saghen/blink.compat" },
    opts = function(_, opts)
      opts.cmdline = {
        enabled = true,
        keymap = {
          -- preset = "cmdline",
          ["<Tab>"] = { "accept" },
          ["<CR>"] = { "accept_and_enter", "fallback" },
        },
        -- sources = function()
        --   local type = vim.fn.getcmdtype()
        --   -- Search forward and backward
        --   if type == "/" or type == "?" then
        --     return { "buffer" }
        --   end
        --   -- Commands
        --   if type == ":" or type == "@" then
        --     return { "cmdline" }
        --   end
        --   return {}
        -- end,
        completion = {
          ghost_text = { enabled = true },
          menu = {
            auto_show = function(ctx)
              return vim.fn.getcmdtype() == ":"
                -- enable for inputs as well, with:
                or vim.fn.getcmdtype() == "@"
            end,
            draw = {
              columns = { { "label", "label_description", gap = 1 } },
            },
          },
          -- trigger = {
          --   show_on_blocked_trigger_characters = {},
          --   show_on_x_blocked_trigger_characters = {},
          -- },
        },
      }

      opts.completion = {
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 500,
          treesitter_highlighting = true,
          -- window = { border = "single" },
        },
        -- ghost_text = { enabled = true }, -- 垂直列表
        keyword = {
          range = "full", -- 'prefix', 'full'
        },
        list = {
          selection = {
            -- { preselect = false, auto_insert = true },
            -- 根据模式选择类型
            preselect = function(ctx)
              return ctx.mode ~= "cmdline"
            end,
            auto_insert = function(ctx)
              return ctx.mode ~= "cmdline"
            end,
          },
        },
        menu = {
          -- auto_show = true,
          border = "single",
          --进行搜索时不显示补全列表
          auto_show = function(ctx)
            return ctx.mode ~= "cmdline" or not vim.tbl_contains({ "/", "?" }, vim.fn.getcmdtype())
          end,
          draw = {
            columns = {
              -- 默认样式
              -- { "kind_icon" },
              -- { "label", "label_description", gap = 1 },
              -- nvim-cmp样式
              -- { "label", "label_description", gap = 1 },
              -- { "kind_icon", "kind" },
              -- 自定义样式
              { "kind_icon" },
              { "label", "label_description", "source_name", gap = 1 },
              -- { "kind_icon", "label", gap = 1 },
              -- { "label_description", "kind", "source_name", gap = 1 },
            },
            -- 使用mini.icons补全图标和图标高亮
            components = {
              kind_icon = {
                ellipsis = false,
                text = function(ctx)
                  local kind_icon, _, _ = require("mini.icons").get("lsp", ctx.kind)
                  return kind_icon
                end,
                -- Optionally, you may also use the highlights from mini.icons
                highlight = function(ctx)
                  local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
                  return hl
                end,
              },
            },
          },
        },
      }

      opts.signature = {
        enabled = true,
        window = {
          border = "single",
          show_documentation = false,
        },
      }

      opts.sources = {
        default = { "buffer", "lsp", "path", "snippets", "codeium", "markdown" },
        compat = { "codeium" },
        providers = {
          codeium = {
            kind = "Codeium",
            score_offset = 100,
            async = true,
          },
          markdown = {
            name = "RenderMarkdown",
            module = "render-markdown.integ.blink",
            fallbacks = { "lsp" },
          },
          cmdline = {
            -- # shell命令模式禁用自动补全
            -- enabled = function()
            --   return vim.fn.getcmdtype() ~= ":" or not vim.fn.getcmdline():match("^[%%0-9,'<>%-]*!")
            -- end,
            min_keyword_length = function(ctx)
              -- when typing a command, only show when the keyword is 3 characters or longer
              if ctx.mode == "cmdline" and string.find(ctx.line, " ") == nil then
                return 3
              end
              return 0
            end,
          },
        },
      }

      -- 针对某种类型文件关闭补全
      opts.enabled = function()
        return not vim.tbl_contains({
          -- "lua",
          -- "markdown",
        }, vim.bo.filetype) and vim.bo.buftype ~= "prompt" and vim.b.completion ~= false
      end
    end,
  },
}
