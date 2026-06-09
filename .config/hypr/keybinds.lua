require("variables")

hl.bind("SUPER + Return", hl.dsp.exec_cmd(terminal), { description = "App: Terminal(kitty)" })
hl.bind("SUPER + B", hl.dsp.exec_cmd("nyxt"), { description = "App: nyxt browser" })
hl.bind("SUPER + F", hl.dsp.exec_cmd(browser), { description = "App: browser(qutebrowser)" })
hl.bind("SUPER + Z", hl.dsp.exec_cmd("zen"), { description = "App: zen browser" })
hl.bind("SUPER + E", hl.dsp.exec_cmd(fileManager), { description = "App: 文件管理器(lf)" })
hl.bind("SUPER + R", hl.dsp.exec_cmd("pkill rofi || rofi -show drun -config $rofi_path/config.rasi"),
    { description = "Launcher: rofi" })
hl.bind("SUPER + X", hl.dsp.exec_cmd("fuzzel"), { description = "Launcher: fuzzel" })
hl.bind("SUPER + CTRL + V",
    hl.dsp.exec_cmd("pkill fuzzel || cliphist list | fuzzel --dmenu --with-nth 2 | cliphist decode | wl-copy"),
    { description = "粘贴复制(fuzzel选择器)" })
hl.bind("SUPER + SHIFT + P", hl.dsp.exec_cmd("hyprpicker | wl-copy"), { description = "App: 色彩拾取器" })
hl.bind("SUPER + SHIFT + V",
    hl.dsp.exec_cmd(
        "pkill rofi || cliphist list | rofi -dmenu -config $rofi_path/themes/clipboard.rasi| cliphist decode | wl-copy"),
    { description = "粘贴复制,(rofi选择器)" })
hl.bind("ALT_L + Return", hl.dsp.exec_cmd("ghostty"), { description = "App: Terminal(ghostty)" })
-- kitty快终端
hl.bind("SUPER + F1", hl.dsp.exec_cmd("'pgrep -f kitty-quick-access | xargs kill' || kitten quick-access-terminal"))
hl.bind("SUPER + F2", hl.dsp.exec_cmd("kitty kitten choose-files"),
    { description = "kitty快速选择文件" })

-- 截屏
hl.bind("SUPER + F6", hl.dsp.exec_cmd("caelestia screenshot -f -r ||" .. scripts .. "/screenshots.sh --window"),
    { locked = true, description = "窗口截屏" })
hl.bind("SUPER + F7", hl.dsp.exec_cmd("caelestia screenshot -r ||" .. scripts .. "/screenshots.sh --region"),
    { locked = true, description = "区域截屏" })
hl.bind("SUPER + F8", hl.dsp.exec_cmd("caelestia screenshot ||" .. scripts .. "/screenshots.sh --full"),
    { locked = true, description = "全屏截屏" })
hl.bind("SUPER + F9", hl.dsp.exec_cmd(scripts .. "/screenshots.sh --preview"),
    { locked = true, description = "预览截屏" })

-- 录屏
hl.bind("F6", hl.dsp.exec_cmd(scripts .. "/record.sh --fullscreen --sound"), { locked = true, description = "录屏(有声音)" })
hl.bind("F7", hl.dsp.exec_cmd(scripts .. "/record.sh --fullscreen"), { locked = true, description = "录屏(无声音)" })
hl.bind("F8", hl.dsp.exec_cmd(scripts .. "/record.sh"), { locked = true, description = "区域录屏" })
hl.bind("SUPER + F10", hl.dsp.pass({ window = "class:^(com\\.obsproject\\.Studio)$" }))

-- 窗口和会话管理
-- hl.bind("SUPER + Q", hl.dsp.exec_cmd(scripts .. "/dontkillsteam.sh"))
-- hl.bind("SUPER + C", hl.dsp.exec_cmd("$scripts/dontkillsteam.sh"))
hl.bind("SUPER + Q", hl.dsp.window.close(), { description = "关闭窗口" })
hl.bind("SUPER + C", hl.dsp.window.kill(), { description = "强制关闭窗口" })
hl.bind("SUPER + SHIFT + ALT + Q", hl.dsp.exec_cmd("hyprctl kill"), { description = "鼠标点击关闭窗口" })
hl.bind("SUPER + M", hl.dsp.exit())
hl.bind("CTRL + ALT + DELETE", hl.dsp.exec_cmd("sh -c ~/.config/rofi/scripts/powermenu/powermenu.sh"),
    { description = "登出菜单" })
hl.bind("CTRL + ALT + L", hl.dsp.exec_cmd("hyprlock"), { description = "锁屏" })


