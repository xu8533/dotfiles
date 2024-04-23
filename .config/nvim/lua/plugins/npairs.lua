return { -- override nvim-autopairs plugin
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  config = function(plugin, opts)
    -- from https://github.com/windwp/nvim-autopairs/wiki/Completion-plugin
    local cmp = require "cmp"
    local cmp_autopairs = require "nvim-autopairs.completion.cmp"
    local ts_utils = require "nvim-treesitter.ts_utils"

    local ts_node_func_parens_disabled = {
      -- ecma
      named_imports = true,
      -- rust
      use_declaration = true,
    }

    local default_handler = cmp_autopairs.filetypes["*"]["("].handler
    cmp_autopairs.filetypes["*"]["("].handler = function(char, item, bufnr, rules, commit_character)
      local node_type = ts_utils.get_node_at_cursor():type()
      if ts_node_func_parens_disabled[node_type] then
        if item.data then
          item.data.funcParensDisabled = true
        else
          char = ""
        end
      end
      default_handler(char, item, bufnr, rules, commit_character)
    end

    cmp.event:on(
      "confirm_done",
      cmp_autopairs.on_confirm_done {
        sh = false,
      }
    )
    -- run default AstroNvim config
    require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
    -- require Rule function
    local npairs = require "nvim-autopairs"
    local Rule = require "nvim-autopairs.rule"
    local cond = require "nvim-autopairs.conds"
    local brackets = { { "(", ")" }, { "[", "]" }, { "{", "}" }, { "<", ">" } }
    npairs.add_rules {
      -- Rule for a pair with left-side ' ' and right side ' '
      Rule(" ", " ")
        -- Pair will only occur if the conditional function returns true
        :with_pair(function(opts)
          -- We are checking if we are inserting a space in (), [], or {}
          local pair = opts.line:sub(opts.col - 1, opts.col)
          return vim.tbl_contains({
            brackets[1][1] .. brackets[1][2],
            brackets[2][1] .. brackets[2][2],
            brackets[3][1] .. brackets[3][2],
          }, pair)
        end)
        :with_move(cond.none())
        :with_cr(cond.none())
        -- We only want to delete the pair of spaces when the cursor is as such: ( | )
        :with_del(function(opts)
          local col = vim.api.nvim_win_get_cursor(0)[2]
          local context = opts.line:sub(col - 1, col + 2)
          return vim.tbl_contains({
            brackets[1][1] .. "  " .. brackets[1][2],
            brackets[2][1] .. "  " .. brackets[2][2],
            brackets[3][1] .. "  " .. brackets[3][2],
          }, context)
        end),
    }
    -- For each pair of brackets we will add another rule
    for _, bracket in pairs(brackets) do
      npairs.add_rules {
        -- Each of these rules is for a pair with left-side '( ' and right-side ' )' for each bracket type
        Rule(bracket[1] .. " ", " " .. bracket[2])
          :with_pair(cond.none())
          :with_move(function(opts) return opts.char == bracket[2] end)
          :with_del(cond.none())
          :use_key(bracket[2])
          -- Removes the trailing whitespace that can occur without this
          :replace_map_cr(
            function(_) return "<C-c>2xi<CR><C-c>O" end
          ),
      }
    end
    -- npairs.add_rules {
    --   -- specify a list of rules to add
    --   Rule(" ", " "):with_pair(function(options)
    --     local pair = options.line:sub(options.col - 1, options.col)
    --     return vim.tbl_contains({ "()", "[]", "{}", "<>" }, pair)
    --   end),
    --   Rule("( ", " )")
    --     :with_pair(function() return false end)
    --     :with_move(function(options) return options.prev_char:match ".%)" ~= nil end)
    --     :use_key ")",
    --   Rule("{ ", " }")
    --     :with_pair(function() return false end)
    --     :with_move(function(options) return options.prev_char:match ".%}" ~= nil end)
    --     :use_key "}",
    --   Rule("[ ", " ]")
    --     :with_pair(function() return false end)
    --     :with_move(function(options) return options.prev_char:match ".%]" ~= nil end)
    --     :use_key "]",
    --   Rule("< ", " >")
    --     :with_pair(function() return false end)
    --     :with_move(function(options) return options.prev_char:match ".%>" ~= nil end)
    --     :use_key ">",
    --   -- Rule("$", "$", { "tex", "latex" })
    --   --   -- don't add a pair if the next character is %
    --   --   :with_pair(cond.not_after_regex "%%")
    --   --   -- don't add a pair if  the previous character is xxx
    --   --   :with_pair(cond.not_before_regex("xxx", 3))
    --   --   -- don't move right when repeat character
    --   --   :with_move(cond.none())
    --   --   -- don't delete if the next character is xx
    --   --   :with_del(cond.not_after_regex "xx")
    --   --   -- disable adding a newline when you press <cr>
    --   --   :with_cr(cond.none()),
    -- }
  end,
}
