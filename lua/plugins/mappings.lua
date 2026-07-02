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


			-- Claude Code
			{ "<leader>a", group = "claude", icon = { icon = "󰚩 ", color = "orange" } },
			{ "<leader>ac", desc = "Toggle Claude", "<cmd>ClaudeCode<cr>" },
			{ "<leader>af", desc = "Focus Claude", "<cmd>ClaudeCodeFocus<cr>" },
			{ "<leader>ar", desc = "Resume session", "<cmd>ClaudeCode --resume<cr>" },
			{ "<leader>aC", desc = "Continue last", "<cmd>ClaudeCode --continue<cr>" },
			{ "<leader>am", desc = "Select model", "<cmd>ClaudeCodeSelectModel<cr>" },
			{ "<leader>ab", desc = "Add current buffer", "<cmd>ClaudeCodeAdd %<cr>" },
			{ "<leader>as", desc = "Send selection", "<cmd>ClaudeCodeSend<cr>", mode = "v" },
			{ "<leader>at", desc = "Add from tree", "<cmd>ClaudeCodeTreeAdd<cr>" },
			{ "<leader>ay", desc = "Accept diff", "<cmd>ClaudeCodeDiffAccept<cr>" },
			{ "<leader>ax", desc = "Reject diff", "<cmd>ClaudeCodeDiffDeny<cr>" },

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
			{ "<leader>bc",      desc = "Close buffer",                                                  ':<C-U>bprevious <bar> bdelete #<CR>' },
			{
				"<leader>w",
				group = "windows",
				proxy = "<c-w>",
				expand = function()
					return require("which-key.extras").expand.win()
				end,
			},
			-- better descriptions
			{ "gx",              desc = "Open with system app" },


			-- Snacks --
			{ "<leader><space>", function() Snacks.picker.smart() end,                                   desc = "Smart Find Files" },
			{ "<leader>,",       function() Snacks.picker.buffers() end,                                 desc = "Buffers" },
			{ "<leader>/",       function() Snacks.picker.grep() end,                                    desc = "Grep" },
			{ "<leader>:",       function() Snacks.picker.command_history() end,                         desc = "Command History" },
			{ "<leader>n",       function() Snacks.picker.notifications() end,                           desc = "Notification History" },
			{ "<leader>e",       function() Snacks.explorer() end,                                       desc = "File Explorer" },
			-- find
			{ "<leader>fb",      function() Snacks.picker.buffers() end,                                 desc = "Buffers" },
			{ "<leader>fc",      function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
			{ "<leader>ff",      function() Snacks.picker.files() end,                                   desc = "Find Files" },
			{ "<leader>fg",      function() Snacks.picker.git_files() end,                               desc = "Find Git Files" },
			{ "<leader>fp",      function() Snacks.picker.projects() end,                                desc = "Projects" },
			{ "<leader>fr",      function() Snacks.picker.recent() end,                                  desc = "Recent" },
			-- git
			{ "<leader>gb",      function() Snacks.picker.git_branches() end,                            desc = "Git Branches" },
			{ "<leader>gl",      function() Snacks.picker.git_log() end,                                 desc = "Git Log" },
			{ "<leader>gL",      function() Snacks.picker.git_log_line() end,                            desc = "Git Log Line" },
			{ "<leader>gs",      function() Snacks.picker.git_status() end,                              desc = "Git Status" },
			{ "<leader>gS",      function() Snacks.picker.git_stash() end,                               desc = "Git Stash" },
			{ "<leader>gd",      function() Snacks.picker.git_diff() end,                                desc = "Git Diff (Hunks)" },
			{ "<leader>gf",      function() Snacks.picker.git_log_file() end,                            desc = "Git Log File" },
			-- gh
			{ "<leader>gi",      function() Snacks.picker.gh_issue() end,                                desc = "GitHub Issues (open)" },
			{ "<leader>gI",      function() Snacks.picker.gh_issue({ state = "all" }) end,               desc = "GitHub Issues (all)" },
			{ "<leader>gp",      function() Snacks.picker.gh_pr() end,                                   desc = "GitHub Pull Requests (open)" },
			{ "<leader>gP",      function() Snacks.picker.gh_pr({ state = "all" }) end,                  desc = "GitHub Pull Requests (all)" },
			-- Grep
			{ "<leader>sb",      function() Snacks.picker.lines() end,                                   desc = "Buffer Lines" },
			{ "<leader>sB",      function() Snacks.picker.grep_buffers() end,                            desc = "Grep Open Buffers" },
			{ "<leader>sg",      function() Snacks.picker.grep() end,                                    desc = "Grep" },
			{ "<leader>sw",      function() Snacks.picker.grep_word() end,                               desc = "Visual selection or word",    mode = { "n", "x" } },
			-- search
			{ '<leader>s"',      function() Snacks.picker.registers() end,                               desc = "Registers" },
			{ '<leader>s/',      function() Snacks.picker.search_history() end,                          desc = "Search History" },
			{ "<leader>sa",      function() Snacks.picker.autocmds() end,                                desc = "Autocmds" },
			{ "<leader>sb",      function() Snacks.picker.lines() end,                                   desc = "Buffer Lines" },
			{ "<leader>sc",      function() Snacks.picker.command_history() end,                         desc = "Command History" },
			{ "<leader>sC",      function() Snacks.picker.commands() end,                                desc = "Commands" },
			{ "<leader>sd",      function() Snacks.picker.diagnostics() end,                             desc = "Diagnostics" },
			{ "<leader>sD",      function() Snacks.picker.diagnostics_buffer() end,                      desc = "Buffer Diagnostics" },
			{ "<leader>sh",      function() Snacks.picker.help() end,                                    desc = "Help Pages" },
			{ "<leader>sH",      function() Snacks.picker.highlights() end,                              desc = "Highlights" },
			{ "<leader>si",      function() Snacks.picker.icons() end,                                   desc = "Icons" },
			{ "<leader>sj",      function() Snacks.picker.jumps() end,                                   desc = "Jumps" },
			{ "<leader>sk",      function() Snacks.picker.keymaps() end,                                 desc = "Keymaps" },
			{ "<leader>sl",      function() Snacks.picker.loclist() end,                                 desc = "Location List" },
			{ "<leader>sm",      function() Snacks.picker.marks() end,                                   desc = "Marks" },
			{ "<leader>sM",      function() Snacks.picker.man() end,                                     desc = "Man Pages" },
			{ "<leader>sp",      function() Snacks.picker.lazy() end,                                    desc = "Search for Plugin Spec" },
			{ "<leader>sq",      function() Snacks.picker.qflist() end,                                  desc = "Quickfix List" },
			{ "<leader>sR",      function() Snacks.picker.resume() end,                                  desc = "Resume" },
			{ "<leader>su",      function() Snacks.picker.undo() end,                                    desc = "Undo History" },
			{ "<leader>uC",      function() Snacks.picker.colorschemes() end,                            desc = "Colorschemes" },
			-- LSP
			{ "gd",              function() Snacks.picker.lsp_definitions() end,                         desc = "Goto Definition" },
			{ "gD",              function() Snacks.picker.lsp_declarations() end,                        desc = "Goto Declaration" },
			{ "gr",              function() Snacks.picker.lsp_references() end,                          nowait = true,                        desc = "References" },
			{ "gI",              function() Snacks.picker.lsp_implementations() end,                     desc = "Goto Implementation" },
			{ "gy",              function() Snacks.picker.lsp_type_definitions() end,                    desc = "Goto T[y]pe Definition" },
			{ "gai",             function() Snacks.picker.lsp_incoming_calls() end,                      desc = "C[a]lls Incoming" },
			{ "gao",             function() Snacks.picker.lsp_outgoing_calls() end,                      desc = "C[a]lls Outgoing" },
			{ "<leader>ss",      function() Snacks.picker.lsp_symbols() end,                             desc = "LSP Symbols" },
			{ "<leader>sS",      function() Snacks.picker.lsp_workspace_symbols() end,                   desc = "LSP Workspace Symbols" },
			-- Other
			{ "<leader>z",       function() Snacks.zen() end,                                            desc = "Toggle Zen Mode" },
			{ "<leader>Z",       function() Snacks.zen.zoom() end,                                       desc = "Toggle Zoom" },
			{ "<leader>.",       function() Snacks.scratch() end,                                        desc = "Toggle Scratch Buffer" },
			{ "<leader>S",       function() Snacks.scratch.select() end,                                 desc = "Select Scratch Buffer" },
			{ "<leader>n",       function() Snacks.notifier.show_history() end,                          desc = "Notification History" },
			{ "<leader>bd",      function() Snacks.bufdelete() end,                                      desc = "Delete Buffer" },
			{ "<leader>cR",      function() Snacks.rename.rename_file() end,                             desc = "Rename File" },
			{ "<leader>gB",      function() Snacks.gitbrowse() end,                                      desc = "Git Browse",                  mode = { "n", "v" } },
			{ "<leader>gg",      function() Snacks.lazygit() end,                                        desc = "Lazygit" },
			{ "<leader>gng",     ":Neogit<CR>",                                                          desc = "Neogit" },
			{ "<leader>un",      function() Snacks.notifier.hide() end,                                  desc = "Dismiss All Notifications" },
			{ "<c-/>",           function() Snacks.terminal() end,                                       desc = "Toggle Terminal" },
			{ "<c-_>",           function() Snacks.terminal() end,                                       desc = "which_key_ignore" },
			{ "]]",              function() Snacks.words.jump(vim.v.count1) end,                         desc = "Next Reference",              mode = { "n", "t" } },
			{ "[[",              function() Snacks.words.jump(-vim.v.count1) end,                        desc = "Prev Reference",              mode = { "n", "t" } },
			{
				"<leader>N",
				desc = "Neovim News",
				function()
					Snacks.win({
						file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
						width = 0.6,
						height = 0.6,
						wo = {
							spell = false,
							wrap = false,
							signcolumn = "yes",
							statuscolumn = " ",
							conceallevel = 3,
						},
					})
				end,
			},
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