-- layout和窗口状态切换
hl.bind("SUPER + P", hl.dsp.window.pin(), { description = "锁定窗口" })
hl.bind("SUPER + V", hl.dsp.window.float({ action = "toggle" }), { description = "切换窗口状态: Float/Tile" })
hl.bind("SUPER + G", hl.dsp.group.toggle(), { description = "切换窗口分组" })
hl.bind("CTRL + SHIFT + F", hl.dsp.layout("preselect r"),
    { description = "l,r,u/t,d/b 切换当前窗口布局, 横屏和竖屏间切换, dwindle, master layout" })

hl.bind("ALT + F", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }),
    { description = "窗口最大化" })
hl.bind("ALT + SHIFT + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }),
    { description = "窗口全屏" })
hl.bind("F8", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }),
    { description = "窗口最大化" })
hl.bind("F9", hl.dsp.window.fullscreen_state({ internal = 0, client = 3, action = "toggle" }),
    { description = "窗口内全屏" })
hl.bind("F10", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }),
    { description = "窗口全屏" })
hl.bind("ALT + C", hl.dsp.window.center({ action = "toggle" }),
    { description = "窗口居中" })

-- To switch between windows in a floating workspace:
hl.bind("ALT + Tab", function()
    hl.dispatch(hl.dsp.window.cycle_next())   -- Change focus to another window
    hl.dispatch(hl.dsp.window.bring_to_top()) -- Bring it to the top
end)

-- 切换工作区
hl.bind("SUPER + U", hl.dsp.focus({ workspace = "r-1" }), { description = "切换到上一个工作区" })
hl.bind("SUPER + I", hl.dsp.focus({ workspace = "r+1" }), { description = "切换到下一个工作区" })
hl.bind("SUPER + 0", hl.dsp.focus({ workspace = "empty" }), { description = "切换到空闲工作区" })

hl.bind("SUPER + CTRL + left", hl.dsp.focus({ workspace = "r-1" }), { description = "切换到上一个工作区" })
hl.bind("SUPER + CTRL + right", hl.dsp.focus({ workspace = "r+1" }), { description = "切换到下一个工作区" })
hl.bind("SUPER + CTRL + down", hl.dsp.focus({ workspace = "empty" }), { description = "切换到空闲工作区" })

-- CTRL + F[1-10] 切换工作区
for i = 1, 10 do
    local arrowkey = { "F1", "F2", "F3", "F4", "F5", "F6", "F7", "F8", "F9", "F10" }
    local workspaceindex = { "1", "2", "3", "4", "5", "6", "7", "8", "9", "10" }
    hl.bind("CTRL + " .. arrowkey[i], hl.dsp.focus({ workspace = workspaceindex[i] }),
        { description = "workspace: Focus " .. arrowkey[i] })
end

-- 工作区间移动窗口
hl.bind("CTRL +SHIFT + left", hl.dsp.window.move({ workspace = "r-1" }), { description = "窗口移动到下一个工作区" })
hl.bind("CTRL +SHIFT + right", hl.dsp.window.move({ workspace = "r+1" }), { description = "窗口移动到上一个工作区" })
hl.bind("SUPER + CTRL + U", hl.dsp.window.move({ workspace = "r-1" }), { description = "窗口移动到下一个工作区" })
hl.bind("SUPER + CTRL + I", hl.dsp.window.move({ workspace = "r+1" }), { description = "窗口移动到上一个工作区" })

-- ALT + F[1-10] 移动窗口到工作区
for i = 1, 10 do
    local arrowkey = { "F1", "F2", "F3", "F4", "F5", "F6", "F7", "F8", "F9", "F10" }
    local workspaceindex = { "1", "2", "3", "4", "5", "6", "7", "8", "9", "10" }
    hl.bind("ALT + " .. arrowkey[i], hl.dsp.window.move({ workspace = workspaceindex[i] }),
        { description = "workspace: switch " .. arrowkey[i] })
end

-- #工作区内操作窗口
--#/# bind = SUPER + ←/↑/→/↓/h/k/l/j, -- Focus in direction
for i = 1, 8 do
    local arrowkey = { "h", "l", "k", "j", "Left", "Right", "Up", "Down" }
    local focusdir = { "l", "r", "u", "d", "l", "r", "u", "d" }
    hl.bind("SUPER + " .. arrowkey[i], hl.dsp.focus({ direction = focusdir[i] }),
        { description = "Window: Focus " .. arrowkey[i] })
end
for i = 1, 2 do
    local arrowkey = { "BracketLeft", "BracketRight" }
    local focusdir = { "l", "r" }
    hl.bind("SUPER + " .. arrowkey[i], hl.dsp.focus({ direction = focusdir[i] }))
