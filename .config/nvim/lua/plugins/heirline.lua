return {
  "rebelot/heirline.nvim",
  opts = function(_, opts)
    local status = require "astroui.status"

    local WorkDir = {
      init = function(self)
        self.icon = " "
        local cwd = vim.fn.getcwd(0)
        self.cwd = vim.fn.fnamemodify(cwd, ":~")
      end,
      hl = { fg = "#bcca87", bold = true },

      flexible = 1,

      {
        -- evaluates to the full-lenth path
        provider = function(self)
          local trail = self.cwd:sub(-1) == "/" and "" or "/"
          return self.icon .. self.cwd .. trail .. " "
        end,
      },
      {
        -- evaluates to the shortened path
        provider = function(self)
          local cwd = vim.fn.pathshorten(self.cwd)
          local trail = self.cwd:sub(-1) == "/" and "" or "/"
          return self.icon .. cwd .. trail .. " "
        end,
      },
      {
        -- evaluates to "", hiding the component
        provider = "",
      },
    }

    opts.statusline = { -- statusline
      hl = { fg = "fg", bg = "bg" },
      status.component.mode {
        mode_text = { padding = { left = 1, right = 1 } },
      }, -- add the mode text
      status.component.git_branch(),
      status.component.file_info(),
      status.component.git_diff(),
      status.component.diagnostics(),
      status.component.builder(WorkDir),
      status.component.fill(),
      status.component.cmd_info(),
      status.component.fill(),
      status.component.lsp(),
      status.component.virtual_env(),
      -- status.component.treesitter(),
      status.component.nav(),
      -- status.component.mode { surround = { separator = "right" } },
    }

    -- opts.winbar = false
    -- virsual studio code winbar
    -- opts.winbar = { -- create custom winbar
    --   -- store the current buffer number
    --   init = function(self) self.bufnr = vim.api.nvim_get_current_buf() end,
    --   fallthrough = false, -- pick the correct winbar based on condition
    --   -- inactive winbar
    --   {
    --     condition = function() return not status.condition.is_active() end,
    --     -- show the path to the file relative to the working directory
    --     status.component.separated_path {
    --       path_func = status.provider.filename { modify = ":.:h" },
    --     },
    --     -- add the file name and icon
    --     status.component.file_info {
    --       file_icon = {
    --         hl = status.hl.file_icon "winbar",
    --         padding = { left = 0 },
    --       },
    --       filename = {},
    --       filetype = false,
    --       file_modified = false,
    --       file_read_only = false,
    --       hl = status.hl.get_attributes("winbarnc", true),
    --       surround = false,
    --       update = "BufEnter",
    --     },
    --   },
    --   -- active winbar
    --   {
    --     -- show the path to the file relative to the working directory
    --     status.component.separated_path {
    --       path_func = status.provider.filename { modify = ":.:h" },
    --     },
    --     -- add the file name and icon
    --     status.component.file_info { -- add file_info to breadcrumbs
    --       file_icon = { hl = status.hl.filetype_color, padding = { left = 0 } },
    --       filename = {},
    --       filetype = false,
    --       file_modified = false,
    --       file_read_only = false,
    --       hl = status.hl.get_attributes("winbar", true),
    --       surround = false,
    --       update = "BufEnter",
    --     },
    --     -- show the breadcrumbs
    --     status.component.breadcrumbs {
    --       icon = { hl = true },
    --       hl = status.hl.get_attributes("winbar", true),
    --       prefix = true,
    --       padding = { left = 0 },
    --     },
    --   },
    -- }
  end,
}
