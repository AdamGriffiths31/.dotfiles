require('catppuccin').setup {
	no_italic = true,
	color_overrides = {
		all = {
			rosewater = '#f66151',
			flamingo = '#c061cb',
			pink = '#c061cb',
			mauve = '#c061cb',
			red = '#e01b24',
			maroon = '#f66151',
			peach = '#ffa348',
			yellow = '#F5C211',
			green = '#33d17a',
			teal = '#54DBF6',
			sky = '#62a0ea',
			sapphire = '#62a0ea',
			blue = '#62a0ea',
			lavender = '#c061cb',
			text = '#ffffff',
			subtext1 = '#deddda',
			subtext0 = '#c0bfbc',
			overlay2 = '#858585',
			overlay1 = '#737373',
			overlay0 = '#616161',
			surface2 = '#4f4f4f',
			surface1 = '#3e3e3e',
			surface0 = '#2e2e2e',
			base = '#1E1E1E',
			mantle = '#1A1A1A',
			crust = '#101010'
		}
	},
	custom_highlights = function(colors)
		return {
			LineNr = {fg = colors.surface1},
			CursorLineNr = {fg = colors.overlay2},
			CursorLine = {bg = '#252525'},
			ColorColumn = {bg = '#252525'},
			Visual = {bg = colors.surface1},
			MsgArea = {fg = colors.subtext0},
			TabLine = {bg = colors.mantle},
			TabLineFill = {bg = colors.mantle},
			TabLineSel = {fg = colors.subtext0, bg = colors.base},

			GitSignsAdd = {fg = '#467555'},
			GitSignsChange = {fg = '#856f3a'},
			GitSignsDelete = {fg = '#753b34'},
			TelescopeBorder = {fg = colors.subtext0},

			Constant = {fg = colors.blue},
			String = {fg = colors.subtext0},
			Character = {fg = colors.subtext0},
			Number = {fg = colors.blue},
			Boolean = {fg = colors.blue},
			Float = {fg = colors.blue},
			Identifier = {fg = colors.green},
			Function = {fg = colors.green},
			Statement = {fg = colors.green},
			Conditional = {fg = colors.green},
			Repeat = {fg = colors.green},
			Label = {fg = colors.green},
			Operator = {fg = colors.subtext0},
			Keyword = {fg = colors.green},
			Exception = {fg = colors.green},
			PreProc = {fg = colors.yellow},
			Include = {fg = colors.yellow},
			Define = {fg = colors.yellow},
			Macro = {fg = colors.yellow},
			PreCondit = {fg = colors.yellow},
			Type = {fg = colors.blue},
			StorageClass = {fg = colors.overlay2},
			Structure = {fg = colors.subtext0},
			Special = {fg = colors.overlay2},
			SpecialChar = {fg = colors.overlay2}
		}
	end
}

vim.cmd 'colorscheme catppuccin'
