require("render-markdown").setup({
    enabled = true,
    file_types = { 'markdown', 'quarto' },
    render_modes = { 'n', 'c', 't' },
    -- | obsidian | mimic Obsidian UI                                          |
    -- | lazy     | will attempt to stay up to date with LazyVim configuration |
    -- | none     | does nothing                                               |
    preset = 'obsidian',
    overrides = {
        buftype = {
            nofile = {
                code = { left_pad = 0, right_pad = 0 },
            },
        },
    },
    quote = {
        enabled = true,
        render_modes = false,
        icon = '▯',
        -- icon = '▋',
        repeat_linebreak = true,
        highlight = {
            'RenderMarkdownQuote1',
            'RenderMarkdownQuote2',
            'RenderMarkdownQuote3',
            'RenderMarkdownQuote4',
            'RenderMarkdownQuote5',
            'RenderMarkdownQuote6',
        },
    },
    anti_conceal = {
        enabled = true,
        disabled_modes = false,
        above = 0,
        below = 0,
        -- Which elements to always show, ignoring anti conceal behavior. Values can either be
        -- booleans to fix the behavior or string lists representing modes where anti conceal
        -- behavior will be ignored. Valid values are:
        --   bullet
        --   callout
        --   check_icon, check_scope
        --   code_background, code_border, code_language
        --   dash
        --   head_background, head_border, head_icon
        --   indent
        --   link
        --   quote
        --   sign
        --   table_border
        --   virtual_lines
        ignore = {
            code_background = true,
            indent = true,
            sign = true,
            virtual_lines = true,
        },
    },
    bullet = {
        icons = { { '󰫶 ', '󱂉 ' } },
        left_pad = 4
    },
    callout = {
        note = {
            rendered = "󰅾 Notary",
            quote_icon = "█",
        },
    },
    checkbox = {
        unchecked = { icon = '✘ ' },
        checked = {
            icon = '  ',
            scope_highlight = '@markup.strikethrough'
        },
        custom = {
            todo = { rendered = '◯ ' },
            important = {
                raw = '[~]',
                rendered = '󰓎 ',
                highlight = 'DiagnosticWarn',
            },
        },

    },
    code = {
        -- 常规设置
        width = "block",
        min_width = 45,
        style = 'full',
        -- 边框
        border = "thin",
        left_pad = 2,
        right_pad = 10,
        -- 语言信息
        language_border = ' ',
        language_left = '',
        language_right = '',
        position = "right",
    },
    completions = {
        blink = { enabled = true },
        lsp = { enabled = true },
    },
    dash = { width = 25 },
    heading = {
        width = 'block',
        min_width = 30,
        position = "inline",
        sign = false,
        border = true,
        border_virtual = true,
        icons = { "󰼏 ", "󰼐 ", "󰼑 ", "󰼒 ", "󰼓 ", "󰼔 " },
    },
    indent = {
        enabled = true,
        skip_level = 0,
        skip_heading = true,
    },
    latex = {
        enabled = false,
        -- position = "above",
        -- bottom_pad = 1,
    },
    link = {
        wiki = { icon = " ", highlight = "RenderMarkdownWikiLink", scope_highlight = "RenderMarkdownWikiLink" },
        image = "󰋵 ",
        email = " ",
        hyperlink = "󰌷 ",
        custom = {
            python = { pattern = "%.py$", icon = "󰌠 " },
            github = { pattern = "github", icon = " " },
            gitlab = { pattern = "gitlab", icon = "󰮠 " },
            youtube = { pattern = "youtube", icon = " " },
            cern = { pattern = "cern.ch", icon = " " },
        },
    },
    paragraph = {
        left_margin = 0.5,
        min_width = 30,
    },
    pipe_table = {
        alignment_indicator = '┅',
        -- border = { "╭", "┬", "╮", "├", "┼", "┤", "╰", "┴", "╯", "│", "─" },
        cell = 'trimmed',
        preset = 'heavy'
        -- preset = 'double'
        -- preset = 'round'
    },
    sign = { enabled = true },
    win_options = {
        showbreak = {
            default = '',
            rendered = '  ',
        },
        breakindent = {
            default = false,
            rendered = true,
        },
        breakindentopt = {
            default = '',
            rendered = '',
        },
        concealcursor = { rendered = "nvc" }
    },
    yaml = { enabled = false },
    Snacks.toggle({
        name = "Render Markdown",
        get = function()
            return require("render-markdown.state").enabled
        end,
        set = function(enabled)
            local m = require("render-markdown")
            if enabled then
                m.enable()
            else
                m.disable()
            end
        end,
    }):map("<leader>um"),
})
