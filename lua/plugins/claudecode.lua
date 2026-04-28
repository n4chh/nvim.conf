vim.pack.add({
	"https://github.com/coder/claudecode.nvim",
})

require("claudecode").setup({
	-- WebSocket server auto-starts so the `claude` CLI discovers nvim as the IDE
	auto_start = true,
	log_level = "info",

	-- Keep selection tracking so Claude sees what you highlight
	track_selection = true,

	terminal = {
		provider = "snacks", -- you already have snacks.nvim installed
		split_side = "right",
		split_width_percentage = 0.35,
		auto_close = true,
	},

	diff_opts = {
		layout = "vertical",
		keep_terminal_focus = false,
	},
})
