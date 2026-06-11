-- ######## Window rules ########

-- 设置tag
hl.window_rule({ match = { class = "^(clash-verge)$" }, tag = "+vpn" })
hl.window_rule({ match = { class = "(.*)(wireshark)(.*)" }, tag = "+network" })
hl.window_rule({ match = { class = "^(zen-browser)$" }, tag = "+web_browser" })
hl.window_rule({ match = { class = "^(.*qutebrowser.*)$" }, tag = "+web_browser" })
hl.window_rule({ match = { title = "^(qutebrowser-editor)" }, tag = "+web_browser" })
hl.window_rule({ match = { class = "^(nyxt)$" }, tag = "+web_browser" })
hl.window_rule({ match = { class = "^(?:LF)$" }, tag = "+file_manager" })
hl.window_rule({ match = { class = "^(?:Yazi)$" }, tag = "+file_manager" })
hl.window_rule({ match = { class = "^(?:[tT]hunar)$" }, tag = "+file_manager" })
hl.window_rule({ match = { class = "^(?:.*[nN]autilus)$" }, tag = "+file_manager" })
hl.window_rule({ match = { class = "^(kitty)$" }, tag = "+term" })
hl.window_rule({ match = { initial_title = "^(ghostty)$" }, tag = "+term" })
hl.window_rule({ match = { class = "^(mpv)$" }, tag = "+multi_media" })
hl.window_rule({ match = { class = "^(MPlayer)$" }, tag = "+multi_media" })
hl.window_rule({ match = { class = "^(bilibili)$" }, tag = "+multi_media" })
hl.window_rule({ match = { class = "^(com.obsproject.Studio)$" }, tag = "+screen_share" })
hl.window_rule({ match = { class = "^(wps)$" }, tag = "+office" })
hl.window_rule({ match = { class = "^(pdf)$" }, tag = "+office" })
hl.window_rule({ match = { class = "^(wpp|et)$" }, tag = "+office" })
hl.window_rule({ match = { class = "^(soffice)$" }, tag = "+office" })
hl.window_rule({ match = { class = "^(.*libreoffice.*)$" }, tag = "+office" })
hl.window_rule({ match = { class = "^(obsidian)$" }, tag = "+notebook" })
hl.window_rule({ match = { class = "^(gpick)$" }, tag = "+picker" })
hl.window_rule({ match = { class = "^(gcolor3)$" }, tag = "+picker" })
hl.window_rule({ match = { class = "^(imv)$" }, tag = "+viewer" })
hl.window_rule({ match = { class = "^(feh)$" }, tag = "+viewer" })
hl.window_rule({ match = { class = "^(swayimg)$" }, tag = "+viewer" })
hl.window_rule({ match = { class = "^(feh-preview)$" }, tag = "+viewer" })
hl.window_rule({ match = { class = "^(imv-preview)$" }, tag = "+viewer" })
hl.window_rule({ match = { class = "^(yazi-img-preview)$" }, tag = "+viewer" })
hl.window_rule({ match = { class = "^(.*fcitx.*)$" }, tag = "+im" })
hl.window_rule({ match = { class = "^(taskmanager)$" }, tag = "+taskmgr" })
hl.window_rule({ match = { initial_class = "^(pavucontrol)$" }, tag = "+mgr" })
hl.window_rule({ match = { initial_class = "^(blueman-manager)$" }, tag = "+mgr" })
hl.window_rule({ match = { initial_class = "^(nm-applet)$" }, tag = "+mgr" })
hl.window_rule({ match = { initial_class = "^(nm-connection-editor)$" }, tag = "+mgr" })

-- 根据tag设置效果
hl.window_rule({
    match = { tag = "mgr" },
    animation = "popin 80%",
    float = true,
    opacity = "1.0 0.6",
})

hl.window_rule({
    match = { tag = "vpn" },
    no_anim = true,
    -- no_shadow = true,
    center = true,
    dim_around = true,
    float = true,
    workspace = "name:vpn",
    size = { "(monitor_w*0.9)", "(monitor_h*0.8)" },
})

hl.window_rule({
    match = { tag = "network" },
    no_anim = true,
    no_shadow = true,
    tile = true,
    workspace = "name:network",
})

hl.window_rule({
    match = { tag = "web_browser" },
    animation = "popin",
    fullscreen_state = "1 2",
    no_blur = true,
    tile = true,
})

hl.window_rule({
    match = { tag = "file_manager" },
    animation = "slide",
    -- no_anim = true,
    -- no_shadow = true,
    center = true,
    dim_around = true,
    float = true,
    size = { "(monitor_w*0.85)", "(monitor_h*0.72)" },
})