end
--#/# bind = SUPER + ALT, ←/↑/→/↓, -- Move in direction
for i = 1, 4 do
    local arrowkey = { "Left", "Right", "Up", "Down" }
    local focusdir = { "l", "r", "u", "d" }
    hl.bind("SUPER + ALT + " .. arrowkey[i], hl.dsp.window.move({ direction = focusdir[i] }),
        { description = "Window: Move " .. arrowkey[i] })
end
-- bind = SUPER + ALT, /h/k/l/j, -- Swap in direction
for i = 1, 4 do
    local arrowkey = { "h", "l", "k", "j" }
    local focusdir = { "l", "r", "u", "d" }
    hl.bind("SUPER + ALT + " .. arrowkey[i], hl.dsp.window.swap({ direction = focusdir[i] }),
        { description = "Window: Swap " .. arrowkey[i] })
end

-- #调整窗口大小
-- Switch to a submap called `resize`.
hl.bind("ALT + R", hl.dsp.submap("resize"))

-- Start a submap called "resize".
hl.define_submap("resize", function()
    -- Set repeating binds for resizing the active window.
    hl.bind("right", hl.dsp.window.resize({ x = 10, y = 0, relative = true }), { repeating = true })
    hl.bind("left", hl.dsp.window.resize({ x = -10, y = 0, relative = true }), { repeating = true })
    hl.bind("up", hl.dsp.window.resize({ x = 0, y = 10, relative = true }), { repeating = true })
    hl.bind("down", hl.dsp.window.resize({ x = 0, y = -10, relative = true }), { repeating = true })

    -- Use `reset` to go back to the global submap
    hl.bind("escape", hl.dsp.submap("reset"))
end)


-- #鼠标
-- 切换工作区
hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e+1" }), { description = "切换到下一个工作区" })
hl.bind("SUPER + mouse_up", hl.dsp.focus({ workspace = "e-1" }), { description = "切换到上一个工作区" })

-- 鼠标控制窗口尺寸
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true, description = "Window: Move" })
hl.bind("SUPER + mouse:274", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true, description = "Window: Resize" })

-- 声音控制
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%+ -l 1.5"),
    { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-"),
    { locked = true, repeating = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_SINK@ toggle"), { locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_SOURCE@ toggle"), { locked = true })

-- 键盘背光控制
-- hl.bind("scroll_lock", hl.dsp.exec_cmd("brightnessctl –device='input3::scrolllock' set 1"))

-- 屏幕亮度控制
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("caelestia shell brightness set +0.03 || brightnessctl s 5%+"),
    { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("caelestia shell brightness set 0.03- || brightnessctl s 5%-"),
    { locked = true, repeating = true })

-- 不同layout绑定相同快捷键
local function layout_bind(bind_table)
    return function()
        local workspace = hl.get_active_special_workspace() or
            hl.get_active_workspace()

        if not workspace then
            return
        end

        local layout = workspace.tiled_layout

        if bind_table[layout] then
            hl.dispatch(bind_table[layout])
        end
    end
end

hl.bind("SUPER + A", layout_bind({
    scrolling = hl.dsp.layout("swapcol l"), -- Scrolling: swap column with left one
    dwindle   = hl.dsp.layout("swapsplit"), -- Dwindle: swap window split
    monocle   = hl.dsp.layout("cycleprev"), -- Monocle and master: cycle prev window
    master    = hl.dsp.layout("cycleprev"),
}))

hl.bind("SUPER + D", layout_bind({
    scrolling = hl.dsp.layout("swapcol r"),   -- Scrolling: swap column with right one
    dwindle   = hl.dsp.layout("togglesplit"), -- Dwindle: toggle window split
    monocle   = hl.dsp.layout("cyclenext"),   -- Monocle and master: cycle next window
    master    = hl.dsp.layout("cyclenext"),
}))

--##! Screen
--# Zoom
local function zoomfunction(value)
    local zoomvalue = hl.get_config("cursor:zoom_factor")
    if (zoomvalue + value) > 3.0 then
        hl.config({ cursor = { zoom_factor = 3.0 } })
    elseif (zoomvalue + value) < 1.0 then
        hl.config({ cursor = { zoom_factor = 1.0 } })
    else
        hl.config({ cursor = { zoom_factor = zoomvalue + value } })
    end
end
hl.bind("SUPER + Minus", function() zoomfunction(-0.3) end, { repeating = true, description = "Screen: Zoom out" })
hl.bind("SUPER + Equal", function() zoomfunction(0.3) end, { repeating = true, description = "Screen: Zoom in" })

--## Make window not amogus large
hl.bind("CTRL + SUPER + Backslash", hl.dsp.window.resize({ x = 640, y = 480, "exact" }))
