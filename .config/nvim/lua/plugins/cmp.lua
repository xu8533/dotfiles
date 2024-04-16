-- 检查是否已经有输入的单词
-- local function has_words_before()
--   local line, col = (unpack or table.unpack)(vim.api.nvim_win_get_cursor(0))
--   return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
-- end

return { -- override nvim-cmp plugin
  "hrsh7th/nvim-cmp",
  keys = { ":", "/", "?" }, -- lazy load cmp on more keys along with insert mode
  dependencies = {
    "hrsh7th/cmp-emoji", -- add cmp source as dependency of cmp
    "hrsh7th/cmp-cmdline", -- add cmp-cmdline as dependency of cmp
    "hrsh7th/cmp-nvim-lua", -- add cmp-nvim-lua as dependency of cmp
    "hrsh7th/cmp-calc", -- add cmp-cacl as dependency of cmp
    "kdheepak/cmp-latex-symbols", -- add cmp-latex-symbols as dependency of cmp
  },
  -- return the new table to be used
  -- override the options table that is used in the `require("cmp").setup()` call
  opts = function(_, opts)
    -- config = function(plugin, opts)
    local cmp = require "cmp"
    -- run cmp setup
    cmp.setup(opts)

    cmp.setup.cmdline("/", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" },
      },
    })
    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "path" },
      }, {
        {
          name = "cmdline",
          option = {
            ignore_cmds = { "Man", "!" },
          },
        },
      }),
    })
    -- 读入astronvim的默认配置, 并加载新配置
    -- astro.extend_tbl(opts, {
    opts.preselect = cmp.PreselectMode.Item
    -- modify the sources part of the options table
    opts.sources = cmp.config.sources {
      { name = "nvim_lsp", priority = 1000 },
      { name = "luasnip", priority = 750 },
      {
        name = "buffer",
        priority = 500,
        option = {
          get_bufnrs = function() return vim.api.nvim_list_bufs() end,
        },
      },
      { name = "path", priority = 250 },
      { name = "emoji", priority = 700 }, -- add emoji source
      { name = "nvim_lua", priority = 700 }, -- add lua source
      {
        name = "latex_symbols",
        priority = 700,
        option = { strategy = 0 },
      }, -- add latex symbols source
      { name = "calc", priority = 650 }, -- add calc source
    }
    -- opts.completion = {
    --   -- 自动选中第一条
    --   completeopt = "menu,menuone,noinsert",
    -- }
    -- -- 光标处弹出补全框
    -- opts.view = { entries = { name = "custom", selection_order = "near_cursor" } },
    -- -- 补全框样式
    -- opts.window = {
    --   completion = {
    --     -- winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
    --     winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
    --     col_offset = -3,
    --     side_padding = 0,
    --   },
    -- },
    -- opts.formatting = {
    --   fields = { "kind", "abbr", "menu" },
    --   format = function(entry, vim_item)
    --     local kind = require("lspkind").cmp_format { mode = "symbol_text", maxwidth = 50 }(entry, vim_item)
    --     local strings = vim.split(kind.kind, "%s", { trimempty = true })
    --     kind.kind = " " .. (strings[1] or "") .. " "
    --     kind.menu = "    (" .. (strings[2] or "") .. ")"
    --     return kind
    --   end,
    -- },
    -- opts.mapping = {
    --   -- intellij输入方式
    --   ["<Tab>"] = cmp.mapping(function(fallback)
    --     -- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
    --     if cmp.visible() then
    --       local entry = cmp.get_selected_entry()
    --       if not entry then
    --         cmp.select_next_item { behavior = cmp.SelectBehavior.Select }
    --       else
    --         cmp.confirm()
    --       end
    --     else
    --       fallback()
    --     end
    --   end, { "i", "s", "c" }),
    --   ["<CR>"] = cmp.mapping {
    --     i = function(fallback)
    --       if cmp.visible() and cmp.get_active_entry() then
    --         cmp.confirm { behavior = cmp.ConfirmBehavior.Replace, select = false }
    --       else
    --         fallback()
    --       end
    --     end,
    --     s = cmp.mapping.confirm { select = true },
    --     c = cmp.mapping.confirm { behavior = cmp.ConfirmBehavior.Replace, select = true },
    --   },
    -- }
    return opts
  end,
  -- idea输入方式
  -- ["<Tab>"] = cmp.mapping(function(fallback)
  --   if cmp.visible() then
  --     local entry = cmp.get_selected_entry()
  --     if not entry then
  --       cmp.select_next_item { behavior = cmp.SelectBehavior.Select }
  --     else
  --       if has_words_before() then
  --         cmp.confirm {
  --           behavior = cmp.ConfirmBehavior.Insert,
  --           select = false,
  --         }
  --       end
  --     end
  --   else
  --     fallback()
  --   end
  -- end, { "i", "s", "c" }),
  -- ["<S-Tab>"] = cmp.config.disable,
}
