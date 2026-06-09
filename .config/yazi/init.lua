-- 显示文件大小和修改时间
function Linemode:size_and_mtime()
    local time = math.floor(self._file.cha.mtime or 0)
    if time == 0 then
        time = ""
    elseif os.date("%Y", time) == os.date("%Y") then
        time = os.date("%b %d %H:%M", time)
    else
        time = os.date("%b %d  %Y", time)
    end

    local size = self._file:size()
    return string.format("%s %s", size and ya.readable_size(size) or "-", time)
end

-- 在neovim中默认隐藏预览窗口
if os.getenv("NVIM") then
    require("toggle-pane"):entry("min-preview")
end

-- 挂载压缩文件
-- require("fuse-archive"):setup({
-- 	smart_enter = true,
-- 	mount_dir = "/media",
-- })

-- full-border
require("full-border"):setup({
    -- Available values: ui.Border.PLAIN, ui.Border.ROUNDED
    -- type = ui.Border.ROUNDED,
    type = ui.Border.PLAIN,
})

-- relative-motions
require("relative-motions"):setup({ show_numbers = "relative_absolute", show_motion = true, enter_mode = "first" })

-- yatline
-- yatline theme
local tokyo_night_theme = require("yatline-tokyo-night"):setup("strom")                                          -- or moon/storm/day/night
local dracula_theme = require("yatline-dracula"):setup()
local catppuccin_theme = require("yatline-catppuccin"):setup("frappe")                                           -- "mocha" | "latte" | "frappe" | "macchiato"
local gruvbox_material_theme = require("yatline-gruvbox-material"):setup({ mode = "light", toughness = "soft" }) -- "night" or "light" -- or "hard" | "medium" | "soft"
local gruvbox_theme = require("yatline-gruvbox"):setup("dark")                                                   -- "dark" | "light"
require("yatline"):setup({
    -- theme = dracula_theme,
    -- theme = tokyo_night_theme,
    -- theme = catppuccin_theme,
    -- theme = gruvbox_theme,
    theme = gruvbox_material_theme,
    -- section_separator = { open = "", close = "" },
    part_separator = { open = "", close = "" },
    -- inverse_separator = { open = "", close = "" },

    section_separator = { open = "", close = "" },
    -- part_separator = { open = "", close = "" },
    inverse_separator = { open = "", close = "" },

    tab_width = 20,
    tab_use_inverse = false,

    show_background = true,

    display_header_line = true,
    display_status_line = true,

    component_positions = { "header", "tab", "status" },

    header_line = {
        left = {
            section_a = {
                { type = "line", custom = false, name = "tabs", params = { "left" } },
            },
            section_b = {},
            section_c = {},
        },
        right = {
            section_a = {
                { type = "string", custom = false, name = "date", params = { "%A, %Y年%B%d日" } },
            },
            section_b = {
                { type = "string", custom = false, name = "date", params = { "%X" } },
            },
            section_c = {},
        },
    },

    status_line = {
        left = {
            section_a = {
                { type = "string", custom = false, name = "tab_mode" },
            },
            section_b = {
                { type = "string", custom = false, name = "hovered_size" },
            },
            section_c = {
                { type = "string",   custom = false, name = "hovered_path" },
                { type = "coloreds", custom = false, name = "count" },
            },
        },
        right = {
            section_a = {
                { type = "string", custom = false, name = "cursor_position" },
            },
            section_b = {
                { type = "string", custom = false, name = "cursor_percentage" },
            },
            section_c = {
                { type = "string",   custom = false, name = "hovered_file_extension", params = { true } },
                { type = "coloreds", custom = false, name = "permissions" },
            },
        },
    },
})

-- mux.yazi
require("mux"):setup({
    aliases = {
        eza_tree_1 = {
            previewer = "piper",
            args = {
                'cd "$1" && LS_COLORS="ex=32" eza --oneline --tree --level 1 --color=always --icons=always --group-directories-first --no-quotes .',
            },
        },
        eza_tree_2 = {
            previewer = "piper",
            args = {
                'cd "$1" && LS_COLORS="ex=32" eza --oneline --tree --level 2 --color=always --icons=always --group-directories-first --no-quotes .',
            },
        },
        eza_tree_3 = {
            previewer = "piper",
            args = {
                'cd "$1" && LS_COLORS="ex=32" eza --oneline --tree --level 3 --color=always --icons=always --group-directories-first --no-quotes .',
            },
        },
        eza_tree_4 = {
            previewer = "piper",
            args = {
                'cd "$1" && LS_COLORS="ex=32" eza --oneline --tree --level 4 --color=always --icons=always --group-directories-first --no-quotes .',
            },
        },
    },
})

-- gvfs.yazi
require("gvfs"):setup({
    which_keys = "1234567890qwertyuiopasdfghjklzxcvbnm-=[]\\;',./!@#$%^&*()_+{}|:\"<>?",

    blacklist_devices = { { name = "Wireless Device", scheme = "mtp" }, { scheme = "file" }, "Device Name" },

    save_path = os.getenv("HOME") .. "/.config/yazi/gvfs.private",

    save_path_automounts = os.getenv("HOME") .. "/.config/yazi/gvfs_automounts.private",

    input_position = { "center", y = 0, w = 60 },

    password_vault = "keyring",

    key_grip = "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB",

    save_password_autoconfirm = true,
})
