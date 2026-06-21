-- Example config for Swayimg.
-- This file contains the default configuration used by the application.

-- The viewer searches for the config file in the following locations:
-- 1. $XDG_CONFIG_HOME/swayimg/init.lua
-- 2. $HOME/.config/swayimg/init.lua
-- 3. $XDG_CONFIG_DIRS/swayimg/init.lua
-- 4. /etc/xdg/swayimg/init.lua

-- swayimg.viewer.on_key("Bracketleft", function()
--     swayimg.viewer.rotate(270)
-- end)
-- swayimg.viewer.on_key("Bracketright", function()
--     swayimg.viewer.rotate(90)
-- end)

-- General config
swayimg.set_mode("viewer")            -- mode at startup
swayimg.enable_antialiasing(true)     -- anti-aliasing
swayimg.enable_decoration(true)       -- window title/buttons/borders
swayimg.enable_overlay(false)         -- window overlay mode
swayimg.enable_exif_orientation(true) -- image orientation by EXIF
swayimg.set_dnd_button("MouseRight")  -- drag-and-drop mouse button

-- Image list configuration
swayimg.imagelist.set_order("numeric")   -- list order
swayimg.imagelist.enable_reverse(false)  -- reverse order
swayimg.imagelist.enable_recursive(true) -- recursive directory reading
swayimg.imagelist.enable_adjacent(false) -- add adjacent files from same dir
swayimg.imagelist.enable_fsmon(true)     -- enable file system monitoring

-- Text overlay configuration
swayimg.text.set_font("LXGW WenKai")    -- font name
swayimg.text.set_size(24)               -- font size in pixels
swayimg.text.set_spacing(0)             -- line spacing
swayimg.text.set_padding(10)            -- padding from window edge
swayimg.text.set_foreground(0xffcccccc) -- foreground text color
swayimg.text.set_background(0x00000000) -- text background color
swayimg.text.set_shadow(0x0d000000)     -- text shadow color
swayimg.text.set_timeout(5)             -- layer hide timeout
swayimg.text.set_status_timeout(3)      -- status message hide timeout

-- Image viewer mode
swayimg.viewer.set_default_scale("fit")                         -- default image scale
swayimg.viewer.set_default_position("center")                   -- default image position
swayimg.viewer.set_drag_button("MouseLeft")                     -- mouse button to drag image
swayimg.viewer.set_window_background(0xff000000)                -- window background color
swayimg.viewer.set_image_chessboard(20, 0xff333333, 0xff4c4c4c) -- chessboard
swayimg.viewer.enable_centering(true)                           -- enable automatic centering
swayimg.viewer.enable_loop(true)                                -- enable image list loop mode
swayimg.viewer.limit_preload(1)                                 -- number of images to preload
swayimg.viewer.limit_history(1)                                 -- number of the history cache
swayimg.viewer.set_mark_color(0xffd81918)                       -- mark icon color
swayimg.viewer.set_pinch_factor(1.0)                            -- pinch gesture factor
swayimg.viewer.set_text("topleft", {                            -- top left text block scheme
    "文件: {path}",
    -- "文件: {name}",
    "格式: {format}",
    "大小: {sizehr}",
    "创建日期: {time}",
    "EXIF date: {meta.Exif.Photo.DateTimeOriginal}",
    "EXIF camera: {meta.Exif.Image.Model}"
})
swayimg.viewer.set_text("topright", { -- top right text block scheme
    "图片: {list.index} of {list.total}",
    "帧数: {frame.index} of {frame.total}",
    "尺寸: {frame.width}x{frame.height}"
})
swayimg.viewer.set_text("bottomleft", { -- bottom left text block scheme
    "缩放比率: {scale}"
})

