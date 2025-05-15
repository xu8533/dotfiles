return {
  {
    "ribru17/bamboo.nvim",
    lazy = true,
    priority = 1000,
    opts = {
      toggle_style_key = "<LocalLeader>ts",
      toggle_style_list = { "vulgaris", "multiplex", "light" },
      dim_inactive = true,
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
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = true,
    opts = {
      integrations = {
        aerial = true,
        alpha = true,
        cmp = true,
        dashboard = true,
        flash = true,
        fzf = true,
        grug_far = true,
        gitsigns = true,
        headlines = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        leap = true,
        lsp_trouble = true,
        mason = true,
        markdown = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        navic = { enabled = true, custom_bg = "lualine" },
        neotest = true,
        neotree = true,
        noice = true,
        notify = true,
        semantic_tokens = true,
        snacks = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        which_key = true,
      },
    },
    specs = {
      {
        "akinsho/bufferline.nvim",
        optional = true,
        opts = function(_, opts)
          if (vim.g.colors_name or ""):find("catppuccin") then
            opts.highlights = require("catppuccin.groups.integrations.bufferline").get()
          end
        end,
      },
    },
  },
  {
    "Mofiqul/dracula.nvim",
    lazy = true,
  },
  {
    "projekt0n/github-nvim-theme",
    lazy = true,
  },
  {
    "ellisonleao/gruvbox.nvim",
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
      functionStyle = { bold = true },
      background = { -- map the value of 'background' option to a theme
        dark = "wave", -- try "dragon" !
        light = "lotus",
      },
      --  transparent Floating Windows
      overrides = function(colors)
        local theme = colors.theme
        -- Tint background of diagnostic messages with their foreground color
        local makeDiagnosticColor = function(color)
          local c = require("kanagawa.lib.color")
          return { fg = color, bg = c(color):blend(theme.ui.bg, 0.95):to_hex() }
        end
        return {
          NormalFloat = { bg = "none" },
          FloatBorder = { bg = "none" },
          FloatTitle = { bg = "none" },

          -- Save an hlgroup with dark background and dimmed foreground
          -- so that you can use it where your still want darker windows.
          -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
          NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

          -- Popular plugins that open floats will link to NormalFloat by default;
          -- set their background accordingly if you wish to keep them dark and borderless
          LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
          MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
          -- Block-like modern Telescope UI
          TelescopeTitle = { fg = theme.ui.special, bold = true },
          TelescopePromptNormal = { bg = theme.ui.bg_p1 },
          TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
          TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
          TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
          TelescopePreviewNormal = { bg = theme.ui.bg_dim },
          TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
          -- More uniform colors for the popup menu
          Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
          PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
          PmenuSbar = { bg = theme.ui.bg_m1 },
          PmenuThumb = { bg = theme.ui.bg_p2 },
          -- Tint background of diagnostic messages with their foreground color
          DiagnosticVirtualTextHint = makeDiagnosticColor(theme.diag.hint),
          DiagnosticVirtualTextInfo = makeDiagnosticColor(theme.diag.info),
          DiagnosticVirtualTextWarn = makeDiagnosticColor(theme.diag.warning),
          DiagnosticVirtualTextError = makeDiagnosticColor(theme.diag.error),
        }
      end,
    },
  },
  {
    "sho-87/kanagawa-paper.nvim",
    enabled = false,
    lazy = true,
    opts = {},
  },
  {
    "EdenEast/nightfox.nvim",
    lazy = true,
    opts = {
      options = {
        module_default = false,
        modules = {
          aerial = true,
          cmp = true,
          ["dap-ui"] = true,
          dashboard = true,
          diagnostic = true,
          gitsigns = true,
          native_lsp = true,
          neotree = true,
          notify = true,
          symbol_outline = true,
          telescope = true,
          treesitter = true,
          whichkey = true,
        },
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
      groups = { all = { NormalFloat = { link = "Normal" } } },
    },
  },
  {
    "oxfist/night-owl.nvim",
    enabled = false,
    lazy = true,
  },
  {
    "navarasu/onedark.nvim",
    lazy = true,
    priority = 1000, -- Ensure it loads first
    enabled = false,
    -- specs = {
    --   { "olimorris/onedarkpro.nvim", optional = true, enabled = false },
    -- },
    opts = {
      -- style = "dark",
      -- style = "darker",
      -- style = "cool",
      -- style = "deep",
      -- style = "warm",
      style = "warmer",
      -- style = "light",
      toggle_style_key = "<LocalLeader>ts",
      code_style = {
        comments = "italic",
        keywords = "bold,italic",
        functions = "italic",
        strings = "none",
        variables = "none",
      },
    },
  },
  {
    "olimorris/onedarkpro.nvim",
    -- enabled = false,
    lazy = true,
    opts = {
      highlights = {
        Comment = { italic = true },
        Directory = { bold = true },
        ErrorMsg = { italic = true, bold = true },
      },
      styles = {
        types = "NONE",
        methods = "bold",
        numbers = "NONE",
        strings = "NONE",
        comments = "italic",
        keywords = "bold,italic",
        constants = "NONE",
        functions = "italic",
        operators = "NONE",
        variables = "NONE",
        parameters = "NONE",
        conditionals = "italic",
        virtual_text = "NONE",
      },
      plugins = { -- Override which plugin highlight groups are loaded
        aerial = true,
        barbar = false,
        codecompanion = false,
        copilot = false,
        dashboard = false,
        flash_nvim = true,
        gitsigns = true,
        hop = true,
        indentline = true,
        leap = false,
        lsp_saga = true,
        lsp_semantic_tokens = true,
        marks = false,
        mini_indentscope = true,
        neotest = true,
        neo_tree = true,
        nvim_cmp = true,
        nvim_bqf = true,
        nvim_dap = true,
        nvim_dap_ui = true,
        nvim_hlslens = false,
        nvim_lsp = true,
        nvim_navic = false,
        nvim_notify = true,
        nvim_tree = false,
        nvim_ts_rainbow = true,
        op_nvim = false,
        packer = false,
        persisted = false,
        polygot = false,
        rainbow_delimiters = true,
        render_markdown = true,
        startify = false,
        telescope = true,
        toggleterm = true,
        treesitter = true,
        trouble = true,
        vim_ultest = false,
        which_key = true,
        vim_dadbod_ui = false,
      },
      options = {
        cursorline = true,
        transparency = false,
        highlight_inactive_windows = true,
      },
    },
  },
  {
    "nyoom-engineering/oxocarbon.nvim",
    lazy = true,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
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
    "tiagovla/tokyodark.nvim",
    enabled = false,
    lazy = true,
  },
  {
    "Mofiqul/vscode.nvim",
    enabled = false,
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
    -- enabled = false,
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
  {
    "NLKNguyen/papercolor-theme",
    lazy = true,
    config = function()
      vim.cmd([[colorscheme PaperColor]])
      vim.cmd([[set background=dark]])
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "bamboo",
      -- colorscheme = "bamboo-light",
      -- colorscheme = "bamboo-multiplex",
      -- colorscheme = "bamboo-vulgaris",
      -- colorscheme = "catppuccin-frappe",
      -- colorscheme = "catppuccin-macchiato",
      -- colorscheme = "catppuccin-mocha",
      -- colorscheme = "dracula",
      -- colorscheme = "vscode",
      -- colorscheme = "gruvbox",
      -- colorscheme = "gruvbox-baby",
      -- colorscheme = "gruvbox-material",
      -- colorscheme = "kanagawa-dragon",
      -- colorscheme = "kanagawa-lotus",
      -- colorscheme = "kanagawa-wave",
      -- colorscheme = "kanagawa-paper",
      -- colorscheme = "carbonfox",
      -- colorscheme = "duskfox",
      -- colorscheme = "nightfox",
      -- colorscheme = "terafox",
      -- colorscheme = "github_dark",
      -- colorscheme = "github_dark_dimmed",
      -- colorscheme = "github_dark_colorblind",
      -- colorscheme = "github_dark_tritanopia",
      -- colorscheme = "github_dark_high_contrast",
      -- colorscheme = "github_light",
      -- colorscheme = "github_light_colorblind",
      -- colorscheme = "github_light_tritanopia",
      -- colorscheme = "github_light_high_contrast",
      -- colorscheme = "nordfox",
      -- colorscheme = "night-owl",
      -- colorscheme = "onelight",
      -- colorscheme = "onedark",
      -- colorscheme = "onedark_vivid",
      -- colorscheme = "onedark_dark",
      -- colorscheme = "oxocarbon",
      -- colorscheme = "PaperColor",
      colorscheme = "rose-pine-moon",
      -- colorscheme = "rose-pine-main",
      -- colorscheme = "tokyonight-day",
      -- colorscheme = "tokyonight",
      -- colorscheme = "tokyonight-moon",
      -- colorscheme = "tokyonight-night",
      -- colorscheme = "tokyonight-storm",
      -- colorscheme = "tokyodark",
      -- colorscheme = "sonokai",
      -- colorscheme = "everforest",
      -- colorscheme = "edge",
      -- colorscheme = "aurora",
      -- colorscheme = "bluloco-dark",
      -- colorscheme = "bluloco-light",
      -- colorscheme = "citruszest",
      -- colorscheme = "cyberdream",
      -- colorscheme = "melange",
      -- colorscheme = "melange",
      -- colorscheme = "nordic",
      -- colorscheme = "dogrun",
      -- colorscheme = "nightfly",
    },
  },
}
