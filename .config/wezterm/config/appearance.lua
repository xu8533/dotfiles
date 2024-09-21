local wezterm = require("wezterm")
-- local colors = require("colors.custom")
-- local fonts = require('config.fonts')

return {
	term = "xterm-256color",
	animation_fps = 60,
	max_fps = 60,
	front_end = "WebGpu",
	webgpu_power_preference = "HighPerformance",

	-- color scheme
	-- colors = colors,
	-- color_scheme = "Gruvbox dark, medium (base16)",
	-- color_scheme = "Pencil Dark (Gogh)",
	-- color_scheme = "Papercolor Dark (Gogh)",
	-- color_scheme = "3024 Night",
	-- color_scheme = "Astrodark (Gogh)",
	-- color_scheme = "Ayu Dark (Gogh)",
	-- color_scheme = "Bamboo",
	-- color_scheme = "Bamboo Multiplex",
	-- color_scheme = "Dracula",
	-- color_scheme = "Dracula (Gogh)",
	-- color_scheme = "Dracula (Official)",
	-- color_scheme = "Dracula+",
	-- color_scheme = "duskfox",
	-- color_scheme = "carbonfox",
	-- color_scheme = "Everforest Dark Hard (Gogh)",
	-- color_scheme = "Everforest Light Soft (Gogh)",
	-- color_scheme = "Galaxy",
	-- color_scheme = "Gruvbox (Gogh)",
	-- color_scheme = "Gruvbox dark, pale (base16)",
	-- color_scheme = "Gruvbox light, soft (base16)",
	-- color_scheme = "GruvboxDark",
	-- color_scheme = "GruvboxLight",
	-- color_scheme = "Highway (Gogh)",
	-- color_scheme = "JetBrains Darcula",
	-- color_scheme = "Kanagawa (Gogh)",
	-- color_scheme = "Kanagawa Dragon (Gogh)",
	-- color_scheme = "MaterialDark",
	-- color_scheme = "MaterialDarker",
	-- color_scheme = "MaterialDesignColors",
	-- color_scheme = "midnight-in-mojave",
	-- color_scheme = "Monokai Soda (Gogh)",
	-- color_scheme = "Monokai Vivid",
	-- color_scheme = "nightfox",
	-- color_scheme = "Pandora",
	-- color_scheme = "Paper (Gogh)",
	-- color_scheme = "PaperColor Dark (base16)",
	-- color_scheme = "Papercolor Dark (Gogh)",
	-- color_scheme = "PaperColor Light (base16)",
	-- color_scheme = "Papercolor Light (Gogh)",
	-- color_scheme = "Pencil Dark (Gogh)",
	-- color_scheme = "Pencil Light (Gogh)",
	color_scheme = "PencilDark",
	-- color_scheme = "PencilLight",
	-- color_scheme = "pinky (base16)",
	-- color_scheme = "Sonokai (Gogh)",
	-- color_scheme = "Spacedust (Gogh)",

	-- background
	window_background_opacity = 0.9,
	win32_system_backdrop = "Acrylic",
	window_background_gradient = {
		colors = { "#1D261B", "#261A25" },
		-- Specifices a Linear gradient starting in the top left corner.
		orientation = { Linear = { angle = -45.0 } },
	},
	background = {
		{
			source = { File = wezterm.config_dir .. "/backdrops/space.jpg" },
		},
		{
			source = { Color = "#1A1B26" },
			height = "100%",
			width = "100%",
			opacity = 0.95,
		},
	},

	-- scrollbar
	enable_scroll_bar = true,
	min_scroll_bar_height = "3cell",
	colors = {
		scrollbar_thumb = "#34354D",
	},

	-- tab bar
	enable_tab_bar = true,
	hide_tab_bar_if_only_one_tab = false,
	use_fancy_tab_bar = true,
	tab_max_width = 25,
	show_tab_index_in_tab_bar = true,
	switch_to_last_active_tab_when_closing_tab = true,

	-- cursor
	default_cursor_style = "BlinkingBlock",
	cursor_blink_ease_in = "Constant",
	cursor_blink_ease_out = "Constant",
	cursor_blink_rate = 700,

	-- window
	adjust_window_size_when_changing_font_size = false,
	window_decorations = "INTEGRATED_BUTTONS|RESIZE",
	integrated_title_button_style = "Windows",
	integrated_title_button_color = "auto",
	integrated_title_button_alignment = "Right",
	initial_cols = 96,
	initial_rows = 24,
	window_padding = {
		left = 5,
		right = 10,
		top = 12,
		bottom = 7,
	},
	window_close_confirmation = "AlwaysPrompt",
	window_frame = {
		active_titlebar_bg = "#0F2536",
		inactive_titlebar_bg = "#0F2536",
		-- font = fonts.font,
		-- font_size = fonts.font_size,
	},
	inactive_pane_hsb = { saturation = 1.0, brightness = 1.0 },
}
