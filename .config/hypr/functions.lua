-- 锁定浮动窗口
function pin_nofocus_toggle()
    local tag = "pin_nofocus"

    local function has_tag(window)
        for _, t in ipairs(window.tags or {}) do
            if t == tag then
                return true
            end
        end
        return false
    end

    return function()
        local window = hl.get_active_window()
        if not window then return end

        if window.floating and window.fullscreen == 0 and not window.pinned and not has_tag(window) then
            -- Tag the window and mark it as pinned with no_focus
            hl.dispatch(hl.dsp.window.tag({ tag = "+" .. tag, window = window }))
            hl.dispatch(hl.dsp.window.pin({ window = window }))
            hl.dispatch(hl.dsp.window.set_prop({ prop = "no_focus", value = "1", window = window }))
        else
            -- Restore all windows that were marked this way
            for _, marked_window in ipairs(hl.get_windows({ tag = tag })) do
                hl.dispatch(hl.dsp.window.set_prop({ prop = "no_focus", value = "unset", window = marked_window }))
                if marked_window.pinned then
                    hl.dispatch(hl.dsp.window.pin({ window = marked_window }))
                end
                hl.dispatch(hl.dsp.window.tag({ tag = "-" .. tag, window = marked_window }))
            end
        end
    end
end

-- 不同layout绑定相同快捷键
function layout_bind(bind_table)
    return function()
        local workspace = hl.get_active_special_workspace() or
            hl.get_active_workspace()

        if not workspace then
            return
        end

        local layout = workspace.tiled_layout

        if bind_table[layout] then
            for i = 1, #bind_table[layout] do
                hl.dispatch(bind_table[layout][i])
            end
        end
    end
end

--# Zoom
function zoomfunction(value)
    local zoomvalue = hl.get_config("cursor:zoom_factor")
    if (zoomvalue + value) > 3.0 then
        hl.config({ cursor = { zoom_factor = 3.0 } })
    elseif (zoomvalue + value) < 1.0 then
        hl.config({ cursor = { zoom_factor = 1.0 } })
    else
        hl.config({ cursor = { zoom_factor = zoomvalue + value } })
    end
end

local MAX_ZOOM = 3
local MIN_ZOOM = 1
local ZOOM_TOGGLE_FACTOR = 1.5

---@param offset number
---@return nil
function zoom(offset)
    local current = hl.get_config("cursor.zoom_factor")
    if offset ~= nil then
        current = current + offset
    elseif current ~= MIN_ZOOM then
        current = MIN_ZOOM
    else
        current = ZOOM_TOGGLE_FACTOR
    end
    current = math.max(MIN_ZOOM, math.min(MAX_ZOOM, current))
    hl.config({ cursor = { zoom_factor = current } })
end

-- 插入或拔出外接显示器
INTERNAL = "eDP-1"
function apply_monitor()
    local monitors = hl.get_monitors() --显示器名称
    local external = nil
    for _, m in ipairs(monitors) do
        if m.name ~= INTERNAL and not m.disabled then
            external = m.name
            break
        end
    end
    if external then
        hl.exec_cmd("hyprctl eval 'hl.monitor({ output=\"eDP-1\", disabled=true})'")
        hl.exec_cmd(
            "hyprctl eval 'hl.monitor({ output = \"\", mode = \"preferred\", position = \"auto-up\", scale = 1})'")
    else
        hl.exec_cmd("hyprctl eval 'hl.monitor({ output=\"eDP-1\", mode = \"preferred\", disabled=false, scale = 1})'")
    end
end
