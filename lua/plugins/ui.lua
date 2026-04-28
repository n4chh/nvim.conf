-- Auto Dark/Light mode

vim.pack.add({
	"https://github.com/f-person/auto-dark-mode.nvim",
})
local adm = require("auto-dark-mode")
-- local lualine = require("lualine")

adm.setup({
	set_dark_mode = function()
		vim.api.nvim_set_option_value("background", "dark", {})
		-- local kanagawa_paper_ink = require("lualine.themes.kanagawa-paper-ink")
		-- lualine.setup({
		-- options = {
		-- 	theme = kanagawa_paper_ink,
		-- }
		-- })
		-- vim.cmd[[ colorscheme kanagawa ]]
	end,
	set_light_mode = function()
		-- local kanagawa_paper_canvas = require("lualine.themes.kanagawa-paper-canvas")
		-- lualine.setup({
		-- 	options = {
		-- 		theme = kanagawa_paper_canvas,
		-- 	}
		-- })
		vim.api.nvim_set_option_value("background", "light", {})
		-- vim.cmd[[ colorscheme kanagawa-paper ]]
	end,
	update_interval = 1000,
	fallback = "dark",
})

-- Telescope
vim.pack.add({
	"https://github.com/nvim-telescope/telescope.nvim",
	-- Deps
	"https://github.com/nvim-telescope/telescope-ui-select.nvim"
})


-- This is your opts table
require("telescope").setup {
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {
        -- even more opts
      }

      -- pseudo code / specification for writing custom displays, like the one
      -- for "codeactions"
      -- specific_opts = {
      --   [kind] = {
      --     make_indexed = function(items) -> indexed_items, width,
      --     make_displayer = function(widths) -> displayer
      --     make_display = function(displayer) -> function(e)
      --     make_ordinal = function(e) -> string
      --   },
      --   -- for example to disable the custom builtin "codeactions" display
      --      do the following
      --   codeactions = false,
      -- }
    }
  }
}
-- To get ui-select loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require("telescope").load_extension("ui-select")
-- Colorizer
vim.pack.add({
	"https://github.com/catgoose/nvim-colorizer.lua",
})
require 'colorizer'.setup {
	'*'
}
-- Transparency
vim.pack.add({
	"https://github.com/xiyaowong/transparent.nvim",
})
opts = {
	groups = {
		"NormalFloat", "FloatBorder",
		'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
		'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
		'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
		'SignColumn', 'CursorLine', 'CursorLineNr', 'StatusLine', 'StatusLineNC',
		'EndOfBuffer',
	},
}
require("transparent").setup(opts)

--Snacks
vim.pack.add({
	"https://github.com/folke/snacks.nvim"
})
local opts = {
	-- your configuration comes here
	-- or leave it empty to use the default settings
	-- refer to the configuration section below
	bigfile = { enabled = true },

	dashboard = {
		enabled = true,
		sections = {
			{ section = "header" },
			{ section = "keys",  gap = 1, padding = 1 },
			-- generator function: receives dashboard instance, returns an item table
			--
			--
			--
			function()
				local count = 0
				local lockfile = vim.fn.stdpath("config") .. "/nvim-pack-lock.json"
				local ok, data = pcall(vim.fn.readfile, lockfile)
				if ok and data then
					local parsed = vim.json.decode(table.concat(data, ""))
					if parsed and parsed.plugins then
						count = vim.tbl_count(parsed.plugins)
					end
				end

				local ms = math.floor(vim.uv.hrtime() / 1e6)

				return {
					{
						icon = "󰏖 ",
						desc = "loaded " .. count .. " plugins in " .. ms .. "ms",
						key = "u",
						action = function() vim.pack.update() end,
						padding = 1,
					},
				}
			end,
		},
	},
	explorer = { enabled = true },
	indent = { enabled = true },
	input = { enabled = true },
	picker = { enabled = true },
	notifier = { enabled = true },
	quickfile = { enabled = true },
	scope = { enabled = true },
	scroll = { enabled = true },
	statuscolumn = { enabled = true },
	words = { enabled = true },
}
require("snacks").setup(opts)

-- Noice

vim.pack.add({
	"https://github.com/folke/noice.nvim",
	--Dependencies
	"https://github.com/MunifTanjim/nui.nvim",
	-- OPTIONAL:
	--   `nvim-notify` is only needed, if you want to use the notification view.
	--   If not available, we use `mini` as the fallback
	"https://github.com/rcarriga/nvim-notify",
})
local opts = {
	-- add any options here
	views = {
		cmdline_popup = {
			position = {
				row = -2,
				col = 0
			}
		}
	},
	presets = {
		bottom_search = true,   -- use a classic bottom cmdline for search
		command_palette = true, -- position the cmdline and popupmenu together
		long_message_to_split = true, -- long messages will be sent to a split
		inc_rename = false,     -- enables an input dialog for inc-rename.nvim
		lsp_doc_border = true,  -- add a border to hover docs and signature help
	},
}
local noice = require("noice")

noice.setup(opts)

-- Lines
vim.pack.add({
	-- bufferline
	"https://github.com/akinsho/bufferline.nvim",
	--lualine
	"https://github.com/nvim-lualine/lualine.nvim",
	--dependencies
	"https://github.com/nvim-tree/nvim-web-devicons"
})

local opts = {
	options = {
		themable = false,
		mode = "buffers",     -- set to "tabs" to only show tabpages instead
		numbers = "none",
		separator_style = "thin",
		indicator = {
			icon = '❱', -- this should be omitted if indicator style is not 'icon'
			style = 'icon'
		},
		buffer_close_icon = '󰅖',
		modified_icon = '●',
		close_icon = '',
		left_trunc_marker = '',
		right_trunc_marker = '',
		-- The diagnostics indicator can be set to nil to keep the buffer name highlight but delete the highlighting
		offsets = {
			{
				filetype = "neo-tree",
				text = "󰙅 File Explorer",
				text_align = "left",
				separator = true
			},
		},
	}
}

require("bufferline").setup(opts)

local lualine_y = { "progress" }
table.insert(lualine_y, {
	noice.api.status.command.get,
	cond = noice.api.status.command.has,
})
table.insert(lualine_y, {
	noice.api.status.mode.get,
	cond = noice.api.status.mode.has,
})
table.insert(lualine_y, {
	noice.api.status.search.get,
	cond = noice.api.status.search.has,
})
local opts = {
	options = {
		-- section_separators = { left = '', right = '' },
		-- component_separators = { left = '', right = '' }
		section_separators = { left = '', right = '' },
		component_separators = { left = '', right = '' }
	},
	theme = "auto",
	icons_enabled = true,
	sections = {
		lualine_y = lualine_y
	},
}
require("lualine").setup(opts)
