hl.on("hyprland.start", function()
    hl.exec_cmd("systemctl --user start hyprpolkitagent")
    hl.exec_cmd("qs -c $qsConfig")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("hyprsunset")

    hl.exec_cmd("udiskie --automount --notify --tray &")
    hl.exec_cmd("sleep 3 && udisksctl mount -b /dev/nvme0n1p6")
    hl.exec_cmd("dbus-update-activation-environment --all")
    -- obs等录屏应用需要
    hl.exec_cmd("sleep 1 && dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")

    -- 输入法
    hl.exec_cmd("fcitx5 --replace -d")

    -- Clipboard: history
    --hl.exec_cmd("wl-paste --watch cliphist store")
    -- hl.exec_cmd(
    --     "wl-paste --type text --watch bash -c 'cliphist store && qs -c $qsConfig ipc call cliphistService update'")
    -- hl.exec_cmd(
    --     "wl-paste --type image --watch bash -c 'cliphist store && qs -c $qsConfig ipc call cliphistService update'")

    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")

    -- Cursor
    hl.exec_cmd("hyprctl setcursor Bibata-Modern-Turquoise 22")

    hl.exec_cmd("sleep 2 && kitty")
    -- hl.exec_cmd(home_dir .. "/.local/bin/monitor-auto.sh")
end)

hl.on("monitor.added", function()
    apply_monitor()
    -- if hl.get_monitor("HDMI-A-1") ~= nil then
    --     -- hl.monitor({ output = "eDP-1", disabled = true })
    --     -- hl.monitor({ output = "", mode = "preferred", position = "auto-up", scale = 1 })
    --     hl.exec_cmd("hyprctl eval 'hl.monitor({ output=\"eDP-1\", disabled=true})'")
    --     hl.exec_cmd(
    --         "hyprctl eval 'hl.monitor({ output = \"\", mode = \"preferred\", position = \"auto-up\", scale = 1})'")
    -- end
end)
hl.on("monitor.removed", function()
    apply_monitor()
    -- if hl.get_monitor("HDMI-A-1") == nil then
    --     -- hl.monitor({ output = "eDP-1", mode = "preferred", disabled = false, scale = 1 })
    --     hl.exec_cmd("hyprctl eval 'hl.monitor({ output=\"eDP-1\", mode = \"preferred\", disabled=false, scale = 1})'")
    -- end
end)
hl.on("config.reloaded", function()
    apply_monitor()
    -- hl.exec_cmd("hyprctl reload config-only")
    -- if hl.get_monitor("HDMI-A-1") ~= nil then
    --     hl.exec_cmd("hyprctl eval 'hl.monitor({ output=\"eDP-1\", disabled=true})'")
    --     -- hl.monitor({ output = "eDP-1", disabled = true })
    --     -- hl.monitor({ output = "", mode = "preferred", position = "auto-up", scale = 1 })
    -- end
end)
