return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"folke/lazydev.nvim",
				ft = "lua",
				opts = {
					library = {
						{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
						{ path = "LazyVim",            words = { "LazyVim" } },
					},
				}
			}
		},
		lazy = false,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			{"nvim-treesitter/nvim-treesitter-context"},
		 	{ "OXY2DEV/markview.nvim" },
		},
		lazy = false,
		build = ":TSUpdate",
		config = function()
			local treesitter = require("nvim-treesitter.configs")

		local  opts = {

				ensure_installed = {
					"bash",
					"c",
					"css",
					"csv",
					"dockerfile",
					"fish",
					"gitignore",
					"html",
					"javascript",
					"json",
					"lua",
					"make",
					"markdown",
					"python",
					"query",
					"scss",
					"sql",
					"toml",
					"typescript",
					"vim",
					"vimdoc",
					"vue",
				},
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
				incremental_selection = {
					enable = true,
					keymaps = {
						node_incremental = "v",
						node_decremental = "V",
					},
				}
			}
			treesitter.setup(opts)
			require("treesitter-context").setup({enable = true})
		end
	},
	{
		"mason-org/mason.nvim",
		lazy = false,
		opts = {}
	}
}
