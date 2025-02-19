return {
  "folke/flash.nvim",
  vscode = true,
  event = "VeryLazy",
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
      "s",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump()
      end,
      desc = "Flash",
    },
    {
      "S",
      mode = { "n", "o", "x" },
      function()
        require("flash").treesitter()
      end,
      desc = "Flash Treesitter",
    },
    {
      "r",
      mode = "o",
      function()
        require("flash").remote()
      end,
      desc = "Remote Flash",
    },
    {
      "R",
      mode = { "o", "x" },
      function()
        require("flash").treesitter_search()
      end,
      desc = "Treesitter Search",
    },
    {
      "<c-s>",
      mode = { "c" },
      function()
        require("flash").toggle()
      end,
      desc = "Toggle Flash Search",
    },
    {
      "<CR>",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump({ continue = true })
      end,
      desc = "Flash continue last search",
    },
    {
      "f",
      mode = { "o" },
      function()
        require("flash").jump({
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
        })
      end,
      desc = "inseatd f motion",
    },
    {
      "t",
      mode = { "o" },
      function()
        require("flash").jump({
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
        })
      end,
      desc = "insetad t motion",
    },
    {
      "F",
      mode = { "o" },
      function()
        require("flash").jump({
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
        })
      end,
      desc = "insetad F motion",
    },
    {
      "T",
      mode = { "o" },
      function()
        require("flash").jump({
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
        })
      end,
      desc = "insetad T motion",
    },
  },
}
