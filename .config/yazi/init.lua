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
require("fuse-archive"):setup({
	smart_enter = true,
	mount_dir = "/media",
})
