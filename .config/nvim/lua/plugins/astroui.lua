-- AstroUI provides the basis for configuring the AstroNvim User Interface
-- Configuration documentation can be found with `:h astroui`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astroui",
  ---@type AstroUIOpts
  opts = {
    -- change colorscheme
    -- colorscheme = "astrodark",
    -- AstroUI allows you to easily modify highlight groups easily for any and all colorschemes
    highlights = {
      init = { -- this table overrides highlights in all themes
        -- Normal = { bg = "#000000" },
      },
      astrotheme = { -- a table of overrides/changes when applying the astrotheme theme
        -- Normal = { bg = "#000000" },
      },
    },
    -- Icons can be configured throughout the interface
    icons = {
      -- configure the loading of the lsp in the status line
      -- LSPLoading1 = "⠋",
      -- LSPLoading2 = "⠙",
      -- LSPLoading3 = "⠹",
      LSPLoading4 = "⠸",
      LSPLoading5 = "⠼",
      LSPLoading6 = "⠴",
      LSPLoading7 = "⠦",
      LSPLoading8 = "⠧",
      LSPLoading9 = "⠇",
      LSPLoading10 = "⠏",
      ActiveLSP = "",
      ActiveTS = "",
      ArrowLeft = "",
      ArrowRight = "",
      BufferClose = "󰅖",
      DapBreakpoint = "",
      DapBreakpointCondition = "",
      DapBreakpointRejected = "",
      DapLogPoint = ".>",
      DapStopped = "󰁕",
      DefaultFile = "󰈙",
      Diagnostic = "󰒡",
      DiagnosticError = "",
      DiagnosticHint = "󰌵",
      DiagnosticInfo = "󰋼",
      DiagnosticWarn = "",
      Ellipsis = "…",
      FileModified = "",
      FileReadOnly = "",
      FoldClosed = "",
      FoldOpened = "",
      FoldSeparator = " ",
      FolderClosed = "",
      FolderEmpty = "",
      FolderOpen = "",
      Git = "󰊢",
      GitAdd = "",
      GitBranch = "",
      GitChange = "",
      GitConflict = "",
      GitDelete = "",
      GitIgnored = "◌",
      GitRenamed = "➜",
      GitStaged = "✓",
      GitUnstaged = "✗",
      GitUntracked = "★",
      LSPLoaded = "",
      LSPLoading1 = "",
      LSPLoading2 = "󰀚",
      LSPLoading3 = "",
      MacroRecording = "",
      Paste = "󰅌",
      Search = "",
      Selected = "❯",
      Spellcheck = "󰓆",
      TabClose = "󰅙",
    },
    -- A table of only text "icons" used when icons are disabled
    text_icons = {
      ActiveLSP = "LSP:",
      ArrowLeft = "<",
      ArrowRight = ">",
      BufferClose = "x",
      DapBreakpoint = "B",
      DapBreakpointCondition = "C",
      DapBreakpointRejected = "R",
      DapLogPoint = "L",
      DapStopped = ">",
      DefaultFile = "[F]",
      DiagnosticError = "X",
      DiagnosticHint = "?",
      DiagnosticInfo = "i",
      DiagnosticWarn = "!",
      Ellipsis = "...",
      FileModified = "*",
      FileReadOnly = "[lock]",
      FoldClosed = "+",
      FoldOpened = "-",
      FoldSeparator = " ",
      FolderClosed = "[D]",
      FolderEmpty = "[E]",
      FolderOpen = "[O]",
      GitAdd = "[+]",
      GitChange = "[/]",
      GitConflict = "[!]",
      GitDelete = "[-]",
      GitIgnored = "[I]",
      GitRenamed = "[R]",
      GitStaged = "[S]",
      GitUnstaged = "[U]",
      GitUntracked = "[?]",
      MacroRecording = "Recording:",
      Paste = "[PASTE]",
      Search = "?",
      Selected = "*",
      Spellcheck = "[SPELL]",
      TabClose = "X",
    },
    -- Configuration options for the AstroNvim lines and bars built with the `status` API.
    status = {
      -- Configure attributes of components defined in the `status` API. Check the AstroNvim documentation for a complete list of color names, this applies to colors that have `_fg` and/or `_bg` names with the suffix removed (ex. `git_branch_fg` as attributes from `git_branch`).
      attributes = {
        buffer_active = { bold = true, italic = true },
        buffer_picker = { bold = true },
        macro_recording = { bold = true },
        git_branch = { bold = true },
        git_diff = { bold = true },
      },
      -- Configure colors of components defined in the `status` API. Check the AstroNvim documentation for a complete list of color names.
      colors = {
        git_branch_fg = "#ABCDEF",
      },
      -- Configure which icons that are highlighted based on context
      icon_highlights = {
        -- enable or disable breadcrumb icon highlighting
        breadcrumbs = false,
        -- Enable or disable the highlighting of filetype icons both in the statusline and tabline
        file_icon = {
          tabline = function(self) return self.is_active or self.is_visible end,
          statusline = true,
          winbar = false,
        },
      },
      -- Configure characters used as separators for various elements
      separators = {
        none = { "", "" },
        left = { "", "  " },
        right = { "  ", "" },
        center = { "  ", "  " },
        tab = { "", "" },
        breadcrumbs = "  ",
        path = "  ",
      },
    },
  },
}