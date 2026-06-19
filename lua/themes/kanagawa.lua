vim.pack.add({
	--Normal
	"https://github.com/rebelot/kanagawa.nvim",
	--Paper
	"https://github.com/thesimonho/kanagawa-paper.nvim",
})
local opts = {
	compile = false, -- enable compiling the colorscheme
	undercurl = true, -- enable undercurls
	commentStyle = { italic = true },
	functionStyle = {},
	keywordStyle = { italic = true },
	statementStyle = { bold = true },
	typeStyle = {},
	transparent = false,  -- do not set background color
	dimInactive = true,  -- dim inactive window `:h hl-NormalNC`
	terminalColors = true, -- define vim.g.terminal_color_{0,17}
	colors = {            -- add/modify theme and palette colors
		palette = {
			lotusWhite0 = "#e3dddb",
			lotusWhite1 = "#e7e2e0",
			lotusWhite2 = "#eae6e4",
			lotusWhite3 = "#f0edec",
			lotusWhite4 = "#e7e2e0",
			lotusWhite5 = "#e3dddb",
		},
		theme = { wave = {}, lotus = {

		}, dragon = {}, all = {} },
	},
	overrides = function(colors) -- add/modify highlights
		return {}
	end,
	theme = "wave", -- Load "wave" theme
	background = { -- map the value of 'background' option to a theme
		dark = "wave", -- try "dragon" !
		light = "lotus"
	},
}
require("kanagawa").setup(opts)
require("kanagawa-paper").setup(opts)
