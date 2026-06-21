hl.config({
    -- 触摸板手势
    gestures = {
        workspace_swipe_distance = 700,
        workspace_swipe_cancel_ratio = 0.2,
        workspace_swipe_min_speed_to_force = 5,
        workspace_swipe_direction_lock = true,
        workspace_swipe_direction_lock_threshold = 10,
        workspace_swipe_create_new = true
    },
    general = {
        -- Gaps and border
        gaps_in = 4,
        gaps_out = 5,
        gaps_workspaces = 50,
        border_size = 2,

        col = {
            active_border = { colors = { "rgba(128, 200, 255, 1.0)", "rgba(199,255,127, 1.0)" }, angle = 45 },
            -- active_border = { colors = { "0xff000000", "0xffffffff" }, angle = 45 },
            inactive_border = { colors = { "#505050", "#808080" }, angle = 45 },
            -- active_border = "rgba(0DB7D455)",
            -- inactive_border = "rgba(31313600)"
            -- inactive_border = "0x11707b7c"
        },
        resize_on_border = true,

        no_focus_fallback = true,
        allow_tearing = true, -- This just allows the `immediate` window rule to work
        snap = {
            enabled = true,
            window_gap = 4,
            monitor_gap = 5,
            respect_gaps = true
        },

        -- 默认layout
        layout = "dwindle",
        -- layout = "master",
        -- layout = "scrolling",
        -- layout = "monocle",
        locale = "zh_CN"

    },
    decoration = {
        -- 2 = circle, higher = squircle, 4 = very obvious squircle
        -- Fuck clearly visible squircles. 100% Apple brainrot.
        rounding_power = 2.5,
        rounding = 18,
        inactive_opacity = 0.80,
        border_part_of_window = true,

        blur = {
            enabled = true,
            xray = true,
            special = false,
            new_optimizations = true,
            size = 12,
            passes = 2,
            brightness = 1,
            noise = 0.05,
            contrast = 0.89,
            vibrancy = 0.5,
            vibrancy_darkness = 0.5,
            popups = true,
            popups_ignorealpha = 0.6,
            input_methods = true,
            input_methods_ignorealpha = 0.8
        },
        shadow = {
            enabled = true,
            range = 20,
            offset = { 0, 2 },
            render_power = 10,
            color = 0xbfa7caff,
            color_inactive = 0x11707b7c
        },
        glow = {
            enabled = true,
            range = 15,
            -- color = 0xefbfe523,
            -- color = 0xbfd81918,
            -- color_inactive = 0xee1a1a1a
        },
        -- Dim
        dim_inactive = true,
        dim_strength = 0.08,
        dim_special = 0.2,
        dim_around = 0.5,
    },
    animations = {
        enabled = true
    },
    group = {
        col = {
            -- border_active = 0x66ffff00,
            border_active = 0xff68935c,
            border_inactive = 0x66777700,
            border_locked_active = 0x66ff5500,
            border_locked_inactive = 0x66775500
        },
        groupbar = {
            enabled = true,
            font_family = "霞鹜文楷等宽",
            font_size = 15,
            font_weight_active = "bold",
            font_weight_inactive = "normal",
            gradients = true,
            height = 10,
            indicator_gap = 0,
            indicator_height = 1,
            rounding = 1,
            rounding_power = 10.0,
            gradient_rounding = 10,
            gradient_rounding_power = 3,
            text_color = 0xbfd81918,
            text_color_inactive = 0xee1a1a1a,
            text_offset = 0,
            text_padding = 50,
            gaps_in = 3,
            gaps_out = 1,
            col = {
                -- active = "#80c8ff",
                -- inactive = "#bbddff",
                active = { colors = { "rgba(128,200,255,1.0)", "rgba(187,221,255, 1.0)" } },
                inactive = { colors = { "rgba(80,80, 80, 0.99)", "rgba(128,128,128, 1.0)" } }
            }
        }
    },
})

hl.config {
    input = {
        kb_layout = "us",
        numlock_by_default = false,
        repeat_delay = 250,
        repeat_rate = 35,

        -- 跟随鼠标聚焦
        follow_mouse = 1,
        off_window_axis_events = 2,

        -- 鼠标敏感度
        sensitivity = 1,

        touchpad = {
            natural_scroll = false,
            disable_while_typing = true,
            clickfinger_behavior = true,
            scroll_factor = 0.7
        }
    },

    misc = {
        disable_hyprland_logo = true,
        disable_splash_rendering = true,

        -- 显示器同步
        -- 可变刷新率
        vrr = 0,

        -- 启用鼠标和键盘唤醒
        mouse_move_enables_dpms = true,
        key_press_enables_dpms = true,

        animate_manual_resizes = false,
        animate_mouse_windowdragging = false,
        enable_swallow = false,
        swallow_regex = "(foot|kitty|allacritty|Alacritty)",
        on_focus_under_fullscreen = 2,
        allow_session_lock_restore = true,
        session_lock_xray = true,
        initial_workspace_tracking = false,
        focus_on_activate = true,
        middle_click_paste = false,
        font_family = "Sarasa Term SC"
    },

    binds = {
        scroll_event_delay = 0,
        hide_special_on_workspace_change = true
    },

    -- 光标配置
    cursor = {
        -- N秒后隐藏光标
        inactive_timeout = 3,

        -- 按键盘后隐藏光标,
        hide_on_key_press = true,

        -- 使用触摸板后隐藏光标
        hide_on_touch = true,

        zoom_factor = 1,
        zoom_rigid = false,
        zoom_disable_aa = true,
        hotspot_padding = 1
    },

    xwayland = {
        force_zero_scaling = true
    }
}
