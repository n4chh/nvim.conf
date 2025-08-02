local mapping_plugins = {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
			-- preset = "helix",
			win = {
				width = { min = 30, max = 60 },
				height = { min = 4, max = 0.75 },
				padding = { 0, 1 },
				col = -1,
				row = -1,
				-- border = { "▛", "▀", "▜", "▐", "▟", "▄", "▙", "▌" },
				border = "rounded",
				title = true,
				title_pos = "left",
			},
			layout = {
				width = { min = 30 },
			},
			defaults = {},
			spec = {
				{
					mode = { "n", "v" },
					{ "<leader><tab>", group = "tabs" },
					{ "<leader>c", group = "code" },
					{ "<leader>e", desc = "explorer", ":Neotree toggle<CR>" },
					{ "<leader>d", group = "debug" },
					{ "<leader>dp", group = "profiler" },
					{ "<leader>f", group = "find" },
					{ "<leader>fs", desc = "search", ":Files<CR>" },
					{ "<leader>g", group = "git" },
					{ "<leader>gh", group = "hunks" },
					{ "<leader>q", group = "quit/session" },
					{ "<leader>s", group = "search" },
					{ "<leader>u", group = "ui", icon = { icon = "󰙵 ", color = "cyan" } },
					{ "<leader>x", group = "diagnostics/quickfix", icon = { icon = "󱖫 ", color = "green" } },
					{ "[", group = "prev" },
					{ "]", group = "next" },
					{ "g", group = "goto" },
					{ "gs", group = "surround" },
					{ "z", group = "fold" },
					{
						"<leader>b",
						group = "buffer",
						expand = function()
							return require("which-key.extras").expand.buf()
						end,
					},
					{
						"<leader>w",
						group = "windows",
						proxy = "<c-w>",
						expand = function()
							return require("which-key.extras").expand.win()
						end,
					},
					-- better descriptions
					{ "gx", desc = "Open with system app" },
				},
			},
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
}

local visual_plugins = {
	{
		"f-person/auto-dark-mode.nvim",
		config = function()
			local adm = require("auto-dark-mode")
			local lualine = require("lualine")

			adm.setup({
				set_dark_mode = function()
					vim.api.nvim_set_option_value("background", "dark", {})
					local kanagawa_paper_ink = require("lualine.themes.kanagawa-paper-ink")
					lualine.setup({
						options = {
							theme = kanagawa_paper_ink,
						}
					})
				end,
				set_light_mode = function()
					local kanagawa_paper_canvas = require("lualine.themes.kanagawa-paper-canvas")
					lualine.setup({
						options = {
							theme = kanagawa_paper_canvas,
						}
					})
					vim.api.nvim_set_option_value("background", "light", {})
				end,
				update_interval = 1000,
				fallback = "dark",
			})
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function() end,
	},
}

local searching_plugins = {
	{
		"junegunn/fzf.vim",
		lazy = false,
		dependencies = {
			"junegunn/fzf",
		},
		config = function() end,
	},
}

local plugins = {
	mapping_plugins,
	visual_plugins,
	searching_plugins,
}
local plugins_table = {}
for _, v in ipairs(plugins) do
	table.insert(plugins_table, v)
end

return plugins_table
