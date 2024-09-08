return { -- override nvim-autopairs plugin
  "windwp/nvim-autopairs",
  config = function(plugin, opts)
    -- run default AstroNvim config
    require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts)
    -- require Rule function
    local Rule = require "nvim-autopairs.rule"
    local npairs = require "nvim-autopairs"
    npairs.add_rules {
      {
        -- specify a list of rules to add
        Rule(" ", " "):with_pair(function(options)
          local pair = options.line:sub(options.col - 1, options.col)
          return vim.tbl_contains({ "()", "[]", "{}" }, pair)
        end),
        Rule("( ", " )")
          :with_pair(function() return false end)
          :with_move(function(options) return options.prev_char:match ".%)" ~= nil end)
          :use_key ")",
        Rule("{ ", " }")
          :with_pair(function() return false end)
          :with_move(function(options) return options.prev_char:match ".%}" ~= nil end)
          :use_key "}",
        Rule("[ ", " ]")
          :with_pair(function() return false end)
          :with_move(function(options) return options.prev_char:match ".%]" ~= nil end)
          :use_key "]",
      },
    }
  end,
}
