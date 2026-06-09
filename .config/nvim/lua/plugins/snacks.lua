local header = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
]]
local pos
local cwd = vim.fn.getcwd(0)
if cwd and cwd:find("obsidian") then
    header = [[
                   ----
                --------
              ----------  --
           ------------  -----
        -------------   -------
       -------------   ----------
       ------------   ------------
       ------------  -------------
        -----------  -------------
      -   ---------  --------------
     ----  --------  --------------
    ------   ------   ---------------
   --------   -----     --------------
  ----------      ------     -----------
 ------------  --------------   --------
-------------  ----------------   ----
 ------------  ------------------  --
   ----------  -------------------
      ------  --------------------
        ---   -------------------
            ---------------------
                       ---------
  ]]
    pos = 2
end

return {
    {
        "folke/snacks.nvim",
        opts = {
            animate = {
                easing = "circle",
                fps = 60,
            },
            dashboard = {
                enabled = true,
                preset = {
                    pick = "fzf-lua",
                    keys = {
                        { icon = " ", key = "f", desc = "查找文件", action = ":lua Snacks.dashboard.pick('files')" },
                        { icon = " ", key = "n", desc = "新建文件", action = ":ene | startinsert" },
                        { icon = " ", key = "g", desc = "搜索内容", action = ":lua Snacks.dashboard.pick('live_grep')" },
                        { icon = " ", key = "r", desc = "最近文件", action = ":lua Snacks.dashboard.pick('oldfiles')" },
                        { icon = " ", key = "s", desc = "恢复会话", section = "session" },
                        {
                            icon = " ",
                            key = "c",
                            desc = "配置neovim",
                            action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
                        },
                        { icon = " ", key = "q", desc = "退出neovim", action = ":qa" },
                    },
                    header = header,
                },
                formats = {
                    key = function(item)
                        return { { "[", hl = "special" }, { item.key, hl = "key" }, { "]", hl = "special" } }
                    end,
                },
                sections = {
                    { section = "header" },
                    {
                        pane = 2,
                        section = "terminal",
                        -- cmd = "colorscript -e zwaves",
                        cmd = "sh ~/.local/share/asciiart/square",
                        height = 5,
                        padding = 1,
                    },
                    {
                        pane = pos,
                        section = "keys",
                        gap = 1,
                        padding = 1,
                    },
                    {
                        pane = 2,
                        icon = " ",
                        title = "最近编辑文件",
                        section = "recent_files",
                        indent = 2,
                        padding = 2,
                    },
                    {
                        pane = 2,
                        icon = " ",
                        title = "工程",
                        section = "projects",
                        indent = 2,
                        padding = 1,
                    },
                    {
                        pane = 2,
                        icon = " ",
                        title = "Git Status",
                        section = "terminal",
                        enabled = function()
                            return Snacks.git.get_root() ~= nil
                        end,
                        cmd = "git status --short --branch --renames",
                        height = 5,
                        padding = 1,
                        ttl = 5 * 60,
                        indent = 3,
                    },
                    { section = "startup" },
                },
            },
            dim = { enabled = true },
            image = {
                enabled = true,
                doc = {
                    enabled = true,
                    inline = false,
                    float = true,
                    max_width = 80,
                    max_height = 40
                },
            },
            input = {
                enabled = false,
                icon = " ",
                icon_hl = "SnacksInputIcon",
                icon_pos = "left",
                prompt_pos = "title",
                win = { style = "input" },
                expand = true,
            },
            indent = {
                enabled = true,
                char = "┇",
                hl = {
                    "SnacksIndent1",
                    "SnacksIndent2",
                    "SnacksIndent3",
                    "SnacksIndent4",
                    "SnacksIndent5",
                    "SnacksIndent6",
                    "SnacksIndent7",
                    "SnacksIndent8",
                },
                indent = {
                    enabled = false,
                },
                chunk = {
                    enabled = true,
                    hl = "SnacksIndentChunk", ---@type string|string[] hl group for chunk scopes
                    char = {
                        -- corner_top = "┌",
                        -- corner_bottom = "└",
                        corner_top = "╭",
                        corner_bottom = "╰",
                        horizontal = "─",
                        vertical = "│",
                        arrow = ">",
                    },
                },
                scope = {
                    enabled = true,       -- enable highlighting the current scope
                    char = "┇",
                    underline = false,    -- underline the start of the scope
                    only_current = false, -- only show scope in the current window
                    hl = "SnacksIndentScope", ---@type string|string[] hl group for scopes
                },
            },
            explorer = { enabled = true },
            picker = {
                enabled = true,
                -- from flash.nvim
                win = {
                    input = {
                        keys = {
                            ["<a-s>"] = { "flash", mode = { "n", "i" } },
                            ["s"] = { "flash" },
                        },
                    },
                },
                actions = {
                    flash = function(picker)
                        require("flash").jump({
                            pattern = "^",
                            label = { after = { 0, 0 } },
                            search = {
                                mode = "search",
                                exclude = {
                                    function(win)
                                        return vim.bo[vim.api.nvim_win_get_buf(win)].filetype ~= "snacks_picker_list"
                                    end,
                                },
                            },
                            action = function(match)
                                local idx = picker.list:row2idx(match.pos[1])
                                picker.list:_move(idx, true, true)
                            end,
                        })
                    end,
                },
            },
            lazygit = { enabled = true },
            notifier = { enabled = true },
            quickfile = { enabled = true },
            scope = { enabled = true },
            scroll = { enabled = true },
            statuscolumn = {
                enabled = true,
                left = { "mark", "sign" }, -- priority of signs on the left (high to low)
                right = { "fold", "git" }, -- priority of signs on the right (high to low)
                folds = {
                    open = true,           -- show open fold icons
                    git_hl = false,        -- use Git Signs hl for fold icons
                },
                git = {
                    -- patterns to match Git signs
                    patterns = { "GitSign", "MiniDiffSign" },
                },
                refresh = 50, -- refresh at most every 50ms
            },
            styles = {
                snacks_image = {
                    -- border = "rounded",
                    border = true,
                    backdrop = false,
                },
            },
            terminal = {
                enabled = true,
                -- win = { style = "float" }
                win = { style = "terminal" }
            },
            toggle = { enabled = true },
            win = { enabled = true },
            words = { enabled = true },
            zen = { enabled = true },
        },
    },
}
