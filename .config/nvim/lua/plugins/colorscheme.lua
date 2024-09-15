return {
  {
    "ribru17/bamboo.nvim",
    lazy = true,
    opts = {
      toggle_style_key = "<LocalLeader>ts", -- Keybind to toggle theme style. Leave it nil to disable it, or set it to a string, e.g. "<leader>ts"
      dim_inactive = true, -- Dim inactive windows/buffers
      -- Change code style ---
      -- Options are anything that can be passed to the `vim.api.nvim_set_hl` table
      -- You can also configure styles with a string, e.g. keywords = 'italic,bold'
      code_style = {
        comments = { italic = true },
        conditionals = { italic = true },
        keywords = {},
        functions = { bold = true },
        namespaces = { italic = true },
        parameters = { italic = true },
        strings = {},
        variables = {},
      },
    },
  },
  {
    "catppuccin",
    lazy = true,
  },
  {
    "Mofiqul/dracula.nvim",
    lazy = true,
  },
  {
    "Mofiqul/vscode.nvim",
    lazy = true,
  },
  {
    "luisiacc/gruvbox-baby",
    lazy = true,
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = true,
    opts = {
      dimInactive = true,
    },
  },
  {
    "EdenEast/nightfox.nvim",
    lazy = true,
    opts = {
      options = {
        dim_inactive = true,
        styles = { -- Style to be applied to different syntax groups
          comments = "italic", -- Value is any valid attr-list value `:help attr-list`
          conditionals = "italic",
          constants = "NONE",
          functions = "italic,bold",
          keywords = "bold",
          numbers = "NONE",
          operators = "NONE",
          strings = "NONE",
          types = "NONE",
          variables = "NONE",
        },
      },
    },
  },
  {
    "olimorris/onedarkpro.nvim",
    lazy = true,
    opts = {
      highlights = {
        Comment = { italic = true },
        Directory = { bold = true },
        ErrorMsg = { italic = true, bold = true },
      },
      styles = {
        types = "NONE",
        methods = "NONE",
        numbers = "NONE",
        strings = "NONE",
        comments = "italic",
        keywords = "bold,italic",
        constants = "NONE",
        functions = "bold",
        operators = "NONE",
        variables = "NONE",
        parameters = "NONE",
        conditionals = "italic",
        virtual_text = "NONE",
      },
      options = {
        cursorline = true,
        highlight_inactive_windows = true,
      },
    },
  },
  {
    "nyoom-engineering/oxocarbon.nvim",
    lazy = true,
  },
  {
    "rose-pine",
    lazy = true,
    opts = {
      dim_inactive_windows = true,
      highlight_groups = {
        TelescopeBorder = { fg = "overlay", bg = "overlay" },
        TelescopeNormal = { fg = "subtle", bg = "overlay" },
        TelescopeSelection = { fg = "text", bg = "highlight_med" },
        TelescopeSelectionCaret = { fg = "love", bg = "highlight_med" },
        TelescopeMultiSelection = { fg = "text", bg = "highlight_high" },

        TelescopeTitle = { fg = "base", bg = "love" },
        TelescopePromptTitle = { fg = "base", bg = "pine" },
        TelescopePreviewTitle = { fg = "base", bg = "iris" },

        TelescopePromptNormal = { fg = "text", bg = "surface" },
        TelescopePromptBorder = { fg = "surface", bg = "surface" },
      },
    },
  },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = {
      styles = {
        -- Style to be applied to different syntax groups
        -- Value is any valid attr-list value for `:help nvim_set_hl`
        comments = { italic = true },
        keywords = { italic = true },
        functions = { bold = true },
        variables = {},
        -- Background styles. Can be "dark", "transparent" or "normal"
        sidebars = "dark", -- style for sidebars, see below
        floats = "dark", -- style for floating windows
      },
      dim_inactive = true,
      on_highlights = function(hl, c)
        local prompt = "#2d3149"
        hl.TelescopeNormal = {
          bg = c.bg_dark,
          fg = c.fg_dark,
        }
        hl.TelescopeBorder = {
          bg = c.bg_dark,
          fg = c.bg_dark,
        }
        hl.TelescopePromptNormal = {
          bg = prompt,
        }
        hl.TelescopePromptBorder = {
          bg = prompt,
          fg = prompt,
        }
        hl.TelescopePromptTitle = {
          bg = prompt,
          fg = prompt,
        }
        hl.TelescopePreviewTitle = {
          bg = c.bg_dark,
          fg = c.bg_dark,
        }
        hl.TelescopeResultsTitle = {
          bg = c.bg_dark,
          fg = c.bg_dark,
        }
      end,
    },
  },
  {
    "AstroNvim/astrotheme",
    lazy = true,
  },
  {
    "sainnhe/everforest",
    lazy = true,
    init = function()
      vim.g.everforest_background = "hard"
      -- vim.g.everforest_background = "medium"
      -- vim.g.everforest_background = "soft"
      vim.g.everforest_enable_italic = 1
      vim.g.everforest_better_performance = 1
      vim.g.everforest_dim_inactive_windows = 1
      vim.g.everforest_diagnostic_virtual_text = "highlighted"
    end,
  },
  {
    "sainnhe/sonokai",
    lazy = true,
    init = function()
      vim.g.sonokai_style = "andromeda"
      -- vim.g.sonokai_style = "espresso"
      -- vim.g.sonokai_style = "default"
      -- vim.g.sonokai_style = "atlantis"
      -- vim.g.sonokai_style = "shusia"
      -- vim.g.sonokai_style = "maia"
      vim.g.onokai_enable_italic = 1
      vim.g.sonokai_better_performance = 1
      vim.g.sonokai_dim_inactive_windows = 1
      vim.g.sonokai_diagnostic_virtual_text = "colored"
    end,
  },
  {
    "sainnhe/gruvbox-material",
    name = "gruvbox-material",
    lazy = true,
    init = function()
      -- vim.g.gruvbox_material_foreground = "material"
      -- vim.g.gruvbox_material_foreground = "mix"
      vim.g.gruvbox_material_foreground = "original"
      -- vim.g.gruvbox_material_background = "hard"
      vim.g.gruvbox_material_background = "medium"
      -- vim.g.gruvbox_material_background = "soft"
      vim.g.gruvbox_material_enable_bold = 1
      vim.g.gruvbox_material_enable_italic = 1
      vim.g.gruvbox_material_better_performance = 1
      vim.g.gruvbox_material_dim_inactive_windows = 1
      vim.g.gruvbox_material_menu_selection_background = "purple"
      -- vim.g.gruvbox_material_menu_selection_background = "aqua"
    end,
  },
  {
    "sainnhe/edge",
    lazy = true,
    init = function()
      vim.g.edge_style = "aura"
      -- vim.g.edge_style = "neon"
      vim.g.edge_enable_italic = true
      vim.g.edge_dim_foreground = 1
      vim.g.edge_better_performance = 1
      vim.g.edge_dim_inactive_windows = 1
      vim.g.edge_diagnostic_text_highlight = 1
      vim.g.edge_menu_selection_background = "purple"
      -- vim.g.edge_menu_selection_background = "green"
      vim.g.edge_diagnostic_virtual_text = "highlighted"
    end,
  },
}
