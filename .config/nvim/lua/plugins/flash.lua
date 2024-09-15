return {
  "folke/flash.nvim",
  -- vscode = true,
  opts = {
    label = {
      rainbow = {
        enabled = true,
      },
    },
    modes = {
      -- options used when flash is activated through
      -- a regular search with `/` or `?`
      search = {
        -- when `true`, flash will be activated during regular search by default.
        -- You can always toggle when searching with `require("flash").toggle()`
        enabled = true,
        search = { incremental = true, wrap = true },
        jump = { autojump = true },
      },
      -- options used when flash is activated through
      -- `f`, `F`, `t`, `T`, `;` and `,` motions
      char = {
        search = { wrap = false },
        jump_labels = true,
        autohide = true,
        multi_line = false,
        jump = { autojump = true },
      },
    },
    -- options for remote operator pending mode
    remote_op = {
      -- restore window views and cursor position
      -- after doing a remote operation
      -- restore = true,
      -- For `jump.pos = "range"`, this setting is ignored.
      -- `true`: always enter a new motion when doing a remote operation
      -- `false`: use the window's cursor position and jump target
      -- `nil`: act as `true` for remote windows, `false` for the current window
      -- motion = true,
    },
  },
  keys = {
    {
      "/",
      mode = { "n", "x", "o" },
      function() require("flash").jump { search = { forward = true, wrap = false, multi_window = false } } end,
      desc = "Flash forward search only",
    },
    {
      "?",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump {
          search = { forward = false, wrap = false, multi_window = false },
        }
      end,
      desc = "Flash backward search only",
    },
    {
      "s",
      mode = { "n" },
      function() require("flash").jump() end,
      desc = "Flash",
    },
    {
      "<CR>",
      mode = { "n", "x", "o" },
      function() require("flash").jump { continue = true } end,
      desc = "Flash continue last search",
    },
    {
      "f",
      mode = { "o" },
      function()
        require("flash").jump {
          search = {
            forward = true,
          },
          jump = {
            inclusive = true,
          },
          -- doesn't do anything for now disable this at top level
          modes = {
            char = {
              multi_line = false,
            },
          },
        }
      end,
      desc = "inseatd f motion",
    },
    {
      "t",
      mode = { "o" },
      function()
        require("flash").jump {
          search = {
            forward = true,
          },
          jump = {
            inclusive = false,
          },
          modes = {
            char = {
              multi_line = false,
            },
          },
        }
      end,
      desc = "insetad t motion",
    },
    {
      "F",
      mode = { "o" },
      function()
        require("flash").jump {
          search = {
            forward = false,
          },
          jump = {
            inclusive = true,
          },
          modes = {
            char = {
              multi_line = false,
            },
          },
        }
      end,
      desc = "insetad F motion",
    },
    {
      "T",
      mode = { "o" },
      function()
        require("flash").jump {
          search = {
            forward = false,
          },
          jump = {
            inclusive = true,
            offset = 1,
          },
          modes = {
            char = {
              multi_line = false,
            },
          },
        }
      end,
      desc = "insetad T motion",
    },
    {
      "*",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump {
          matcher = function(win)
            ---@param diag Diagnostic
            return vim.tbl_map(
              function(diag)
                return {
                  pos = { diag.lnum + 1, diag.col },
                  end_pos = { diag.end_lnum + 1, diag.end_col - 1 },
                }
              end,
              vim.diagnostic.get(vim.api.nvim_win_get_buf(win))
            )
          end,
          action = function(match, state)
            vim.api.nvim_win_call(match.win, function()
              vim.api.nvim_win_set_cursor(match.win, match.pos)
              vim.diagnostic.open_float()
            end)
            state:restore()
          end,
        }
      end,
      desc = "Flash show diagnostics at target, without changing cursor position",
    },
  },
  dependencies = {
    -- Telescope integration
    {
      "nvim-telescope/telescope.nvim",
      optional = true,
      opts = function(_, opts)
        local function flash(prompt_bufnr)
          require("flash").jump {
            pattern = "^",
            label = { after = { 0, 0 } },
            search = {
              mode = "search",
              exclude = {
                function(win) return vim.bo[vim.api.nvim_win_get_buf(win)].filetype ~= "TelescopeResults" end,
              },
            },
            action = function(match)
              local picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
              picker:set_selection(match.pos[1] - 1)
            end,
          }
        end
        opts.defaults = vim.tbl_deep_extend("force", opts.defaults or {}, {
          mappings = {
            n = { s = flash },
            i = { ["<c-s>"] = flash },
          },
        })
      end,
    },
  },
}
