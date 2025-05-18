return {
  {
    "saghen/blink.compat",
    version = "*",
    lazy = true,
    opts = {},
  },
  {
    "saghen/blink.cmp",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      "codeium.nvim",
      "saghen/blink.compat",
      "xzbdmw/colorful-menu.nvim",
    },
    opts = function(_, opts)
      opts.cmdline = {
        enabled = true,
        keymap = {
          preset = "inherit",
          ["<Tab>"] = { "show", "accept" },
        },
        completion = {
          ghost_text = { enabled = true },
          menu = {
            -- auto_show = true,
            auto_show = function(ctx)
              return vim.fn.getcmdtype() == ":"
              -- enable for inputs as well, with:
              -- or vim.fn.getcmdtype() == "@"
            end,
            draw = {
              columns = { { "label", "label_description", gap = 1 } },
            },
          },
        },
      }

      opts.completion = {
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 500,
          treesitter_highlighting = true,
          window = { border = "single" },
        },
        ghost_text = {
          enabled = true,
          show_with_menu = true,
        }, -- 补全预览
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
            cursorline_priority = 0,
            columns = {
              -- 默认样式
              -- { "kind_icon" },
              -- { "label", "label_description", gap = 1 },
              -- nvim-cmp样式
              -- { "label", "label_description", gap = 1 },
              -- { "kind_icon", "kind" },
              -- 自定义样式
              -- { "kind_icon" },
              -- { "label", "label_description", "source_name", gap = 1 },
              -- colorful-menu.nvim
              { "kind_icon", "label", "source_name", gap = 1 },
              -- { "label_description", "kind", "source_name", gap = 1 },
            },
            -- 使用mini.icons补全图标和图标高亮
            components = {
              kind_icon = {
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
              kind = {
                -- (optional) use highlights from mini.icons
                highlight = function(ctx)
                  local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
                  return hl
                end,
              },
              label = {
                highlight = function(ctx)
                  return require("colorful-menu").blink_components_highlight(ctx)
                end,
                text = function(ctx)
                  return require("colorful-menu").blink_components_text(ctx)
                end,
              },
            },
          },
        },
        trigger = {
          show_on_keyword = true,
        },
      }
      opts.fuzzy = {
        implementation = "rust",
        sorts = {
          "exact",
          -- defaults
          "score",
          "sort_text",
        },
      }
      opts.keymap = {
        ["<A-space>"] = { "show", "show_documentation", "hide_documentation" },
        ["<C-e>"] = { "hide", "fallback" },
        ["<C-y>"] = { "select_and_accept" },
        ["<CR>"] = { "accept", "fallback" },

        ["<Up>"] = { "select_prev", "fallback" },
        ["<Down>"] = { "select_next", "fallback" },
        ["<C-p>"] = { "select_prev", "fallback_to_mappings" },
        ["<C-n>"] = { "select_next", "fallback_to_mappings" },

        ["<C-b>"] = { "scroll_documentation_up", "fallback" },
        ["<C-f>"] = { "scroll_documentation_down", "fallback" },

        ["<Tab>"] = {
          function(cmp)
            if cmp.snippet_active() then
              return cmp.accept()
            else
              return cmp.select_and_accept()
            end
          end,
          "snippet_forward",
          "fallback",
        },
        ["<S-Tab>"] = { "snippet_backward", "fallback" },
        ["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
      }

      opts.signature = {
        enabled = true,
        window = {
          border = "single",
          show_documentation = false,
        },
      }

      opts.sources = {
        compat = { "codeium" },
        default = { "buffer", "lsp", "path", "snippets", "markdown" },
        per_filetype = {
          lua = { inherit_defaults = true, "lazydev" },
        },
        snippets = { preset = "luasnip" },
        providers = {
          -- 使用所有buffer内容作为补全源
          buffer = {
            opts = {
              get_bufnrs = function()
                return vim.tbl_filter(function(bufnr)
                  return vim.bo[bufnr].buftype == ""
                end, vim.api.nvim_list_bufs())
              end,
            },
            score_offset = 2000,
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
          codeium = {
            kind = "Codeium",
            score_offset = 1000,
            async = true,
          },
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            -- make lazydev completions top priority (see `:h blink.cmp`)
            score_offset = 100,
          },
          -- https://cmp.saghen.dev/recipes#fuzzy-sorting-filtering
          lsp = {
            -- name = "LSP",
            -- module = "blink.cmp.sources.lsp",
            -- transform_items = function(_, items)
            --   return vim.tbl_filter(function(item)
            --     return item.kind ~= require("blink.cmp.types").CompletionItemKind.Keyword
            --   end, items)
            -- end,
            fallbacks = {},
          },
          markdown = {
            name = "RenderMarkdown",
            module = "render-markdown.integ.blink",
            fallbacks = { "lsp" },
          },
          -- 使用cwd替换buffer目录作为补全源
          path = {
            opts = {
              get_cwd = function(_)
                return vim.fn.getcwd()
              end,
            },
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