swayimg.viewer.on_key("q", function()
    swayimg.exit()
end)
swayimg.viewer.on_key("v", function()
    swayimg.viewer.flip_vertical()
end)
swayimg.viewer.on_key("Shift-v", function()
    swayimg.viewer.flip_horizontal()
end)
swayimg.viewer.on_key("g", function()
    swayimg.viewer.switch_image("first")
end)
swayimg.viewer.on_key("Shift-g", function()
    swayimg.viewer.switch_image("last")
end)
swayimg.viewer.on_key("Shift-r", function()
    swayimg.viewer.switch_image("random")
end)
swayimg.viewer.on_key("h", function()
    swayimg.viewer.switch_image("prev")
end)
swayimg.viewer.on_key("l", function()
    swayimg.viewer.switch_image("next")
end)
swayimg.viewer.on_key("Space", function()
    swayimg.viewer.switch_image("next")
end)
swayimg.viewer.on_key("Shift-h", function()
    swayimg.viewer.switch_image("prev_dir")
end)
swayimg.viewer.on_key("Shift-l", function()
    swayimg.viewer.switch_image("next_dir")
end)
swayimg.viewer.on_key("Comma", function()
    swayimg.viewer.prev_frame()
end)
swayimg.viewer.on_key("Period", function()
    swayimg.viewer.next_frame()
end)
swayimg.viewer.on_key("m", function()
    swayimg.viewer.mark_image()
end)

-- bind the left arrow key to move the image to the left by 1/10 of the application window size
swayimg.viewer.on_key("Left", function()
    local wnd = swayimg.get_window_size()
    local pos = swayimg.viewer.get_position()
    swayimg.viewer.set_abs_position(math.floor(pos.x + wnd.width / 10), pos.y);
end)
swayimg.viewer.on_key("Right", function()
    local wnd = swayimg.get_window_size()
    local pos = swayimg.viewer.get_position()
    swayimg.viewer.set_abs_position(math.floor(pos.x - wnd.width / 10), pos.y);
end)
swayimg.viewer.on_key("Up", function()
    local wnd = swayimg.get_window_size()
    local pos = swayimg.viewer.get_position()
    swayimg.viewer.set_abs_position(pos.x, math.floor(pos.y + wnd.height / 10));
end)
swayimg.viewer.on_key("Down", function()
    local wnd = swayimg.get_window_size()
    local pos = swayimg.viewer.get_position()
    swayimg.viewer.set_abs_position(pos.x, math.floor(pos.y - wnd.height / 10));
end)

-- bind mouse vertical scroll button with pressed Ctrl to zoom in the image at mouse pointer coordinates
swayimg.viewer.on_mouse("Ctrl-ScrollUp", function()
    local pos = swayimg.get_mouse_pos()
    local scale = swayimg.viewer.get_scale()
    scale = scale + scale / 10
    swayimg.viewer.set_abs_scale(scale, pos.x, pos.y);
end)


-- Slide show mode, same config as for viewer mode with the following defaults:
swayimg.slideshow.set_timeout(5)                    -- timeout to switch image
swayimg.slideshow.set_default_scale("fit")          -- default image scale
swayimg.slideshow.set_window_background("auto")     -- window background mode
swayimg.slideshow.limit_history(0)                  -- number of the history cache
swayimg.slideshow.set_text("topleft", { "{name}" }) -- top left text block scheme

-- slideshow keybind
swayimg.slideshow.on_key("q", function()
    swayimg.exit()
end)
swayimg.slideshow.on_key("v", function()
    swayimg.slideshow.flip_vertical()
end)
swayimg.slideshow.on_key("Shift-v", function()
    swayimg.slideshow.flip_horizontal()
end)
swayimg.slideshow.on_key("g", function()
    swayimg.slideshow.switch_image("first")
end)
swayimg.slideshow.on_key("Shift-g", function()
    swayimg.slideshow.switch_image("last")
end)
swayimg.slideshow.on_key("Shift-r", function()
    swayimg.slideshow.switch_image("random")
end)
swayimg.slideshow.on_key("h", function()
    swayimg.slideshow.switch_image("prev")
end)
swayimg.slideshow.on_key("l", function()
    swayimg.slideshow.switch_image("next")
end)
swayimg.slideshow.on_key("Space", function()
    swayimg.slideshow.switch_image("next")
end)
swayimg.slideshow.on_key("Shift-h", function()
    swayimg.slideshow.switch_image("prev_dir")
end)
swayimg.slideshow.on_key("Shift-l", function()
    swayimg.slideshow.switch_image("next_dir")
end)
swayimg.slideshow.on_key("Comma", function()
    swayimg.slideshow.prev_frame()
end)
swayimg.slideshow.on_key("Period", function()
    swayimg.slideshow.next_frame()
end)
swayimg.viewer.on_key("m", function()
    swayimg.viewer.mark_image()
end)

