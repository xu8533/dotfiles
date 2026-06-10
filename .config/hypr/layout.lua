hl.config {
    dwindle = {
        preserve_split      = true,
        smart_split         = true,
        smart_resizing      = true,
        force_split         = 2,
        default_split_ratio = 0.8,
        split_bias          = 0
    },

    master = {
        -- "left", "right", "top", "bottom" or "center"
        orientation = "center",
        -- "master", "slave", "inherit"
        new_status = "master",
        new_on_top = true,
        mfact = 0.70,
        slave_count_for_center_master = 0
    },

    scrolling = {
        fullscreen_on_one_column = true,
        column_width = 0.7,
        follow_focus = true,
        follow_min_visible = 0.4,
        explicit_column_widths = "0.333, 0.5, 0.667, 1.0",
        wrap_focus = true,
        wrap_swapcol = true,
        -- "left", "right", "down", "up"
        direction = "right"
    }
}