hl.window_rule({
    match = { tag = "taskmgr" },
    animation = "slide right",
    -- no_anim = true,
    -- no_shadow = true,
    center = true,
    dim_around = true,
    float = true,
    size = { "(monitor_w*0.90)", "(monitor_h*0.80)" },
})

hl.window_rule({
    match = { tag = "term" },
    animation = "gnomed",
    tile = true,
})

hl.window_rule({
    match = { tag = "multi_media" },
    fullscreen = true,
    idle_inhibit = "focus",
    no_anim = true,
    no_blur = true,
    no_shadow = true,
    tile = true,
    workspace = "name:video",
})

hl.window_rule({
    match = { tag = "screen_share" },
    float = true,
    maximize = true,
    workspace = "name:screen-share",
})

hl.window_rule({
    match = { tag = "office" },
    animation = "slide right",
    decorate = false,
    float = true,
    maximize = true,
    workspace = "name:office",
})

hl.window_rule({
    match = { tag = "notebook" },
    animation = "slide left",
    -- decorate = false,
    fullscreen_state = "3 3",
    float = true,
    maximize = true,
    workspace = "name:notebook",
})

hl.window_rule({
    match = { tag = "picker" },
    -- animation = "slide up",
    animation = "slidevert",
    border_size = 0,
    center = true,
    float = true,
    size = { "(monitor_w*0.5)", "(monitor_h*0.5)" },
})

hl.window_rule({
    match = { tag = "viewer" },
    animation = "popin",
    border_size = 0,
    center = true,
    float = true,
    no_shadow = true,
    min_size = { "(monitor_w*0.3)", "(monitor_h*0.2)" },
    max_size = { "(monitor_w*0.9)", "(monitor_h*0.7)" },
})

hl.window_rule({
    match = { tag = "im" },
    -- animation = "slide up",
    -- border_size = 0,
    -- center = true,
    -- decorate = false,
    dim_around = false,
    float = true,
    pseudo = true,
})

-- 弹出窗口设置
hl.window_rule({ match = { title = "^(.*打开捕获文件)$" }, float = true, center = true })
hl.window_rule({ match = { class = "^(org.quickshell)$" }, animation = "slide left", float = true, center = true })



-- ######## Workspace rules ########
hl.workspace_rule({ workspace = "special:special", gaps_out = 30 })
-- hl.workspace_rule({ workspace = "w[tv1]s[false]", gaps_out = 0, gaps_in = 0 })
-- hl.workspace_rule({ workspace = "f[1]s[false]", gaps_out = 0, gaps_in = 0 })
-- hl.window_rule({ match = { float = false, workspace = "w[tv1]s[false]" }, border_size = 0 })
-- hl.window_rule({ match = { float = false, workspace = "w[tv1]s[false]" }, rounding = 0 })
-- hl.window_rule({ match = { float = false, workspace = "f[1]s[false]" }, border_size = 0 })
-- hl.window_rule({ match = { float = false, workspace = "f[1]s[false]" }, rounding = 0 })

-- ######## Layer rules ########
hl.layer_rule({ match = { namespace = ".*" }, xray = true })
hl.layer_rule({ match = { namespace = "walker" }, no_anim = true })
hl.layer_rule({ match = { namespace = "selection" }, no_anim = true })
hl.layer_rule({ match = { namespace = "overview" }, no_anim = true })
hl.layer_rule({ match = { namespace = "anyrun" }, no_anim = true })
hl.layer_rule({ match = { namespace = "indicator.*" }, no_anim = true })
hl.layer_rule({ match = { namespace = "osk" }, no_anim = true })
hl.layer_rule({ match = { namespace = "hyprpicker" }, no_anim = true })

hl.layer_rule({ match = { namespace = "noanim" }, no_anim = true })
hl.layer_rule({ match = { namespace = "gtk-layer-shell" }, blur = true })
hl.layer_rule({ match = { namespace = "gtk-layer-shell" }, ignore_alpha = 0 })
hl.layer_rule({ match = { namespace = "launcher" }, blur = true })
hl.layer_rule({ match = { namespace = "launcher" }, ignore_alpha = 0.5 })
hl.layer_rule({ match = { namespace = "rofi" }, blur = true })
hl.layer_rule({ match = { namespace = "rofi" }, ignore_alpha = 0.5 })
hl.layer_rule({ match = { namespace = "notifications" }, blur = true })
hl.layer_rule({ match = { namespace = "notifications" }, ignore_alpha = 0.69 })

hl.layer_rule({ match = { namespace = "gtk4-layer-shell" }, no_anim = true })
