return {
	{
		"rmehri01/onenord.nvim",
		opts = {},
	},
	{
		"thesimonho/kanagawa-paper.nvim",
		opts = {},
	},
	{
		"lunacookies/vim-colors-xcode",
		opts = {},
		config = function()
		end
	},
	{
		'Mofiqul/vscode.nvim'
	},
	{
		"scottmckendry/cyberdream.nvim",
		config = function()
			require("cyberdream").setup({
				variant = "auto", -- use "light" for the light variant. Also accepts "auto" to set dark or light colors based on the current value of `vim.o.background`
				transparent = true,
				saturation = 1, -- accepts a value between 0 and 1. 0 will be fully desaturated (greyscale) and 1 will be the full color (default)
				italic_comments = true,
			})
		end
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		opts =
		{
			flavour = "auto", -- latte, frappe, macchiato, mocha
			background = { -- :h background
				light = "latte",
				dark = "mocha",
			},
			transparent_background = false, -- disables setting the background color.
			float = {
				transparent = false, -- enable transparent floating windows
				solid = false,     -- use solid styling for floating windows, see |winborder|
			},
			show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
			term_colors = false,   -- sets terminal colors (e.g. `g:terminal_color_0`)
			dim_inactive = {
				enabled = false,   -- dims the background color of inactive window
				shade = "dark",
				percentage = 0.15, -- percentage of the shade to apply to the inactive window
			},
			no_italic = false,     -- Force no italic
			no_bold = false,       -- Force no bold
			no_underline = false,  -- Force no underline
			styles = {             -- Handles the styles of general hi groups (see `:h highlight-args`):
				comments = { "italic" }, -- Change the style of comments
				conditionals = { "italic" },
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
				-- miscs = {}, -- Uncomment to turn off hard-coded styles
			},
			color_overrides = {},
			custom_highlights = {},
			default_integrations = true,
			auto_integrations = false,
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
		},
		priority = 1000
	}
}
