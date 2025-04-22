vim.g.mapleader = ' '
local dap = require('dap')
local dapui = require('dapui')
local wk = require("which-key")

local defaults = {
	---@type false | "classic" | "modern" | "helix"
	preset = "classic",
	-- Delay before showing the popup. Can be a number or a function that returns a number.
	---@type number | fun(ctx: { keys: string, mode: string, plugin?: string }):number
	delay = function(ctx)
		return ctx.plugin and 0 or 200
	end,
	---@param mapping wk.Mapping
	filter = function(mapping)
		-- example to exclude mappings without a description
		-- return mapping.desc and mapping.desc ~= ""
		return true
	end,
	--- You can add any mappings here, or use `require('which-key').add()` later
	---@type wk.Spec
	spec = {},
	-- show a warning when issues were detected with your mappings
	notify = true,
	-- Which-key automatically sets up triggers for your mappings.
	-- But you can disable this and setup the triggers manually.
	-- Check the docs for more info.
	---@type wk.Spec
	triggers = {
		{ "<auto>", mode = "nxso" },
	},
	-- Start hidden and wait for a key to be pressed before showing the popup
	-- Only used by enabled xo mapping modes.
	---@param ctx { mode: string, operator: string }
	defer = function(ctx)
		return ctx.mode == "V" or ctx.mode == "<C-V>"
	end,
	plugins = {
		marks = true, -- shows a list of your marks on ' and `
		registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
		spelling = {
			enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 20, -- how many suggestions should be shown in the list?
		},
		presets = {
			operators = true, -- adds help for operators like d, y, ...
			motions = true, -- adds help for motions
			text_objects = true, -- help for text objects triggered after entering an operator
			windows = true, -- default bindings on <c-w>
			nav = true, -- misc bindings to work with windows
			z = true,   -- bindings for folds, spelling and others prefixed with z
			g = true,   -- bindings for prefixed with g
		},
	},
	---@type wk.Win.opts
	win = {
		-- don't allow the popup to overlap with the cursor
		no_overlap = true,
		-- width = 1,
		-- height = { min = 4, max = 25 },
		-- col = 0,
		-- row = math.huge,
		border = "rounded",
		padding = { 1, 2 }, -- extra window padding [top/bottom, right/left]
		title = true,
		title_pos = "center",
		zindex = 1000,
		-- Additional vim.wo and vim.bo options
		bo = {},
		wo = {
			-- winblend = 10, -- value between 0-100 0 for fully opaque and 100 for fully transparent
		},
	},
	layout = {
		width = { min = 20 }, -- min and max width of the columns
		spacing = 3,    -- spacing between columns
	},
	keys = {
		scroll_down = "<c-d>", -- binding to scroll down inside the popup
		scroll_up = "<c-u>", -- binding to scroll up inside the popup
	},
	---@type (string|wk.Sorter)[]
	--- Mappings are sorted using configured sorters and natural sort of the keys
	--- Available sorters:
	--- * local: buffer-local mappings first
	--- * order: order of the items (Used by plugins like marks / registers)
	--- * group: groups last
	--- * alphanum: alpha-numerical first
	--- * mod: special modifier keys last
	--- * manual: the order the mappings were added
	--- * case: lower-case first
	sort = { "local", "order", "group", "alphanum", "mod" },
	---@type number|fun(node: wk.Node):boolean?
	expand = 0, -- expand groups when <= n mappings
	-- expand = function(node)
	--   return not node.desc -- expand all nodes without a description
	-- end,
	-- Functions/Lua Patterns for formatting the labels
	---@type table<string, ({[1]:string, [2]:string}|fun(str:string):string)[]>
	replace = {
		key = {
			function(key)
				return require("which-key.view").format(key)
			end,
			-- { "<Space>", "SPC" },
		},
		desc = {
			{ "<Plug>%(?(.*)%)?", "%1" },
			{ "^%+",              "" },
			{ "<[cC]md>",         "" },
			{ "<[cC][rR]>",       "" },
			{ "<[sS]ilent>",      "" },
			{ "^lua%s+",          "" },
			{ "^call%s+",         "" },
			{ "^:%s*",            "" },
		},
	},
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "➜", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
		ellipsis = "…",
		-- set to false to disable all mapping icons,
		-- both those explicitly added in a mapping
		-- and those from rules
		mappings = true,
		--- See `lua/which-key/icons.lua` for more details
		--- Set to `false` to disable keymap icons from rules
		---@type wk.IconRule[]|false
		rules = {},
		-- use the highlights from mini.icons
		-- When `false`, it will use `WhichKeyIcon` instead
		colors = true,
		-- used by key format
		keys = {
			Up = " ",
			Down = " ",
			Left = " ",
			Right = " ",
			C = "󰘴 ",
			M = "󰘵 ",
			D = "󰘳 ",
			S = "󰘶 ",
			CR = "󰌑 ",
			Esc = "󱊷 ",
			ScrollWheelDown = "󱕐 ",
			ScrollWheelUp = "󱕑 ",
			NL = "󰌑 ",
			BS = "󰁮",
			Space = "󱁐 ",
			Tab = "󰌒 ",
			F1 = "󱊫",
			F2 = "󱊬",
			F3 = "󱊭",
			F4 = "󱊮",
			F5 = "󱊯",
			F6 = "󱊰",
			F7 = "󱊱",
			F8 = "󱊲",
			F9 = "󱊳",
			F10 = "󱊴",
			F11 = "󱊵",
			F12 = "󱊶",
		},
	},
	show_help = true, -- show a help message in the command line for using WhichKey
	show_keys = true, -- show the currently pressed key and its label as a message in the command line
	-- disable WhichKey for certain buf types and file types.
	disable = {
		ft = {},
		bt = {},
	},
	debug = false, -- enable wk.log in the current directory
}



