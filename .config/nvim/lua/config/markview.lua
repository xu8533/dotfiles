local presets = require("markview.presets");

require("markview").setup({
    markdown = {
        enable = true,
        headings = presets.headings.glow,
        -- headings = presets.headings.glow_center,
        -- headings = presets.headings.slanted,
        -- headings = presets.headings.arrowed,
        -- headings = presets.headings.simple,
        -- headings = presets.headings.marker,
        -- horizontal_rules = presets.horizontal_rules.thin,
        -- horizontal_rules = presets.horizontal_rules.thick,
        -- horizontal_rules = presets.horizontal_rules.double,
        -- horizontal_rules = presets.horizontal_rules.dotted,
        -- horizontal_rules = presets.horizontal_rules.dashed,
        -- horizontal_rules = presets.horizontal_rules.solid,
        horizontal_rules = presets.horizontal_rules.arrowed,
        -- tables = presets.tables.none,
        -- tables = presets.tables.single,
        -- tables = presets.tables.double,
        tables = presets.tables.rounded,
        -- tables = presets.tables.solid,
        block_quotes = presets.block_quotes.obsidian
    }
});

--- You can again call `setup()` to modify
--- the options without changing the preset.
require("markview").setup({
    markdown = {
        enable = true,
        tables = {
            enable = false,
        }
    },
    markdown_inline = {
        enable = true,
        block_references = {
            enable = true,
            default = {
                icon = "󰿨 ",
                hl = "MarkviewPalette6Fg",
                file_hl = "MarkviewPalette0Fg",
            },
        },
        checkboxes = {
            enable = true,
            checked = { text = "󰗠", hl = "MarkviewCheckboxChecked", scope_hl = "MarkviewCheckboxChecked" },
            unchecked = { text = "󰄰", hl = "MarkviewCheckboxUnchecked", scope_hl = "MarkviewCheckboxUnchecked" },
            ["/"] = { text = "󱎖", hl = "MarkviewCheckboxPending" },
            [">"] = { text = "", hl = "MarkviewCheckboxCancelled" },
            ["<"] = { text = "󰃖", hl = "MarkviewCheckboxCancelled" },
            ["-"] = { text = "󰍶", hl = "MarkviewCheckboxCancelled", scope_hl = "MarkviewCheckboxStriked" },
            ["?"] = { text = "󰋗", hl = "MarkviewCheckboxPending" },
            ["!"] = { text = "󰀦", hl = "MarkviewCheckboxUnchecked" },
            ["*"] = { text = "󰓎", hl = "MarkviewCheckboxPending" },
            ['"'] = { text = "󰸥", hl = "MarkviewCheckboxCancelled" },
            ["l"] = { text = "󰆋", hl = "MarkviewCheckboxProgress" },
            ["b"] = { text = "󰃀", hl = "MarkviewCheckboxProgress" },
            ["i"] = { text = "󰰄", hl = "MarkviewCheckboxChecked" },
            ["S"] = { text = "", hl = "MarkviewCheckboxChecked" },
            ["I"] = { text = "󰛨", hl = "MarkviewCheckboxPending" },
            ["p"] = { text = "", hl = "MarkviewCheckboxChecked" },
            ["c"] = { text = "", hl = "MarkviewCheckboxUnchecked" },
            ["f"] = { text = "󱠇", hl = "MarkviewCheckboxUnchecked" },
            ["k"] = { text = "", hl = "MarkviewCheckboxPending" },
            ["w"] = { text = "", hl = "MarkviewCheckboxProgress" },
            ["u"] = { text = "󰔵", hl = "MarkviewCheckboxChecked" },
            ["d"] = { text = "󰔳", hl = "MarkviewCheckboxUnchecked" },
        },
        inline_codes = {
            enable = true,
            hl = "MarkviewInlineCode",
            padding_left = " ",
            padding_right = " "
        },
        emails = {
            enable = true,
            default = {
                icon = " ",
                hl = "MarkviewEmail"
            },

            ["%@gmail%.com$"] = {
                --- user@gmail.com

                icon = "󰊫 ",
                hl = "MarkviewPalette0Fg"
            },

            ["%@icloud%.com$"] = {
                --- user@icloud.com

                icon = "󰀸 ",
                hl = "MarkviewPalette6Fg"
            }
        },
        embed_files = {
            enable = true,

            default = {
                icon = "󰠮 ",
                hl = "MarkviewPalette7Fg"
            }
        },
        emoji_shorthands = {
            enable = true
        },
        entities = {
            enable = true,
            hl = "Special"
        },
        escapes = {
            enable = true
        },
        footnotes = {
            enable = true,

            default = {
                icon = "󰯓 ",
                hl = "MarkviewHyperlink"
            },

            ["^%d+$"] = {
                --- Numbered footnotes.

                icon = "󰯓 ",
                hl = "MarkviewPalette4Fg"
            }
        },
        highlights = {
            enable = true,

            default = {
                padding_left = " ",
                padding_right = " ",

                hl = "MarkviewPalette3"
            }
        },
        hyperlinks = {
            enable = true,

            default = {
                icon = "󰌷 ",
                hl = "MarkviewHyperlink",
            },

            ["github%.com/[%a%d%-%_%.]+%/?$"] = {
                --- github.com/<user>

                icon = " ",
                hl = "MarkviewPalette0Fg"
            },
            ["github%.com/[%a%d%-%_%.]+/[%a%d%-%_%.]+%/?$"] = {
                --- github.com/<user>/<repo>

                icon = " ",
                hl = "MarkviewPalette0Fg"
            },
            ["github%.com/[%a%d%-%_%.]+/[%a%d%-%_%.]+/tree/[%a%d%-%_%.]+%/?$"] = {
                --- github.com/<user>/<repo>/tree/<branch>

                icon = " ",
                hl = "MarkviewPalette0Fg"
            },
            ["github%.com/[%a%d%-%_%.]+/[%a%d%-%_%.]+/commits/[%a%d%-%_%.]+%/?$"] = {
                --- github.com/<user>/<repo>/commits/<branch>

                icon = " ",
                hl = "MarkviewPalette0Fg"
            },

            ["github%.com/[%a%d%-%_%.]+/[%a%d%-%_%.]+%/releases$"] = {
                --- github.com/<user>/<repo>/releases

                icon = " ",
                hl = "MarkviewPalette0Fg"
            },
            ["github%.com/[%a%d%-%_%.]+/[%a%d%-%_%.]+%/tags$"] = {
                --- github.com/<user>/<repo>/tags

                icon = " ",
                hl = "MarkviewPalette0Fg"
            },
            ["github%.com/[%a%d%-%_%.]+/[%a%d%-%_%.]+%/issues$"] = {
                --- github.com/<user>/<repo>/issues

                icon = " ",
                hl = "MarkviewPalette0Fg"
            },
            ["github%.com/[%a%d%-%_%.]+/[%a%d%-%_%.]+%/pulls$"] = {
                --- github.com/<user>/<repo>/pulls

                icon = " ",
                hl = "MarkviewPalette0Fg"
            },

            ["github%.com/[%a%d%-%_%.]+/[%a%d%-%_%.]+%/wiki$"] = {
                --- github.com/<user>/<repo>/wiki

                icon = " ",
                hl = "MarkviewPalette0Fg"
            },

            ["w3schools%.com"] = {
                priority = -9999,

                icon = " ",
                hl = "MarkviewPalette4Fg"
            },

            ["github%.com"] = {
                priority = -9999,

                icon = " ",
                hl = "MarkviewPalette6Fg"
            },

            ["gitlab%.com"] = {
                priority = -9999,

                icon = "󰮠 ",
                hl = "MarkviewPalette2Fg"
            },

            ["npmjs%.com"] = {
                priority = -9999,

                icon = " ",
                hl = "MarkviewPalette0Fg"
            },

            ["pypi%.org"] = {
                priority = -9999,

                icon = "󰆦 ",
                hl = "MarkviewPalette0Fg"
            },
        },
        images = {
            enable = true,

            default = {
                icon = "󰥶 ",
                hl = "MarkviewImage",
            },

            ["%.svg$"] = { icon = "󰜡 " },
            ["%.png$"] = { icon = "󰸭 " },
            ["%.jpg$"] = { icon = "󰈥 " },
            ["%.gif$"] = { icon = "󰵸 " },
            ["%.pdf$"] = { icon = " " }
        },
        internal_links = {
            enable = true,

            default = {
                icon = " ",
                hl = "MarkviewPalette7Fg",
            },
        },
        uri_autolinks = {
            enable = true,

            default = {
                icon = " ",
                hl = "MarkviewEmail"
            },

            ["github%.com/[%a%d%-%_%.]+%/?$"] = {
                --- github.com/<user>

                icon = " ",
                hl = "MarkviewPalette0Fg"
            },
            ["github%.com/[%a%d%-%_%.]+/[%a%d%-%_%.]+%/?$"] = {
                --- github.com/<user>/<repo>

                icon = " ",
                hl = "MarkviewPalette0Fg"
            },
            ["github%.com/[%a%d%-%_%.]+/[%a%d%-%_%.]+/tree/[%a%d%-%_%.]+%/?$"] = {
                --- github.com/<user>/<repo>/tree/<branch>

                icon = " ",
                hl = "MarkviewPalette0Fg"
            },
            ["github%.com/[%a%d%-%_%.]+/[%a%d%-%_%.]+/commits/[%a%d%-%_%.]+%/?$"] = {
                --- github.com/<user>/<repo>/commits/<branch>

                icon = " ",
                hl = "MarkviewPalette0Fg"
            },

            ["github%.com/[%a%d%-%_%.]+/[%a%d%-%_%.]+%/releases$"] = {
                --- github.com/<user>/<repo>/releases

                icon = " ",
                hl = "MarkviewPalette0Fg"
            },
            ["github%.com/[%a%d%-%_%.]+/[%a%d%-%_%.]+%/tags$"] = {
                --- github.com/<user>/<repo>/tags

                icon = " ",
                hl = "MarkviewPalette0Fg"
            },
            ["github%.com/[%a%d%-%_%.]+/[%a%d%-%_%.]+%/issues$"] = {
                --- github.com/<user>/<repo>/issues

                icon = " ",
                hl = "MarkviewPalette0Fg"
            },
            ["github%.com/[%a%d%-%_%.]+/[%a%d%-%_%.]+%/pulls$"] = {
                --- github.com/<user>/<repo>/pulls

                icon = " ",
                hl = "MarkviewPalette0Fg"
            },

            ["github%.com/[%a%d%-%_%.]+/[%a%d%-%_%.]+%/wiki$"] = {
                --- github.com/<user>/<repo>/wiki

                icon = " ",
                hl = "MarkviewPalette0Fg"
            },

            ["w3schools%.com"] = {
                priority = -9999,

                icon = " ",
                hl = "MarkviewPalette4Fg"
            },

            ["github%.com"] = {
                priority = -9999,

                icon = " ",
                hl = "MarkviewPalette6Fg"
            },

            ["gitlab%.com"] = {
                priority = -9999,

                icon = "󰮠 ",
                hl = "MarkviewPalette2Fg"
            },

            ["pypi%.org"] = {
                priority = -9999,

                icon = "󰆦 ",
                hl = "MarkviewPalette0Fg"
            },
        },
        tags = {
            enable = true,
            default = {
                hl = "MarkviewPalette7",
                padding_left = " ",
                padding_right = " "
            }
        }
    },
    html = {
        enable = true,
        container_elements = {
            enable = true,

            ["^a$"] = {
                on_opening_tag = { conceal = "", virt_text_pos = "inline", virt_text = { { " ", "MarkviewHyperlink" } } },
                on_node = { hl_group = "MarkviewHyperlink" },
                on_closing_tag = { conceal = "" },
            },
            ["^b$"] = {
                on_opening_tag = { conceal = "" },
                on_node = { hl_group = "Bold" },
                on_closing_tag = { conceal = "" },
            },
            ["^code$"] = {
                on_opening_tag = { conceal = "", hl_mode = "combine", virt_text_pos = "inline", virt_text = { { " ", "MarkviewInlineCode" } } },
                on_node = { hl_group = "MarkviewInlineCode" },
                on_closing_tag = { conceal = "", hl_mode = "combine", virt_text_pos = "inline", virt_text = { { " ", "MarkviewInlineCode" } } },
            },
            ["^em$"] = {
                on_opening_tag = { conceal = "" },
                on_node = { hl_group = "@text.emphasis" },
                on_closing_tag = { conceal = "" },
            },
            ["^i$"] = {
                on_opening_tag = { conceal = "" },
                on_node = { hl_group = "Italic" },
                on_closing_tag = { conceal = "" },
            },
            ["^kbd$"] = function(_, item)
                local hl = "MarkviewInlineCode";
                local output = {
                    on_opening_tag = { conceal = "" },
                    on_node = {
                        virt_text_pos = "inline",
                        right_gravity = true,
                        hl_group = hl
                    },
                    on_closing_tag = { conceal = "", hl_mode = "combine", virt_text_pos = "inline", virt_text = { { " ", hl } } },
                };

                if not item then
                    return output;
                end

                ---@type integer Start column of the node.
                local start_col = item.range.col_start;

                ---@type integer[] Output of `TSNode:range()` on the opening tag.
                local open_range = item.opening_tag.range;
                ---@type integer[] Output of `TSNode:range()` on the closing tag.
                local close_range = item.closing_tag.range;

                ---@type string Normalized keymap.
                local key = string.upper(
                    string.sub(
                        item.text[1],
                        (open_range[4] + 1) - start_col,
                        close_range[2] - start_col
                    )
                );

                if string.match(key, "^%<C") or string.match(key, "CTRL") then
                    hl = "MarkviewPalette3";

                    output.on_node.hl_group = hl;
                    output.on_node.virt_text = { { "  ", hl } };
                    output.on_closing_tag.virt_text = { { " ", hl } };
                elseif string.match(key, "^%<S") or string.match(key, "SHIFT") then
                    hl = "MarkviewPalette4";

                    output.on_node.hl_group = hl;
                    output.on_node.virt_text = { { " 󰘶 ", hl } };
                    output.on_closing_tag.virt_text = { { " ", hl } };
                elseif
                    string.match(key, "^%<M") or
                    string.match(key, "OPT") or string.match(key, "OPTION") or
                    string.match(key, "ALT") or string.match(key, "META")
                then
                    hl = "MarkviewPalette2";

                    output.on_node.hl_group = hl;
                    output.on_node.virt_text = { { " 󰘵 ", hl } };
                    output.on_closing_tag.virt_text = { { " ", hl } };
                elseif string.match(key, "CMD") or string.match(key, "COMMAND") then
                    hl = "MarkviewPalette5";

                    output.on_node.hl_group = hl;
                    output.on_node.virt_text = { { " 󰘳 ", hl } };
                    output.on_closing_tag.virt_text = { { " ", hl } };
                elseif string.match(key, "CAPS.LOCK") then
                    hl = "MarkviewPalette1";

                    output.on_node.hl_group = hl;
                    output.on_node.virt_text = { { " 󰘲 ", hl } };
                    output.on_closing_tag.virt_text = { { " ", hl } };
                elseif string.match(key, "SPACE") then
                    hl = "MarkviewPalette5";

                    output.on_node.hl_group = hl;
                    output.on_node.virt_text = { { " 󱁐 ", hl } };
                    output.on_closing_tag.virt_text = { { " ", hl } };
                elseif string.match(key, "ENTER") then
                    hl = "MarkviewPalette2";

                    output.on_node.hl_group = hl;
                    output.on_node.virt_text = { { " 󰌑 ", hl } };
                    output.on_closing_tag.virt_text = { { " ", hl } };
                elseif string.match(key, "TAB") then
                    hl = "MarkviewPalette3";

                    output.on_node.hl_group = hl;
                    output.on_node.virt_text = { { " 󰌒 ", hl } };
                    output.on_closing_tag.virt_text = { { " ", hl } };
                else
                    hl = "MarkviewPalette6";

                    output.on_node.hl_group = hl;
                    output.on_node.virt_text = { { " 󰌌 ", hl } };
                    output.on_closing_tag.virt_text = { { " ", hl } };
                end

                return output;
            end,
            ["^mark$"] = {
                on_opening_tag = { conceal = "" },
                on_node = { hl_group = "MarkviewPalette1" },
                on_closing_tag = { conceal = "" },
            },
            ["^pre$"] = {
                on_opening_tag = { conceal = "" },
                on_node = { hl_group = "Special" },
                on_closing_tag = { conceal = "" },
            },
            ["^strong$"] = {
                on_opening_tag = { conceal = "" },
                on_node = { hl_group = "@text.strong" },
                on_closing_tag = { conceal = "" },
            },
            ["^sub$"] = {
                on_opening_tag = { conceal = "", hl_mode = "combine", virt_text_pos = "inline", virt_text = { { "↓[", "MarkviewSubscript" } } },
                on_node = { hl_group = "MarkviewSubscript" },
                on_closing_tag = { conceal = "", hl_mode = "combine", virt_text_pos = "inline", virt_text = { { "]", "MarkviewSubscript" } } },
            },
            ["^sup$"] = {
                on_opening_tag = { conceal = "", hl_mode = "combine", virt_text_pos = "inline", virt_text = { { "↑[", "MarkviewSuperscript" } } },
                on_node = { hl_group = "MarkviewSuperscript" },
                on_closing_tag = { conceal = "", hl_mode = "combine", virt_text_pos = "inline", virt_text = { { "]", "MarkviewSuperscript" } } },
            },
            ["^s$"] = {
                on_opening_tag = { conceal = "" },
                on_node = { hl_group = "@markup.strikethrough" },
                on_closing_tag = { conceal = "" },
            },
            ["^strike$"] = {
                on_opening_tag = { conceal = "" },
                on_node = { hl_group = "@markup.strikethrough" },
                on_closing_tag = { conceal = "" },
            },
            ["^del$"] = {
                on_opening_tag = { conceal = "" },
                on_node = { hl_group = "@markup.strikethrough" },
                on_closing_tag = { conceal = "" },
            },
            ["^u$"] = {
                on_opening_tag = { conceal = "" },
                on_node = { hl_group = "Underlined" },
                on_closing_tag = { conceal = "" },
            },
        },
        headings = {
            enable = true,

            heading_1 = {
                hl_group = "MarkviewPalette1Bg"
            },
            heading_2 = {
                hl_group = "MarkviewPalette2Bg"
            },
            heading_3 = {
                hl_group = "MarkviewPalette3Bg"
            },
            heading_4 = {
                hl_group = "MarkviewPalette4Bg"
            },
            heading_5 = {
                hl_group = "MarkviewPalette5Bg"
            },
            heading_6 = {
                hl_group = "MarkviewPalette6Bg"
            },
        },
        void_elements = {
            enable = true,

            ["^hr$"] = {
                on_node = {
                    conceal = "",

                    virt_text_pos = "inline",
                    virt_text = {
                        { "─", "MarkviewGradient2" },
                        { "─", "MarkviewGradient3" },
                        { "─", "MarkviewGradient4" },
                        { "─", "MarkviewGradient5" },
                        { " ◉ ", "MarkviewGradient9" },
                        { "─", "MarkviewGradient5" },
                        { "─", "MarkviewGradient4" },
                        { "─", "MarkviewGradient3" },
                        { "─", "MarkviewGradient2" },
                    }
                }
            },
            ["^br$"] = {
                on_node = {
                    conceal = "",

                    virt_text_pos = "inline",
                    virt_text = {
                        { "󱞦", "Comment" },
                    }
                }
            },
        }
    }
});
