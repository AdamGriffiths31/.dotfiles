require("catppuccin").setup({
    transparent_background = false, -- disables setting the background color.
    show_end_of_buffer = false,     -- shows the '~' characters after the end of buffers
    term_colors = true,            -- sets terminal colors (e.g. `g:terminal_color_0`)
    dim_inactive = {},
    no_italic = false,              -- Force no italic
    no_bold = false,                -- Force no bold
    no_underline = false,           -- Force no underline
    styles = {                      -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { "italic" },    -- Change the style of comments
        conditionals = {},
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
    },
	color_overrides = {
				mocha = {
					base = "#000000",
					mantle = "#000000",
					crust = "#000000",
				},
			},
    custom_highlights = {},
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        mini = {
            enabled = true,
            indentscope_color = "",
        },
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
})

-- setup must be called before loading
vim.cmd.colorscheme "catppuccin"