-- Gallery mode
swayimg.gallery.set_aspect("fill")               -- thumbnail aspect ratio
swayimg.gallery.set_thumb_size(200)              -- thumbnail size in pixels
swayimg.gallery.set_padding_size(5)              -- padding between thumbnails
swayimg.gallery.set_border_size(5)               -- border size for selected thumbnail
swayimg.gallery.set_border_color(0xffaaaaaa)     -- border color for selected thumbnail
swayimg.gallery.set_selected_scale(1.15)         -- scale for selected thumbnail
swayimg.gallery.set_selected_color(0xff404040)   -- background color for selected thumbnail
swayimg.gallery.set_unselected_color(0xff202020) -- background color for unselected thumbnail
swayimg.gallery.set_window_color(0xff000000)     -- window background color
swayimg.gallery.set_mark_color(0xffd81918)
swayimg.gallery.set_pinch_factor(100.0)          -- pinch gesture factor
swayimg.gallery.limit_cache(100)                 -- number of thumbnails stored in memory
swayimg.gallery.enable_preload(false)            -- preloading invisible thumbnails
swayimg.gallery.enable_pstore(false)             -- enable persistent storage for thumbnails
swayimg.gallery.set_text("topleft", {            -- top left text block scheme
    "文件名: {name}"
})
swayimg.gallery.set_text("topright", { -- top right text block scheme
    "{list.index} / {list.total}"
})

-- Key and mouse bindings in gallery mode (example only, not all):
-- bind Enter key to open image in viewer
swayimg.gallery.on_key("Return", function()
    swayimg.set_mode("viewer")
end)
-- bind the left arrow key to select thumbnail on the left side
swayimg.gallery.on_key("q", function()
    swayimg.exit()
end)
swayimg.gallery.on_key("g", function()
    swayimg.gallery.switch_image("first")
end)
swayimg.gallery.on_key("Shift-g", function()
    swayimg.gallery.switch_image("last")
end)
swayimg.gallery.on_key("h", function()
    swayimg.gallery.switch_image("left")
end)
swayimg.gallery.on_key("l", function()
    swayimg.gallery.switch_image("right")
end)
swayimg.gallery.on_key("j", function()
    swayimg.gallery.switch_image("down")
end)
swayimg.gallery.on_key("k", function()
    swayimg.gallery.switch_image("up")
end)
swayimg.gallery.on_key("Shift-h", function()
    swayimg.gallery.switch_image("pgup")
end)
swayimg.gallery.on_key("Shift-l", function()
    swayimg.gallery.switch_image("pgdown")
end)
swayimg.gallery.on_key("Comma", function()
    swayimg.gallery.switch_image("left")
end)
swayimg.gallery.on_key("Period", function()
    swayimg.gallery.switch_image("right")
end)
swayimg.gallery.on_key("m", function()
    swayimg.gallery.mark_image()
end)

--
-- Other configuration examples
--

-- force set scale mode on window resize (useful for tiling compositors)
swayimg.on_window_resize(function()
    swayimg.viewer.set_fix_scale("optimal")
end)

-- bind the Delete key in slide show mode to delete the current file and display a status message
swayimg.slideshow.on_key("Delete", function()
    local image = swayimg.slideshow.get_image()
    os.remove(image.path)
    swayimg.text.set_status("文件 " .. image.path .. " 已经被删除")
end)

-- set a custom window title in gallery mode
swayimg.gallery.on_image_change(function()
    local image = swayimg.gallery.get_image()
    swayimg.set_title("目录: " .. image.path)
end)

-- print paths to all marked files by pressing Ctrl-p in gallery mode
swayimg.gallery.on_key("Ctrl-p", function()
    local entries = swayimg.imagelist.get()
    for _, entry in ipairs(entries) do
        if entry.mark then
            print(entry.path)
        end
    end
end)