local opts = {
	mode = "n",  -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}
local mappings = {
	{ "<leader>a",   "<cmd>Alpha<cr>",                                         desc = "Alpha",             nowait = true, remap = false },
	{ "<leader>c",   "<cmd>bdelete<CR>",                                       desc = "Kill Buffer",       nowait = true, remap = false },
	{ "<leader>e",   "<cmd>NvimTreeToggle<cr>",                                desc = "Explorer",          nowait = true, remap = false },
	{ "<leader>m",   "<cmd>Mason<CR>",                                         desc = "Mason",             nowait = true, remap = false },
	{ "<leader>q",   "<cmd>q<CR>",                                             desc = "Quit",              nowait = true, remap = false },
	{ "<leader>r",   "<cmd>lua vim.lsp.buf.format{async=true}<cr>",            desc = "Reformat Code",     nowait = true, remap = false },
	{ "<leader>w",   "<cmd>w<CR>",                                             desc = "Save",              nowait = true, remap = false },
	-- Debug
	{ "<leader>d",   group = "Debug",                                          nowait = true,              remap = false },
	{ "<leader>dR",  dap.run_to_cursor,                                        desc = "Run to cursor",     nowait = true, remap = false },
	{ "<leader>db",  dap.toggle_breakpoint,                                    desc = "Breakpoint",        nowait = true, remap = false },
	{ "<leader>dc",  dap.run,                                                  desc = "Continue",          nowait = true, remap = false },
	{ "<leader>ds",  group = "Steps",                                          nowait = true,              remap = false },
	{ "<leader>dsi", dap.setp_into,                                            desc = "Step into",         nowait = true, remap = false },
	{ "<leader>dso", dap.setp_over,                                            desc = "Step over",         nowait = true, remap = false },
	{ "<leader>dsO", dap.setp_out,                                             desc = "Step out",          nowait = true, remap = false },
	{ "<leader>dt",  dap.terminate,                                            desc = "Terminate session", nowait = true, remap = false },
	{ "<leader>du",  group = "UI",                                             nowait = true,              remap = false },
	{ "<leader>dut", dapui.toggle,                                             desc = "Toggle UI",         nowait = true, remap = false },

	-- Telescope
	{ "<leader>f",   group = "File Search",                                    nowait = true,              remap = false },
	{ "<leader>fc",  "<cmd>Telescope colorscheme<cr>",                         desc = "Colorscheme",       nowait = true, remap = false },
	{ "<leader>ff",  "<cmd>lua require('telescope.builtin').find_files()<cr>", desc = "Find files",        nowait = true, remap = false },
	{ "<leader>fr",  "<cmd>Telescope oldfiles<cr>",                            desc = "Recent Files",      nowait = true, remap = false },
	{ "<leader>ft",  "<cmd>Telescope live_grep <cr>",                          desc = "Find Text Pattern", nowait = true, remap = false },

	{ "<leader>s",   group = "Search",                                         nowait = true,              remap = false },
	{ "<leader>sc",  "<cmd>Telescope commands<cr>",                            desc = "Commands",          nowait = true, remap = false },
	{ "<leader>sh",  "<cmd>Telescope help_tags<cr>",                           desc = "Find Help",         nowait = true, remap = false },
	{ "<leader>sd",  "<cmd>Telescope diagnostics<cr>",                           desc = "Find diagnostics",         nowait = true, remap = false },
	{ "<leader>sk",  "<cmd>Telescope keymaps<cr>",                             desc = "Keymaps",           nowait = true, remap = false },
	{ "<leader>sm",  "<cmd>Telescope man_pages<cr>",                           desc = "Man Pages",         nowait = true, remap = false },
	{ "<leader>sr",  "<cmd>Telescope registers<cr>",                           desc = "Registers",         nowait = true, remap = false },

	-- Git
	{ "<leader>g",   group = "Git",                                            nowait = true,              remap = false },
	{ "<leader>gR",  "<cmd>lua require 'gitsigns'.reset_buffer()<cr>",         desc = "Reset Buffer",      nowait = true, remap = false },
	{ "<leader>gb",  "<cmd>Telescope git_branches<cr>",                        desc = "Checkout branch",   nowait = true, remap = false },
	{ "<leader>gc",  "<cmd>Telescope git_commits<cr>",                         desc = "Checkout commit",   nowait = true, remap = false },
	{ "<leader>gj",  "<cmd>lua require 'gitsigns'.next_hunk()<cr>",            desc = "Next Hunk",         nowait = true, remap = false },
	{ "<leader>gk",  "<cmd>lua require 'gitsigns'.prev_hunk()<cr>",            desc = "Prev Hunk",         nowait = true, remap = false },
	{ "<leader>gl",  "<cmd>lua require 'gitsigns'.blame_line()<cr>",           desc = "Blame",             nowait = true, remap = false },
	{ "<leader>go",  "<cmd>Telescope git_status<cr>",                          desc = "Open changed file", nowait = true, remap = false },
	{ "<leader>gp",  "<cmd>lua require 'gitsigns'.preview_hunk()<cr>",         desc = "Preview Hunk",      nowait = true, remap = false },
	{ "<leader>gr",  "<cmd>lua require 'gitsigns'.reset_hunk()<cr>",           desc = "Reset Hunk",        nowait = true, remap = false },
	{ "<leader>gs",  "<cmd>lua require 'gitsigns'.stage_hunk()<cr>",           desc = "Stage Hunk",        nowait = true, remap = false },
	{ "<leader>gt",  "<cmd>Neogit<cr>",                                              desc = "Open UI",           nowait = true, remap = false },
	{ "<leader>gu",  "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",      desc = "Undo Stage Hunk",   nowait = true, remap = false },
	-- LSP
	{ "<leader>l",   group = "LSP",                                            nowait = true,              remap = false },
	{ "<leader>lS",  "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",       desc = "Workspace Symbols", nowait = true, remap = false },
	{ "<leader>la",  "<cmd>lua vim.lsp.buf.code_action()<cr>",                 desc = "Code Action",       nowait = true, remap = false },
	{ "<leader>li",  "<cmd>LspInfo<cr>",                                       desc = "Info",              nowait = true, remap = false },
	{ "<leader>ll",  "<cmd>lua vim.lsp.codelens.run()<cr>",                    desc = "CodeLens Action",   nowait = true, remap = false },
	{ "<leader>lr",  "<cmd>lua vim.lsp.buf.rename()<cr>",                      desc = "Rename",            nowait = true, remap = false },
	{ "<leader>ld",  "<cmd>lua vim.diagnostic.open_float({border = \"rounded\"})<cr>",                desc = "Document Symbols",  nowait = true, remap = false },
	{ "<leader>ls",  "<cmd>Telescope lsp_document_symbols<cr>",                desc = "Document Symbols",  nowait = true, remap = false },
}

wk.setup(defaults)
wk.add(mappings)
