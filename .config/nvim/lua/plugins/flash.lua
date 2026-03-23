return {
    "folke/flash.nvim",
    vscode = true,
    event = "VeryLazy",
    opts = {
        continue = true,
        search = {
            -- * exact: exact match
            -- * search: regular search
            -- * fuzzy: fuzzy search
            mode = "exact",
        },
        jump = {
            -- save location in the jumplist
            jumplist = true,
            -- jump position
            pos = "start", ---@type "start" | "end" | "range"
            -- clear highlight after jump
            nohlsearch = true,
            -- automatically jump when there is only one match
            autojump = true,
            -- 0: default
            -- 1: when pos == "end" and pos < current position
            offset = nil,
        },
        modes = {
            -- a regular search with `/` or `?`
            search = {
                -- when `true`, flash will be activated during regular search by default.
                -- You can always toggle when searching with `require("flash").toggle()`
                enabled = true,
            },
            -- `f`, `F`, `t`, `T`, `;` and `,` motions
            char = {
                enabled = true,
                -- hide after jump when not using jump labels
                autohide = true,
                -- show jump labels
                jump_labels = true,
                -- set to `false` to use the current line only
                multi_line = false,
                jump = {
                    -- when using jump labels, set to 'true' to automatically jump
                    -- or execute a motion when there is only one match
                    autojump = true,
                },
            },
            -- options used for treesitter selections
            -- `require("flash").treesitter()`
            treesitter = {
                label = { before = true, after = true, style = "overlay" },
                highlight = {
                    backdrop = false,
                    matches = false,
                },
            },
            treesitter_search = {
                remote_op = { restore = true },
                label = { before = true, after = true, style = "overlay" },
            },
        },
        label = {
            rainbow = {
                enabled = true,
            },
        },
    },
    keys = {
        {
            "s",
            mode = { "n", "x", "o" },
            function()
                require("flash").jump()
            end,
            desc = "Flash",
        },
        -- {
        --     "S",
        --     mode = { "n", "o", "x" },
        --     function()
        --         require("flash").treesitter()
        --     end,
        --     desc = "Flash Treesitter",
        -- },
        {
            "S",
            mode = { "n", "o", "x" },
            function()
                require("flash").treesitter({
                    actions = {
                        ["<SPACE>"] = "next",
                        ["<BS>"] = "prev"
                    }
                })
            end,
            desc = "Treesitter incremental selection",
        },
        {
            "r",
            mode = "o",
            function()
                require("flash").remote()
            end,
            desc = "Remote Flash",
        },
        {
            "R",
            mode = { "o", "x" },
            function()
                require("flash").treesitter_search()
            end,
            desc = "Treesitter Search",
        },
        {
            "<c-s>",
            mode = { "c" },
            function()
                require("flash").toggle()
            end,
            desc = "Toggle Flash Search",
        },
        {
            "<CR>",
            mode = { "n", "x", "o" },
            function()
                require("flash").jump({ continue = true })
            end,
            desc = "Flash continue last search",
        },
        {
            "f",
            mode = { "o" },
            function()
                require("flash").jump({
                    search = {
                        forward = true,
                    },
                    jump = {
                        inclusive = true,
                    },
                    -- doesn't do anything for now disable this at top level
                    modes = {
                        char = {
                            multi_line = false,
                        },
                    },
                })
            end,
            desc = "inseatd f motion",
        },
        {
            "t",
            mode = { "o" },
            function()
                require("flash").jump({
                    search = {
                        forward = true,
                    },
                    jump = {
                        inclusive = false,
                    },
                    modes = {
                        char = {
                            multi_line = false,
                        },
                    },
                })
            end,
            desc = "insetad t motion",
        },
        {
            "F",
            mode = { "o" },
            function()
                require("flash").jump({
                    search = {
                        forward = false,
                    },
                    jump = {
                        inclusive = true,
                    },
                    modes = {
                        char = {
                            multi_line = false,
                        },
                    },
                })
            end,
            desc = "insetad F motion",
        },
        {
            "T",
            mode = { "o" },
            function()
                require("flash").jump({
                    search = {
                        forward = false,
                    },
                    jump = {
                        inclusive = true,
                        offset = 1,
                    },
                    modes = {
                        char = {
                            multi_line = false,
                        },
                    },
                })
            end,
            desc = "insetad T motion",
        },
    },
}
