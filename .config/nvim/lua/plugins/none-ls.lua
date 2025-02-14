-- Customize None-ls sources

---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  enabled = false,
  opts = function(_, config)
    -- config variable is the default configuration table for the setup function call
    local null_ls = require "null-ls"

    -- Check supported formatters and linters
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    config.sources = {
      -- Set a formatter
      null_ls.builtins.formatting.stylua, -- lua formatter
      null_ls.builtins.formatting.prettier, -- shell, c formatter
      null_ls.builtins.formatting.prettierd, -- css, json, yaml, java formatter
      null_ls.builtins.formatting.black, -- python formatter
      null_ls.builtins.formatting.shfmt, -- sh formatter
      null_ls.builtins.formatting.markdownlint, -- markdown formatter
      null_ls.builtins.formatting.tidy, -- html, xml formatter
    }
    return config -- return final config table
  end,
}
