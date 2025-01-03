-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  -- bars-and-lines
  -- { import = "astrocommunity.bars-and-lines.bufferline-nvim" },
  { import = "astrocommunity.bars-and-lines.dropbar-nvim" },
  -- { import = "astrocommunity.bars-and-lines.feline-nvim" },
  -- { import = "astrocommunity.bars-and-lines.lualine-nvim" },
  -- { import = "astrocommunity.bars-and-lines.lualine-nvim" },
  -- { import = "astrocommunity.bars-and-lines.statuscol-nvim" },
  --
  -- code-runner
  { import = "astrocommunity.code-runner.overseer-nvim" },

  -- color
  { import = "astrocommunity.color.ccc-nvim" },
  { import = "astrocommunity.color.transparent-nvim" },

  -- colorscheme
  -- { import = "astrocommunity.colorscheme.bamboo-nvim" },
  -- { import = "astrocommunity.colorscheme.catppuccin" },
  -- { import = "astrocommunity.colorscheme.dracula-nvim" },
  -- { import = "astrocommunity.colorscheme.everforest" },
  -- { import = "astrocommunity.colorscheme.gruvbox-baby" },
  -- { import = "astrocommunity.colorscheme.kanagawa-nvim" },
  -- { import = "astrocommunity.colorscheme.nightfox-nvim" },
  -- { import = "astrocommunity.colorscheme.onedarkpro-nvim" },
  -- { import = "astrocommunity.colorscheme.oxocarbon-nvim" },
  -- { import = "astrocommunity.colorscheme.rose-pine" },
  -- { import = "astrocommunity.colorscheme.sonokai" },
  -- { import = "astrocommunity.colorscheme.tokyonight-nvim" },
  -- { import = "astrocommunity.colorscheme.vscode-nvim" },
  { import = "astrocommunity.colorscheme.aurora" },
  { import = "astrocommunity.colorscheme.bluloco-nvim" },
  { import = "astrocommunity.colorscheme.citruszest-nvim" },
  { import = "astrocommunity.colorscheme.cyberdream-nvim" },
  { import = "astrocommunity.colorscheme.melange-nvim" },
  { import = "astrocommunity.colorscheme.nordic-nvim" },
  { import = "astrocommunity.colorscheme.vim-dogrun" },
  { import = "astrocommunity.colorscheme.vim-moonfly-colors" },
  { import = "astrocommunity.colorscheme.vim-nightfly-colors" },

  -- completion
  { import = "astrocommunity.completion.cmp-cmdline" },
  { import = "astrocommunity.completion.codeium-vim" },
  -- { import = "astrocommunity.completion.avante-nvim" },
  --
  -- motion
  { import = "astrocommunity.motion.flash-nvim" },
  { import = "astrocommunity.motion.hop-nvim" },
  { import = "astrocommunity.motion.nvim-surround" },

  -- debug
  -- { import = "astrocommunity.debugging.nvim-dap-repl-highlights" },
  -- { import = "astrocommunity.debugging.nvim-dap-virtual-text" },
  -- { import = "astrocommunity.debugging.telescope-dap-nvim" },
  -- { import = "astrocommunity.debugging.persistent-breakpoints-nvim" },

  -- diagnostics
  { import = "astrocommunity.diagnostics.trouble-nvim" },

  -- editing-support
  -- { import = "astrocommunity.editing-support.multicursors-nvim" },
  -- { import = "astrocommunity.editing-support.nvim-treesitter-context" },
  { import = "astrocommunity.editing-support.rainbow-delimiters-nvim" },
  -- { import = "astrocommunity.editing-support.true-zen-nvim" },
  -- { import = "astrocommunity.editing-support.ultimate-autopair-nvim" },
  { import = "astrocommunity.editing-support.undotree" },
  -- { import = "astrocommunity.editing-support.vim-move" },
  { import = "astrocommunity.editing-support.yanky-nvim" },
  -- { import = "astrocommunity.editing-support.conform-nvim" },

  -- file-explorer
  -- { import = "astrocommunity.file-explorer.telescope-file-browser-nvim" },

  -- fuzzy-finder
  -- { import = "astrocommunity.fuzzy-finder.fzf-lua" },

  -- git
  -- { import = "astrocommunity.git.diffview-nvim" },
  -- { import = "astrocommunity.git.octo-nvim" },

  -- indent
  -- { import = "astrocommunity.indent.indent-blankline-nvim" },
  { import = "astrocommunity.indent.mini-indentscope" },

  -- markdown-and-latex
  -- { import = "astrocommunity.markdown-and-latex.markdown-preview-nvim" },
  -- { import = "astrocommunity.markdown-and-latex.vimtex" },
  -- { import = "astrocommunity.markdown-and-latex.markmap-nvim" },
  { import = "astrocommunity.markdown-and-latex.render-markdown-nvim" },
  -- { import = "astrocommunity.markdown-and-latex.markview-nvim" },

  -- AI completion
  -- lsp
  { import = "astrocommunity.lsp.lsp-signature-nvim" },
  { import = "astrocommunity.lsp.garbage-day-nvim" },
  -- note-taking
  -- { import = "astrocommunity.note-taking.neorg" },
  -- {
  --   "nvim-neorg/neorg",
  --   opts = {
  --     load = {
  --       ["core.dirman"] = {
  --         config = {
  --           workspaces = {
  --             notes = "~/笔记",
  --           },
  --         },
  --       },
  --     },
  --   },
  -- },

  -- pack
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.hyprlang" },

  -- project
  { import = "astrocommunity.project.projectmgr-nvim" },

  -- recipes
  { import = "astrocommunity.recipes.astrolsp-no-insert-inlay-hints" },
  -- { import = "astrocommunity.recipes.heirline-mode-text-statusline" },
  { import = "astrocommunity.recipes.telescope-nvchad-theme" },
  { import = "astrocommunity.recipes.telescope-lsp-mappings" },

  -- snippets
  -- { import = "astrocommunity.snippet.nvim-snippets" },

  -- utility
  { import = "astrocommunity.utility.noice-nvim" },
}
