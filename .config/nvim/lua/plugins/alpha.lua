return {
	"goolord/alpha-nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"nvim-lua/plenary.nvim",
	},
	config = function(_, opts)
		local dashboard = require("alpha.themes.dashboard")

		-- helper function for utf8 chars
		local function getCharLen(s, pos)
			local byte = string.byte(s, pos)
			if not byte then
				return nil
			end
			return (byte < 0x80 and 1) or (byte < 0xE0 and 2) or (byte < 0xF0 and 3) or (byte < 0xF8 and 4) or 1
		end

		local function applyColors(logo, colors, logoColors)
			dashboard.section.header.val = logo

			for key, color in pairs(colors) do
				local name = "Alpha" .. key
				vim.api.nvim_set_hl(0, name, color)
				colors[key] = name
			end

			dashboard.section.header.opts.hl = {}
			for i, line in ipairs(logoColors) do
				local highlights = {}
				local pos = 0

				for j = 1, #line do
					local opos = pos
					pos = pos + getCharLen(logo[i], opos + 1)

					local color_name = colors[line:sub(j, j)]
					if color_name then
						table.insert(highlights, { color_name, opos, pos })
					end
				end

				table.insert(dashboard.section.header.opts.hl, highlights)
			end
			return dashboard.opts
		end

		require("alpha").setup(applyColors({
			[[  ███       ███  ]],
			[[  ████      ████ ]],
			[[  ████     █████ ]],
			[[ █ ████    █████ ]],
			[[ ██ ████   █████ ]],
			[[ ███ ████  █████ ]],
			[[ ████ ████ ████ ]],
			[[ █████  ████████ ]],
			[[ █████   ███████ ]],
			[[ █████    ██████ ]],
			[[ █████     █████ ]],
			[[ ████      ████ ]],
			[[  ███       ███  ]],
			[[                    ]],
			[[  N  E  O  V  I  M  ]],
		}, {
			["b"] = { fg = "#3399ff", ctermfg = 33 },
			["a"] = { fg = "#53C670", ctermfg = 35 },
			["g"] = { fg = "#39ac56", ctermfg = 29 },
			["h"] = { fg = "#33994d", ctermfg = 23 },
			["i"] = { fg = "#33994d", bg = "#39ac56", ctermfg = 23, ctermbg = 29 },
			["j"] = { fg = "#53C670", bg = "#33994d", ctermfg = 35, ctermbg = 23 },
			["k"] = { fg = "#30A572", ctermfg = 36 },
		}, {
			[[  kkkka       gggg  ]],
			[[  kkkkaa      ggggg ]],
			[[ b kkkaaa     ggggg ]],
			[[ bb kkaaaa    ggggg ]],
			[[ bbb kaaaaa   ggggg ]],
			[[ bbbb aaaaaa  ggggg ]],
			[[ bbbbb aaaaaa igggg ]],
			[[ bbbbb  aaaaaahiggg ]],
			[[ bbbbb   aaaaajhigg ]],
			[[ bbbbb    aaaaajhig ]],
			[[ bbbbb     aaaaajhi ]],
			[[ bbbbb      aaaaajh ]],
			[[  bbbb       aaaaa  ]],
			[[                    ]],
			[[  a  a  a  b  b  b  ]],
		}))

		-- button
		local get_icon = require("astroui").get_icon
		dashboard.section.buttons.val = {
			dashboard.button("LDR f f", get_icon("Search", 2, true) .. "查找文件  "),
			dashboard.button("LDR f o", get_icon("DefaultFile", 2, true) .. "最近使用  "),
			dashboard.button("LDR f '", get_icon("Bookmarks", 2, true) .. "书签  "),
			dashboard.button("LDR S l", get_icon("Refresh", 2, true) .. "上次会话  "),
		}
		-- footer
		local alpha = require("alpha")
		local greeting
		local current_hour = tonumber(os.date("%H"))
		if current_hour < 3 then
			greeting = {
				"  🌙  丹霞夹明月，华星出云间",
				"  🌙  上天垂光采，五色一何鲜",
			}
		elseif current_hour < 6 then
			greeting = {
				"  🌄  东方欲晓，莫道君行早",
				"  🌄  踏遍青山人未老，风景这边独好",
			}
		elseif current_hour < 8 then
			greeting = {
				"  🌄  天地转，光阴迫",
				"  🌄  一万年太久，只争朝夕",
			}
		elseif current_hour < 10 then
			greeting = {
				"  🌄  才饮长沙水，又食武昌鱼，极目楚天舒",
				"  🌄  不管风吹浪打，胜似闲庭信步",
			}
		elseif current_hour < 12 then
			greeting = {
				"  🌄  烟雨莽苍苍，龟蛇锁大江",
				"  🌄  把酒酹滔滔，心潮逐浪高",
			}
		elseif current_hour < 18 then
			greeting = {
				"  ☕  莫听穿林打叶声。何妨吟啸且徐行",
				"  ☕  回首向来潇洒处。归去。也无风雨也无晴",
			}
		elseif current_hour < 20 then
			greeting = {
				"  🌙  老夫聊发少年狂，左牵黄，右擎苍",
				"  🌙  会挽雕弓如满月，西北望，射天狼",
			}
		elseif current_hour < 22 then
			greeting = {
				"  🌙  危楼高百尺，手可摘星辰",
				"  🌙  不敢高声语，恐惊天上人",
			}
		else
			greeting = {
				"  🌙  淡淡梅花香欲染，丝丝柳带露初干",
				"  🌙  一片砧敲千里白，半轮鸡唱五更残",
			}
		end
		opts.section.footer.val = greeting
		alpha.setup(opts.config)
	end,
}
