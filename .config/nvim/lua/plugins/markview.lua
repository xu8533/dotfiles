-- For `plugins/markview.lua` users.
return {
    "OXY2DEV/markview.nvim",
    lazy = false,
    -- enabled = false,
    -- Completion for `blink.cmp`
    dependencies = { "saghen/blink.cmp" },
    opts = {
        experimental = {
            fancy_comments = true,
            date_formats = {
                "^%d%d%d%d%-%d%d%-%d%d$",      --- YYYY-MM-DD
                "^%d%d%-%d%d%-%d%d%d%d$",      --- DD-MM-YYYY, MM-DD-YYYY
                "^%d%d%-%d%d%-%d%d$",          --- DD-MM-YY, MM-DD-YY, YY-MM-DD
                "^%d%d%d%d%/%d%d%/%d%d$",      --- YYYY/MM/DD
                "^%d%d%/%d%d%/%d%d%d%d$",      --- DD/MM/YYYY, MM/DD/YYYY
                "^%d%d%d%d%.%d%d%.%d%d$",      --- YYYY.MM.DD
                "^%d%d%.%d%d%.%d%d%d%d$",      --- DD.MM.YYYY, MM.DD.YYYY
                "^%d%d %a+ %d%d%d%d$",         --- DD Month YYYY
                "^%a+ %d%d %d%d%d%d$",         --- Month DD, YYYY
                "^%d%d%d%d %a+ %d%d$",         --- YYYY Month DD
                "^%a+%, %a+ %d%d%, %d%d%d%d$", --- Day, Month DD, YYYY
            },
            date_time_formats = {
                "^%a%a%a %a%a%a %d%d %d%d%:%d%d%:%d%d ... %d%d%d%d$", --- UNIX date time
                "^%d%d%d%d%-%d%d%-%d%dT%d%d%:%d%d%:%d%dZ$",           --- ISO 8601
            },
            file_open_command = "tabnew",
            list_empty_line_tolerance = 3,
            prefer_nvim = true,
            read_chunk_size = 1024,
            linewise_ignore_org_indent = false,
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
            },
        },

        latex = {
            enable = true,
            blocks = {
                hl = "MarkviewCode",
                pad_char = " ",
                pad_amount = 3,
                text = "  LaTeX ",
                text_hl = "MarkviewCodeInfo"
            },
            inlines = {
                enable = true,
                padding_left = " ",
                padding_right = " ",
                hl = "MarkviewInlineCode"
            },

            commands = {
                enable = nil,
            },
            escapes = { enable = true },
            parenthesis = { enable = true },
            fonts = {
                enable = true,
                default = {
                    enable = true,
                    hl = "MarkviewSpecial"
                },
                mathbf = { enable = true },
                mathbfit = { enable = true },
                mathcal = { enable = true },
                mathbfscr = { enable = true },
                mathfrak = { enable = true },
                mathbb = { enable = true },
                mathbffrak = { enable = true },
                mathsf = { enable = true },
                mathsfbf = { enable = true },
                mathsfit = { enable = true },
                mathsfbfit = { enable = true },
                mathtt = { enable = true },
                mathrm = { enable = true },
            },
            subscripts = {
                enable = true,
                hl = "MarkviewSubscript"
            },
            superscripts = {
                enable = true,
                hl = "MarkviewSuperscript"
            },
            symbols = {
                enable = true,
                hl = "MarkviewComment"
            },
            texts = { enable = true },
        },

        markdown = {
            enable = nil,
            block_quoutes = {},
            code_blocks = {},
            headings = {},
            horizontal_rules = {},
            list_items = {},
            tables = {},
            metadata_plus = {},
            metadata_minus = {},
            reference_definitions = {},
        },
        markdown_inline = {
            enable = nil,
            block_references = {},
            checkboxes = {},
            emails = {},
            footnotes = {},
            hyperlinks = {},
            images = {},
            inline_codes = {},
            uri_autolinks = {},
            embed_files = {},
            highlights = {},
            internal_links = {},
            entities = {},
            emoji_shorthands = {},
            escapes = {},
        },

        preview = {
            enable = true,
            map_gx = true,
            callbacks = {},
            filetypes = { "quarto", "rmd", "typst" },
            ignore_buftypes = { "nofile" },
            ignore_previews = {},
            debounce = 150,
            icon_provider = "mini",
            max_buf_lines = 1000,
            modes = { "n", "no", "c" },
            enable_hybrid_mode = true,
            -- hybrid_modes = { "n" },
            linewise_hybrid_mode = true,
            draw_range = {
                1 * vim.o.lines, 1 * vim.o.lines
            },
            edit_range = { 0, 0 },
            -- splitview_winopts = { "right" },
        },

        typst = {
            enable = true,
            code_blocks = {
                enable = true,
                hl = "MarkviewCode",
                min_width = 60,
                pad_amount = 3,
                pad_char = " ",
                style = "block",
                text = "󰣖 Code",
                text_direction = "right",
                text_hl = "MarkviewIcon5"
            },
            code_spans = {
                enable = true,
                padding_left = " ",
                padding_right = " ",
                hl = "MarkviewCode"
            },
            escapes = { enable = true },
            symbols = {
                enable = true,
                hl = "Special"
            },
            headings = {
                enable = true,
                shift_width = 1,
                heading_1 = {
                    style = "icon",
                    sign = "󰌕 ",
                    sign_hl = "MarkviewHeading1Sign",
                    icon = "󰼏  ",
                    hl = "MarkviewHeading1",
                },
                heading_2 = {
                    style = "icon",
                    sign = "󰌖 ",
                    sign_hl = "MarkviewHeading2Sign",
                    icon = "󰎨  ",
                    hl = "MarkviewHeading2",
                },
                heading_3 = {
                    style = "icon",
                    icon = "󰼑  ",
                    hl = "MarkviewHeading3",
                },
                heading_4 = {
                    style = "icon",
                    icon = "󰎲  ",
                    hl = "MarkviewHeading4",
                },
                heading_5 = {
                    style = "icon",
                    icon = "󰼓  ",
                    hl = "MarkviewHeading5",
                },
                heading_6 = {
                    style = "icon",
                    icon = "󰎴  ",
                    hl = "MarkviewHeading6",
                }
            },
            labels = {
                enable = true,
                default = {
                    hl = "MarkviewInlineCode",
                    padding_left = " ",
                    icon = " ",
                    padding_right = " "
                }
            },
            list_items = {
                enable = true,
                indent_size = function(buffer)
                    if type(buffer) ~= "number" then
                        return vim.bo.shiftwidth or 4;
                    end
                    --- Use 'shiftwidth' value.
                    return vim.bo[buffer].shiftwidth or 4;
                end,
                shift_width = 4,
                marker_minus = {
                    add_padding = true,
                    text = "●",
                    hl = "MarkviewListItemMinus"
                },
                marker_plus = {
                    add_padding = true,
                    text = "%d)",
                    hl = "MarkviewListItemPlus"
                },
                marker_dot = {
                    add_padding = true,
                    text = "%d.",
                    hl = "MarkviewListItemStar"
                }
            },
            math_blocks = {
                enable = true,
                text = " 󰪚 Math ",
                pad_amount = 3,
                pad_char = " ",
                hl = "MarkviewCode",
                text_hl = "MarkviewCodeInfo"
            },
            math_spans = {
                enable = true,
                padding_left = " ",
                padding_right = " ",
                hl = "MarkviewInlineCode"
            },
            raw_blocks = {
                enable = true,
                style = "block",
                label_direction = "right",
                sign = true,
                min_width = 60,
                pad_amount = 3,
                pad_char = " ",
                border_hl = "MarkviewCode",
                default = {
                    block_hl = "MarkviewCode",
                    pad_hl = "MarkviewCode"
                },
                ["diff"] = {
                    block_hl = function(_, line)
                        if line:match("^%+") then
                            return "MarkviewPalette4";
                        elseif line:match("^%-") then
                            return "MarkviewPalette1";
                        else
                            return "MarkviewCode";
                        end
                    end,
                    pad_hl = "MarkviewCode"
                }
            },
            raw_spans = {
                enable = true,
                padding_left = " ",
                padding_right = " ",
                hl = "MarkviewInlineCode"
            },
            reference_links = {
                enable = true,
                default = {
                    icon = " ",
                    hl = "MarkviewHyperlink"
                },
            },
            terms = {
                enable = true,
                default = {
                    text = " ",
                    hl = "MarkviewPalette6Fg"
                },
            },
            url_links = {
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
            subscripts = {
                enable = true,
                hl = "MarkviewSubscript"
            },
            superscripts = {
                enable = true,
                hl = "MarkviewSuperscript"
            },
        },

        yaml = {
            enable = true,
            properties = {
                enable = true,
                data_types = {
                    ["text"] = {
                        text = "󰗊 ", hl = "MarkviewIcon4"
                    },
                    ["list"] = {
                        text = "󰝖 ", hl = "MarkviewIcon5"
                    },
                    ["number"] = {
                        text = " ", hl = "MarkviewIcon6"
                    },
                    ["checkbox"] = {
                        ---@diagnostic disable
                        text = function(_, item)
                            return item.value == "true" and "󰄲 " or "󰄱 "
                        end,
                        ---@diagnostic enable
                        hl = "MarkviewIcon6"
                    },
                    ["date"] = {
                        text = "󰃭 ", hl = "MarkviewIcon2"
                    },
                    ["date_&_time"] = {
                        text = "󰥔 ", hl = "MarkviewIcon3"
                    }
                },
                default = {
                    use_types = true,
                    border_top = nil,
                    border_middle = nil,
                    border_bottom = nil,
                    border_hl = nil,
                },
                ["^tags$"] = {
                    use_types = false,
                    text = "󰓹 ",
                    hl = "MarkviewIcon0"
                },
                ["^aliases$"] = {
                    match_string = "^aliases$",
                    use_types = false,
                    text = "󱞫 ",
                    hl = "MarkviewIcon2"
                },
                ["^cssclasses$"] = {
                    match_string = "^cssclasses$",
                    use_types = false,
                    text = " ",
                    hl = "MarkviewIcon3"
                },
                ["^publish$"] = {
                    match_string = "^publish$",
                    use_types = false,
                    text = "󰅧 ",
                    hl = "MarkviewIcon5"
                },
                ["^permalink$"] = {
                    match_string = "^permalink$",
                    use_types = false,
                    text = " ",
                    hl = "MarkviewIcon2"
                },
                ["^description$"] = {
                    match_string = "^description$",
                    use_types = false,
                    text = "󰋼 ",
                    hl = "MarkviewIcon0"
                },
                ["^image$"] = {
                    match_string = "^image$",
                    use_types = false,
                    text = "󰋫 ",
                    hl = "MarkviewIcon4"
                },
                ["^cover$"] = {
                    match_string = "^cover$",
                    use_types = false,
                    text = "󰹉 ",
                    hl = "MarkviewIcon2"
                }
            },
        },
    }
}
