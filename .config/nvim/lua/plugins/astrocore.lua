-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

--- @type LazySpec
return {
  "AstroNvim/astrocore",
  --- @type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    -- easily configure auto commands
    autocmds = {
      -- first key is the `augroup` (:h augroup)
      highlighturl = {
        -- list of auto commands to set
        {
          -- events to trigger
          event = { "VimEnter", "FileType", "BufEnter", "WinEnter" },
          -- the rest of the autocmd options (:h nvim_create_autocmd)
          desc = "URL Highlighting",
          callback = function() require("astrocore").set_url_match() end,
        },
      },
    },
    -- easily configure user commands
    commands = {
      -- key is the command name
      AstroReload = {
        -- first element with no key is the command (string or function)
        function() require("astrocore").reload() end,
        -- the rest are options for creating user commands (:h nvim_create_user_command)
        desc = "Reload AstroNvim (Experimental)",
      },
    },
    features = {
      large_buf = { size = 1024 * 500, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- easily configure functions on key press
    on_keys = {
      -- first key is the namespace
      auto_hlsearch = {
        -- list of functions to execute on key press (:h vim.on_key)
        function(char) -- example automatically disables `hlsearch` when not actively searching
          if vim.fn.mode() == "n" then
            local new_hlsearch = vim.tbl_contains({ "<CR>", "n", "N", "*", "#", "?", "/" }, vim.fn.keytrans(char))
            if vim.opt.hlsearch:get() ~= new_hlsearch then vim.opt.hlsearch = new_hlsearch end
          end
        end,
      },
    },
    -- Enable git integration for detached worktrees
    git_worktrees = {
      { toplevel = vim.env.HOME, gitdir = vim.env.HOME .. "/.dotfiles" },
    },
    -- Configure project root detection, check status with `:AstroRootInfo`
    rooter = {
      -- list of detectors in order of prevalence, elements can be:
      --   "lsp" : lsp detection
      --   string[] : a list of directory patterns to look for
      --   fun(bufnr: integer): string|string[] : a function that takes a buffer number and outputs detected roots
      detector = {
        "lsp", -- highest priority is getting workspace from running language servers
        { ".git", "_darcs", ".hg", ".bzr", ".svn" }, -- next check for a version controlled parent directory
        { "lua", "MakeFile", "package.json" }, -- lastly check for known project root files
      },
      -- ignore things from root detection
      ignore = {
        servers = {}, -- list of language server names to ignore (Ex. { "efm" })
        dirs = {}, -- list of directory patterns (Ex. { "~/.cargo/*" })
      },
      -- automatically update working directory (update manually with `:AstroRoot`)
      autochdir = false,
      -- scope of working directory to change ("global"|"tab"|"win")
      scope = "global",
      -- show notification on every working directory change
      notify = false,
    },
    -- Configuration table of session options for AstroNvim's session management powered by Resession
    sessions = {
      -- Configure auto saving
      autosave = {
        last = true, -- auto save last session
        cwd = true, -- auto save session for each working directory
      },
      -- Patterns to ignore when saving sessions
      ignore = {
        dirs = {}, -- working directories to ignore sessions in
        filetypes = { "gitcommit", "gitrebase" }, -- filetypes to ignore sessions
        buftypes = {}, -- buffer types to ignore sessions
      },
    },
    mappings = {
      n = {
        -- second key is the lefthand side of the map
        -- mappings seen under group name "Buffer"
        ["<Leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
        ["<Leader>bD"] = {
          function()
            require("astronvim.utils.status").heirline.buffer_picker(
              function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
            )
          end,
          desc = "Pick to close",
        },
        -- tables with the `name` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        ["<Leader>b"] = { name = "Buffers" },
        -- quick save
        ["<C-s>"] = { ":w!<cr>", desc = "Save File" }, -- change description but the same command
        [";"] = { ":", desc = "quick enter command mode" },
        ["<Leader>q"] = { "<cmd>q<cr>", desc = "Quit" },
        ["<Leader>c"] = {
          function()
            local bufs = vim.fn.getbufinfo { buflisted = true }
            require("astronvim.utils.buffer").close(0)
            if require("astronvim.utils").is_available "alpha-nvim" and not bufs[2] then
              require("alpha").start(true)
            end
          end,
          desc = "Close buffer",
        },
        -- navigate buffer tabs with `H` and `L`
        L = {
          function() require("astrocore.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
          desc = "Next buffer",
        },
        H = {
          function() require("astrocore.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
          desc = "Previous buffer",
        },
      },
      t = {
        -- setting a mapping to false will disable it
        ["<esc>"] = false,
      },
    },
    options = {
      opt = {
        relativenumber = true, -- sets vim.opt.relativenumber
        scrolloff = 8, --在光标上下各保存8行
        number = true, -- sets vim.opt.number
        numberwidth = 3, -- 设置行号宽度
        spell = false, -- sets vim.opt.spell
        signcolumn = "auto", -- sets vim.opt.signcolumn to auto
        wrap = false, -- sets vim.opt.wrap
        sidescrolloff = 8, -- 保留光标周围8列
        tabstop = 4,
        softtabstop = 4,
        expandtab = true,
        shiftwidth = 4,
        hlsearch = true,
        incsearch = true,
        autoread = true,
        autowrite = true,
        backspace = "indent,eol,start",
        -- whichwrap:append "<>[]hl",
        --- 禁止创建备份文件
        backup = false,
        swapfile = false,
        --- 显示不可见字符
        list = true,
        -- iskeyword:append { "$", "@-@", "%" },
        -- runtimepath:append { "~/.fzf" },
      },
      g = {
        mapleader = " ", -- sets vim.g.mapleader
        loaclleader = ",", -- sets vim.g.localleader
        autoformat_enabled = true, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
        cmp_enabled = true, -- enable completion at start
        autopairs_enabled = true, -- enable autopairs at start
        diagnostics_mode = 3, -- set the visibility of diagnostics in the UI (0=off, 1=only show in status line, 2=virtual text off, 3=all on)
        icons_enabled = true, -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
        ui_notifications_enabled = true, -- disable notifications when toggling UI elements
        resession_enabled = true, -- enable experimental resession.nvim session management (will be default in AstroNvim v4)
        encoding = "utf-8",
        heirline_bufferline = true, -- 启用heirline配置的bufferline
      },
    },
  },
}
