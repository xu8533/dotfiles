require("render-markdown").setup({
    enabled = true,
    -- file_types = { 'markdown', 'quarto' },
    file_types = { 'markdown' },
    -- render_modes = { 'n', 'c', 't' },
    render_modes = true,
    -- | obsidian | mimic Obsidian UI                                          |
    -- | lazy     | will attempt to stay up to date with LazyVim configuration |
    -- | none     | does nothing                                               |
    -- preset = 'obsidian',
    -- overrides = {
    --     buftype = {
    --         nofile = {
    --             code = { left_pad = 0, right_pad = 0 },
    --         },
    --     },
    -- },
    quote = {
        enabled = false,
        -- render_modes = false,
        -- icon = '▯',
        -- -- icon = '▋',
        -- repeat_linebreak = true,
        -- highlight = {
        --     'RenderMarkdownQuote1',
        --     'RenderMarkdownQuote2',
        --     'RenderMarkdownQuote3',
        --     'RenderMarkdownQuote4',
        --     'RenderMarkdownQuote5',
        --     'RenderMarkdownQuote6',
        -- },
    },
    anti_conceal = {
        enabled = false,
    },
    bullet = {
        enabled = false,
    },
    -- callout = {
    --     enabled = false,
    --     note = {
    --         rendered = "󰅾 Notary",
    --         quote_icon = "█",
    --     },
    -- },
    checkbox = {
        enabled = false,
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
        enabled = false,
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
        enabled = false,
        lsp = { enabled = true },
    },
    dash = {
        enabled = false,
        width = 25
    },
    heading = {
        enabled = false,
        width = 'block',
        min_width = 30,
        position = "inline",
        sign = false,
        border = true,
        border_virtual = true,
        icons = { "󰼏 ", "󰼐 ", "󰼑 ", "󰼒 ", "󰼓 ", "󰼔 " },
    },
    indent = {
        enabled = false,
        skip_level = 0,
        skip_heading = true,
    },
    latex = {
        enabled = false,
        -- position = "above",
        -- bottom_pad = 1,
    },
    link = {
        enabled = false,
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
        enabled = false,
        left_margin = 0.5,
        min_width = 30,
    },
    pipe_table = {
        enabled = true,
        render_modes = false,
        -- preset = 'round',
        preset = 'heavy',
        cell = 'trimmed',
        min_width = 12,
        alignment_indicator = '┅',
    },
    sign = { enabled = true },
    -- Snacks.toggle({
    --     name = "Render Markdown",
    --     get = function()
    --         return require("render-markdown.state").enabled
    --     end,
    --     set = function(enabled)
    --         local m = require("render-markdown")
    --         if enabled then
    --             m.enable()
    --         else
    --             m.disable()
    --         end
    --     end,
    -- }):map("<leader>um"),
})
