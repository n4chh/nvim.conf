return {
	{
		"rmehri01/onenord.nvim",
		opts = {},
	},
	{
		"rebelot/kanagawa.nvim",
		opts = {
			compile = false, -- enable compiling the colorscheme
			undercurl = true, -- enable undercurls
			commentStyle = { italic = true },
			functionStyle = {},
			keywordStyle = { italic = true },
			statementStyle = { bold = true },
			typeStyle = {},
			transparent = false, -- do not set background color
			dimInactive = false, -- dim inactive window `:h hl-NormalNC`
			terminalColors = true, -- define vim.g.terminal_color_{0,17}
			colors = {    -- add/modify theme and palette colors
				palette = {},
				theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
			},
			overrides = function(colors) -- add/modify highlights
				return {}
			end,
			theme = "wave", -- Load "wave" theme
			background = { -- map the value of 'background' option to a theme
				dark = "wave", -- try "dragon" !
				light = "lotus"
			},
		},
	},
	{
	"rose-pine/neovim",
	name = "rose-pine",
	opts = {
	    variant = "auto", -- auto, main, moon, or dawn
	    dark_variant = "main", -- main, moon, or dawn
	    dim_inactive_windows = false,
	    extend_background_behind_borders = true,
	
	    enable = {
	        terminal = true,
	        legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
	        migrations = true, -- Handle deprecated options automatically
	    },
	
	    styles = {
	        bold = true,
	        italic = true,
	        transparency = true,
	    },
	
	    groups = {
	        border = "muted",
	        link = "iris",
	        panel = "surface",
	
	        error = "love",
	        hint = "iris",
	        info = "foam",
	        note = "pine",
	        todo = "rose",
	        warn = "gold",
	
	        git_add = "foam",
	        git_change = "rose",
	        git_delete = "love",
	        git_dirty = "rose",
	        git_ignore = "muted",
	        git_merge = "iris",
	        git_rename = "pine",
	        git_stage = "iris",
	        git_text = "rose",
	        git_untracked = "subtle",
	
	        h1 = "iris",
	        h2 = "foam",
	        h3 = "rose",
	        h4 = "gold",
	        h5 = "pine",
	        h6 = "foam",
	    },
	
	    palette = {
	        -- Override the builtin palette per variant
	        -- moon = {
	        --     base = '#18191a',
	        --     overlay = '#363738',
	        -- },
	    },
	
		-- NOTE: Highlight groups are extended (merged) by default. Disable this
		-- per group via `inherit = false`
	    highlight_groups = {
	        -- Comment = { fg = "foam" },
	        -- StatusLine = { fg = "love", bg = "love", blend = 15 },
	        -- VertSplit = { fg = "muted", bg = "muted" },
	        -- Visual = { fg = "base", bg = "text", inherit = false },
	    },
	
	    before_highlight = function(group, highlight, palette)
	        -- Disable all undercurls
	        -- if highlight.undercurl then
	        --     highlight.undercurl = false
	        -- end
	        --
	        -- Change palette colour
	        -- if highlight.fg == palette.pine then
	        --     highlight.fg = palette.foam
	        -- end
	    end,
		},
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
			transparent_background = true, -- disables setting the background color.
			float = {
				transparent = true, -- enable transparent floating windows
				solid = false,    -- use solid styling for floating windows, see |winborder|
			},
			show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
			term_colors = false,  -- sets terminal colors (e.g. `g:terminal_color_0`)
			dim_inactive = {
				enabled = false,  -- dims the background color of inactive window
				shade = "dark",
				percentage = 0.15, -- percentage of the shade to apply to the inactive window
			},
			no_italic = false,    -- Force no italic
			no_bold = false,      -- Force no bold
			no_underline = false, -- Force no underline
			styles = {            -- Handles the styles of general hi groups (see `:h highlight-args`):
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
		-- config = function(_, opts)
		priority = 1000
	}
}
