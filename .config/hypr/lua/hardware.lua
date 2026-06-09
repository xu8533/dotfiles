-- MONITOR CONFIG
hl.monitor({
    output = "",
    mode = "preferred",
    position = "auto-up",
    scale = 1
})

-- 触摸板手势
-- hl.gesture({
--     fingers = 3,
--     direction = "swipe",
--     action = "move"
-- })
-- hl.gesture({
--     fingers = 3,
--     direction = "pinch",
--     action = "fullscreen"
-- })
-- hl.gesture({
--     fingers = 4,
--     direction = "horizontal",
--     action = "workspace"
-- })
-- hl.gesture({
--     fingers = 4,
--     direction = "up",
--     action = function()
--         hl.dispatch(hl.dsp.global("quickshell:overviewWorkspacesToggle"))
--     end
-- })
-- hl.gesture({
--     fingers = 4,
--     direction = "down",
--     action = function()
--         hl.dispatch(hl.dsp.global("quickshell:overviewWorkspacesToggle"))
--     end
-- })
--
hl.device({
    name = "huawei-mouse-wyn--mouse",
    sensitivity = 1.0,
})
hl.device({
    name = "elan260a:00-04f3:3163-mouse",
    sensitivity = 1.0,
})
hl.device({
    name = "elan260a:00-04f3:3163-touchpad",
    sensitivity = 1.0,
})
hl.device({
    name = "kzzi-k75-5.0--mouse",
    sensitivity = 1.0,
})
