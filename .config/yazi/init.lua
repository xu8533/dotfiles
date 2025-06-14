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
--
-- omp提示
-- require("omp"):setup({ config = "~/.config/omp/yazi-themes/unicorn.omp.json" })
-- require("omp"):setup({ config = "~/.config/omp/yazi-themes/aliens.omp.json" })
-- require("omp"):setup({ config = "~/.config/omp/yazi-themes/blueish.omp.json" })
-- require("omp"):setup({ config = "~/.config/omp/yazi-themes/cert.omp.json" })
-- require("omp"):setup({ config = "~/.config/omp/yazi-themes/cobalt2.omp.json" })
-- require("omp"):setup({ config = "~/.config/omp/yazi-themes/chips.omp.json" })
-- require("omp"):setup({ config = "~/.config/omp/yazi-themes/gmay.omp.json" })
-- require("omp"):setup({ config = "~/.config/omp/yazi-themes/gruvbox.omp.json" })
-- require("omp"):setup({ config = "~/.config/omp/yazi-themes/huvix.omp.json" })
-- require("omp"):setup({ config = "~/.config/omp/yazi-themes/paradox.omp.json" })
-- require("omp"):setup({ config = "~/.config/omp/yazi-themes/1_shell.omp.json" })
-- require("omp"):setup({ config = "~/.config/omp/yazi-themes/catppuccin_latte.omp.json" })
-- require("omp"):setup({ config = "~/.config/omp/yazi-themes/honukai.omp.json" })
-- require("omp"):setup({ config = "~/.config/omp/yazi-themes/if_tea.omp.json" })
-- require("omp"):setup({ config = "~/.config/omp/yazi-themes/jandedobbeleer.omp.json" })
-- require("omp"):setup({ config = "~/.config/omp/yazi-themes/json.omp.json" })
-- require("omp"):setup({ config = "~/.config/omp/yazi-themes/powerlevel10k_classic.omp.json" })
-- require("omp"):setup({ config = "~/.config/omp/yazi-themes/tokyonight_storm.omp.json" })
require("omp"):setup({ config = "~/.config/omp/yazi-themes/ys.omp.json" })

-- full-border
require("full-border"):setup({
	-- Available values: ui.Border.PLAIN, ui.Border.ROUNDED
	-- type = ui.Border.ROUNDED,
	type = ui.Border.PLAIN,
})
