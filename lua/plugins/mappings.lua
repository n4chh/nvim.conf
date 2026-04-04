vim.g.mapleader = " "
vim.g.maplocalleader = " "
		vim.pack.add({
			"https://github.com/folke/which-key.nvim",
		})
		local opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
			-- preset = "helix",
			win = {
				width = { min = 30, max = 80 },
				height = { min = 4, max = 0.75 },
				padding = { 0, 1 },
				col = -1,
				row = -1,
				-- border = { "▛", "▀", "▜", "▐", "▟", "▄", "▙", "▌" },
				border = vim.o.winborder,
				title = true,
				title_pos = "left",
			},
			layout = {
				width = { min = 30 },
			},
			spec = {
				{
					mode = { "n", "v" },
					{ "<leader>e", desc = "explorer", ":Neotree toggle<CR>" },
					{
						"<leader>F",
						desc = "formater",
						function()
							vim.lsp.buf.format()
						end
					},
					{ "<leader>f", group = "find" },
					{ "<leader>fs", desc = "search", ":Files<CR>" },
					{ "<leader>fg", desc = "rip-grep", ":Rg<CR>" },
					{ "<leader>K", desc = "hover", vim.lsp.buf.hover },
					-- { "<leader>r", desc = "rename", vim.lsp.buf.rename },
					{ "<F2>", desc = "rename", vim.lsp.buf.rename },
					{ "<leader>s", group = "search" },
					{ "<leader>sC", desc = "Search Colorscheme", ":Colors<CR>" },
					{ "<leader>sh", desc = "Search helptags", ":Helptags<CR>" },
					{ "<leader>sm", desc = "Search mappings", ":Maps<CR>" },
					{ "<leader>sc", desc = "Search commands", ":Commands<CR>" },

					{ "<leader>x", group = "diagnostics/quickfix", icon = { icon = "󱖫 ", color = "green" } },
					{ "<leader>y", desc = "Yank to system clipboard", '"+y' },
					{ "<leader>p", desc = "Paste from system clipboard", '"+p' },
					{ "<leader>d", desc = "Delete and yank to system clipboard", '"+d' },
					{ "<leader>c", desc = "Change and yank to system clipboard", '"+c' },
					{ "<leader>t", desc = "Toggle Terminal", ':ToggleTerm<CR>' },


					-- git
					{ "<leader>g", group = "git" },
					{ "<leader>gb", group = "buffers" },

					{ "<leader>gbh", desc = "buffer git history", ":buffer_history_preview<CR>" },
					{ "<leader>gbb", desc = "buffer git blame", ":VGit buffer_blame_preview<CR>" },
					{ "<leader>gbd", desc = "buffer git diff", ":VGit buffer_diff_preview<CR>" },
					{ "[", group = "prev" },
					{ "]", group = "next" },
					{ "g", group = "goto" },
					{ "gs", group = "surround" },
					{ "z", group = "fold" },
					{
						"<leader>D",
						desc = "Show diagnostic",
						vim.diagnostic.open_float,
					},
					{
						"<leader>b",
						group = "buffer",
						expand = function()
							return require("which-key.extras").expand.buf()
						end,
					},
					{ "<leader>bc", desc = "Close buffer",        ':<C-U>bprevious <bar> bdelete #<CR>' },
					{
						"<leader>w",
						group = "windows",
						proxy = "<c-w>",
						expand = function()
							return require("which-key.extras").expand.win()
						end,
					},
					-- better descriptions
					{ "gx",         desc = "Open with system app" },
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
	require("which-key").setup(opts)

